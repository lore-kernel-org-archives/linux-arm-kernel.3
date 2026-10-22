Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99793606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=28PVkG1g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hFM/Raui;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4mo8PVz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=; b=28PVkG1gYcAkpU
	LVr1mCnOzRjseuZYr/ZXvX7cLU+pFFefyTtYWsuscQ++HUMC+9o1K9L7MNxKYC9SKchlaV0H3E0sM
	sCDtR7xczBBCoY+BPFWq+J5aPsnlTWOMEMTOjcnQVLPGdERxML2/x39cEkNOrCql8YeBtgS5nvTBu
	0TGHWpiQtUDCMKlAwCM9/Q/xijVdsGr3/HsOMCt1+H4O1fjR8wt4KwMjIBm8hGXGJA1xOmIFRSfS8
	GatfQaIr4ckLCPDpHle3NnRu9s7fAjV1obOSniByGPSlFE/mUMQDBmPZJJqw/jp3CIP5St3qaCq2n
	8AFQTjy2l1+s0IywqB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGw-0000000E6KA-14c7;
	Thu, 22 Oct 2026 12:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGk-0000000E6DS-364e
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 12:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=; b=hFM/RauiIMtcfoLKEsy7jTE4BV
	H4Ws2SeBui/vZ741oXmaw3hQ44il/3xbgZ8Q8gr3+ssRcirmKJ8uc8ffq+Rb6SYWosL3kykSjcbDy
	gOH33kV8ukqdeGOx6Ujz8YzFeYWIVfW7DUmJWz7VYtHaZWKrrhr18qF81h+QSo/EMuuIfnaVJ/xtj
	DtzMfvEh+wTz7UlvvPHKSeqvjE3DBAeL+hp9vQ1L2ud/ys1yjRwGHQf9PbS9mKeN0lREyvuA2RElC
	/27Dg770h4NI8gAfMFCajtu9F+y5FzhlAZHwRkNdxup/ulIYxqsO+BvUjSiaHkeR8HiEwX7dhkR4l
	J6JpTXzQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGe-000000077Oi-2OSA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so14664715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673492; x=1793278292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=X4mo8PVzfVuc/lqsRLWtle84EMZIY646ehsXVhv1MfSaPkX2QarX07oiI9Bortz2Qo
         /wGJABHI4FzBj2TnTxmLBgi+21MHz0xQafUOqKu4cfcpejQu0ehyvpXVWLHFwc9RzhpT
         XQEQihtDGriqmqMdVbDggjQFevN1UpZpZEOFXUbbMXKVlw5/VROicClqwgpKyJ132c+S
         wiBpe/sv0t7rzwaD+EFWyo1GQI2UJ+MrjJpOgAT4zD8DHqA2cCxcQNn2JJyvvqUl7n35
         d1wwR/a3q8/wHiDli4ZX4+rIgqHumsqekWSLqFcp/VSYFITl1t9k8m0Vm7e0JypbH0UP
         /98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673492; x=1793278292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNm/9g8tvXvdrBfPLA0jc0/PXVgX5xc+si2+Vq6b1jY=;
        b=2oCCLp7SpXUpkepIeplJObYs9KrFIKptKwVJc5B/vXQdnvogXp9eCw/0KFj+6M2Uqa
         YLHSJhkfewlPzRKXUOLwFxR/dDQUXD88tTLmCIPvr8lA250nNRcg76Jl56Rphmhh7IX9
         LXuE2i6dYBFcsfXkF9unn6F70v1Pi0xvkRVB6tj/KFQzODkUh1/BBn/qtIuI95tc7A36
         kPNZ+6bDogY40PSWRPAgfMyZ08unHd49UeYpvlBwqK04erwolSWUtyXcD8f4E+mQwFwS
         SM188Hx9mcRMwA4yV4zeBjAK2mVNwwFa2KAG01enUXHbLBaJljggZ/VDacCQkp+ksp+R
         rFVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIi5LUZUCnuPzYW53Cy7tRikcXGAOnR4KUFT0AeqV9yWU2OPflApcYqs8p4aV5YE6NXaPtg5d1rXW8hcqm2j7I@lists.infradead.org
X-Gm-Message-State: AFq9FYITK7S998JFlk6UhLW7JQthgRG7EBnjDqrhxIsmJSHvuvoDPLyI
	h7bnNaLGzmh8Qh3cgbdDihPZG3mrBudcz6iYYqa+p4c8jP6mYOtQc88n
X-Gm-Gg: AYBFou0RfXkhR2s3Tgplvje/5ByO/rpT804+s7yYHp+xLSXTI5ozltDPrskMjwvCUiy
	dxkc87VsoRqVwkgrUQ2eQKA3DFBWpUOutfeW+c0ieRtrXnXOoHHLl7gkW+7Gnp5nqRO4sfM1Z9M
	XoLm86vY8Dp6ZSQFDEGqUNEBW/GgsZ9FsXhDLYX3WVUfpRSrZQ1Rj60IueclsUlB3rlK6i6k1+0
	vxg2qlmR2gk11dd+Dl7rCMWW4pingoJkZIMAzk8U9bZZdCJ5wDI69vuPZXzzFkHsHPiwzDpTd58
	gf+PrBVMey6/2GLFfnqcIyXDdeEugNqT8gaPP1uuDjpHjFawEuHP+HbWXEakwyK+sep3uf/sbi/
	5In3JQ8Vfr6dGiTtDUPlnkpgEYwinH4bqCKg/CjEOagVYvIQwqaVjGkCJS0VNKoPOpBReC+uDul
	lez73qIY6v+FMNDxbOOaxXSGhutwXAnTHJS7utyJ5xFzb1o3QN/80k7j4PMaYki/j5Esb4kC0P1
	+to3uLKN0tem7MGyqErtHPcinv6Ewd1JcmyzzSKJv7wjCinmWU15G8WT+ggLI93LscIdFeQwFeP
	AnDLgTYWLxwILpmBg950+DavL7xoM7YH4kjzqy19vdAvgKTRzyKxnj8=
X-Received: by 2002:a05:600c:1c2a:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4a1fdd4fe80mr121580035e9.26.1792673491651;
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:07 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8-apalis: Add NAU8822
 Bridge Tied Load
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-imx-nau8822-btl-v2-3-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_135138_471037_EB793FF5 
X-CRM114-Status: GOOD (  13.25  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 on the Apalis Evaluation Board V1.2 is labelled nau8822_1a,
like on the Verdin Development Board, and can use the same Bridge Tied
Load (BTL) overlay.

Combine the overlay with the Apalis iMX8QM V1.1 on Evaluation Board
V1.2 device tree to provide a ready-to-use DTB, and mention the board in
the overlay description. The overlay supports both Apalis iMX8QM and
iMX8QP modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 3 +++
 arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3821e3f16210..0b8f497c5c6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -810,12 +810,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
 
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
 imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
index e4b662519a6b..cdbe7bb1ba90 100644
--- a/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
@@ -2,8 +2,9 @@
 /*
  * Copyright (c) Toradex
  *
- * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
- * combining the two loudspeaker outputs for higher output power.
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board
+ * and the Apalis Evaluation Board V1.2, combining the two loudspeaker outputs
+ * for higher output power.
  */
 
 /dts-v1/;

-- 
2.43.0


