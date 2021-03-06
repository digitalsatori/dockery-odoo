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
ENV ODOO_MIG_DIR         "${ODOO_BASEPATH}/migration.d"
ENV ODOO_CMD             "${ODOO_BASEPATH}/vendor-9/odoo/cc/odoo-bin"
ENV ODOO_FRM             "${ODOO_BASEPATH}/vendor-9/odoo/cc"
ENV ODOO_VENDOR          "${ODOO_BASEPATH}/vendor ${ODOO_BASEPATH}/vendor-9"
ENV ODOO_SRC             "${ODOO_BASEPATH}/src ${ODOO_BASEPATH}/src-9"
ENV PATCHES_DIR          "${ODOO_BASEPATH}/patches.d"

# ============================================================
# Ship with conventional odoo patches
# ============================================================

COPY patches.d "${PATCHES_DIR}"

# ============================================================
# Forward enforce minimal naming scheme on secondary build
# ============================================================

ONBUILD COPY --chown=odoo:odoo  vendor                      "${ODOO_BASEPATH}/vendor-9"
ONBUILD COPY --chown=odoo:odoo  src                         "${ODOO_BASEPATH}/src-9"
ONBUILD COPY --chown=odoo:odoo  migration.yaml              "${ODOO_MIG}"
ONBUILD COPY --chown=odoo:odoo  migration.d                 "${ODOO_MIG_DIR}"
ONBUILD COPY --chown=odoo:odoo  cfg.d                       "${ODOO_RC}"
ONBUILD COPY --chown=odoo:odoo  patches.d/*                 "${PATCHES_DIR}/"

# ============================================================