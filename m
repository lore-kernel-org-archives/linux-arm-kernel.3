Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DD4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=izmdp1mfJElMA660m7jOXKNrgn9YS9Q0kIP1psA3utA=; b=c2D4BYp1CWNUgJ/tBZbOS3O0a5
	m4C3dnKFZ4uemnitpv1xaJhkhKu+w97G0TAWoU+7wLKWwjnw6dDrB9Drk2Mao/43o4SBSCPQQ9wtq
	EezjLMZ5om1jMBIwdK9kJ2LfxazlnCd5K5Z86GYvWqlnHNTaR1eXzwJX37WoRQE28IBF8J5OV0Luj
	c1OgqKO0rJMY2ODRL5QT0N4HtpSKK71jLAMnd7BHtVDyUBsuRD8adzlv4qxH12qwx5URuJEcO9f8z
	ERtkDsRE5VPhyRfd9jT0ErkOuJVqijzJHHhRan1dPhNLyeUAkghzI/ScOhFabzlKdpsgAscEx3P8h
	jsEnnFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3yi-00000001Dyf-1lDs;
	Wed, 30 Jul 2025 10:24:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3wE-00000001DmQ-048h;
	Wed, 30 Jul 2025 10:21:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so3981645e9.1;
        Wed, 30 Jul 2025 03:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753870892; x=1754475692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izmdp1mfJElMA660m7jOXKNrgn9YS9Q0kIP1psA3utA=;
        b=W6wV35WtCeaFp8RRhVzk3CxdrYR4TIFuE1l9xxcDfW5f0wFcLp7lkFEhYpvR4YeWPM
         z4qumDzUCAE+nmF5UOe1j8tgdRh9ZsGYmA0lpfx6BGOmkYHZCpfun9PFpT5xin4B58wx
         hbrzU0IMifG9gzgEoGtTfexXe04X2KgRkN5fxbvjcxu5GP9k7CAPpDPkjebWI/CzEvA6
         Am/KxnH/qctASKAx1IyvenLt/WnOtrgnyiKH5KR/IyMxzHSXMOrOEqyADEn+He5ZRqia
         qGZbk+5TWg7ER3TlHXW0omnR5z9z/g6lnEDiz72JHfq3V+5fBuwpvibs/CZXV6mKTNKP
         BazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753870892; x=1754475692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izmdp1mfJElMA660m7jOXKNrgn9YS9Q0kIP1psA3utA=;
        b=kcU7Nx0QnEPH14xu/ubFdlnoMRrEH1bQ6vOPsBbSFlAVzzpw3HOeHKM1mbMKMt8e5/
         KMt6S/l86YLtT89UHqlJpYBBtDU7W/Sar8syZ1CpWXtuTuVyOa7Uf2g5eXJuNyccMfux
         nXlZExFbhuw+tSbilOPmYiYxg6MsdbxIdFFJYkIm16Xbf9GaWGi7AgQhcKlAjBESgewg
         ejtdBXBdeuELaOKnj38Wp5PJf/xOEQB5/04wVIAFoDr7KRhS7vOWGxlIgXkq0OR8jIw+
         3RruGhnhQKrfOcQmY2S0nB4qxeYouD1C3MlGq2IGIgeK/JDyscxDsqdPgAnQuZuAfJM+
         +aoA==
X-Forwarded-Encrypted: i=1; AJvYcCW4n5n0cV6p3ExZnsgJbCDKBeoJC5XEKe5HjYNWz6p3kD4vf+hS12cZ8FBDKIYGQQ++63tC9Ir9wMSv2Mdaim+o@lists.infradead.org, AJvYcCXfRfCPFSDfRgSADSQPLRVaeE6hQy8eTa/gEAemvLFivoftD/a66wgtJadSb5tgQI7eH2ZZsgrgfMXsKr48E+g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRWob7qOG1X5SwS9X4Pydw3dBLzZSEsX79Bs4DBkSLKgMzCEtp
	h//8upqm8bfHhVJZfXmzmtKbKSrAegDJgl3C53jaz19EJQO3Zv+PFG7g
X-Gm-Gg: ASbGncvz4jMgDFdN3S58j84o+7FxZWPMnDaLmyeXMU/r6esoWqwuYXztiSph8nA/0MQ
	d9M8i+ERT0Pv6uaJ/2dz6OpCWTwt5M6dB3ogqQezmmCuVLfQg34Pz7ab7yssRxKEZJ3usxBvr6l
	WApeGw7joBLUvhE1Ri9v5NznBqW1mzMbASrW6wqzM3TBK19Z9CNIVgAxsk8sNu7SHu6n2WAIzbb
	Ro0/0tA6QaAhl8ktn9QqglLd8k9to70bC5u0KluxDT4JxBGQyVYfFojfHSqNLk8mGSrS9qp7Eu1
	C4p3g4Pc4XH2I+z4bRwp4iUUh06+4EbqUtDOIdFABthV06tuoe+i8WYbw5LyXIAk8+grBBaebX9
	3sEJ1lwU690dgFNTA5lPqG2zmtOZrltWx7ZiADfxkKvFKbR/NuUC5ZSvefCk1zjE5rKrXjaE2JH
	5sjnRq7p6bdIRI7xD5ma1iPpy6R+bT0tQGQ1V+Zd0eOGEqaW9vfchHfsmYWA==
X-Google-Smtp-Source: AGHT+IEHXtB2NA59RXOAGzl8/E7rrQL8mlrQPxG7D28gE4sPqk53HQ56chwvDhjCqBfn8C/qtk2Kow==
X-Received: by 2002:a05:600c:628c:b0:456:1281:f8dd with SMTP id 5b1f17b1804b1-45893108700mr24657995e9.12.1753870892301;
        Wed, 30 Jul 2025 03:21:32 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45895377b3csm20230985e9.13.2025.07.30.03.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:21:31 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
Date: Wed, 30 Jul 2025 11:21:26 +0100
Message-ID: <20250730102129.224468-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_032134_052332_7B5B4FC8 
X-CRM114-Status: GOOD (  11.98  )
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

As described in the pinebookpro_v2.1_mainboard_schematic.pdf page 10,
he SPI Flash's VCC connector is connected to VCC_3V0 power source.

This fixes the following warning:

  spi-nor spi1.0: supply vcc not found, using dummy regulator

Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 05c48cb09df6f..ee0e6c1947acb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -978,6 +978,7 @@ spiflash: flash@0 {
 		reg = <0>;
 		m25p,fast-read;
 		spi-max-frequency = <10000000>;
+		vcc-supply = <&vcc_3v0>;
 	};
 };
 
-- 
2.50.1


