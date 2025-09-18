Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56276CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFjH+4iKezMx9taew/P2Pp2wCahAKn7daFaD40BNcwI=; b=kiaSja3V1NLmsunzg3evq+jcm5
	AR7HEdaShBMb4TsBaj/oNNJ5XOCbg7L5S4TnaT9Eve1ZhJQmo/gaeZJJ3Coz/pbFmvdYTTUab2fLb
	UVI2wFD8Q4aVR9IoqTKE6haY+wNbQTyBtzgEu1lju6UvuDFug/hj3E75KsjACwhHBYxW+FCoQdZLD
	mvELzkOCdVqvWpBZEOYwpyMjsxq6lR+gYFcS02tDeZLv0FMHotgx2vo0Am8tz+jom9ppygS1trTWQ
	Qc+0fb20ANUgXluijJzcS2zHDLG/g87Bn4U1PKNY/C2rtC6k/ZhuIrl2z2T4AMq/kmSF5Yz12GKZJ
	yQVEzjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8FY-0000000GQwo-0qGa;
	Thu, 18 Sep 2025 06:36:12 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8FW-0000000GQve-1HKW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:36:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45dd66e1971so5174425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758177368; x=1758782168; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VFjH+4iKezMx9taew/P2Pp2wCahAKn7daFaD40BNcwI=;
        b=3uiqqf7CzCjqTz0XQgNIQSbYfwufem70caICKAGamcPMuVN06oGB8aa5jjFCP+FXbb
         rZUH8kN0Id5RmfZMvV6sFhFK9pPz8Pv/DsMrFZ3IUOm7v3aRgBJrbWELJKM3S3wLTAYW
         Ro+zPkQjTWSOCk2fvNm1RSutR+b1i96GqfrZOpFb9PkkRKWC7y6EQr5QJrE2FdfPsarG
         RbORYZTchXSIAMwJrXSf27g818DnVucT1TnopXlSloUsvQki7TGU5+9pSmJb3a9V4bda
         MUwcImHY/MEwWE83qmyDhSafOrJhHpwa0kKLl7KW4yUagXZvE5vxTPVYTOElm/lkA80f
         2WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177368; x=1758782168;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFjH+4iKezMx9taew/P2Pp2wCahAKn7daFaD40BNcwI=;
        b=b1hI57yoV17RF0rHAyq9Hrv4JBoXb8IKpkAaAD0SdCzeWl/kVL8zwFznotS0RB3AGh
         laQ6ZUR1269N7kubJQeSDtL05Iho4kFUqq8Jj8raVihB+BD0LLYENYZrZsdQerJuGyu0
         uM9uDC98BtdDKQNJvNnDU3TvsJ3ogtMgqJ+XKYGWWz/WX2nWqt2/kJVj/LciqhaSEJCu
         Iu5vP1V2xEngNwKTPD0vAIPkVDND53SPR55ry1WbLyLEfeWgZW13KDl2U++ff5DkcPU6
         ltBdYtyfIKQiABtzu73VmR348EmWqlphT3bvgMIJI/dmMK9PmfuJWSYpxaCqsM0O8Nq3
         bNDw==
X-Gm-Message-State: AOJu0Yw6CyEopyERI7Dn+6vWdfGwsciMbq6yjyjmFS7WlUx59/0Yozfb
	E6cdsQA3oEcNbH/S4iyvn+rdE1WA0XXty8HfXyzChknGZqo96iSvIcbIqXyxxuXZZbfQI4YzCKt
	PInraevtes92GeIyT+VJP8Z9zyT+Zyyiuey+8VCmql4kx3RQuynarMYVqLbCzkfTIMg4rQNAIEk
	p4QzUpHBMKEVRkcS/thhaihX8hrQcEnSl85R8zGhfQ0keA
X-Google-Smtp-Source: AGHT+IH2UgG37umNMoeACtGTZ7/9BuSZf5nN5MC+UZpNd1hrMGzyvC/NPJGsd1QclVocKHX2GkTc/eq3
X-Received: from wmbjg18.prod.google.com ([2002:a05:600c:a012:b0:45f:28d1:7681])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19d4:b0:45b:8f5e:529a
 with SMTP id 5b1f17b1804b1-462031b1dfdmr44345345e9.14.1758177367559; Wed, 17
 Sep 2025 23:36:07 -0700 (PDT)
Date: Thu, 18 Sep 2025 08:35:40 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=ardb@kernel.org;
 h=from:subject; bh=rNO7lD/OuznN/elc7/2TihvZkB/fdGPOYNhJzbseLp0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0CpsE7vV2ez+u1zTqWvlm66PI7v2vzq858OP34VDlH
 RdSd7CEdJSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJXNZgZJi8acHsj1ffLuVk
 fL/bXFd9jZnTm39O0idV/Nf9jMhU6bJm+Ge14c5izX+7hNeL3t5mGNO5U2iZoqlY/rFJqrp8UkJ t+dwA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918063539.2640512-7-ardb+git@google.com>
Subject: [PATCH 0/5] arm64: Move kernel mode FPSIMD buffer to the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_233610_365329_716BF693 
X-CRM114-Status: GOOD (  11.65  )
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

Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
context switch out of struct thread_struct, and onto the stack, so that
the memory cost is not imposed needlessly on all tasks in the system.

Patches #1 - #3 contains some prepwork so that patch #4 can tighten the
rules around permitted usage patterns of kernel_neon_begin() and
kernel_neon_end(). This permits #5 to provide a stack buffer to
kernel_neon_begin() transparently, in a manner that ensures that it will
remain available until after the associated call to kernel_neon_end()
returns.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>

Ard Biesheuvel (5):
  crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
  crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
  crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
  arm64/fpsimd: Require kernel NEON begin/end calls from the same scope
  arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack

 arch/arm64/crypto/aes-ce-ccm-glue.c |  5 +--
 arch/arm64/crypto/sm4-ce-ccm-glue.c | 10 ++----
 arch/arm64/crypto/sm4-ce-gcm-glue.c | 10 ++----
 arch/arm64/include/asm/neon.h       |  7 ++--
 arch/arm64/include/asm/processor.h  |  2 +-
 arch/arm64/kernel/fpsimd.c          | 34 +++++++++++++-------
 6 files changed, 34 insertions(+), 34 deletions(-)


base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
-- 
2.51.0.384.g4c02a37b29-goog


