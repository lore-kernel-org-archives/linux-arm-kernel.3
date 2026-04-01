Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1581310F92EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1OvbiweTCjhtUC8AZj2mAbljTB73GnHpwQYyOLsvAGY=; b=bJq21+Bw+U/lIb+tlkBp/5vO4b
	hHdlSSqSvUxWEKgnnZF0UtOm5vIPio8vSmhblBqJdcQQ6zlmHsgllq8sHoKudaCSytjMttzwglmVi
	FFZQuB7onv54KTpU6v8BBcdCEScfRJ1yues9D/TWxwax6vyLiKSKPlLdM9hGdR2vBygOKL6k9+wOJ
	sAjplnYLfbRPLqCvXdZ9kZgY1/hGz/6Lj7OtBKVvntWSPvy1ku3fdkORP36pmiuBrNRxbIY8/2WNK
	T1CSzPeLPlMtkyP024n2mIYDCH7h704Z52sb1UxwuadaN8vK3bSg4JEPMd6NgLxBo+c/kRsXHZE18
	yEmZBtiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7k3A-0000000DlSb-0hss;
	Wed, 01 Apr 2026 01:07:16 +0000
Received: from mail-qk1-x761.google.com ([2607:f8b0:4864:20::761])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7k37-0000000DlR0-0kRF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 01:07:14 +0000
Received: by mail-qk1-x761.google.com with SMTP id af79cd13be357-8cfc3ca1922so53761785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775005631; x=1775610431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OvbiweTCjhtUC8AZj2mAbljTB73GnHpwQYyOLsvAGY=;
        b=YvT3p0S5m9lW/3RB8RG44eeNB2F9LDl6ocuwJWfcIlVkmmssodK6QDbHlC3eaS6+DR
         ccW21vtwc8hpJ+dq5UhgXJRlYp1DLDNWe76xBpYiZZz9Y3offssX3Y+RhRd5AlzU5c0N
         OaDg416eHsckvOY21u+ZjhvQ2kktDUyQPwhSlll3HMt5C11VCimSrv8xYKfaNVdPsIBQ
         W9ROT1dcScMKp0iAS2AXzhSKrjDpnTPEsF0P6mvsWgzhJDf27by2V+n4dcQQi930u7Mx
         66aABufnRTHQ425pXpPYGe4AjqUqLsyyhBKIQyuLSLkbL/0ewpanqrgmGN6tLm/D1beQ
         lasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775005631; x=1775610431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OvbiweTCjhtUC8AZj2mAbljTB73GnHpwQYyOLsvAGY=;
        b=qxtZaF3P5oTuTZbrD/nxNguepcIyg+k0hP40roLQRMxKsbB09Y3nEKadPlHnJWqiDh
         RfPOtW0+li46ONgETDbMuB4zIDuHHpzeGZZetTE6KAM5j7iNjCRalTLMlOCIvfGkE4b1
         837EXsqTOCkljLPgP185Jy4NlY/KHLMSyBXmWykpMgg1BdB0a1BvIynYpDdC4gU0VAOK
         r15Gpu8ofSd04Mp7i891KjUhk7G+fggW9QCfG9ohk+O+77QBQZhiGvHd1GEbJInNVZdD
         ApVXxHY7Ot62y2rbr1eIW+k1GX5viF3gcd9sNMWUcrVF3lxAwnG3HvczX49gk9SlAeh+
         dl/g==
X-Forwarded-Encrypted: i=1; AJvYcCVcdkB475U7/zIb52DMaOr73+d5FpYzaNKdTi38cNFwFosyPaa55rmOWWK20VlNQMzwnHjCn0ZzE0S4Tb00oJJq@lists.infradead.org
X-Gm-Message-State: AOJu0YzOl0FFePcUUEefEf1lvg6MOs/zl6OWEFlOl7B8FLlQTRQfXhvn
	LnU1mRsldCY2apil9T7OFe/1z3w5WAYubBmEEz+dftZxI7qS2etLnDDH/nJZLLNgXtd0969/tEE
	umBmyBvrqVyxk59cU2ZbY/99Thp/BPRCSLgsh
X-Gm-Gg: ATEYQzxK+/ZJD9rgKNv7wsi3iJcRkmbmCbqlDwf71EUAfwgFyxaiLiOr+wP3/djns2D
	ChBWqxJu+a0boCiKsUyXhgg/MZJKYIgPlUsOIL1oDcDGpthZ2as63x2I7rhvA/cCTVD8Y21KLGL
	D5Y3naa4TXHpyBUEqisESh5NfTAt1Kg+9t5TrznrFC9UpPvcN/hGqOxv+4B7O7BqSvOSW5GCQm2
	OfOQK9ulyE0HgDdoADj6YT9C2o2uWRC7/F5tTWk4H4fiSPwcRo+vE7h18ai1hrkfx0MKVkpiNfI
	7NGPr634vwVx/gjPdvvTmjor1yOEk70FPVP86GLvFfeboL/tibUMR929ccAOOLtlMqm+qQsykhr
	XMZqxURytWyJXyvZKCqL8ivfNtkwfWiNy3cJNrL/AGFDf
X-Received: by 2002:a05:6214:4412:b0:89c:8769:1e50 with SMTP id 6a1803df08f44-8a4430c6838mr23940876d6.16.1775005631508;
        Tue, 31 Mar 2026 18:07:11 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89ecd72ecd5sm14105766d6.15.2026.03.31.18.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:07:11 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add support for Orange Pi 5 Pro
Date: Tue, 31 Mar 2026 20:07:04 -0500
Message-ID: <20260401010707.2584962-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_180713_234420_98ECD291 
X-CRM114-Status: GOOD (  13.41  )
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

From: Dennis Gilmore <dennis@ausil.us>

This series adds initial support for Orange Pi 5 Pro. The network
driver was just added. The only thing missing is the second HDMI port
that is connected via a DP to HDMI adaptor


The series was tested against Linux 7.0-rc2

Please take a look.

Thank you,

Dennis Gilmore

Changes in v5:
- define a connector node for Type-A port, and list the regulator as its VBUS supply explicitly.
- Requires https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net/
- link to v4 https://lore.kernel.org/linux-devicetree/20260310031002.3921234-1-dennis@ausil.us/

Changes in v4:
- rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 to match the schematic
- use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
- remove the definition for vcc3v3_pcie_m2 as it does not really exist
  as a regulator

- link to v3 https://lore.kernel.org/linux-devicetree/20260306024634.239614-1-dennis@ausil.us/

Changes in v3:
- moved leds from gpio-leds to pwm-leds
- remove disable-wp from sdio
- rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
  purppose
- actually clean up the delete lines and comments missed in v2
- link to v2 https://lore.kernel.org/linux-devicetree/20260304025521.210377-1-dennis@ausil.us/

Changes in v2:
- moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
  dts files
- removed all the comments and deleted properties from 5 Pro dts
- Link to v1 https://lore.kernel.org/linux-devicetree/20260228205418.2944620-1-dennis@ausil.us/


Dennis Gilmore (3):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 320 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  | 184 ++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 202 +----------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 181 ++++++++++
 6 files changed, 700 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0


