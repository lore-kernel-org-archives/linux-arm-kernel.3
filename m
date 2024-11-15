Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AB9D6DDD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 05:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wwGpDZ5iudS5LM+KuL+hNLzM54ZC3CXNotEma4ON0U=; b=Giu95aduwPHBkGiZ+xyXFz8NAd
	zkSgOPAZ/bYLeHeBfN9Odp6MbjKf/Xp/rTeVEiJktAcGVoV084JGAjyU/0CaOIRdY0frDJJcYsWqU
	jYSq316bS0uaxyGE/wbBYliQ+Hgn9/Ge9+Q/Io1U/KGKAlvm4NCZ/PKKtDXTY+CcIO+DoYVx87FVX
	soNYMo8W6GQeLsfOb5uk7VTClyltILuY+B9tM9adsnbxbnM7dr2qhCE+xDyU6tfTunTSyj+rAfg4S
	jfOjq9Cs4zMOGd09scdv1a10ntusZhBqyS/eg0Ashhk7PFvCc0sC6bxFH4A7+ZVArGXwF44w1aHEh
	vQ4AwfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBocy-00000001e5h-2LEY;
	Fri, 15 Nov 2024 05:12:16 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBoc2-00000001dtF-2VeS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 05:11:20 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ee3fc1090cso20961887b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 21:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731647477; x=1732252277; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1wwGpDZ5iudS5LM+KuL+hNLzM54ZC3CXNotEma4ON0U=;
        b=hYmaP5BzcKQHKmszXmlgoUXowFSApA2rjWzlbccnYZdzERVG8JdX3UX7U/+1ROySfv
         iVCT8dD9TGR8kHG4jIRjWySzzYN3nTXenslgrFdH46xihIy3Aw2SK8O4qYUbEER3/owq
         PlvOT97smAFrFF/OnALN9M7khQ3A22xUeLJdS6RRsWq/5CTOLeh65tqxoIXTryNGoUC7
         RGu8PxgRh0+Yo8nJPpC+Lbwcqx02ogW/TYctaoFA5cxq3D3AslCNBtI20AyCH6pqHFhR
         ZtPJYYKc89exN4czbCo43wYjoNZRKL9+TdUp7ZYEbuLqSkikymgL1yXPH1WXbj8agCHH
         yM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731647477; x=1732252277;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wwGpDZ5iudS5LM+KuL+hNLzM54ZC3CXNotEma4ON0U=;
        b=qJ4Em9F33zWauLaGqM9IupsmD2tVW/2J9Mh4InL9jpHh7Cfe1ngKotNrbVvzqwdr5J
         NzojZZenWxH/ZMggVfBcx52AboVRty2jJd4PbECHVLbz0pSSWsM6tY6nBE1wCIp60tZ5
         20mj0N5ntNEupWH0NfbRlZ2Nv91zSwGMuMcA9+Lbt4Jb77YFH86j9eVjohXI/MaCByVa
         aplaLDGZc13DSu1Yt0eF/RrHgMcUZdPgyaMfD49SHQO4bipPPnoZtK5X9M+SYi1IRxdV
         3azszQZ+8t4R6RmCXzRhbSxwxNotIjYgsOIUEuZKNhtiwM+ZThT8FKdudtJZe7gdfuPw
         mObQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHMEE5P733+ghMRW88iWyCZ4IXzvaS1Qg3B0IDeFXpbaVc3MhOFuhOz/lLwRcQkYhBtdnAF4Vuem55NjEDiitg@lists.infradead.org
X-Gm-Message-State: AOJu0YwaIF4sAPNk9EuM1uNahvTt1D44iLC0F1ufb0dlWermVcRnnfrK
	MobsXS2RUuNWuViQn/VBiX9eF099YY2FUeCNs2Mc/THHGkM8oPJD9ka3gGPLgfp+ZL6xpwkwTA8
	P
X-Google-Smtp-Source: AGHT+IGz3q4DCIJt57K3asfgvwzEbv+NGkaDrw/vPNLXCsgnnxFJTN6ZZqOGNQ9YDpPKAjLF646BkA9aZ54=
X-Received: from yabinc-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:5172:b594:baa2:7cb2])
 (user=yabinc job=sendgmr) by 2002:a05:690c:4348:b0:6e3:c4cb:689b with SMTP id
 00721157ae682-6ee3d6eac31mr497447b3.4.1731647476326; Thu, 14 Nov 2024
 21:11:16 -0800 (PST)
Date: Thu, 14 Nov 2024 21:11:06 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115051107.3374417-1-yabinc@google.com>
Subject: [PATCH] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
From: Yabin Cui <yabinc@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_211118_652439_420921E8 
X-CRM114-Status: GOOD (  12.78  )
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

Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
selected.

On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
Experiments on Android show 4% improvement in cold app startup time
and 13% improvement in binder benchmarks.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
 arch/arm64/Kconfig                  |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tools/autofdo.rst
index 1f0a451e9ccd..f0952e3e8490 100644
--- a/Documentation/dev-tools/autofdo.rst
+++ b/Documentation/dev-tools/autofdo.rst
@@ -55,7 +55,7 @@ process consists of the following steps:
    workload to gather execution frequency data. This data is
    collected using hardware sampling, via perf. AutoFDO is most
    effective on platforms supporting advanced PMU features like
-   LBR on Intel machines.
+   LBR on Intel machines, ETM traces on ARM machines.
 
 #. AutoFDO profile generation: Perf output file is converted to
    the AutoFDO profile via offline tools.
@@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
 
       $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a -N -b -c <count> -o <perf_file> -- <loadtest>
 
+   - For ARM platforms:
+
+     Follow the instructions in the `Linaro OpenCSD document
+     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fdo/autofdo.md`_
+     to record ETM traces for AutoFDO::
+
+      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <loadtest>
+      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=i500009il
+
+     For ARM platforms running Android, follow the instructions in the
+     `Android simpleperf document
+     <https://android.googlesource.com/platform/system/extras/+/main/simpleperf/doc/collect_etm_data_for_autofdo.md>`_
+     to record ETM traces for AutoFDO::
+
+      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
+
 4) (Optional) Download the raw perf file to the host machine.
 
 5) To generate an AutoFDO profile, two offline tools are available:
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..c3814df5e391 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -103,6 +103,7 @@ config ARM64
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_RT
+	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
-- 
2.47.0.338.g60cca15819-goog


