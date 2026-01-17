Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020B1C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/1CoOR/LPq1QynD6bWy4/54n2aY1moOLrcvMLQ5c54=; b=sOuuCXK5c2s1cQW+2Y3bHOo/ZM
	V7poHuVav0hNF2ZSCNsobJ21XT9r9w0CF2LBMJyYG2Rb5SzoAPoPaprDBM/huThyScwAX33KmcLHN
	44QHitOTlukUNrvstq/JD3tQm6DrGqG5wyp9ztLEGESSwl8jVa+zirXOy3DERnA1/eVLYFAr061f5
	SHwQHD24A9HIcvuH6+escMbiAA/2g78E/sm5Ld/LgyI0IurmEYxeHE3M6THN4eu9sFY0lofLE9n5w
	rprG32fHaDsBX2PLlo67qoo34GEaoG4/QgrrTuvrX/gyTJwCq8BN242BeyebVSpmKcl1UN1XkO7ha
	6CDj1Scg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysd-0000000FEik-3VAm;
	Sat, 17 Jan 2026 05:29:47 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysP-0000000FESM-3hbO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:35 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ae56205588so4575507eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627772; x=1769232572; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/1CoOR/LPq1QynD6bWy4/54n2aY1moOLrcvMLQ5c54=;
        b=bbKUGtZA5ZyO66xIvk3rz/81SNS9gFO5ECjI5JIKy1fwVsu/MLw8tQjeuA509xGSAC
         0KwQbCJGEYPdBKYAmC4RImafuBuiQblMl6jXVXBTg8TyEzu+blRMw0MRt3Gc1smRJXPl
         3irB+6+XdX0eDraNh3pfxxhNfa+C5d0ZvbFkvYYOJ+r3Z6cxEEs0MfWZGoFsmFcmoIiH
         wrkqgHgxaqQzq7j49aTpwHFxmck2oLus0GO/nIpK7B4+/YoXGrxsxULi6ZtmYOiwLRog
         fr/0C8HgIb9j1I5Cot3LET+A2I4HZTLbrIbXs+RLHG/TfXBrGKQ84N1Sy9H6JMLlz9BG
         8z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627772; x=1769232572;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/1CoOR/LPq1QynD6bWy4/54n2aY1moOLrcvMLQ5c54=;
        b=ITPzGVHPQ6V7zxQ+wr1IQ9US79aOT/Rf6a8hAnn4EqOG/VBo2XebNKHvosdn/dR0Uh
         Pa0ls4b25XY5aLoUyNFGuDz9FQfATrbARoJN4n4F6W1WbvwKUIpw0vOpZFH3iQBtuEps
         3hNYn/QcmmzY7cZ4L2/898g8xhMHEe6CUs21YoMPf3D6PgNGZ5PuAU4D/bu1fP7HmT5r
         8DnlW3vge+ovuQJCrGbea7haH7UiF0MimMC6w/s7+6fNvQ4oprQLcZXoNxxaohmtecGt
         6xhsesARcY2hXmARlbCiG0nmFs50TkAAhr4pZwzoitPuvXT3pVlTMElwi2HI0KXxF+oC
         demg==
X-Forwarded-Encrypted: i=1; AJvYcCXsa1WcGyq+TVOwxGpmzfF3atFxfkmhJ20H5W9FZrc3aihx5QFHMzYXnt1If9r/Y6vov/KvtkQgoNwOs12WX6vE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9jsT8FL9kLuMo3cN1/XgDqGVM2ZtkAkYF+/IGIR7KiL5liGD7
	PbOE4tBvPXjEFAY/3We65KqI/oMAbwQ4f/OHfnMlEZmfoJe+ijdGJP3vnl2cDEws8LgQGCOpAcl
	9Ov0hBz4DGA==
X-Received: from dyb28.prod.google.com ([2002:a05:693c:631c:b0:2b6:c268:19bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b505:b0:2b0:5412:3ef
 with SMTP id 5a478bee46e88-2b6b412b810mr3937507eec.42.1768627772289; Fri, 16
 Jan 2026 21:29:32 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:33 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-8-irogers@google.com>
Subject: [PATCH v1 07/23] perf powerpc: Unify the skip-callchain-idx libdw
 with that for addr2line
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212933_953158_E84F132E 
X-CRM114-Status: GOOD (  32.24  )
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

Rather than have 2 Dwfl unify the Dwfl in skip-callchain-idx with that
is used by libdw__addr2line. Rename that variable in struct dso from
a2l_libdw to just libdw as it is now used in more than addr2line.

The Dwfl in skip-callchain-idx uses a map address when being read with
dwfl_report_elf (rather than dwfl_report_offline that addr2line
uses). skip-callchain-idx is wrong as the map address can vary between
processes because of ASLR, ie it should need a different Dwfl per
process. In the code after this patch the base address becomes 0 and
the mapped PC is used with the dwfl functions. This should increase
the accuracy of skip-callchain-idx, but the impact has only been build
tested.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/powerpc/util/skip-callchain-idx.c    |  52 ++-------
 tools/perf/util/dso.c                         |   2 +-
 tools/perf/util/dso.h                         |  23 ++--
 tools/perf/util/libdw.c                       | 101 ++++++++++--------
 tools/perf/util/libdw.h                       |  12 +--
 tools/perf/util/srcline.c                     |   2 +-
 6 files changed, 89 insertions(+), 103 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/skip-callchain-idx.c b/tools/perf/arch/powerpc/util/skip-callchain-idx.c
index 356786432fd3..e57f10798fa6 100644
--- a/tools/perf/arch/powerpc/util/skip-callchain-idx.c
+++ b/tools/perf/arch/powerpc/util/skip-callchain-idx.c
@@ -30,14 +30,6 @@
  * The libdwfl code in this file is based on code from elfutils
  * (libdwfl/argp-std.c, libdwfl/tests/addrcfi.c, etc).
  */
-static char *debuginfo_path;
-
-static const Dwfl_Callbacks offline_callbacks = {
-	.debuginfo_path = &debuginfo_path,
-	.find_debuginfo = dwfl_standard_find_debuginfo,
-	.section_address = dwfl_offline_section_address,
-};
-
 
 /*
  * Use the DWARF expression for the Call-frame-address and determine
@@ -149,44 +141,22 @@ static Dwarf_Frame *get_dwarf_frame(Dwfl_Module *mod, Dwarf_Addr pc)
  *		yet used)
  *	-1 in case of errors
  */
-static int check_return_addr(struct dso *dso, u64 map_start, Dwarf_Addr pc)
+static int check_return_addr(struct dso *dso, Dwarf_Addr mapped_pc)
 {
 	int		rc = -1;
 	Dwfl		*dwfl;
 	Dwfl_Module	*mod;
 	Dwarf_Frame	*frame;
 	int		ra_regno;
-	Dwarf_Addr	start = pc;
-	Dwarf_Addr	end = pc;
+	Dwarf_Addr	start = mapped_pc;
+	Dwarf_Addr	end = mapped_pc;
 	bool		signalp;
-	const char	*exec_file = dso__long_name(dso);
-
-	dwfl = RC_CHK_ACCESS(dso)->dwfl;
-
-	if (!dwfl) {
-		dwfl = dwfl_begin(&offline_callbacks);
-		if (!dwfl) {
-			pr_debug("dwfl_begin() failed: %s\n", dwarf_errmsg(-1));
-			return -1;
-		}
-
-		mod = dwfl_report_elf(dwfl, exec_file, exec_file, -1,
-						map_start, false);
-		if (!mod) {
-			pr_debug("dwfl_report_elf() failed %s\n",
-						dwarf_errmsg(-1));
-			/*
-			 * We normally cache the DWARF debug info and never
-			 * call dwfl_end(). But to prevent fd leak, free in
-			 * case of error.
-			 */
-			dwfl_end(dwfl);
-			goto out;
-		}
-		RC_CHK_ACCESS(dso)->dwfl = dwfl;
-	}
 
-	mod = dwfl_addrmodule(dwfl, pc);
+	dwfl = dso__libdw_dwfl(dso);
+	if (!dwfl)
+		return -1;
+
+	mod = dwfl_addrmodule(dwfl, mapped_pc);
 	if (!mod) {
 		pr_debug("dwfl_addrmodule() failed, %s\n", dwarf_errmsg(-1));
 		goto out;
@@ -196,9 +166,9 @@ static int check_return_addr(struct dso *dso, u64 map_start, Dwarf_Addr pc)
 	 * To work with split debug info files (eg: glibc), check both
 	 * .eh_frame and .debug_frame sections of the ELF header.
 	 */
-	frame = get_eh_frame(mod, pc);
+	frame = get_eh_frame(mod, mapped_pc);
 	if (!frame) {
-		frame = get_dwarf_frame(mod, pc);
+		frame = get_dwarf_frame(mod, mapped_pc);
 		if (!frame)
 			goto out;
 	}
@@ -264,7 +234,7 @@ int arch_skip_callchain_idx(struct thread *thread, struct ip_callchain *chain)
 		return skip_slot;
 	}
 
-	rc = check_return_addr(dso, map__start(al.map), ip);
+	rc = check_return_addr(dso, map__map_ip(al.map, ip));
 
 	pr_debug("[DSO %s, sym %s, ip 0x%" PRIx64 "] rc %d\n",
 		dso__long_name(dso), al.sym->name, ip, rc);
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 143720d1ecb1..dce207c7f862 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1612,7 +1612,7 @@ void dso__delete(struct dso *dso)
 	auxtrace_cache__free(RC_CHK_ACCESS(dso)->auxtrace_cache);
 	dso_cache__free(dso);
 	dso__free_a2l(dso);
-	dso__free_a2l_libdw(dso);
+	dso__free_libdw(dso);
 	dso__free_symsrc_filename(dso);
 	nsinfo__zput(RC_CHK_ACCESS(dso)->nsinfo);
 	mutex_destroy(dso__lock(dso));
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 4aee23775054..295388085031 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -268,11 +268,8 @@ DECLARE_RC_STRUCT(dso) {
 	const char	 *short_name;
 	const char	 *long_name;
 	void		 *a2l;
-	void		 *a2l_libdw;
+	void		 *libdw;
 	char		 *symsrc_filename;
-#if defined(__powerpc__)
-	void		*dwfl;			/* DWARF debug info */
-#endif
 	struct nsinfo	*nsinfo;
 	struct auxtrace_cache *auxtrace_cache;
 	union { /* Tool specific area */
@@ -335,16 +332,26 @@ static inline void dso__set_a2l(struct dso *dso, void *val)
 	RC_CHK_ACCESS(dso)->a2l = val;
 }
 
-static inline void *dso__a2l_libdw(const struct dso *dso)
+static inline void *dso__libdw(const struct dso *dso)
 {
-	return RC_CHK_ACCESS(dso)->a2l_libdw;
+	return RC_CHK_ACCESS(dso)->libdw;
 }
 
-static inline void dso__set_a2l_libdw(struct dso *dso, void *val)
+static inline void dso__set_libdw(struct dso *dso, void *val)
 {
-	RC_CHK_ACCESS(dso)->a2l_libdw = val;
+	RC_CHK_ACCESS(dso)->libdw = val;
 }
 
+struct Dwfl;
+#ifdef HAVE_LIBDW_SUPPORT
+struct Dwfl *dso__libdw_dwfl(struct dso *dso);
+#else
+static inline struct Dwfl *dso__libdw_dwfl(struct dso *dso __maybe_unused)
+{
+	return NULL;
+}
+#endif
+
 static inline unsigned int dso__a2l_fails(const struct dso *dso)
 {
 	return RC_CHK_ACCESS(dso)->a2l_fails;
diff --git a/tools/perf/util/libdw.c b/tools/perf/util/libdw.c
index b96c4e0d728f..216977884103 100644
--- a/tools/perf/util/libdw.c
+++ b/tools/perf/util/libdw.c
@@ -8,14 +8,62 @@
 #include <unistd.h>
 #include <elfutils/libdwfl.h>
 
-void dso__free_a2l_libdw(struct dso *dso)
+static const Dwfl_Callbacks offline_callbacks = {
+	.find_debuginfo = dwfl_standard_find_debuginfo,
+	.section_address = dwfl_offline_section_address,
+	.find_elf = dwfl_build_id_find_elf,
+};
+
+void dso__free_libdw(struct dso *dso)
 {
-	Dwfl *dwfl = dso__a2l_libdw(dso);
+	Dwfl *dwfl = dso__libdw(dso);
 
 	if (dwfl) {
 		dwfl_end(dwfl);
-		dso__set_a2l_libdw(dso, NULL);
+		dso__set_libdw(dso, NULL);
+	}
+}
+
+struct Dwfl *dso__libdw_dwfl(struct dso *dso)
+{
+	Dwfl *dwfl = dso__libdw(dso);
+	const char *dso_name;
+	Dwfl_Module *mod;
+	int fd;
+
+	if (dwfl)
+		return dwfl;
+
+	dso_name = dso__long_name(dso);
+	/*
+	 * Initialize Dwfl session.
+	 * We need to open the DSO file to report it to libdw.
+	 */
+	fd = open(dso_name, O_RDONLY);
+	if (fd < 0)
+		return NULL;
+
+	dwfl = dwfl_begin(&offline_callbacks);
+	if (!dwfl) {
+		close(fd);
+		return NULL;
+	}
+
+	/*
+	 * If the report is successful, the file descriptor fd is consumed
+	 * and closed by the Dwfl. If not, it is not closed.
+	 */
+	mod = dwfl_report_offline(dwfl, dso_name, dso_name, fd);
+	if (!mod) {
+		dwfl_end(dwfl);
+		close(fd);
+		return NULL;
 	}
+
+	dwfl_report_end(dwfl, /*removed=*/NULL, /*arg=*/NULL);
+	dso__set_libdw(dso, dwfl);
+
+	return dwfl;
 }
 
 struct libdw_a2l_cb_args {
@@ -63,58 +111,21 @@ static int libdw_a2l_cb(Dwarf_Die *die, void *_args)
 	return 0;
 }
 
-int libdw__addr2line(const char *dso_name, u64 addr,
-		     char **file, unsigned int *line_nr,
+int libdw__addr2line(u64 addr, char **file, unsigned int *line_nr,
 		     struct dso *dso, bool unwind_inlines,
 		     struct inline_node *node, struct symbol *sym)
 {
-	static const Dwfl_Callbacks offline_callbacks = {
-		.find_debuginfo = dwfl_standard_find_debuginfo,
-		.section_address = dwfl_offline_section_address,
-		.find_elf = dwfl_build_id_find_elf,
-	};
-	Dwfl *dwfl = dso__a2l_libdw(dso);
+	Dwfl *dwfl = dso__libdw_dwfl(dso);
 	Dwfl_Module *mod;
 	Dwfl_Line *dwline;
 	Dwarf_Addr bias;
 	const char *src;
 	int lineno = 0;
 
-	if (!dwfl) {
-		/*
-		 * Initialize Dwfl session.
-		 * We need to open the DSO file to report it to libdw.
-		 */
-		int fd;
-
-		fd = open(dso_name, O_RDONLY);
-		if (fd < 0)
-			return 0;
-
-		dwfl = dwfl_begin(&offline_callbacks);
-		if (!dwfl) {
-			close(fd);
-			return 0;
-		}
-
-		/*
-		 * If the report is successful, the file descriptor fd is consumed
-		 * and closed by the Dwfl. If not, it is not closed.
-		 */
-		mod = dwfl_report_offline(dwfl, dso_name, dso_name, fd);
-		if (!mod) {
-			dwfl_end(dwfl);
-			close(fd);
-			return 0;
-		}
-
-		dwfl_report_end(dwfl, /*removed=*/NULL, /*arg=*/NULL);
-		dso__set_a2l_libdw(dso, dwfl);
-	} else {
-		/* Dwfl session already initialized, get module for address. */
-		mod = dwfl_addrmodule(dwfl, addr);
-	}
+	if (!dwfl)
+		return 0;
 
+	mod = dwfl_addrmodule(dwfl, addr);
 	if (!mod)
 		return 0;
 
diff --git a/tools/perf/util/libdw.h b/tools/perf/util/libdw.h
index 0f8d7b4a11a5..b12094737415 100644
--- a/tools/perf/util/libdw.h
+++ b/tools/perf/util/libdw.h
@@ -11,7 +11,6 @@ struct symbol;
 #ifdef HAVE_LIBDW_SUPPORT
 /*
  * libdw__addr2line - Convert address to source location using libdw
- * @dso_name: Name of the DSO
  * @addr: Address to resolve
  * @file: Pointer to return filename (caller must free)
  * @line_nr: Pointer to return line number
@@ -26,23 +25,22 @@ struct symbol;
  *
  * Returns 1 on success (found), 0 on failure (not found).
  */
-int libdw__addr2line(const char *dso_name, u64 addr, char **file,
+int libdw__addr2line(u64 addr, char **file,
 		     unsigned int *line_nr, struct dso *dso,
 		     bool unwind_inlines, struct inline_node *node,
 		     struct symbol *sym);
 
 /*
- * dso__free_a2l_libdw - Free libdw resources associated with the DSO
+ * dso__free_libdw - Free libdw resources associated with the DSO
  * @dso: The dso to free resources for
  *
  * This function cleans up the Dwfl context used for addr2line lookups.
  */
-void dso__free_a2l_libdw(struct dso *dso);
+void dso__free_libdw(struct dso *dso);
 
 #else /* HAVE_LIBDW_SUPPORT */
 
-static inline int libdw__addr2line(const char *dso_name __maybe_unused,
-				   u64 addr __maybe_unused, char **file __maybe_unused,
+static inline int libdw__addr2line(u64 addr __maybe_unused, char **file __maybe_unused,
 				   unsigned int *line_nr __maybe_unused,
 				   struct dso *dso __maybe_unused,
 				   bool unwind_inlines __maybe_unused,
@@ -52,7 +50,7 @@ static inline int libdw__addr2line(const char *dso_name __maybe_unused,
 	return 0;
 }
 
-static inline void dso__free_a2l_libdw(struct dso *dso __maybe_unused)
+static inline void dso__free_libdw(struct dso *dso __maybe_unused)
 {
 }
 #endif /* HAVE_LIBDW_SUPPORT */
diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index 28fa1abd1fd3..9be42f398440 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -161,7 +161,7 @@ static int addr2line(const char *dso_name, u64 addr, char **file, unsigned int *
 	for (size_t i = 0; i < ARRAY_SIZE(symbol_conf.addr2line_style); i++) {
 		switch (symbol_conf.addr2line_style[i]) {
 		case A2L_STYLE_LIBDW:
-			ret = libdw__addr2line(dso_name, addr, file, line_nr, dso, unwind_inlines,
+			ret = libdw__addr2line(addr, file, line_nr, dso, unwind_inlines,
 					       node, sym);
 			break;
 		case A2L_STYLE_LLVM:
-- 
2.52.0.457.g6b5491de43-goog


