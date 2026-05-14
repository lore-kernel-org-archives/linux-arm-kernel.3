Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C92CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=; b=25JvHn2TCkwsYasJ4BsF3/JZgC
	FDnJkevNwcEN7wtaINFAqAKRHSGkPwPAZVT3xb4mIBlczO7yqDGby/sdMLXklJfx3NkN4NJzQTMxb
	YY8pv0mFyxO6mZBR6BzWj1iqTYqS63KVl5KGWc1OX/qurodgn4OU4wFvUpCFuu+XBMI+rP1mPszbm
	Fzm2/laQyTOnDNLlPeT5MnCSIsw0Ob/6nOoZV2ICQybwhXaSAovTYin4c7kypYLVumUwr4P1VW9wN
	P+KnyJZYKyKI3XftTsIkku1BifHJjj89fXPr1kb+iShwHIjpHPBRFT+GHaJX21+StW+/X/kkKVHHl
	Uf/VduFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT4H-00000005A0U-2YML;
	Thu, 14 May 2026 10:13:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT44-000000059pv-3QHH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:13:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-835386ff122so7444614b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753592; x=1779358392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=;
        b=CARzWmofQAFVmwLBlXZzG1KsWaCaT8JOKuXP8GD+ZhKC4rqSh0ii8qyTsRuIJaHyG8
         IWcMWS5SSaaYP24PerJMZQ8JLAIlsqR/JpLzGSlDQ9QwHGhcObUTN1onrDvIpyYCHSof
         3gp5ctiWYGIKdjgDadLlnicfrtn7yiR33cKs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753592; x=1779358392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=;
        b=JcU9i2w8LBxWyVxx0Dy5erqmfUvSGfCpZXTJ4TMRLKlvsUyZ1ZTSijg3mPgoeO6l4n
         rqs4nq5Y7EmxGf1XrRDZLeYoumFMmQY/9CYbFd0gqjxzUnyjYJmizXIQVtdGGUN6/Reb
         men2Xqxp3R+Hq9Yhk+JsQcs5mGH6lOoeZkY9aBcoiV7Ou6TCENM3bCE5nAYn4Te4OYT2
         9AfpdggYzz02Y8Wo/y1BnwGRPbJsewG89m6f8Ynl0IoNAjV6E10G4c81J8pT3maCKEFl
         +Yf3ZIqXZnpVZYMnwDk70IR2Nqbz+SgOiVU3Ea1EjKNtD9Xl31Oznlp4pNElHeDptRbz
         WMiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZI3frKQOPi9YL55K4JvXDoLL/Oe5DlqmM+htpmXbstN9OoCnZPsb0DJWIMQjqqL2XRM3Xon9vovVpsfFddYK9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5IpQPeAFgpYsIltmKkHZjjke3jgJP4t6j26zVMltX7N7EepeC
	zVXA7tKXLl/lg/uOzQ+ywFtT0sxyXC6O4z3gHyh7oyTo3oK3Liz+buzw6yS42Auk6Q==
X-Gm-Gg: Acq92OFkj/Dimmpir6ovqOaC2GMphzkk2QiY6RDG+jX+uU9/Eqzqa4TM8nqdr09YVcG
	hJSJ+jMQXWPVN/WkRliRx/C7Uu2uu7ZbkoO5AiqcFjqAvonD8M2zfl/Ah4FNh/3KpHIceHxeZTi
	eoyaOxcdwwJO3IIiqsw4TBWn83MS9Y49+0jmzciqc2A7LC46FuW+64OQl/qSOpfAgHLgaH/NhEB
	qMBJPBLoKKbm63OORtz+qits4K6+krh07WWEnPkbhyZcKZ7IaFuSW2Jd+SnBwtaBqBCgxUNDIAz
	clf9A92MR3PN7C+oSUqx9wXjOb9jY6fyG3fS3oHY9eGOBywoumwMWdgSGNBzWtc8zdMXcD+ZH76
	Csi4dO5oSfhHrfEhzCg6vDwdN4+IqU/a3gZnjj2fbk8QL7o0KKG8nwAjNkoog4N8Y57ZV/Rq2Gn
	UfeYzFimr9Xnp9yDka6kgMI1Sy3UwmVCKEt3j+suW8qHAw3B2Np/Ng7hYwsIvxkQ3lAfDKad8+t
	leM5LX+tWNwETvcvIU=
X-Received: by 2002:a05:6a00:439b:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83f03fcc5afmr7790644b3a.18.1778753591788;
        Thu, 14 May 2026 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly
Date: Thu, 14 May 2026 18:12:52 +0800
Message-ID: <20260514101254.2749300-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031315_321969_02625E35 
X-CRM114-Status: GOOD (  13.04  )
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

The thermistor device nodes were added before the vbus regulator and
reserved memory nodes, when they should be after them, based on
alphabetical order of the device node _name_.

Move them to the correct position. No functional changes intended.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 94 +++++++++----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 538c46ada32b..ef7afc436aef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -149,6 +149,53 @@ ppvar_sys: regulator-ppvar-sys {
 		regulator-boot-on;
 	};
 
+	usb_vbus: regulator-5v0-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus";
+		enable-active-high;
+		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+
+		adsp_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0xd80000>;
+			no-map;
+		};
+
+		afe_mem: memory@60d80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60d80000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_device_mem: memory@60e80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60e80000 0 0x280000>;
+			no-map;
+		};
+	};
+
+	spk_amplifier: rt1019p {
+		compatible = "realtek,rt1019p";
+		label = "rt1019p";
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rt1019p_pins_default>;
+		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* Murata NCP03WF104F05RL */
 	tboard_thermistor1: thermal-sensor-t1 {
 		compatible = "generic-adc-thermal";
@@ -219,53 +266,6 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
-
-	usb_vbus: regulator-5v0-usb-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb-vbus";
-		enable-active-high;
-		regulator-always-on;
-		vin-supply = <&pp5000_s5>;
-	};
-
-	reserved_memory: reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		scp_mem: memory@50000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x50000000 0 0x2900000>;
-			no-map;
-		};
-
-		adsp_mem: memory@60000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0xd80000>;
-			no-map;
-		};
-
-		afe_mem: memory@60d80000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60d80000 0 0x100000>;
-			no-map;
-		};
-
-		adsp_device_mem: memory@60e80000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60e80000 0 0x280000>;
-			no-map;
-		};
-	};
-
-	spk_amplifier: rt1019p {
-		compatible = "realtek,rt1019p";
-		label = "rt1019p";
-		#sound-dai-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&rt1019p_pins_default>;
-		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
-	};
 };
 
 &adsp {
-- 
2.54.0.563.g4f69b47b94-goog


