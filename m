Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97723C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KsiYSQaqI5xt4hpo9n+HFHiwvaYjALuwKisRyJqehjk=; b=FnlbLcSZsO0ocxKm9UEOX9XCdV
	j3Pvb/Mu6OvtVrpYwhAMxGPE+V1BzOylDcSy6MMJAo1lqIs876vyTypMtQXvWKxv8hPjIj0xcXBhu
	BMLCBQqWQxWP1fn64DVxRkqLvUHgKmi08XgPS4r94uqvshMMBcwS2jC/LyVmeKxhYUzJkwcQiA0hG
	5HNXPbjZvoqwv9vsFrAVbC15BjHjbByqUQOO9D1QQtG5iEtRP8RRiGv6bYeeoyBc8lF1rYe41M8Qe
	026CrBY+hfPltbzh0rbVZqSId0Fi1Qz1pmJWiTBAl4wUgnkpT/HGRerLUKWi+DJ1RzdL3O6LYd0cL
	roP7Xl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwyL-00000007epG-2h1Y;
	Mon, 05 May 2025 14:39:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwwM-00000007eYu-2YGa;
	Mon, 05 May 2025 14:37:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-441c99459e9so9244765e9.3;
        Mon, 05 May 2025 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746455825; x=1747060625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KsiYSQaqI5xt4hpo9n+HFHiwvaYjALuwKisRyJqehjk=;
        b=GlsC+HTNd++4KDIpBnO120/LUuUwtjXvhZ5ehxHhXTzOJUE7PJTFJlXwovMRy3n9OM
         OcAxeOmQbWVEuLqtWhc2roUBJLTs1t4A+Xc5RB9PRUDOV8HnzYD2zJNubQhHRRE0F5Yt
         Ph9gOoeCmUpPGILFi401rE7ABR6E+SzDf5WNRbS299JkbBJp/AoUqWzY6F5tx/9tPeK0
         D41yXFjShwfg0R2lbvtRnjT/ShTTCQK0Lk1n9MKvm+koO0FwN5WZhTbcA2sCJ4rbVbNt
         A8QJH55tqYd7FLbHJwN4+PPxenUfB8pKLt1vxvXC5zu7GgWT7jdYlDsYXzpee+K4dtqH
         VHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455825; x=1747060625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsiYSQaqI5xt4hpo9n+HFHiwvaYjALuwKisRyJqehjk=;
        b=hXuxAMc20ow379hkgsm05posi8zOo4cBFc34judMaPedwg/YwourFC7Yib/tgO+bvQ
         DLIfRlrjcomQ7C26HMahN43/hO4tHJ0RnFie1u3neuyeDnN30nZiAdsiv62HZnTffu4G
         4mzKXhUgy9zTsc+dGAE/v6WW7NxnhF7lN5dtHYtqFhqFarTT0nY7h/GBmloHI+eYVxpy
         E7a0nOPuTzWygdFYCOcQNJYbBJfRHLcBSGNuDzDMZERCVSv8qCX31hUhpqGTcEAfsdoI
         jeaKDrLd2ACHfy5/JT6P/7KYrR8fUyTujM6bctHmUUflFxYN7ny3MTkqXSXwjOjvNK7y
         UN4A==
X-Forwarded-Encrypted: i=1; AJvYcCV/Rnn/R+kopC2pZ311AWf6Foacqtaz0DXOM6cWNOYtR9AX66/Soj+ppQTPXZVm3eANpZ+VWDJ0XqzC/whh9Kw13Q==@lists.infradead.org, AJvYcCVT6NuekcoMY/aXPYC2QD0Cc8W3DqW/lihynwB78I2j9PkqqCNfPIwOK3UzCnD2/cn1asY2/QsxdRwgO5CT@lists.infradead.org
X-Gm-Message-State: AOJu0YyWFF9KnH0YEn6AIOVRP5x27SaycIoZQHAuiOVzzzZNahfGSZP0
	DrVxSlDpOO96YardGMgUFvxgCELmTlTEIXHsUMhZMiETyNPPhJvz
X-Gm-Gg: ASbGnctNRstgKVj43epEVcowvWSt9TDju8Sn7RPttyUuaqiP9wjOZ0I+PBwEmfVuhpU
	9SfvJc8QimbSxKVAGpRsaa//74vVpRcU6N5AmMoRQK6BawyzddUYfMsoCOVrTBA3apGiMRej7lb
	FzaI0brtBDYrRUom2HlRnLDN6yQEV1hujyN2eJE68Ri7a50pCDCVY5BVHmzCcZ8Bx59Fj65dt7S
	UyR2vKcXSF12wktg3xdMcyF4Dc29I3g4qOZnlIdCNDxjFcbItSJ7SPCVsZqbeV1GzvMh1aOZjef
	nsG5S4sypNGMvc3PNUTYDwYXn3wiSDkqAT2BEAaLcETtmg==
X-Google-Smtp-Source: AGHT+IFTHVGI2vR6SnT1zPMrtW+l6TfoGzFy6CYCvq/IBo0x6vMnqBeTsKkgU/UY5Tffx9spt+ecAQ==
X-Received: by 2002:a05:600c:3ca5:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-441bbed4726mr115777665e9.14.1746455824548;
        Mon, 05 May 2025 07:37:04 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ad8149afsm116568875e9.0.2025.05.05.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:37:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed for stability
Date: Mon,  5 May 2025 14:37:00 +0000
Message-Id: <20250505143700.4029484-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_073706_647699_F3CD53CF 
X-CRM114-Status: GOOD (  14.48  )
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

Users report being able to boot (u-boot) from SD card but kernel
init then fails to mount partitions on the card containing boot
media resulting in first-boot failure. System logs show only the
probe of the mmc devices: the SD card is seen, but no partitions
are found so init fails to mount them and boot stalls.

Reducing the speed of the SD card from 50MHz to 35MHz results in
complete probing of the card and successful boot.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The same workaround of dropping to 35MHz is also done with the
ac2xx dtsi; which has a comment about CRC errors being seen at
50MHz. It's probable this is the same although I forget now how
that diagnosis was done (or who did it, Martin perhaps?). I've
removed the FIXUP comment and added one about boot failures
being seen at 50Mhz but if you prefer to repeat the CRC comment
from ac2xx feel free to fixup when applying or I can send a v2
with that change. Links to original issue reports with user test
results [0] [1] are below:

[0] https://github.com/LibreELEC/LibreELEC.tv/issues/10027
[1] https://github.com/libretro/Lakka-LibreELEC/issues/2059

 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 40db95f64636..03b4b414cd5f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -384,11 +384,10 @@ &sd_emmc_b {
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <50000000>;
+	/* Boot failures are observed at 50MHz */
+	max-frequency = <35000000>;
 	disable-wp;
 
-	/* TOFIX: SD card is barely usable in SDR modes */
-
 	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&tflash_vdd>;
 	vqmmc-supply = <&vddio_c>;
-- 
2.34.1


