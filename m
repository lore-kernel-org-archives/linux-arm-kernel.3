Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B2606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CN4p4OT2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBH/kxse
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zhSkZK9wUJ7MrrG0jC3AixVJwTfUNHHFD92YhMooG3Q=; b=CN4p4OT25xgxnN
	Rue1E8TGN99co3eOSLlZXkE6BjbNUxsatMQHHODWfsqw6aGbLs1Mvnx7Rl31SmkLFeLSGME5qCEP9
	MYmeM2ASGOZbm7Vwo9bemQ5CvG7Wyz3JnEnaptgptk6XYLaJYvRuZH2BzVfxagzShdJU+FKDDMGe8
	pckFTNxe9lMXfpX0xtYX9+bobQqfI3rH5DlaMZ9Kye7NrV0EPnOEVlDUkENbZIkBFRS78KRsVuS2W
	OTb1gWjgxWOjvF4szRmMgivS7Di20/kuQR3ndW6enDwoTik0p7/nmnWkxIwMWzbSYCOPEwRTPS5Z5
	DrrV1AMUAin3rWN858Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0x-0000000FvsY-3Y0M;
	Mon, 02 Nov 2026 09:07:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0t-0000000Fvgr-1x7U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so10383515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610453; x=1794215253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhSkZK9wUJ7MrrG0jC3AixVJwTfUNHHFD92YhMooG3Q=;
        b=oBH/kxse9DLqPUjWD17p8qK+ZXHzaFD+WphJkpqZoSvI0Dw/0vsdLCR2FbsYhm6To4
         q8E7TZI8VkmdOZk/gTztBGfdlsKOxmKjBU5AfaDYNl18HKvI19m7XWoBuPECYH8hH32+
         YQ+3wn6MlfVd4t1chtXaeiPABEhvyt3jWLPrVix3iuiXzKH6qeZruGR1KG9n32mXEM/e
         xP+9ebjUfgXmycKJO4fuzar6VuXI/1WrPv6iOT/PkupSuLCT70e3kJONPCwcmEd/iKdP
         +UNedefI9pF1KOOcooWhng7Js2Z2syOp3UJZoCXyconbvJQKg2cpM3RKkaQKQoPQoW8U
         foaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610453; x=1794215253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhSkZK9wUJ7MrrG0jC3AixVJwTfUNHHFD92YhMooG3Q=;
        b=hkJoM7zOtkArLPmEKdzlzzMaOltCR7CY+mDkx0EnEtVP0t9q89K5mqwxUMstHutPNk
         kYoU++m/I7P0mbBTHGIPLMo+spt+giHCYDrXk9UQfMmZsUYwLjIfNxcK6J7HTnk796pN
         XWmEoYofItHibmwjtKujc1lS75oWhwauWe5vddCX0yKtkRDx9eC14PpOoC01lMIFwHFx
         1B/UljNTu6ilVbFgBBwMPtX65X72JGGUFGkqNqRjqSPGysgHtYjEunjv8o+olC+j6fBx
         q8Ziy4Z4nFPqVl843sSfP4NPwYBNQXYVj2YNa/aorRcAoap8BNy2unxYfsmNkGOankUl
         hYOg==
X-Forwarded-Encrypted: i=1; AKwUvByQW8IRkZq7EiGn3KR1rjJfsRy54pPPWkyUNSb27nJqrAZvUgogkm1oEuoeKyFr+5uEIGsgQXQieliiaNWNmi5F@lists.infradead.org
X-Gm-Message-State: AFq9FYLPdfy+ZfK0XR498et8PmJNv+H0NlhyqK4wSbvjAkuzYpOgXeJb
	m2kQ9ACP2t2Hq/HIp4yTgJvY+UJPP0voJ07qMcUKBzTrICYi/GmiNSXh
X-Gm-Gg: AYBFou2cYfVunGZij4dJ7NVpFwQ+7D804tY1GyF02fJxDNr3HEkw47cKHPoTOdCEN6H
	0B+YGlgT27b6vdQAj1TlS8gN/na+kRcKxWAcMwTyepO37BVwB83htYd3B2Jgt6g5GLITxJUx9LL
	1QqCNZvmG4qCwEqHvW/xQp6yVE/zFlaSutPxfVyoyf8nidyRBkJZV+mxQlYuDycOOIHkPyoz0xa
	YEs4U9vaqrVmVIKfmfsb6LVE9/j1ZopQGM76Z9ic6QTX6RrGJQ2mow92DpPI5oVNkiN63EBGeA1
	JfdeQQ6avwNu/T2zLI25jKXQCihIOXK6/S9AWAqTf7ylJnJB/CVWVUe9pKYuYTiz2y9gwzNMzbY
	gwJVxidLoXe7YTrdac4BTaRaaMVU2eK2v+92SswLq6nmSyjoa0seiTZ8szDxOe2NLz4I22OvMVL
	91HCFWPFUyEMCXuvPzGOa5DOpjwbwwjEZ+mQtLb+hh6fdCuUv85Pg4FfeI4Qm2uP9jC/jukeYFi
	ojfEyvthmwPOo5oG04HlkV9Dt8dJxWjeoeAnd3dgMAnGXl/MEmb23QgqTVqBSKbwVhtrm0g4yL5
	iizOKiyHlzD47LyC0m/NCt4hmA2k2G9i0mGAF17mlvvR0RgtZ8K9rV9gRTZHW1qPJmgdHzfpiZI
	g+Wq6bdz/HceWLsSuBEqGf5V+hnFvPLX577HPpOgXJdc/fGW5Q4B7qDKrP7zu2pr0LDoxKflvXz
	pbYKXF65QWczcR
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr216013045e9.26.1793610453395;
        Mon, 02 Nov 2026 01:07:33 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 9/9] arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio
Date: Mon,  2 Nov 2026 09:06:59 +0000
Message-ID: <20261102090713.896324-10-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010735_548168_B7E3E1DF 
X-CRM114-Status: GOOD (  12.82  )
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

Enable the DMA4 controller, excluding channel 11 which the VPU
firmware uses for VCHIQ, and hook up HDMI audio to it. The D0
stepping uses different DREQ lines for the HDMI controllers.
DREQ numbers and channel mask match Raspberry Pi downstream.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts     |  8 ++++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc5..3322862906f62 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -51,6 +51,14 @@ &pinctrl_aon {
 	reg = <0x7d510700 0x1c>;
 };
 
+&hdmi0 {
+	dmas = <&dma40 12>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 13>;
+};
+
 &uart10 {
 	interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index e5030da60f9e7..3b55840414975 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -117,6 +117,12 @@ &disp_intr {
 	status = "okay";
 };
 
+&dma40 {
+	/* The VPU firmware uses DMA channel 11 for VCHIQ */
+	brcm,dma-channel-mask = <0x07c0>;
+	status = "okay";
+};
+
 &pinctrl {
 	bt_shutdown_default: bt-shutdown-default-state {
 		function = "gpio";
@@ -254,12 +260,16 @@ &hvs {
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 10>;
+	dma-names = "audio-rx";
 	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 17>;
+	dma-names = "audio-rx";
 	status = "okay";
 };
 
-- 
2.56.0


