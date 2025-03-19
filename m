Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF28EC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGnh5R7F2nGjibuMN1IiOugHr5YAQ01+XconQh81ims=; b=QoUL9ZWODds2Eqpa0R8jR+r6F7
	7nBFi5Y9giydP8pntrz7iVrIeUPAFyxn3WWgnvwZ6IDvSONdOpWjsfcuNvwuSZ7QW8chXdj5A3nUH
	garmvF/TaDdePIbARG4ieW6VSnaGFBOZNh3wrMJnSBUwrQyZWCtu/26AkRPzQ1q4XpoWi2cnCO/sN
	/yhnhIBXMf0+aLqfwdV3pMbMFDwUKyrFkqRB+ZtM9fswMvdQlQGqSfiLq0iC0N7UmUecxkboiZk8/
	grLIkK2VE+PfK4AkjkBszC+9wrKbspfergd6ZglSFrQQXiUsnKVAi0AbXR1Ehcg8mLIK124M2mPCS
	IgkUSUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tum2C-0000000845n-1QVJ;
	Wed, 19 Mar 2025 05:32:08 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulf9-000000080xt-490g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:08:21 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e5740c858beso8736085276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360899; x=1742965699; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGnh5R7F2nGjibuMN1IiOugHr5YAQ01+XconQh81ims=;
        b=k9tunLFDqk9h6GWFhNv1fYDO5wCFD3hfO+F7jEOk1p793CekG6UTZgd2IKaOauaP9z
         9aot53nDKb9R/eObCurnIAyj868YjaBh3oPYwsxTF0MuyePGkVWaeMJvzzny6tw/hvkK
         VXzfk0EfdO+squaH1LqYyCxVL54nULLo/Z0go7sV4DJSypEaYMIlIlIJHaze2uq3+Ltf
         PZmOAFy1y6SdhSQ/CVGuwQ74aSn810UNT6jcYZETPL4PvYYUSj8GuneJVGEFdIILsyp6
         yIzpC6RAyf8MIAOVsOfCUkmrGlApxEA5pi/UnXr1ZZZjkmvgk4neUth8dZ9BxSuR8ijr
         PGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360899; x=1742965699;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGnh5R7F2nGjibuMN1IiOugHr5YAQ01+XconQh81ims=;
        b=fnQ8lh+zn0hpOFMEf8TxnSeVD6qaG5eU1AaDiEzRInRyi7njsgkDO8NrIlJGzmD7Ol
         Iq1b8C9TCdGSI/jdWwvX3xaXAEgPhfo2Y5VXGT1LZjr0fkPuQf/JPtxUF8AXRXf7TlK0
         NqkCeo1lzcOYn81hKw7+05/bu1zXqh0QxiOYwBw4DW/b2gnsul5utEkpaMsw3jMv9TeE
         myBMbbhyHuHFM5Ko0sx+Vi6Rjhf9adsdgncb6VbOqcU4aLGIszLMTiyLTeeRTRM/NVf3
         TrVTYMyc2/8AOvzeELxqk0dSOKsuQop0zirjiMrgNbRSPGNPf4+BxQQ3SHOG6ICirxHh
         oX0g==
X-Forwarded-Encrypted: i=1; AJvYcCWRUeNjyFIp6Ewpbq1tgmmj4Xpij99Fl6JzFyqtdmA7QzEuNKsVmApxg8/3JruIolyCmWkAVPFb9hTRdGMYzuy0@lists.infradead.org
X-Gm-Message-State: AOJu0YzryVMe/Y5iyqq/OGE1vM8co/5EOsg8Vbot0z2c7fc6kY2mrxzv
	m2WyAHB5h9jBDK5WGLRlc+Lo0xtyfCL4altzOD9DoKe39lyDMEJ4Qt3O3MaoPuuW6w8B87qFyz5
	A2rQe/Q==
X-Google-Smtp-Source: AGHT+IHv1nfcfv3Ye5fOTqwhfAPWbuVvzkQzn8h4pmksBhQF9eFLTiSxCvjG8QByREOpkefDEY1DbG6A3hXY
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a25:dc03:0:b0:e63:699a:4e6b with SMTP id
 3f1490d57ef6-e667b41463bmr514276.4.1742360898600; Tue, 18 Mar 2025 22:08:18
 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:41 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-15-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 14/14] perf trace: Fix evlist memory leak
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_220820_023691_C4E1599D 
X-CRM114-Status: GOOD (  14.15  )
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

Leak sanitizer was reporting a memory leak in the "perf record and
replay" test. Add evlist__delete to trace__exit, also ensure
trace__exit is called after trace__record.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 1d4ad5d19b10..a102748bd0c9 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -5339,6 +5339,8 @@ static void trace__exit(struct trace *trace)
 		zfree(&trace->syscalls.table);
 	}
 	zfree(&trace->perfconfig_events);
+	evlist__delete(trace->evlist);
+	trace->evlist = NULL;
 #ifdef HAVE_LIBBPF_SUPPORT
 	btf__free(trace->btf);
 	trace->btf = NULL;
@@ -5719,8 +5721,10 @@ int cmd_trace(int argc, const char **argv)
 		}
 	}
 
-	if ((argc >= 1) && (strcmp(argv[0], "record") == 0))
-		return trace__record(&trace, argc-1, &argv[1]);
+	if ((argc >= 1) && (strcmp(argv[0], "record") == 0)) {
+		err = trace__record(&trace, argc-1, &argv[1]);
+		goto out;
+	}
 
 	/* Using just --errno-summary will trigger --summary */
 	if (trace.errno_summary && !trace.summary && !trace.summary_only)
-- 
2.49.0.rc1.451.g8f38331e32-goog


