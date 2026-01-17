Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F619C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OS8+jcXChzbawXYGLy5k5VOyetH1gbj+eqgOcCR0OU=; b=nDg8/2qE0W8DEELWgcmwkxMkeb
	3ag52TSWjwAbD4QvbZp5g0NV0v2No77+FZL7Oi49ooUNNw5G+PWip6vwj7LjXOwT6fvpFQ8k7x5cJ
	vhCCjOzp/jf1Q3WqTOSV4QqB+buJN5TOXqLE4e/1O6qbupCVkO8eyA7dhDMs9IzulhC2XJ2W1VCCO
	Q057j3i2jFtFYglO5HN/Z+eRunKglfB7HOoFJXfIOwFINsDrz5wNxdEY+lEku2JryT7Fia/b1OnLR
	5sJQ5gCJ8s8/kDBFzDtl3HBA1FzeZIAvDnpoHBQnwyeSW9uO4jajKPGXfkcwQnDJ/dlGCaw3SLw8m
	1p6k2UHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysJ-0000000FEN4-1yE6;
	Sat, 17 Jan 2026 05:29:27 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysE-0000000FEJE-1UXh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:23 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b21d136010so4465045eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627761; x=1769232561; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OS8+jcXChzbawXYGLy5k5VOyetH1gbj+eqgOcCR0OU=;
        b=KpChoqYlV6onsoyf9j0TSwu0t7o5l7G6b2dQweixIYo1a8BD1F2PBvslPR/CHpbQlA
         fKC3/xrgP+XnQaJDyLKjquJhkIThwACQyGFxS3Y7lmIPeFTJAt0daoDI3bhkiAbqu6vb
         L28UR0fhr/NaYZVPlal79ke5I4qp4E1+hhn77jVTK834ohuLvBYTzo+SK143Oj85odP6
         HU5X/eHMFVqA9X1gMgpIhvrjTgp7XM2sK/845tZrPZ4E7ZaISFKXaLcKaLZoaF2pcORA
         Ud2WN6W0CMlAlMhRa4yFanmENsFV2HJQKDnAO7XO7KPKAohEmo2R9tgzaz6bXZayVhpZ
         lm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627761; x=1769232561;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OS8+jcXChzbawXYGLy5k5VOyetH1gbj+eqgOcCR0OU=;
        b=wnJU6W3B+VdWygfxepel3W0ES1Or1FvQabnG73kRRTEvh+SlcJR7+ovtgPata2ToH/
         VGqLV3miePHT2cKO6tTCB4w2QM+6q6RvW78nn2kgsZNv3vTJ0+CaxE6Ix513nsVGuNXo
         uTPV/eZ3QEm3yNnpVC5r59RytR6us+6jN/NCZZEdBJH4cY1zOUUDeSyWEEGXh/VBce/A
         /XKENy9e5I55ZqO37V46nhjs4rnw7YIsHmhGHgvdSxOmaIAtRO8oj/+88Do+NcWMLIEI
         4X8yzpOUlUhzhih+PmwoOuPF4nc8RLPHK52SlKyZ04FAvxH4Udyqacd8oQTO7MhEaJAk
         NTZA==
X-Forwarded-Encrypted: i=1; AJvYcCXohoOdzqgBaUB7XWwWHxrJn9i8WcgyKw8myRS9IIpqUmlZVHMOEiTGESqIA03wBYf2Rc5tNuL6nvNfL+hnmlOS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0C3yAp8tAiNiMoYBc6Ycd+ieQ580MT+qFrPxwNaRJZr+CeT1a
	hdPjDLVf6QUe+QVXX6pKH+xMjq5ZFXuHhmc+cjn1DR9SGuf0IgW1ARAvstLy4gKo5bkfJT1aHrM
	WQ4vDAbZVnw==
X-Received: from dlbrh14.prod.google.com ([2002:a05:7022:f30e:b0:11a:44f1:daa3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:dc04:b0:2ae:5b71:d226
 with SMTP id 5a478bee46e88-2b6b3ed9044mr3890490eec.3.1768627760880; Fri, 16
 Jan 2026 21:29:20 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:27 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-2-irogers@google.com>
Subject: [PATCH v1 01/23] perf symbol-elf: Fix leak of ELF files with GNU debugdata
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
X-CRM114-CacheID: sfid-20260116_212922_386728_33736BAF 
X-CRM114-Status: GOOD (  12.31  )
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

The processing of DSO_BINARY_TYPE__GNU_DEBUGDATA in symsrc__init
happens with an open ELF file but the error path only closes the
associate fd. Fix the goto so that the ELF file is also ended and
memory released.

Fixes: b10f74308e13 ("perf symbol: Support .gnu_debugdata for symbols")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol-elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index b8fea12997a0..76912c62b6a0 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1173,7 +1173,7 @@ int symsrc__init(struct symsrc *ss, struct dso *dso, const char *name,
 		Elf *embedded = read_gnu_debugdata(dso, elf, name, &new_fd);
 
 		if (!embedded)
-			goto out_close;
+			goto out_elf_end;
 
 		elf_end(elf);
 		close(fd);
-- 
2.52.0.457.g6b5491de43-goog


