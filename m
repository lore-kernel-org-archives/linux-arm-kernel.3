Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6314C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1r7j6oxFgC0ngZMI9Q8295mOsi/2CMN4d5P2svdjAjA=; b=OYyer95ADPOin7YfdIgNbkGjtp
	L2LW1eD/XcstUDfOaPAc5VJl44NX0wFvsr9alRmDPV+GEVJBWnMUIFfnebTZjV5Ol+zOeiFabSdYj
	HrJVAErAedknufS6fcLmKCQ6NKtwZS3NHCprOm05ITgneYPKHKadvZaieJM8op+rHzXtrXoTJBeyY
	V1zZuZPPztNz9zvZhzQGu3+c09oWAyDlyJyI57Rhu0x+0o0hxAstFzJm8cvQ82UCcar/PBrQso23/
	qn2D4yR6iA0UTybEJPkwpSoekAGe6Eczw4K8ZQglzB8oK/GgcGOy5RedUvQBi5V3aZI1OclpIznRK
	oSsNms+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgyss-0000000FF1W-3Pva;
	Sat, 17 Jan 2026 05:30:02 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysV-0000000FEWM-0GjB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:40 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1233b91de6bso5020954c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627778; x=1769232578; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1r7j6oxFgC0ngZMI9Q8295mOsi/2CMN4d5P2svdjAjA=;
        b=CSzPd+Wa9pJRHeTLOAlwMH6tHh9THjeXGncB96q/FgXznF0ZsebROcH6r4RLX5ipxo
         fxf0e7B+SUJdAJrc5Dzd83Re06mux9nJs/52e2PR32dxw01FA6agVG5Fynno7PgzDOJI
         ABQ0hFPCFqXsi6BPfSQjQThOc4vh6jMJq2+Mf1iqmf/I3i+ISN7otxWbuu+N+bIaSkBD
         cxYQ/A+mxEvuetnwLQWq0iumZKCZRdkL3b5SEisriSTf0pk0CPs63VSeAZ9FdN3eOZl0
         CHcW1L5LTUeJTiMNcykZ6IJIlM9yGc/yTTj9jvPZ0Ikbkx/4X86HFl2ffIBypS22iNqG
         8PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627778; x=1769232578;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1r7j6oxFgC0ngZMI9Q8295mOsi/2CMN4d5P2svdjAjA=;
        b=kzXHMp5y71/M4KTyYCueZpmzN9FTrR35n8ckFcQXpzqUL6uiSpNqs4OBGm8fggImh0
         0NvYpcZCKBwxFZ2jF0JCJEet/KKXXekq7WsBwVTaX9T7i5gL/r0ghimPsbT35SFF6nMz
         wkgx0zPA07d79x2QQuLBZuVox/xRmBBsqy0Dnh4F6VoonnW81ERwW4Lmr3O7y0C2zm7U
         Y7A3seuqEvcE9yYWBaZXaapo4LtbA6Hzf8p4U9oX8MqCJJDVg10uXdxxX0GxzIRH9g4C
         6eyYzRPekmH80YPU8xw5qZKr5YFmCIB4CiG8geX8XiFZ3ycPU3JbVcMFust3mYqwhM+S
         Mq9g==
X-Forwarded-Encrypted: i=1; AJvYcCXoruJBeCos1n53q6KDeJZd3sxbPaH++eb/ZOfS5gXtHrihXpGeOHcfX3cO0gGQsIu4PkIV83Xm5iJdrnXv+BIV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr0mGtvyN8d5obBoQCJ9kT7UsO5dUOYUJPotsfEny4wwQhuVQA
	R1Fk8V5eV1XY56LlevMDkqwwGxXQbCfB9rFqEif0Ihu4eOJY5sGTlBuqX0b43WTHojwz2e5XHUx
	I4k36NSqbMw==
X-Received: from dlbto2.prod.google.com ([2002:a05:7022:3b02:b0:119:9f33:34ae])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:670b:b0:11d:fc64:9562
 with SMTP id a92af1059eb24-1244b30826dmr3833057c88.1.1768627777697; Fri, 16
 Jan 2026 21:29:37 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:36 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-11-irogers@google.com>
Subject: [PATCH v1 10/23] perf dwarf-regs: Remove get_arch_regnum
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
X-CRM114-CacheID: sfid-20260116_212939_112497_F6E0A280 
X-CRM114-Status: GOOD (  10.78  )
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

Except in dwarf-regs the function is never called. The weak function
has no strong arch implementations. Remove so that the fall-through
case applies.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs.c         | 12 ------------
 tools/perf/util/include/dwarf-regs.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 28a1cfdf26d4..b2f37299147e 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -71,13 +71,6 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 	return NULL;
 }
 
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
-__weak int get_arch_regnum(const char *name __maybe_unused)
-{
-	return -ENOTSUP;
-}
-#endif
-
 /* Return DWARF register number from architecture register name */
 int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags __maybe_unused)
 {
@@ -98,11 +91,6 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags
 		machine = EM_HOST;
 	}
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
-	case EM_HOST:
-		reg = get_arch_regnum(regname);
-		break;
-#endif
 	case EM_X86_64:
 		fallthrough;
 	case EM_386:
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 6f1b9f6b2466..015d1ade645f 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -101,10 +101,6 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 
 int get_x86_regnum(const char *name);
 
-#if !defined(__x86_64__) && !defined(__i386__)
-int get_arch_regnum(const char *name);
-#endif
-
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
  * name: architecture register name
-- 
2.52.0.457.g6b5491de43-goog


