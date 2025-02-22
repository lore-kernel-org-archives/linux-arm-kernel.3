Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A941EC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/RDwd1dzgwI+i7ONubzdJYvtvlrF6300doLfGnBg5ak=; b=UOaaxYBRnq/VarnQg1DtSdSH3k
	Z0KvPZuDwgxnM2E9/Mq4TWQvn5fYyDUUETeP0NnnF5ign03RyqV0Or6trl2ToFFptJ93bI4d2nDPi
	p3vzX/54sxFSSmL+WqscGC0rYG57MRNFWodl+F2+R9X7UlLBO8IWVxL+cq1Vb27FJu5rW9pLX6xlh
	aaZn1lWjj/1ozkaLkRUbfT97OQfxSRdb1f2/Z65u3SIEDdd2AFznC7MOMyvPpRhUUyrjuxGimg6vg
	r74k/3b1E35P+7cxkhxs/8LBjceIH9FVmgTo+IjGWvr/ydLlS49grGJWZevCm2YQjqfXRVX1KW3Yw
	kKsW3ZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tltKL-00000008RvU-2Olp;
	Sat, 22 Feb 2025 17:30:09 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tltIr-00000008Rio-42bJ;
	Sat, 22 Feb 2025 17:28:39 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3f3fc8f5ffdso682694b6e.0;
        Sat, 22 Feb 2025 09:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740245317; x=1740850117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RDwd1dzgwI+i7ONubzdJYvtvlrF6300doLfGnBg5ak=;
        b=H10TRhl+PWYqhlTW2TJ4xJfwro7ntdgo9AufR8RhqmEypJntKV3OVMtvFccnQqLBeB
         B/1C45aNWy53vZW180s6wVCWrCZixWhsIvXq3bjb1doqd9BpxIBjGpBBEHb3G6t4pc/M
         3L6su3MMOHTKj2Iiz9JXvksD2FCa8R089mTZDShMWYB+ybtbkWyP3PMKasqpr+0WUj/B
         EMUF/nkKSBRiBsldwLUvgTdsUXsLGq5n/HVkP2BTZzhu+j/a6c4yneoect0SsUkE2HR8
         JNiVaxuCXWChmiA7Pur0aE6nw6lg4/edF80mf00KxgdZVH58IpKaiWqohxJDY5Hf9OB0
         cfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740245317; x=1740850117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RDwd1dzgwI+i7ONubzdJYvtvlrF6300doLfGnBg5ak=;
        b=sxUiI9clhlKFOkPafrbeREbkCYWN8EUUjtb+gzBxVnDB0Qg35mkPGR0fRYZfJVS8UP
         AUd9uVHJFSZ0do9Z/HgBz1m0OrI+q9bjehvQbXH6y/xLpsOfYSU4oBgDGhi2O3mdpDCC
         ZLf4YF+75QbeYJzKfmraG4EVj5UCcOJo8MKvxz7R6S/Dasatec3TrmUfQ3P7I/Jc8pdZ
         nsCCC8KFkGimBDgyA3/ee2W3gxmBmh2rBZvaLBf3xgQEHReQQRYlpHqMMKSQE/sAYbR6
         T6vdQltEBSheKEtmoI8GJQVFxuT61LEr4wg3Mxyc/scxj/qhWQTjwTxWmwlsFkkm7PwC
         sdOw==
X-Forwarded-Encrypted: i=1; AJvYcCV+6L3CEQScrZb9wbp1CySigI7/d1xu2PXnobVuCTG++ANl5vyarhqZZ2AFR0d9mgnXDbaKPfKpj7KlPS3P9Jc=@lists.infradead.org, AJvYcCWA3AOJ44GtNPfKUaDqfGyOAqku3h1tY1wkr7RTk6HCpsaeHBVXngO2d/dUb+MXyG+ZzPWusG4Ohr0pkhwJl/mV@lists.infradead.org
X-Gm-Message-State: AOJu0YzlGacwjPc5lJ8yThRKzW6vw5xun9SiSx5cyo+86Jzz7Cjz+4SL
	+xXyXBf2AKC8hMZQBF2GOA6NRMSsGVOqWhzOgzt4a2v2cEW+HS50
X-Gm-Gg: ASbGnct4zCSoyPBOs4YtyNa3WgmP977PygOXBippxHPeo4Mb2xIAbP/tzhZBT8BHM1H
	6FI8+wCAI0HGnIMSYML3+Is/RBduUIq7PtGmesD28+q0iUXj/xDyoiguu4q7cvcPp5J720rISGQ
	PL8NYjXor/fXF2DElRhdmAYKTjr3cPsNY3AmL7Rg8y6I18WQaOuACy8HHCXVPDCYcern16OWeaq
	ZH0VXpl3dv9xLABS3v9zjRirCY6FM4kwqnOZcbhyOKGt5DdI7jE24gt3Ze8EYg0xsJV0ptIfjg9
	ToJN6uD+oPAA2MfK6TG9Js44ySwmm745WKw=
X-Google-Smtp-Source: AGHT+IF0NTsU8DfMoaFZ2lsiXddsrGmALe0QLSbx/QBGxRbH4pRWZ/f5aNtmVBWOMYxv3yoy32tzkA==
X-Received: by 2002:a05:6808:1815:b0:3f4:1197:29ba with SMTP id 5614622812f47-3f425a5fa53mr5553662b6e.2.1740245316893;
        Sat, 22 Feb 2025 09:28:36 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:996a:132b:43a2:f7b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b963a0ac4bsm7244238fac.47.2025.02.22.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:28:35 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Johannes Erdfelt <johannes@erdfelt.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v6 0/5] Orange Pi 5 Ultra
Date: Sat, 22 Feb 2025 11:27:47 -0600
Message-ID: <20250222172752.6254-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_092838_001189_DBD35B86 
X-CRM114-Status: GOOD (  13.22  )
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

Add device-tree for Orange Pi 5 Ultra

Thanks to Johannes for testing

The schematic has been published for the Orange 5 Ultra. [1]

It's a sibling of the Orange Pi 5 Max [2] with the HDMI0 switched out 
for the HDMI RX. As a side affect the pin for USB_OTG_PWREN [3][4] has 
changed.

Also, the Ultra's PWM_LEDs have the polarity inverted

Patch 1 can be included in 6.14-fixes
Patch 2 and 3 can be used on 6.14-rc1
Patch 4 can be used with 6.15-rc1
Patch 5 is waiting for HDMI audio patchset [5]

My testing branch with dependent patchsets is on github [6]. This now 
includes extra patch in clk to throw NOENT [7]

[1] http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-5-Ultra.html
[2] http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-5-Max.html
[3] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts#L306
[4] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts#L321
[5] https://lore.kernel.org/linux-rockchip/20250217215641.372723-1-detlev.casanova@collabora.com/
[6] https://github.com/jimmyhon/linux/tree/integrate-6.15
[7] https://lore.kernel.org/linux-rockchip/2425191.NG923GbCHz@diego/

Changes in v6:
- Add R-b from Rob
- More differences between Max and Ultra
- Ultra PWM_LEDs have different polarity than Max
Link to v5: https://lore.kernel.org/linux-rockchip/20250220041010.3801-1-honyuenkwun@gmail.com/

Changes in v5:
- add USB 3.0
- add HDMI1
- add HDMI audio
Link to v4: https://lore.kernel.org/linux-rockchip/20241229184256.1870-10-honyuenkwun@gmail.com/

Jimmy Hon (5):
  arm64: dts: rockchip: Differences in Orange Pi 5 Max
  dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
  arm64: dts: rockchip: Add Orange Pi 5 Ultra board
  arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
  arm64: dts: rockchip: Enable HDMI1 audio output for Orange Pi 5 Ultra

 .../devicetree/bindings/arm/rockchip.yaml     |  3 +-
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../rockchip/rk3588-orangepi-5-compact.dtsi   |  9 --
 .../dts/rockchip/rk3588-orangepi-5-max.dts    |  8 ++
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 83 +++++++++++++++++++
 5 files changed, 94 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts

base-commit: fa15cc73121279f93757ec76312b0d0b73f7462a
prerequisite-patch-id: e7cb3b62d173506d38a10a8e71eedd62ba6a1bc0
-- 
2.48.1


