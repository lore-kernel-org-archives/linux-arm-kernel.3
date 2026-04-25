Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E678FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUJSZggZAnW35gY6L6UfepyO4olhr8IMzDQNCfxT3yU=; b=PSSWy9oHoVpoUJBn6+68vFW2fu
	ZfoaONajceIDgzCPBZ18PDa595wNzCcIELAn3TgrYJcv55v0CAZWafWng1fv4cR+DV/DLsFQPY/86
	VnkTPyJVwuil7M5qcBiSmXDHnGIG/FMO0AUtbAoSBI8jeYpUNNOASeIOyYqKi+mDVh4noPSeg00rL
	ecldX7dvJ+cYGyd5jPksrCV5LCPjMvS5ZcxqNrrUHI0oINjONW/mb+Au/t9KTmluEWb0dj2UCl840
	vONLm8SYL1wohCaTsL5q98yhYIeVhjdTuQ5B5lRY2/WDUA87S66vzOajttUocsU3tUq0S6azmM5+4
	BBJoB9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhBi-0000000EfXX-0EY5;
	Sat, 25 Apr 2026 17:53:07 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGh9c-0000000Ee08-0ARc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 17:51:03 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c16233ee11so12314421eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777139452; x=1777744252; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FUJSZggZAnW35gY6L6UfepyO4olhr8IMzDQNCfxT3yU=;
        b=BWjgSs1JwDDtPYkA83NBkd6y2f4bDOFYANUYEjxyQKQTWSig8WVi60IiP333we53oY
         YOCkPofpsVtbBeTO19+c5XbliGakXOLrkPvesM3RMGiIm2Q5SycZkWjGF0crdCLOftFy
         a3gj4qneprJFhv2q6IHQXERwGXWBLB3IonU5myqX4hwdxzTrHJsP337PfqYONijPVs27
         jPbOX9hPCLOtJ446c+QPHs0f8mw8HEg9bikKpC/r2toFrXuPQoASEvDWIFh7i7W1spCn
         y6g1zqEupHBBWTnlsz17sYJxdIhUkB6uWkUVJi8C0/5Y2YJkKfFVbwh5Ig+Ow5IuJHD/
         it9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139452; x=1777744252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUJSZggZAnW35gY6L6UfepyO4olhr8IMzDQNCfxT3yU=;
        b=V/YL5rOrhP/Ggo0ZRpldTR7aROWhImwznQAR/w101Nd/GC4HE8l3/Coh6O2EGBzphY
         muljPCeGPcenKB50vmFEMxPxWmE5vOMX8nX67AFxKPb/Q5c+w5OMxGmnKYmB7p6LiEk9
         MEoUK7/fwBz2Whur5FyiYCVmUD+MYJ8a7NanfQ8rZyx+yvCtM4TUwt0T5kdIy6OBKOWx
         eynQRI6zuGddB7u9whvexNQ4wuMBbTOv6foyViPnAROAIml5IuhaqB2JncQCp1vGqRHS
         AMN/M7BhDMxF68CmA7nq+22aEjKgPiVx2S/UPmdFTcrAUhDcfDweyEp3fM8n6VPfkh9r
         eteQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SWhHJHlWMQ6U3RCWeWWBjwAQ19mEperc0WI60aerWb+/SFVHgaYqyCMpQDvMTIFibfnXEgngQHKS9jpos6lyw@lists.infradead.org
X-Gm-Message-State: AOJu0YzDUdpYSvpVOak7JtRlXkYti6NvDu1kVj+7CpqlPHv69RCMx4Zq
	VDFkSaquSpPiqjQkv/8uYAWzxxzNJvSMg0WCq2keAFhqR//bFAbAuQvRui2OfjZXisGacYdY3wu
	y8bYXMlSv0w==
X-Received: from dycnl10.prod.google.com ([2002:a05:7300:d10a:b0:2d9:6d60:48e5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:bb0a:b0:2ea:ed7c:8064
 with SMTP id 5a478bee46e88-2eaed7c8298mr1673010eec.3.1777139451835; Sat, 25
 Apr 2026 10:50:51 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:48:53 -0700
In-Reply-To: <20260425174858.3922152-1-irogers@google.com>
Mime-Version: 1.0
References: <20260424164721.2229025-1-irogers@google.com> <20260425174858.3922152-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425174858.3922152-56-irogers@google.com>
Subject: [PATCH v6 55/59] perf Makefile: Update Python script installation path
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_105056_410587_017F4A7A 
X-CRM114-Status: GOOD (  21.15  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Remove libpython feature test that is now a python-module feature
test. Update references from libpython to python-module accordingly.

Remove references to legacy 'scripts/python' directory and install
scripts directly to 'python' directory under libexec. This aligns with
the removal of embedded interpreter and move to standalone
scripts.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature             |  4 ++--
 tools/build/feature/Makefile             |  4 ++--
 tools/build/feature/test-all.c           |  6 +++---
 tools/build/feature/test-libpython.c     | 10 ----------
 tools/build/feature/test-python-module.c | 12 ++++++++++++
 tools/perf/Makefile.config               | 13 ++++++-------
 tools/perf/Makefile.perf                 | 10 ++++------
 tools/perf/tests/make                    |  5 +----
 8 files changed, 30 insertions(+), 34 deletions(-)
 delete mode 100644 tools/build/feature/test-libpython.c
 create mode 100644 tools/build/feature/test-python-module.c

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 96d4382144c4..cbe41ba7bae5 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -79,7 +79,7 @@ FEATURE_TESTS_BASIC :=                  \
         libelf-zstd                     \
         libnuma                         \
         numa_num_possible_cpus          \
-        libpython                       \
+        python-module                   \
         libslang                        \
         libtraceevent                   \
         libcpupower                     \
@@ -140,7 +140,7 @@ FEATURE_DISPLAY ?=              \
          libelf                 \
          libnuma                \
          numa_num_possible_cpus \
-         libpython              \
+         python-module          \
          libcapstone            \
          llvm-perf              \
          zlib                   \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 60e3df8142a5..5530f9e03fcf 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -30,7 +30,7 @@ FILES=                                          \
          test-libdebuginfod.bin                 \
          test-libnuma.bin                       \
          test-numa_num_possible_cpus.bin        \
-         test-libpython.bin                     \
+         test-python-module.bin                 \
          test-libslang.bin                      \
          test-libtraceevent.bin                 \
          test-libcpupower.bin                   \
@@ -252,7 +252,7 @@ $(OUTPUT)test-gtk2-infobar.bin:
 grep-libs  = $(filter -l%,$(1))
 strip-libs = $(filter-out -l%,$(1))
 
-$(OUTPUT)test-libpython.bin:
+$(OUTPUT)test-python-module.bin:
 	$(BUILD) $(FLAGS_PYTHON_EMBED)
 
 $(OUTPUT)test-libbfd.bin:
diff --git a/tools/build/feature/test-all.c b/tools/build/feature/test-all.c
index 1488bf6e6078..4400e3d24f81 100644
--- a/tools/build/feature/test-all.c
+++ b/tools/build/feature/test-all.c
@@ -10,8 +10,8 @@
  * Quirk: Python headers cannot be in arbitrary places, so keep this testcase at
  * the top:
  */
-#define main main_test_libpython
-# include "test-libpython.c"
+#define main main_test_python_module
+# include "test-python-module.c"
 #undef main
 
 #define main main_test_hello
@@ -148,7 +148,7 @@
 
 int main(int argc, char *argv[])
 {
-	main_test_libpython();
+	main_test_python_module();
 	main_test_hello();
 	main_test_libelf();
 	main_test_gettid();
diff --git a/tools/build/feature/test-libpython.c b/tools/build/feature/test-libpython.c
deleted file mode 100644
index 371c9113e49d..000000000000
--- a/tools/build/feature/test-libpython.c
+++ /dev/null
@@ -1,10 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <Python.h>
-
-int main(void)
-{
-	Py_Initialize();
-
-	return 0;
-}
-#undef _GNU_SOURCE
diff --git a/tools/build/feature/test-python-module.c b/tools/build/feature/test-python-module.c
new file mode 100644
index 000000000000..d670dba014b0
--- /dev/null
+++ b/tools/build/feature/test-python-module.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <Python.h>
+
+int main(void)
+{
+	static struct PyModuleDef moduledef = {
+		PyModuleDef_HEAD_INIT,
+	};
+	PyObject *module = PyModule_Create(&moduledef);
+
+	return module ? 0 : -1;
+}
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index ecddd91229c8..e2cef452964f 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -317,7 +317,7 @@ PYTHON_CONFIG_SQ := $(call shell-sq,$(PYTHON_CONFIG))
 
 # Python 3.8 changed the output of `python-config --ldflags` to not include the
 # '-lpythonX.Y' flag unless '--embed' is also passed. The feature check for
-# libpython fails if that flag is not included in LDFLAGS
+# python-module fails if that flag is not included in LDFLAGS
 ifeq ($(shell $(PYTHON_CONFIG_SQ) --ldflags --embed 2>&1 1>/dev/null; echo $$?), 0)
   PYTHON_CONFIG_LDFLAGS := --ldflags --embed
 else
@@ -340,8 +340,8 @@ ifdef PYTHON_CONFIG
   endif
 endif
 
-FEATURE_CHECK_CFLAGS-libpython := $(PYTHON_EMBED_CCOPTS)
-FEATURE_CHECK_LDFLAGS-libpython := $(PYTHON_EMBED_LDOPTS)
+FEATURE_CHECK_CFLAGS-python-module := $(PYTHON_EMBED_CCOPTS)
+FEATURE_CHECK_LDFLAGS-python-module := $(PYTHON_EMBED_LDOPTS)
 
 FEATURE_CHECK_LDFLAGS-libaio = -lrt
 
@@ -830,13 +830,12 @@ endif
 
 disable-python = $(eval $(disable-python_code))
 define disable-python_code
-  CFLAGS += -DNO_LIBPYTHON
   $(warning $1)
-  NO_LIBPYTHON := 1
+  NO_PYTHON_MODULE := 1
 endef
 
 PYTHON_EXTENSION_SUFFIX := '.so'
-ifdef NO_LIBPYTHON
+ifdef NO_PYTHON_MODULE
   $(call disable-python,Python support disabled by user)
 else
 
@@ -849,7 +848,7 @@ else
       $(call disable-python,No 'python-config' tool was found: disables Python support - please install python-devel/python-dev)
     else
 
-      ifneq ($(feature-libpython), 1)
+      ifneq ($(feature-python-module), 1)
         $(call disable-python,No 'Python.h' was found: disables Python support - please install python-devel/python-dev)
       else
          PYTHON_SETUPTOOLS_INSTALLED := $(shell $(PYTHON) -c 'import setuptools;' 2> /dev/null && echo "yes" || echo "no")
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 2020532bab9c..e50b1e8cf85d 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -17,9 +17,7 @@ include ../scripts/utilities.mak
 #
 # Define CROSS_COMPILE as prefix name of compiler if you want cross-builds.
 #
-
-#
-# Define NO_LIBPYTHON to disable python script extension.
+# Define NO_PYTHON_MODULE to disable python script extension.
 #
 # Define PYTHON to point to the python binary if the default
 # `python' is not correct; for example: PYTHON=python2
@@ -1099,10 +1097,10 @@ endif
 	$(call QUIET_INSTALL, perf-iostat) \
 		$(INSTALL) $(OUTPUT)perf-iostat -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)'
 
-ifndef NO_LIBPYTHON
+ifndef NO_PYTHON_MODULE
 	$(call QUIET_INSTALL, python-scripts) \
-		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python'; \
-		$(INSTALL) python/*.py -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python'
+		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python'; \
+		$(INSTALL) python/*.py -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python'
 endif
 	$(call QUIET_INSTALL, dlfilters) \
 		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/dlfilters'; \
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 31b064928cfc..f2c5f1c254a7 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -75,8 +75,6 @@ make_jevents_all    := JEVENTS_ARCH=all
 make_no_bpf_skel    := BUILD_BPF_SKEL=0
 make_gen_vmlinux_h  := GEN_VMLINUX_H=1
 
-make_no_libpython   := NO_LIBPYTHON=1
-make_no_scripts     := NO_LIBPYTHON=1
 make_no_slang       := NO_SLANG=1
 make_no_gtk2        := NO_GTK2=1
 make_no_ui          := NO_SLANG=1 NO_GTK2=1
@@ -118,7 +116,7 @@ make_install_prefix_slash := install prefix=/tmp/krava/
 make_static         := LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX32=1 NO_JVMTI=1 NO_LIBTRACEEVENT=1 NO_LIBELF=1
 
 # all the NO_* variable combined
-make_minimal        := NO_LIBPYTHON=1 NO_GTK2=1
+make_minimal        := NO_GTK2=1
 make_minimal        += NO_DEMANGLE=1 NO_LIBELF=1 NO_BACKTRACE=1
 make_minimal        += NO_LIBNUMA=1 NO_LIBBIONIC=1 NO_LIBDW=1
 make_minimal        += NO_LIBBPF=1
@@ -150,7 +148,6 @@ run += make_jevents_all
 run += make_no_bpf_skel
 run += make_gen_vmlinux_h
 
-run += make_no_libpython
 run += make_no_scripts
 run += make_no_slang
 run += make_no_gtk2
-- 
2.54.0.545.g6539524ca2-goog


