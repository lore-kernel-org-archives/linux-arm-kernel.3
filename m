Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A144D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CMetophH;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+s1HQM2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pi8xQTHmN8oIR3u41XpUTeacQqSw+crTxhinHNCStKw=; b=CMetophHYe015Y
	TegeM5Crn+B3cOWoJsVr5UYgTzCh1f3AzCqk7PGIuXf/T+s+r7oUvgXV4BKj3UXD6olygIKshly4m
	jWsb1V4dy4xoqCHxlBdLv0vHPuft9FOMitUBoetcb6kenl3Mw5YIfexv+ZEBdt4uqD0qSkqkINnFR
	ro/UHBwYn7iTlirEe2lTB2+ztOl/eElkAQBB/EcGQTzhYJ7ieSztBZSbxAqr0vTo+RFZSMX4MKBGD
	e5CE0xo20ragUQfCeEbh7rg9ezZzi31DfMxkxMGj99suegL2uXowdZ3joc32cTGjhXSSGsGLURLRb
	iayLIAo8tYSpLdJb2FeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD65-0000000BJhW-1rzZ;
	Fri, 06 Nov 2026 06:06:45 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5z-0000000BJaJ-1Ikj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 06:06:40 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36f8cdd30beso703543eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 22:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945198; x=1794549998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pi8xQTHmN8oIR3u41XpUTeacQqSw+crTxhinHNCStKw=;
        b=K+s1HQM2sI7isKwHwZk5/tFQ63OWxwjHntQ8TpYmld6gIeEc4yEEwO6FRPzrTjE58D
         WwWy8FS0O0YFsFTwzgx545GweQQg32aeRgDNVApu1Y27rXhif1QSxOd+ZJrBymul2BfO
         KpYGYiO6LDU4WXl2I8XgevyuHCiMzfVyYWxLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945198; x=1794549998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pi8xQTHmN8oIR3u41XpUTeacQqSw+crTxhinHNCStKw=;
        b=bNS4zeKKDS0DvxalQTn2wViPkd+nbolYswNgq+RCXqiXUqiItG5NP8XY9YHu6LcxEm
         LN3CV7eQWqV5udwf4MN0oRro8xgjFcsozCNgZru/y4FjrgBOOdLLsmOSNNok1AXYA5hs
         41AH8TDCYVb7RzidtpqDSgwmyDcVys3oYpnPqj+GSGZfyPU3rd/Zclh7r/6yqUTxvSGV
         k+ew/piuv4jv2C0iLAllS9ouC6GEYyejlaw7+FYiWFm4ykppblU9hIfzM4V7pXNRrmbp
         pf+menp64t1KvO2aRIh5t/ONf+qJwpTLcFry5rWn2bLK7PQ6L6Wec1eVXJjnGL8fRMJK
         xcIQ==
X-Forwarded-Encrypted: i=1; AL+hErGz5uvNnqxOXcHw+SqEKMKiKJhxD+SxDEMjjGa41puKzOuv93tmdALVzKhHn3rH6zDdXWaas76ZBFYf9KWF6MMC@lists.infradead.org
X-Gm-Message-State: APuU4Z+tErAkdmRzkdD6lzde/glhjbQ6O2B2AsBH5573tW92N2rrl84R
	zB+tXr2Av4ggTkR6afTveZIw+L/bdTwzcDeLmfqeFRmW1HajgvSmFX6bCYMYRDUbGCzeVRT1ve2
	ln6g=
X-Gm-Gg: AYBFou0hcsLD2aNUSQZRjuikgjriQce/7Jxwl68bT88lRjaIquNBUOazrtG/vx+WI06
	wFApMZwLndfCHBzQ+J+haTGQTWNOkvFRFzMJTTd9gErNI8BueC7A8XS52MsX5WuoFyAg83rwiVJ
	uqcA5h8wuMKg2rNPUFbcjuI0louF2Io1BDGwe6IRfoMVRjc7QflosQ7ghT1u5bbzM+qAAJ0bC5e
	tkydfZlRb2WC63gUWSd4HMHTYQ4V/9GqQ24ovSp6d1JgT1oa36AAaRl/7Ki6fAmof9CjQXxCoZz
	ra3H94znu3WakF8Q0S3blrY3PzSorwPVs7UFkHgwplPt9moyKK/8wFafiyr2n39HIKS97SJQSax
	SPJoAIMPKK67lcX/pgOPSHrWEOHPi0KXRIkdj7yl1e1IGn9mZH/pt2tSPJ9AiT6M6/z57TEpvj9
	1wFRsleVp7f0zmcg/VPOn7ysspmtwHVsvoZkVvFXxDOfEWCl/7u7cxVgxpzIY7kET3YjgPEfGow
	hBOJFv3MG27QGy0t8+f9ciQ5l5fzNbzzI3UVq+27KqPYoF2MpKFw54g84rKyrvm79jCd6HGNg8l
	Eo8ZfyiXPLmDP+tfi+VAJGpMW4Kyl9ad9HuuHQbzlbba3FWl1afakR72Gx/Vmyiz7Gpz9QHOGQJ
	xTZPEuae1NEJ5
X-Received: by 2002:a05:7301:4249:b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-36f776f1f8emr2009226eec.33.1793945198326;
        Thu, 05 Nov 2026 22:06:38 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:37 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8390-genio-common: Fix swapped USB hub labels
Date: Fri,  6 Nov 2026 14:06:20 +0800
Message-ID: <20261106060621.2706658-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220639_712705_B0B2E473 
X-CRM114-Status: GOOD (  13.27  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The TI TUSB8020B USB 3.0 hub on the Genio 510 / 700 EVKs presents
itself as two USB hubs, a USB 3.0 hub with the default PID 0x8025 and
a USB 2.0 hub with PID 0x8027 (the USB 3.0 PID XOR 0x2), as described
in the datasheet.

The hub nodes have the correct compatible strings, and are attached to
the correct XHCI ports (port 1 being SuperSpeed and port 2 being
HighSpeed), but the labels are swapped: the USB 3.0 hub (usb451,8025)
is labeled "hub_2_0", and the USB 2.0 hub (usb451,8027) is labeled
"hub_3_0".

Swap the labels so they match the hubs they are attached to. This
change has no functional impact.

Fixes: 20d959fa6fd0 ("arm64: dts: mediatek: mt8390-genio-700-evk: add keys and USB HUB")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch

Compile tested only.

This patch, including the commit message, was written by an LLM coding
assistant at my request, based on the PID scheme described in the TI
USB8020B datasheet. The PIDs in the datasheet were checked by hand.
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 63b4af476959..e5c7608dca6b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1539,10 +1539,10 @@ &xhci1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	hub_2_0: hub@1 {
+	hub_3_0: hub@1 {
 		compatible = "usb451,8025";
 		reg = <1>;
-		peer-hub = <&hub_3_0>;
+		peer-hub = <&hub_2_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
 
@@ -1560,10 +1560,10 @@ usb_3_0_p2: endpoint {
 		};
 	};
 
-	hub_3_0: hub@2 {
+	hub_2_0: hub@2 {
 		compatible = "usb451,8027";
 		reg = <2>;
-		peer-hub = <&hub_2_0>;
+		peer-hub = <&hub_3_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
 
-- 
2.56.0.455.g6c5a503b38-goog


