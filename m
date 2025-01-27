Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F029C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDc9oon22Zy8JtV6oJyK3eShWNaKTPBJnRLwhRmq6mE=; b=CYhUjRKe+GBumJvGU4wG6LwY8J
	AhXphTjs5awQmbczEIofeKlcAEzm64ojViGE6mDvuOcPtIhM5qCFYFMkrWtkykrKgGtdONcLFr7ED
	QDsJTDepslNYsvJNk+mxFLScS3Km49b58JbLGsoDSmWI8S+qiaa+eqHfqlR41wfZyIvsc6h8JNUAn
	2uO1vVzqvpOx68NpTll5AH2NGs+8QWHFvllGRX8gsXXBKSFnD7ioaQBzIvN+MShAgR0+peAWCOco6
	C4l1dovgSYk4Xa8qIdBiZgHz3paTB+DBmV9sj7D8q+t+XzvyXMKyYjhFivCZ6YAURggmzBBpCtb7q
	9n5mM5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWw3-00000003L4U-3v5X;
	Mon, 27 Jan 2025 21:46:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjp-00000003JIN-24WB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:46 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so9423218a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013624; x=1738618424; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDc9oon22Zy8JtV6oJyK3eShWNaKTPBJnRLwhRmq6mE=;
        b=twwlMm8i35i51mw/lK+xl9IGTv8nxH7siLUTeUBCwFmURgy6yZaqHXK776X+O30c/F
         HCjkzbbngDH4q+dQt1EzNKCsDFRtjhKQbvQBMtUIDpC7C0+BzTGAz9kjoXg8W8Bg9Qgl
         KaecbMelcTIctn87xRQCXnCwPfjeZf0PhTLyyQxy6raDvKE8UtBxFPIMCe+3JVInNipL
         6gjbwrdD/exE4XgumOT8VjWqNxSTDslDo2OEnY/izZ4TeomczGmoy+34DOMSH7hQS+Qa
         ZMckzZYL+pJIe+LJOfdrooJF+eCNLrcbsPHfPAR1NwYsujY+VgdCAng3/dbE/s/LGND+
         CqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013624; x=1738618424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDc9oon22Zy8JtV6oJyK3eShWNaKTPBJnRLwhRmq6mE=;
        b=t2TDsveiv8R7m6IRS52quoMVXft7RcSdYQi+/T9jjurGxqHUj8jfA/J4njYHH+0ibm
         DSfX9dFe9BiRZBT4fbGDOFTJTC7sS5uEK06HsgmzEvGF1lxZ9tmWWhBFAMV+gReOY6M0
         ou820ZEjETDE7Bjlq5YHIBUEnBcVhLcm77mPMMETK2iVwtGuz+fePd/XOl4AXyVzwtAT
         X6mOiPGsjeBBf+gCnqaCW/0jxBplLBm9yq1dYqkID+uH5odl6eMIfZCjoT7Uyh0YsunK
         qRcVIy45or9FFokATXQ2rqbBzut3hW110VJjwJfESFTghNpAePU/IYP1IkZ+LQlCkTe/
         2YVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJs4uQqGW2urUEnALwjPwI+qn1X+B4BDjKpN6HllAAzJwo/xGdrRWrnKBKWZ3sFOVHOXA8GD/drQIorwBUTp53@lists.infradead.org
X-Gm-Message-State: AOJu0YyQq1l42HiiZDEGzK1Cmb5NfUu/xih/MvQx5g4ZNibLc2uNvb4r
	HGV2jOoSaZ2WZ0kMrhE2I/2lR6V0ZDAisKq63zf5zaffMcc+Agd6NyYTWhH9u9GzR1gbnwXKvA=
	=
X-Google-Smtp-Source: AGHT+IEfHevdTTJtb6AigZBRpVD2FnhyEzVTYMnATEtYpNkPmzEcW9Tro1KWiXPv1Vj43sJ3+gY4o9DCZA==
X-Received: from pjbqo13.prod.google.com ([2002:a17:90b:3dcd:b0:2f4:47fc:7f17])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2808:b0:2ee:5edc:4b2
 with SMTP id 98e67ed59e1d1-2f782cc0114mr60880084a91.20.1738013624271; Mon, 27
 Jan 2025 13:33:44 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:10 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-9-wnliu@google.com>
Subject: [PATCH 8/8] arm64: Enable livepatch for ARM64
From: Weinan Liu <wnliu@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Weinan Liu <wnliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_133345_529492_014EFDDE 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

Since SFrame is considered as reliable stacktrace, enable livepatch in
arch/arm64/Kconfig

Signed-off-by: Weinan Liu <wnliu@google.com>
---
 arch/arm64/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5..c292bc73b65c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -271,6 +271,8 @@ config ARM64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select HAVE_RELIABLE_STACKTRACE if SFRAME_UNWINDER
+	select HAVE_LIVEPATCH		if HAVE_DYNAMIC_FTRACE_WITH_ARGS && HAVE_RELIABLE_STACKTRACE
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -2498,3 +2500,4 @@ source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
 
+source "kernel/livepatch/Kconfig"
-- 
2.48.1.262.g85cc9f2d1e-goog


