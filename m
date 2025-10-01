Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C268FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4j20MEC8Ax3r4R1mIrlpRXC+UmhNM+andOU7drpFlJg=; b=MB1oc0q2vPyICp3MNodH6s4JUF
	Z3krPIjApVHjMdkOMhZnuPN9ezfwNUdRDJR+UJkF9Zdv46OVScnnNxt18m7OlWIq8HFMK+PZqwBDg
	EM07xCTBTFKYril5vjid+IEOpwy85JMTnN6c2U/OZ8i/oYEC3HhC0KFJQ6zjGqS3NhtOZRIXom8hu
	j5FmuKuVflSGCy2qrOrfehbQzD/x1HgulCBK6lrSAX/gkwVaaqGR0tUoJoDdYSq5glzfEb8qFptf2
	i7eUGvmiB7puTyk+F1wAhmDR300r/Go6GBWQpb4m84Xm41cm8gCghVoraAnpujizmaYpOCr79rHnT
	LcofKZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zX-00000008yyL-2UZI;
	Wed, 01 Oct 2025 21:04:03 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zU-00000008yu8-37xW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:01 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3f030846a41so108974f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352638; x=1759957438; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4j20MEC8Ax3r4R1mIrlpRXC+UmhNM+andOU7drpFlJg=;
        b=bQOY/SpQDzm52EwTro8V0W08HyrrdYOLt8LWlEFt0i+I4azGUiYa11GeNRwWiS2Ke+
         NRbBUPC2nDke0q/vRQRnGOmaUscrN7PyucvOk1fWetf2wX9XZekYCNQKfeQzNIDkn2CH
         ku9zpyasP3QPXxsM2Xth7D5x0NY94Rl/1UltgcyUW14TBXJ3T5tZzwWA84RVx8h7xS0E
         hGbQMO3vXVnViPnzMkIYoY9bzC4r06AfwRuaCrpB/j/qMC5Z1Z1177IcWzEUWtvFvC2I
         Vjm3APeZ6oz8asWdut7QGxMmMT1Ftrk2txbpGSgbfVdQWvaw+wraz29LHYoVtltUWZAC
         YmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352638; x=1759957438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4j20MEC8Ax3r4R1mIrlpRXC+UmhNM+andOU7drpFlJg=;
        b=h/fC3hunjqGtzB13k8tacVtCY70GdwnRHCeCjBT2yTMKdSRMhcVVOnFGIBjEghvZhc
         VAOw5JcdM6Fh6sNr9j5S0WCAgbPSHvL3Ro61AOscdr/yECe161yhmEr7AXju0oaTogm/
         s+4iYg88qQTnCn07Tay7i8Crbp0gO7ljwSOqTr5cdZgpK+c6oonfOtWGC0MoRWVCexEP
         tznJNsftTqH0xvWuqYgcnp/42DRNJjH//ro1fIa0RkY2R0IFcHix7GopiUbXZto63G3V
         XOEIYXfmUkINiAlgeCPhKIPrtzvifQfFF9kDVBskZB55adlOru/JV+ney4qLMPP3II2s
         MwlQ==
X-Gm-Message-State: AOJu0YwjhITSDiD/ch1bgb38WbTSs6Y+DTqoKvNrGhUfW6AsVxzoJCeM
	74EhrflM+eGUMpoAIy34ihmN5TCfPjhcOBHsz6PFeWw2Vm6+rzuMFB1H2/tGpAMMr57xj6suDQh
	dwt0uQFy/UW04W1ANBzeXJZxtrrHZDu1DvXcYPnQ4hkx/QUIVDIafI4BNWLOE/9mKQ1u+J5zS/9
	yKYo3wx1AWwqO7vH/pLTjgSfT9WlHweLlrFqzg/eA6R6C2
X-Google-Smtp-Source: AGHT+IEuG1RbtJ6FiwIucAXGOGuLO6+jN3odMsNV/hZ3o58B9bsNzZE7dpr8nZZ7AG2wrt76ICGCYLz6
X-Received: from wmph10.prod.google.com ([2002:a05:600c:498a:b0:46e:3d73:fc5f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:220b:b0:402:71e6:5e00
 with SMTP id ffacd0b85a97d-425577ed455mr3244884f8f.7.1759352638294; Wed, 01
 Oct 2025 14:03:58 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:08 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=ardb@kernel.org;
 h=from:subject; bh=cfu0++gxesQ+j0mFCsE0nnO6ije/EROXIJJwVNT18uY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutMcBulsb9Sf4Rn696XB38WaDfWe15F4pq8cpdulUF
 insmBLQUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYiF8zwT73e6+Ks9K/+Zebd
 R+6sq/m6USFAcL2p+MU135V7PqktCmRk+LXMZ/6d0FIN7xxPpoX/jt5W3mGrLFV3wuGL08ZXstw XeQE=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-28-ardb+git@google.com>
Subject: [PATCH v2 06/20] crypto/arm64: aes-ce-ccm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_140400_794270_074C0109 
X-CRM114-Status: GOOD (  13.96  )
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

Kernel mode NEON sections are now preemptible on arm64, and so there is
no need to yield it explicitly in order to prevent scheduling latency
spikes.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/aes-ce-ccm-glue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index 2d791d51891b..2eb4e76cabc3 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -114,11 +114,8 @@ static u32 ce_aes_ccm_auth_data(u8 mac[], u8 const in[], u32 abytes,
 			in += adv;
 			abytes -= adv;
 
-			if (unlikely(rem)) {
-				kernel_neon_end();
-				kernel_neon_begin();
+			if (unlikely(rem))
 				macp = 0;
-			}
 		} else {
 			u32 l = min(AES_BLOCK_SIZE - macp, abytes);
 
-- 
2.51.0.618.g983fd99d29-goog


