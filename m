Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FF0C98311
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kK4WpTbjYTQ30LMox0FYXGUlgDkXshdRvemGVnSiQqs=; b=DcUu7SVDut/h0e8ZyBrmn36rvB
	uvqenCJ3EP1CTyxv5coEGH/reSIOC2jVieJwEayFzF6WVd62au9V1rp/7cWeSzKM/J92xKcEg4NKN
	snFHCNGifsx3AMT+gnmrR2vA8FXlf0DCK7I6fIkCNc4bdmO9A8fpQF9Smml+rZ+O990/nIbfyFHx0
	Pbdgp2/KapEhAmS3NSdxcLFdSL9whS84tP064Gzta9iwmCrS6jswBIBvXxtgS2WiplvUe8bPG59HV
	psu9fdrodR2BezSoYuHPYFPzHoKpzCG/gawnQYO06EGWmz1YX8KoLQyexD65PuxQ51ABy9nOpjaVL
	uJ6bZtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysM-0000000FEP9-2gUy;
	Sat, 17 Jan 2026 05:29:30 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysG-0000000FEJw-3IsF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:25 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso25319835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627763; x=1769232563; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kK4WpTbjYTQ30LMox0FYXGUlgDkXshdRvemGVnSiQqs=;
        b=SHVRBc/qvKqs70Juc9Z+vgS4OrlDgZWUXQ3xhdAPx0eRpJByXiLcuWP5FErulpfOpb
         xge38Mn8HSgfW49s6+w291MzvTp2bMxGgn2eit/qAV86K09ZtuQ0FvT7rherWjNDXThK
         oXiyJE1/6q0j74LduitieEovRVwp7OLKJxApY9XsSV/inO7uoLMP0IyEsMGF4vcWpXs6
         10KCPgXeIhNDaNKR9f8ull90OF5yFvhdAeRoUg0HOWYHYDSOosrLEBb8iZaxGrDeC08k
         HQM9kGiBgpmtMHGoJlxisnNRO8qTMcf3N1xeeNIO4YSpzUQVy5zox/YgDUpecfa5q7PR
         rY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627763; x=1769232563;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kK4WpTbjYTQ30LMox0FYXGUlgDkXshdRvemGVnSiQqs=;
        b=FycR/JXBr1t+CrITWky148tWh6vUqm3zr6JXQ6+uo1oo5D95DJAiabwWVaehval6fq
         LI3wAcrezBW6tZ5fjiOSIcS1004haPZ9CKFbf76YwVXqxbgyqStl1xwe19BzrWce6wtW
         p489Y7F1KsShT84qOm/aGzRQTTcXhPLsGiov6+EH0jZvrVg77dHc1XTu4iJj9kDkBxOK
         o0hJOCod1Xq3FRjg+gGZlC9TcdQDVV79HioqXOR2BCZEimGITMxcZKKXMvUuypkSrZgB
         RO/CM7lHNixlGqJqrYPaBE9MJTi3QRrKGoiTDlquaZx6fD/0Y4otjlzx8nTw7VG9dv4B
         XFjg==
X-Forwarded-Encrypted: i=1; AJvYcCU/CfNfV0liV+zO2jRXrG2NOcCx+X5745lx7F1smZgwyGE8SEvnbP0i+4HZc/KQsytcG/dBOpHzkZ7ZIv7OA39s@lists.infradead.org
X-Gm-Message-State: AOJu0YymtaYUDCvQuzyGL+CgOhfIVNYPqtiUrd6Umreuuid8pr0/WF1t
	IG6wcdkfyYB4asAXMCGoI/9Sbhl5tctA4RseWmWVA0a6Ja96mRp7Tb5qQDhNVWcoljpcHTZAKJt
	njy742oFBHQ==
X-Received: from plov5.prod.google.com ([2002:a17:902:8d85:b0:29d:7778:2d65])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f8a:b0:2a2:f0cb:dfa2
 with SMTP id d9443c01a7336-2a71754509fmr50340175ad.13.1768627762755; Fri, 16
 Jan 2026 21:29:22 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:28 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-3-irogers@google.com>
Subject: [PATCH v1 02/23] perf dso: Extra validity checks that e_machine is valid
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
X-CRM114-CacheID: sfid-20260116_212924_843572_D474DB0F 
X-CRM114-Status: GOOD (  13.26  )
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

Better ensure a read e_machine is valid by checking the file appears
like an ELF file and the read e_machine value is less than
EM_NUM. This better avoids spurious e_machine values when looking for
an e_machine in say a thread.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 18e656712f5a..143720d1ecb1 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1236,17 +1236,28 @@ uint16_t dso__e_machine(struct dso *dso, struct machine *machine)
 	try_to_open_dso(dso, machine);
 	fd = dso__data(dso)->fd;
 	if (fd >= 0) {
-		_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
-		_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
-		if (dso__needs_swap(dso) == DSO_SWAP__UNSET) {
-			unsigned char eidata;
-
-			if (pread(fd, &eidata, sizeof(eidata), EI_DATA) == sizeof(eidata))
-				dso__swap_init(dso, eidata);
+		unsigned char e_ident[EI_NIDENT];
+
+		_Static_assert(offsetof(Elf32_Ehdr, e_ident) == 0, "Unexpected offset");
+		_Static_assert(offsetof(Elf64_Ehdr, e_ident) == 0, "Unexpected offset");
+		if (pread(fd, &e_ident, sizeof(e_ident), 0) == sizeof(e_ident) &&
+		    memcmp(e_ident, ELFMAG, SELFMAG) == 0 &&
+		    e_ident[EI_CLASS] > ELFCLASSNONE && e_ident[EI_CLASS] < ELFCLASSNUM &&
+		    e_ident[EI_DATA] > ELFDATANONE && e_ident[EI_DATA] < ELFDATANUM &&
+		    e_ident[EI_VERSION] == EV_CURRENT) {
+			_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
+			_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
+
+			if (dso__needs_swap(dso) == DSO_SWAP__UNSET)
+				dso__swap_init(dso, e_ident[EI_DATA]);
+
+			if (dso__needs_swap(dso) != DSO_SWAP__UNSET &&
+			    pread(fd, &e_machine, sizeof(e_machine), 18) == sizeof(e_machine) &&
+			    e_machine < EM_NUM)
+				e_machine = DSO__SWAP(dso, uint16_t, e_machine);
+			else
+				e_machine = EM_NONE;
 		}
-		if (dso__needs_swap(dso) != DSO_SWAP__UNSET &&
-		    pread(fd, &e_machine, sizeof(e_machine), 18) == sizeof(e_machine))
-			e_machine = DSO__SWAP(dso, uint16_t, e_machine);
 	}
 	mutex_unlock(dso__data_open_lock());
 	return e_machine;
-- 
2.52.0.457.g6b5491de43-goog


