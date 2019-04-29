FROM xoelabs/dockery-odoo-base:10.0
# ============================================================
# Convention about required libraries
# ============================================================

USER root

RUN pip --quiet --quiet install redis prometheus_client

# ============================================================
# Convention about environment variables
# ============================================================

ENV ODOO_BASEPATH        "/opt/odoo"
ENV ODOO_RC              "${ODOO_BASEPATH}/cfg.d"
ENV ODOO_MIG             "${ODOO_BASEPATH}/migration.yaml"
ENV ODOO_CMD             "${ODOO_BASEPATH}/vendor/odoo/cc/odoo-bin"
ENV ODOO_FRM             "${ODOO_BASEPATH}/vendor/odoo/cc"
ENV ODOO_VENDOR          "${ODOO_BASEPATH}/vendor"
ENV ODOO_SRC             "${ODOO_BASEPATH}/src"
ENV PATCHES_DIR          "${ODOO_BASEPATH}/patches.d"

# ============================================================
# Ship with conventional odoo patches
# ============================================================

COPY patches.d "${PATCHES_DIR}"

# ============================================================
# Forward enforce minimal naming scheme on secondary build
# ============================================================

ONBUILD COPY --chown=odoo:odoo  vendor    					"${ODOO_VENDOR}"
ONBUILD COPY --chown=odoo:odoo  src                         "${ODOO_SRC}"
ONBUILD COPY --chown=odoo:odoo  .migration.yml              "${ODOO_MIG}"
ONBUILD COPY --chown=odoo:odoo  .cfg-default.ini            "${ODOO_RC}"/01-default
ONBUILD COPY --chown=odoo:odoo  patches.d/*            		"${PATCHES_DIR}/"
ONBUILD RUN /patches ${ODOO_BASEPATH} || true

# ============================================================