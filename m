Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658A3C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 05:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yg6BBDLYoGyifIg9RVhTYdC6MChPe9nDARLhmJSgMKY=; b=iXj4fVChonUYI/04kUS2kyQzHH
	PQbKXraCEtTuPZvX5u1yHbRNncj9sAqt65SpXfA/xzPJ9ODJwf3ohEVsqLB0OtXuBe8Qq3mM80++D
	BxiVC4c5hBNyVq+iT7sLdbtaulxrEDxFaYy1EYT6Ic98B1PXW2BuH8mN5p91HjGGLHpV1s9vTOMU8
	iPkuEFTAhjs4gSpCZflUEsgIVvR0OJXJyGJqvhdbr5unwFRDUaeO1bqthhOrdaM542g3BMI1fCmYl
	9CIMuUE2BzY9x1y/oNOX61EFNbZ4jsZahDvUJGy9/yxq26aSVunQZHp23sbnaEvMRgQ+f5cgi5BQC
	EqQWqMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNI2-00000008H0d-21ft;
	Thu, 30 Jan 2025 05:40:34 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNGg-00000008Gq1-3XvS;
	Thu, 30 Jan 2025 05:39:12 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so1601299e87.1;
        Wed, 29 Jan 2025 21:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738215548; x=1738820348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yg6BBDLYoGyifIg9RVhTYdC6MChPe9nDARLhmJSgMKY=;
        b=jsEgWmiN8wpGUiXfhsDwVK0Ohu8xJO9j4RIL3czUj/K81FjeaG3Vu1CfRKBK3y1gAN
         xZ1OrYi30lyADwe+6v4M8gXQvFJfHlwlsl1loSC/epg44RhTsfAfSQruUuL66tDEz2TS
         yVmozvJAiweN6czUNZ9S522+J01linSUzKuYqzDZbkFHkhejCEsyLhYblvj4PdtgszoS
         38ew86D91KgEHyy8+pHHg7f4bRt/40dub+0/u5JdxM8ErwVFToOGJTb700O0zWIGiZDL
         ztgphJA4qogUMekYvDGkEgoBMLnsHN5KoV+0YgVTYM3rNCuky03RtN5CCPOjEq9e/UU9
         Ekag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738215548; x=1738820348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yg6BBDLYoGyifIg9RVhTYdC6MChPe9nDARLhmJSgMKY=;
        b=VA5NT08Tc47y/MtJ7uoKEcMVqiN8bTFItpO4t8GKtIHZDUMcFybc+yzUXBVG8Kjdr6
         jZufI7KcoFw0liF/hATJP8JXEeceRKNkZbksTFZ2TJqWabLxfzL9NpNr41o7WZ1IkI2/
         ku+88WQG891no4/+TShWb6SNemx3Brn9EWcleYZVgiHBlTn/c84Kx/ggUuSDolfWA7Oh
         6E2D05avWS9WZ0HQnPeanhSoOn0STpial7NAc7BvmZIkZpIDaW5EbAHJMoWzOx9dVuCV
         rGUOfq/tKGV3djOF+LO0+abRBadxl7FFKAfTwFAwYoBG+rmlpUXQyEBHpJ9eJazpc3KQ
         RwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxL9idqtHyWgUof7ZDU5Jsz5sNutyU+K7zIFG2cMqpzX4DIXsjI8YFya0HcfkDVechzuV6kMEr6pVo+DJqf3ov@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv3uO5ggdhUTrJZhW8ENe7ZBVR3eWOkOpbp6ehMshTk4F/neKQ
	NhyHBCToTBISBsOisSkeXA5mDaN5FK8UgEjWZeNxxodlhdJteRfdt2M2lsSc
X-Gm-Gg: ASbGncvfVhCw9uDb0UwpLaSazXnz2w37H8kJhJWvhNmnADFPkE4/7pZzLCscO6VS/kJ
	9GSWdzCIr9qFKWm4cH+tNhjZOF7JYH0XhRnT0DOAwLdhLw84Ia6gl+9ORO15eLJxCrkLZcavblN
	2tLsvPrjEaRFevfHRWIXMJLCLdzE+Yo4OQXSHfR83JgPJuPjgKQ2ZYpMMiY32eKuygeF7OGXfOG
	S0I0dakw49aOzWvASQFBTjpt4hIj80VmVCnwWTVRxjAIxFkovYIfmXK80/wHI2FqKyFldc8Bv4D
	6lFMEdK7tJwwzjzJTIwI1YWroQujxAxARvuFhw==
X-Google-Smtp-Source: AGHT+IHwPat51mTNEQD4tasyr+KPQCLz762K4muhG5MfppKqRTRitE6CB6EPNTp9yP7cvuJ670ntDA==
X-Received: by 2002:a19:7007:0:b0:53e:3852:999c with SMTP id 2adb3069b0e04-543ea3d218dmr552015e87.12.1738215548145;
        Wed, 29 Jan 2025 21:39:08 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb77e4sm66749e87.163.2025.01.29.21.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 21:39:06 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Fix broken tsadc pinctrl names for rk3588
Date: Thu, 30 Jan 2025 08:38:49 +0300
Message-Id: <20250130053849.4902-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_213910_881383_7854F23D 
X-CRM114-Status: GOOD (  12.90  )
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

The tsadc driver does not handle pinctrl "gpio" and "otpout".
Let's use the correct pinctrl names "default" and "sleep".
Additionally, Alexey Charkov's testing [1] has established that
it is necessary for pinctrl state to reference the &tsadc_shut_org
configuration rather than &tsadc_shut for the driver to function correctly.

[1] https://lkml.org/lkml/2025/1/24/966

Fixes: 32641b8ab1a5 ("arm64: dts: rockchip: add rk3588 thermal sensor")
Cc: stable@vger.kernel.org
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce7..978de506d434 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2668,9 +2668,9 @@ tsadc: tsadc@fec00000 {
 		rockchip,hw-tshut-temp = <120000>;
 		rockchip,hw-tshut-mode = <0>; /* tshut mode 0:CRU 1:GPIO */
 		rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
-		pinctrl-0 = <&tsadc_gpio_func>;
-		pinctrl-1 = <&tsadc_shut>;
-		pinctrl-names = "gpio", "otpout";
+		pinctrl-0 = <&tsadc_shut_org>;
+		pinctrl-1 = <&tsadc_gpio_func>;
+		pinctrl-names = "default", "sleep";
 		#thermal-sensor-cells = <1>;
 		status = "disabled";
 	};
-- 
2.39.1


