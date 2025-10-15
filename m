Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC1ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dl7DSFNXrvgC8fPiu6fPIF6OEEmMKscydyxcv7oyMcM=; b=NH8MK5zagP1AvXwu7vRfI0eMeq
	xBbHKOb6hq+ronxBzpWMvUqypH5fq8l0pBma0+0rJrp30lNqVemY6YWWkQ8o/6MXXbOsAbXfuur39
	v3W4T6vdKbCXkDqdp11Hfvw1in/GM0KM2KE4mWeyFVXTfDt33BrQqIopFdt0IHVCByoTk1sUeLe0M
	DNr0AJycrhYE+87cKItZV9tF5MOUz7YDH6VI9ns+//4ojYi+zGCC7AW3pRCSbPdbOharlcaSRAJ6Y
	Lujn4Uwox3PfFK0MhlcBVyuzmpSQxbSY2UzEEQXEPZC1YwBh67qXkWYhbw5K/ZvxY+Cab1s/kz5Cx
	NAhoNASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cY-00000002tke-47RR;
	Wed, 15 Oct 2025 21:01:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cX-00000002tif-1Eva
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dl7DSFNXrvgC8fPiu6fPIF6OEEmMKscydyxcv7oyMcM=; b=hwM6LOfv+GJEYpsdvQPQRxBgl8
	aXKatE7yIb+c/HiWb303jUjvTypKhOmSZ49OTBipM+LJKJ4xf0g6n3VlRzROzHD6Uo61mchUdhHEd
	wGuB0ybs+KINb6+HI2dM0IgKd6R6avEE3tXJAz1b4y1mMZ2QOxCovFFkF5cFlK4ypal0VfmZMlXuo
	izE6m0zEjHG8+4FCj/6qXg3uca9QPng+RNmW/Gcc2UT3Eh5NcBTQxbCPkJsoW3qp/jX6RMFNA2TCT
	Nl9fug8euKcWOM6peDLDCtrug8FcRF8LR57T469KTCOfsr+XjDIWre4FsXI6u2i1agxv2YWhaZN5l
	izXf8apw==;
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cQ-00000006G8Z-3Gpi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:14 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b5ffd44fcc0so1596866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562065; x=1761166865; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dl7DSFNXrvgC8fPiu6fPIF6OEEmMKscydyxcv7oyMcM=;
        b=q1bKxyhK/XpVgPgSFQ8uizaG3DoHJyY8/vpJ9tPAV6B1sBQXibsW6pSYCFwbQtksns
         nDpPoIl9wpBVt1oO9ppz2PO2Uo3wHMkOpYQ8bnSOl5RE2DxW4f7iLW4IN+qsV6v2Fttj
         auqXspbLKJFCz72dpK1FpWKo0qfwJRLccBTDSm1ZK1JOUAhZqLa5lxez8PBQ/8y9cM4X
         +fkmUbnccU6pcItoLC5UJ9MlROe6fbX2YqywDxPnBnQ7nHbYWSB4bwZb6jM2faEJf2tN
         DVSIGf6jwDzH5yyinYW5hiy7jgKIQC3gSgF5EhhuNmW2L+tBkOzoA/MotNghhqSFEYU0
         6vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562065; x=1761166865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dl7DSFNXrvgC8fPiu6fPIF6OEEmMKscydyxcv7oyMcM=;
        b=I0nPM2BHAdO6o2ZrXcYyoR9Zu1JqFxtHJOjN/oILYSCsAUmNpWEurF6Yzn80in60rB
         buDjYDXy6dOlL5or1JYtYCzN6uVQObBt2JmqI7hAICHi6Oe0jWU92fzuvzxH8UirwuCT
         1cAkfyIBzak1+6x7sGdbMa6nHfoFdYRd4i5sPy99EpD9aT8DlrLhLd4aoPLATVVj+WLr
         KQl0mNVKTzGyYIPGN5fhzHBRXCbLOf3+yNn6Tw4itWYagj6fBkvI/8qk24p+hCRI9pu4
         gzPO5/hCqkMesRt43IU7QMMDxHnHajtEwFK3mAUon3oUhk8g3PG2YfS7466kIHWHGJu1
         L63w==
X-Forwarded-Encrypted: i=1; AJvYcCU81Rd+bcYwSCYn0bIltTMWFQ4cVSYr4L+bj41dKDlwPx17d+gB9Rs5bkdKeBoSPMu5m4hFfeCRCz/lXLKEhosd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7JlwFuBn1b05FlrbvaTJGuJGcOUTMw7vcSfcPLXNWz8U2fWiW
	RI99RszlQFsYZoXpPe+xJwdoeA9iSIPB9KWfYPgN7iAt6Czf6vhCkZFUzyYdKIKslJ/MqxXuSw=
	=
X-Google-Smtp-Source: AGHT+IFbnpDjbsGYz+B5RZXbbX+lQAERWey19YRdHXPDBHHjm8WsWQOtc3beJ3/VDPI6WGbFnSNWq6W+
X-Received: from ejkf21.prod.google.com ([2002:a17:906:60d5:b0:b3e:d65b:d781])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:980f:b0:b42:9840:eac5
 with SMTP id a640c23a62f3a-b50acb0e645mr3264235166b.61.1760562064831; Wed, 15
 Oct 2025 14:01:04 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:38 +0200
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=ardb@kernel.org;
 h=from:subject; bh=3k3eAeRzb5JtIy3mWW+ubq7svhGC8mUZQWnX3o9AW0Q=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDV/tegTVS5dfXu18UWPjk1eM+1663m/bMeRC4e7bqM
 +23r1njOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEmOwZ/oqnmq6ITeacf2jG
 mnnzLl0RqJGM0Df8/FlHNOxjasSsf5MZ/qc/KH/84UNLpdyBY1qtf2/cjU7fssu6aWcD8x4784P vOjkB
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-12-ardb+git@google.com>
Subject: [PATCH v4 resend 3/7] arm64/fpsimd: Don't warn when EFI execution
 context is preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220112_880183_478DC17B 
X-CRM114-Status: GOOD (  13.47  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Kernel mode FP/SIMD no longer requires preemption to be disabled, so
only warn on uses of FP/SIMD from preemptible context if the fallback
path is taken for cases where kernel mode NEON would not be allowed
otherwise.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e3f8f51748bc..3d848c89604e 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1934,11 +1934,11 @@ void __efi_fpsimd_begin(void)
 	if (!system_supports_fpsimd())
 		return;
 
-	WARN_ON(preemptible());
-
 	if (may_use_simd()) {
 		kernel_neon_begin();
 	} else {
+		WARN_ON(preemptible());
+
 		/*
 		 * If !efi_sve_state, SVE can't be in use yet and doesn't need
 		 * preserving:
-- 
2.51.0.869.ge66316f041-goog


