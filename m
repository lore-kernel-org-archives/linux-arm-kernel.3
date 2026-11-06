Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4365606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=28CVtl8m;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRDvGh1D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NMTw4oTDCJyIKE8BV8ip+57Dn/aXQGYoxWAp8K3eAUM=; b=28CVtl8mJ5Aha0M/CERcc3BiGx
	7IhbvWwzxvuKzXEKVVf+kGCFxm26s9NDcDZn9OTLxMMFTR+XBKdtO90YfKy16TWv976tNX5TcUVvh
	SHvqi0QUjrPdTQjE8P+0654XGoLtszFkhlD3Hz+ZYo0wTSLT2JvaLV3ZO6ZwEGfMe0wBX9YVsdwek
	BTCRr8ZRfpyn+UITBnwOeHgGIpAhj33SRGRoBPUa7W2EX/MA1ZpwKEeUMt7V8taBWQDE001l+HIcD
	L6NQr+LRBDI590EjfHkOIOyE+gnKysgr8h0AHCHz/iZj6QjzQwcbP4Cogbad60WnTZrBiqGEK/PSx
	fR5obAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDHm-0000000BL71-2MrM;
	Fri, 06 Nov 2026 06:18:50 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDHk-0000000BL6G-0ndX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 06:18:49 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-14394530ec6so482095c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 22:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945927; x=1794550727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMTw4oTDCJyIKE8BV8ip+57Dn/aXQGYoxWAp8K3eAUM=;
        b=GRDvGh1DnWkEaSKhjd13vShYTc6Bhs8fM2jAnfppwLMikt1gD45L2nJC+SEvagQQkt
         chtd21Csgn9tThOPE1xCiFil1YjabsqU++gQDgR4BsGsJW3rxlQXQC0+src/2YHUxVp/
         aJvDWPhJCq+l5o6Irx81BEpCor9iCRrbIFAmDAUYTt/ZwTcjMbnrSXOM08rrSH+eQmPC
         9p6Q/aLPHIw8sRiTKgVzTjE+MrbyHt5xOqlJxWH68lpz/i1vG0MxkzWUY2N/esZrX0P/
         RvfHpuBZxLdBJMo43+6HlvKYLiPzAKNKRBqs3wzyOSFCztRHf3Lkg5xz2eaAP0ZJXjkP
         Rk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945927; x=1794550727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMTw4oTDCJyIKE8BV8ip+57Dn/aXQGYoxWAp8K3eAUM=;
        b=U1SzM/8NZJOLyvMbM2SLuJd9sMV96Nd4wqt6V2gKVtEZBNptkjTuPcZMR8RZi7HS8P
         kE3feUwY5odJDIPfT3mLwurkIn87UIzyqb+vbKaMTwRSyUAWjPfSA0oDpqq2lI9rxEJz
         Rmlg/wND87W/nH1M7xdrBq9DVetjsg85kJBzMCvbS2TRHAuj6qzJOYXtV1ACLncONlG1
         Yb2FWtvqC0JWrH41nYMAvHl1SK6rZ/kPRL8hVSQSyorrZEnNb6VpijQjlt814klNtwze
         a4X71a7mY5Y7uOdpVm0ZYXIEZh08wHjsOhhC0SLhaTWYmVuCzS9a3YRLe4tjTW6J9C3/
         d+SA==
X-Forwarded-Encrypted: i=1; AKwUvBxHaX8CCOZqtjSTi/k/0Y2clbxUoH743mOBqLy7KdznP+HRKPzIfc4LhRFufatzZFenfBXXNki0UrOlm7ukG3gt@lists.infradead.org
X-Gm-Message-State: APuU4Z+nFIgxbxi+cBLDytzsx9GJBLql+2FYpedqQtr5ttFtXWQbxN62
	ul1x2/Cbs4g97CY23Dn0BuDuR1oSaSFMU4rzfUnxyYrlHKyAYdd0wfcmRsIHbnawAg5sCw==
X-Gm-Gg: AYBFou35KvDls4tqL2+dghAoZbFfC6RAkeqlzOaRZ/ESNhnhvmz2FlglaTFHBnz5IWR
	FRfn1mzf5El8wjGfuiYXeGbDNce94mnfFIArwtryNqPbENOQOgW4ZeLSk3tstZcnKCXWYCB3xva
	BayAaGlCeB4N0ShQAC2sr37GGRP0k4qKd9nW/NermlJpDsHSuyWAvPeNmxqKrbiM+k0CB3t0GPq
	q9evODa4RUt4Pfz27TD/vkEez8u8pu9k+O+zs/rw+JJStAPqUxKwR6hKrThorIJorAkLsJOdchd
	YPmgNH4//RnizBKnANylHtTlykM5Wockfyfrin8OH8qeQqBuZaSWMxBWL9Ti70dhv6uFn91VKSP
	6CQWFPVqIBxS1qgV40Xbcmu+KC4K9/2AoNw+SFeB/S10b/h+n9a6icgurEdkMjdPlnmjFXw47Oi
	+9bnr2+5Qz1i6H/Nm4t0LXUIi22bhUiYSED9Vcj7wjDPej99E+XfPF7soiWiDSd3FqDquv8ZaDY
	nAmuk/2WlpnHeYF2GbR9tT/6SyQVk24zjM5esxTudBRUhMXQuJO7L8FrgHPRpFWbBHG9IbKmg8p
	q/NqdFVbU+h1Q/7TL3HRP+HbqdiwsKx3tZZlXXiee+fF
X-Received: by 2002:a05:701b:2318:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b25d359e6cmr2423409c88.41.1793945927182;
        Thu, 05 Nov 2026 22:18:47 -0800 (PST)
Received: from aaron-m75q ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm2675521c88.13.2026.11.05.22.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:18:46 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v3] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Fri,  6 Nov 2026 14:18:35 +0800
Message-ID: <20261106061835.1316-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_221848_260233_2FDD83E0 
X-CRM114-Status: GOOD (  18.20  )
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

Contrary to its name, vcc_sdio is the IO supply of the SD card slot: the
schematics route it to SDMMC0_VDD. It is listed as the vmmc-supply
of the WiFi SDIO node instead, and that consumer keeps the rail from
switching to 1.8V.

The WiFi module's main VBAT input comes from vcc3v3_sys, and its IO
supply stays vcc1v8_s3. The card slot itself is fed from vcc3v3_sys
through a switch enabled by GPIO4_D6, which the vendor device tree calls
vcc_sd.

Fix the supplies of sdio0 and sdmmc accordingly, describe vcc_sd, and
enable SDR104, which now becomes possible.

With UHS enabled, sequential read from a 64GB SDXC card goes from
22 MB/s to 60 MB/s. WiFi remained associated at 5 GHz, with no WiFi
errors.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
Changes in v3:
- Describe the slot's own supply, vcc_sd, and use it as the sdmmc
  vmmc-supply (Heiko). It is fed from vcc3v3_sys, and GPIO4_D6 controls
  the slot power switch: holding the pin low leaves the card unpowered.
  This is the same arrangement as vcc3v0_sd on the ROC-PC. The existing,
  unreferenced lcd_panel_reset pinctrl entry also names GPIO4_D6; the
  vendor tree uses the pin only for vcc_sd.
- Link to v2: https://lore.kernel.org/all/20261105102556.1365-1-yaozhonguwl@gmail.com/

Changes in v2:
- Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
  instead of dropping it (Heiko)
- Rewrite the commit message (Heiko)
- Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhonguwl@gmail.com/

On the boot-time issue described in v2: with the vmmc-supply in place
the sdmmc controller now probes after the GRF io-domain here, and a card
present at boot came up in SDR104 in 5 of 5 warm boots, against 0 of 8
before. That is a change in probe order rather than a fix for the
ordering problem itself.

 .../boot/dts/rockchip/rk3399-firefly.dts      | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..03858a4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -233,6 +233,19 @@ vcc5v0_typec: regulator-vcc5v0-typec {
 		vin-supply = <&vcc_sys>;
 	};
 
+	vcc_sd: regulator-vcc-sd {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_sd_en>;
+		regulator-name = "vcc_sd";
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_sys>;
+	};
+
 	vcc_sys: regulator-vcc-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -731,6 +744,12 @@ wifi_enable_h: wifi-enable-h {
 		};
 	};
 
+	sdmmc {
+		vcc_sd_en: vcc-sd-en {
+			rockchip,pins = <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb-typec {
 		vcc5v0_typec_en: vcc5v0_typec_en {
 			rockchip,pins = <1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -777,7 +796,7 @@ &sdio0 {
 
 	/* Power supply */
 	vqmmc-supply = <&vcc1v8_s3>;	/* IO line */
-	vmmc-supply = <&vcc_sdio>;	/* card's power */
+	vmmc-supply = <&vcc3v3_sys>;	/* card's power */
 
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -804,6 +823,9 @@ &sdmmc {
 	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_sd>;
+	vqmmc-supply = <&vcc_sdio>;
 	status = "okay";
 };
 

base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3


