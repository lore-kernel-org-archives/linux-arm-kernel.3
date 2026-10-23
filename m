Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18076606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JSOQJCca;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d7o8I8uS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZJFWHzliBTc3+ANTD4MSj5zAkBWI2RhH31jFlttP6lk=; b=JSOQJCcaAZkAZG
	MjIF99bwj2znISbEiO9HcrgiWHOzszP9iacx8NB6JT3LpYJ/9s0RzY3fK1ejUe7M1i02C/qyxbPVQ
	XkXk7q60xO0HtneyeZPhEGrAOtlsbE8iqAXeVdprE9ZO7GSOSFrKlq64P7bUQWc+zQk4yKTw2ASD7
	YVMPvfJvZew7x0JfuZ13NcbyFLIldgrh+VBSp7hka4OKG7BQkUwvItsk/UvO20re0CFMCs2tDGrW2
	uDIDpSHWYQlmCy5+pX5SXhDCl29mgBtqQuAlFVl5AYeLIMRBwGC4h6ZwOJ9tyYkmbZyZVNi7ai93n
	rrOEGiH0iRNZmc1x0LGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8xB-0000000Fbui-47Zm;
	Fri, 23 Oct 2026 06:40:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wx-0000000FbeJ-16Vq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:40:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso280624f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737621; x=1793342421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJFWHzliBTc3+ANTD4MSj5zAkBWI2RhH31jFlttP6lk=;
        b=d7o8I8uSOfWmEo71X06rhBa/tRI5tyPhoYNaNdMadcD4LXHvyfzfJmRbPmugroJAAA
         gLnyigfDZVmuUhiBIBzE0TEFf2hXbdqD2gcG7VqzNs/PKgc1zIK/g6j92p+YoqploJu6
         7GgA3hfwX+1voeuoginFZpsDepejNLL7iCzetZ2qRlwyUQb/ZDjpkI1HdRVJcAgrMriG
         O1sTEx28Bv6OclchLF7g1j/wsie7KUrjs/5pM5ecFyjZ1N5IA4SDJrCi9r9Oh2aMbbB+
         V7LpVJbfH98QC7zdMen21utNjgaWVtRPwbEnotQHQfvXFngvR0IDLtERoliVw94AfS5i
         I/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737621; x=1793342421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJFWHzliBTc3+ANTD4MSj5zAkBWI2RhH31jFlttP6lk=;
        b=sqGl8cRh5Ro8DdP+WKKqIXUaZlqt/vVSHx1Mcw+jDT5MPZuyBRAKR1ECou1pvOK/9x
         3Dd6PEjHk3kvjXHYsDFjZTpVTgEd+MrgqwyqHTLdGKF2f6kHbQlQGlEJp2wQMaec3lal
         Oxe0vl3qCWZ2o5J9pR8zUD+qV8MNOc6I8VHk6DcIoFIMiR6m1aDZUGJ8Yuwo7hVGts4f
         GTx5QgqtyCpAJmtgOtO8BN8zkALQ3/FwMsDO4WaRB9bqI4y3OkRddk7a4KLDdkdE/TZr
         Qfz+LtRhQ9xPLjL92s3XEvKRfro7P28iAtpnWXMbEtMXzvk9aqQ5rB8jYwpzt8HyrrmE
         0DSA==
X-Gm-Message-State: AFq9FYJWwIFUhLXD4GcQHtxL+aFosQYfF/6Pl9MS/epnx63tY+tYRfy0
	TPTsh+LyGnAGBZQgBcVGYq+ig1SmB2c+Xie5O+dLMtMZOEXMB8LDT1Y7
X-Gm-Gg: AYBFou36n2dMUyV/eRvHLRFlVBQC/URYIkxTXfWYVneEVODpQyU2YfZiKazwdc8cES/
	ut5HaEYXsx5z3KSbEK5aVgknidR1ngLFG4GWk5b/oblDR4D7d5MkXO+w6gJPYT6NBTxxkVzFEK8
	hTWvLmMb2lMI8vCF+oLArRerZdvvm8At/VFkuvWV6Zsfd3Jg7Pavgj+I2+Y0WkqDe3R1jm/vfO6
	apmFQuOdmBidQTsmGZtMSV0Ycs4UpMSOHE7ZhnEczyoGyIkn59vo5hqb22jbGXrIAQ3+DMF5CqZ
	rgyuLIP7NoMZ8MpRgiqUTt4uiJUJerg8d7ckzLG1f5HHxz8oPcayX4W9RKyb27Z/MS9+FVySGMY
	wrwoF9laG7StsEL5809h+kv+5zpt6USUeoXieEMiEOXCGIqzj8p+N24Hwq/BRrtIlph5m2VmBI2
	GaMwOfm53bZ8xXcKBsaE2bHfyEj+UWf9E08Co7UkZwGqlYyKbDehynyIuR4BNTIfiNFpj+rDzkR
	SMOsjOnUSoUncRVngW1e0qAUy46JptuVsZvSZQfkrdF3LON6nlzX0rWWyj+ThnA6OrxWlCjPb6c
	HhSaqTob2QNMYn1M1RlftL/KZ3O1QHDi4fTTjPRfy1V11uvUO4dejfDUu8uU7hSnMb0NPPVfAU/
	Z0pk=
X-Received: by 2002:a05:6000:310e:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e38588967mr1965340f8f.14.1792737621324;
        Thu, 22 Oct 2026 23:40:21 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:20 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:39 +0200
Subject: [PATCH v3 14/16] arm64: dts: ti: k3-j722s: Add the AUX L2 SRAM and
 DRU regions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-14-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234024_075429_3FA2AD0A 
X-CRM114-Status: GOOD (  13.70  )
X-Spam-Score: -2.1 (--)
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

The DRM accel Thames driver maps each core's auxiliary L2 SRAM and the
DRU's channel registers into the Contexts it creates, so the DSP nodes
carry these two regions besides the L2 SRAM, and the bus gains ranges
for them. The auxiliary L2 is 256 KiB of SRAM in a 512 KiB aperture; a
read past it faults, so the reg entry covers the SRAM only.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 16 ++++++++++++----
 arch/arm64/boot/dts/ti/k3-j722s.dtsi      |  4 ++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 5a5b9a1bfd9e..b6c951a1dd74 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -385,10 +385,16 @@ main_r5fss0_core0: r5f@78400000 {
 		};
 	};
 
+	/*
+	 * The auxiliary L2 is 256 KiB of SRAM in a 512 KiB aperture; a read
+	 * past it faults.
+	 */
 	c7x_0: dsp@7e000000 {
 		compatible = "ti,am62a-c7xv-dsp";
-		reg = <0x00 0x7e000000 0x00 0x00200000>;
-		reg-names = "l2sram";
+		reg = <0x00 0x7e000000 0x00 0x00200000>,
+		      <0x00 0x7f000000 0x00 0x00040000>,
+		      <0x00 0x7c460000 0x00 0x00020000>;
+		reg-names = "l2sram", "l2aux", "dru";
 		resets = <&k3_reset 208 1>;
 		firmware-name = "j722s-c71_0-fw";
 		ti,sci = <&dmsc>;
@@ -399,8 +405,10 @@ c7x_0: dsp@7e000000 {
 
 	c7x_1: dsp@7e200000 {
 		compatible = "ti,am62a-c7xv-dsp";
-		reg = <0x00 0x7e200000 0x00 0x00200000>;
-		reg-names = "l2sram";
+		reg = <0x00 0x7e200000 0x00 0x00200000>,
+		      <0x00 0x7f800000 0x00 0x00040000>,
+		      <0x00 0x7d460000 0x00 0x00020000>;
+		reg-names = "l2sram", "l2aux", "dru";
 		resets = <&k3_reset 268 1>;
 		firmware-name = "j722s-c71_1-fw";
 		ti,sci = <&dmsc>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index ca10c6904b69..6c0d2ee94290 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -185,6 +185,10 @@ cbass_main: bus@f0000 {
 			 <0x00 0x78500000 0x00 0x78500000 0x00 0x00008000>, /* MAIN R5FSS0 BTCM */
 			 <0x00 0x7e000000 0x00 0x7e000000 0x00 0x00200000>, /* C7X_0 L2SRAM */
 			 <0x00 0x7e200000 0x00 0x7e200000 0x00 0x00200000>, /* C7X_1 L2SRAM */
+			 <0x00 0x7f000000 0x00 0x7f000000 0x00 0x00080000>, /* C7X_0 L2 aux */
+			 <0x00 0x7f800000 0x00 0x7f800000 0x00 0x00080000>, /* C7X_1 L2 aux */
+			 <0x00 0x7c460000 0x00 0x7c460000 0x00 0x00020000>, /* C7X_0 DRU */
+			 <0x00 0x7d460000 0x00 0x7d460000 0x00 0x00020000>, /* C7X_1 DRU */
 			 <0x01 0x00000000 0x01 0x00000000 0x00 0x00310000>, /* A53 PERIPHBASE */
 			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS0 DAT3 */
 			 <0x06 0x00000000 0x06 0x00000000 0x01 0x00000000>, /* PCIe0 DAT1 */

-- 
2.54.0


