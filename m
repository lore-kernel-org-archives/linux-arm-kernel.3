Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EC0C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lcQZPNOwVritWIDtMp41b7bB5T4gHCJ575UDlNYCGTU=; b=v7PXUawplIs13dRushq9JI1AY0
	xak7lJQDDRup7ZejuIFQO/pw76MrDOCenSiOedWbhvRzJMm3NgqZ9vDrJ24zFPJxxQi4ipjDO9hNh
	I58HlVjfhLYfyD0zBN/iyrkCgnausHz1fwhokC3IltQ/fRMLWYGODvnBj6AIyfSqDAezW2WLTjWtJ
	zT9cQ4euHUJNenetPG5Bxv9db64/8339aO3MjGMcc9tYh8erdonxrnP6Ns6jy8A3xMOQbcu6XiHH1
	aVfO02lwtb1a50sm7hLQtHwuPBYpAirt/v+yDFvaH0ClDSceoohqu3WM/s7Wjy5c/Gvmjh1JlpQjB
	+qAw7k3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXpQ-0000000FBu4-44dt;
	Thu, 29 May 2025 07:37:28 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKXnH-0000000FBgh-3kmF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 07:35:17 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-450d021b9b1so1245725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748504113; x=1749108913; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lcQZPNOwVritWIDtMp41b7bB5T4gHCJ575UDlNYCGTU=;
        b=c/I4LYA2T18EIAy1plcAEAeIGsTKZX982NnSWi6aLNmSNk1zYqu5UlOaITjkNWfGK5
         FZzCPTbLkJU3MPS2+b1OF7nTi3vmWL08khJb4Ns7slZf/cQ0HALAW63pGoWwWM/w234W
         j5n3ifDV4RgN40SjzTJubPcVEP5ND2fo0/s/S1Ev4hy4Q7zdKW4A2zzK2LzyrOVb68e9
         eZ9yVnh8E8dISNni2CSt8NN4+AeHzPRex+ind4XlfEM2rwCet/h07zh5Ugbf2MzLKiqg
         d5AbAMRCe+oxHEfot685I8ATHZdLjTraHd8gSdRUVlXtUmXJr9b98RzcC+in3qMPQv6t
         N5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748504113; x=1749108913;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcQZPNOwVritWIDtMp41b7bB5T4gHCJ575UDlNYCGTU=;
        b=K2qvK+SJrX6pDxsdVn+ZQI3R3gtb+TLz9t6qk7ZlI8cWAhAeQVFVjqTThiX4cuF/jo
         dyG4dYmWgsNEtfuAurnpc2W1C3FSrXm97RDBXBPmw5mXcKFOIAqI3gP1hAlLlRwUvpI7
         Xtt/q3i3ClK6pGp5zcPqAWQ6Bi1e3EyWUPDqNT3Fx3I0mUF/QB/QyyvA8ISf8w0ywL1L
         HEV9+DRSZebo7XWZwZmBMwFoIOHocAH1CBwhliV5DpCDteErH6nn0AbBOqufTDtoScyn
         LrIQzSO0n0fCv2Wsd4CBEA7PKmKE+ym3soAjoCQptsUBxDFJqEhbDSaz7kwdsQhy6BCq
         KoGg==
X-Gm-Message-State: AOJu0Yxvj+UWTjQmlhOQYmEZGlP78VuZCyldk+dZs3fnwXHG7SdSSESZ
	31hOn7DknjEV5j0TTImor7slqUBwQhv6DY535sJLKV8TUxZ4mcSVDoUdwx04jOISphekSSFXldC
	aLMhx5fQrSGsMbC2RmXDUUd4WRJ/ILY6cFXxp6TOySIwSLKKpEnZ/J+0F40rVM406Oduynmrxat
	nUCxnNc9DIDe5Ta/MDdN8gtAfW9aw+SHI3Whe3iUqTjkrJ
X-Google-Smtp-Source: AGHT+IEjieu1PVP6lrScJ37wIH5pXuxZNzIy4/yXl2IhlnKgrGkcAzIB+hUnC+Uf0+4+b4ccTu67Tb52
X-Received: from wrbgz6.prod.google.com ([2002:a05:6000:4806:b0:3a3:62c7:3b9b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:430a:b0:3a4:e6e4:6ee7
 with SMTP id ffacd0b85a97d-3a4f35e1c93mr941938f8f.45.1748504113015; Thu, 29
 May 2025 00:35:13 -0700 (PDT)
Date: Thu, 29 May 2025 09:35:08 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=ardb@kernel.org;
 h=from:subject; bh=H0IRuCkh1pL6XzUoM1zoycMKPDG3rt06UIiGp6YYXNM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIcOCT+eV/PQbb3Y++uR4799xfrUfRzZNiU+7XO/WWWp0d
 8/fkxOEOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEBK0Z/vArbN31x7K9yT7k
 bpuPGof5t4qK/96T/HY2X4j6tcGa5RAjw3e1WIdvL0sM/Lcc/5fEaTU7Yu2zFQf2S7cz7lrX6JI 3lQsA
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
Message-ID: <20250529073507.2984959-2-ardb+git@google.com>
Subject: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, will@kernel.org, 
	catalin.marinas@arm.com, nathan@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_003515_957417_148253A3 
X-CRM114-Status: UNSURE (   9.59  )
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

From: Ard Biesheuvel <ardb@kernel.org>

It turns out that the way LLD handles ASSERT()s in the linker script can
result in spurious failures, so disable them for the newly introduced
BSS symbol export checks.

Link: https://github.com/ClangBuiltLinux/linux/issues/2094
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c5266430284b..86f088a16147 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,6 +10,10 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
+#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
+#define ASSERT(...)
+#endif
+
 #define PI_EXPORT_SYM(sym)		\
 	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
 #define __PI_EXPORT_SYM(sym, pisym, msg)\
@@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 _kernel_codesize = ABSOLUTE(__inittext_end - _text);
 #endif
 
+#undef ASSERT
+
 #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
-- 
2.49.0.1238.gf8c92423fb-goog


