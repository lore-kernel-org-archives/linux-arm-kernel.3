Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D708C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 03:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3dQ4EXCJkdc+MbQXCx9yljD58LDbDwzPzubxY8NvWU=; b=BvawJgc3rNdQHAu73NLWbZMlVk
	fZmAP+H91qCDSfipbwFcJPa1w7Y9YIBJ9nj88oZPhzZpL1gIr1THQ1ec2awBqI5k9gJ6T+Js7+CXh
	pEQyCCfjSuhxFxKIP6c0bDTof8FeooeSi9w4oE+BUiSDlPidG9e9oJ858SY+y2Igqdop/CkM0q97D
	KxF1A9t3VjB9l4IXdfpuMHmDGqibRPeb9Cn06I2SsfCNs5QITCEWKQLUPRvlhG0e7FLm46QsK2TeN
	j0HJYOEfRVfG0TmOwB7Bb37fby8myK50Clz7tKcOvXqnh3eQYuGBO2w+6auXqIUp7xSfWyAdbhWgG
	WEZIHYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KNE-00000000uV3-3fHa;
	Fri, 04 Sep 2026 03:13:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KND-00000000uUi-2HUw;
	Fri, 04 Sep 2026 03:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+3dQ4EXCJkdc+MbQXCx9yljD58LDbDwzPzubxY8NvWU=; b=mheZBFMG+jVxWWkm/Ud7T5M0Ca
	sEHdQ7r4J8lhEffJa5EDDkm2ZjBOLVbqVDlnPPiPRCGOcm5dqEk+7+tIhiQQ2CxSBDFkFZPebV8Tk
	ZhbPeq9q8SRRRLyeY9WRP00wt/kAEDSNoHT0vI1deQHfWMUDSewTpoJegF1YuESgMZrYZMTPJho57
	bD+tOIrbJAR0TyBCMVoEDPxuS4zel/x6gzrbRmucNlOuTNAZszxwClJjOhhvnNqBd+jDQCOG3NwmQ
	DbvULPudicF6Vjj5xLF13Ij1j5ejsaZz4XKLfO8+669/h62saFbgNjrsvYUwWFB1M1/52AWUGmOCX
	zci/SfZg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2KN9-0000000Desl-1YqR;
	Fri, 04 Sep 2026 03:13:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6843CqdfE4114200, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788491572; bh=+3dQ4EXCJkdc+MbQXCx9yljD58LDbDwzPzubxY8NvWU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=F0U1/avGNFsH8gJptrdkod8ybG6hWdmsu8sj94EQpTsl5DZcFjW5u1+bX/xbFt3Gz
	 G74xqQGYqIG5B+TmNaXbpgcu3W79akvVOUD/l9sEUzkUGykIk6YKKWXD3U46hox6vV
	 S7VOcmESUdU4Vh5XpQYLVyLzFD8htsCvxf7UvoT3osHwYXzzvveFLBqLfa6qYcTPsZ
	 MiuFDTG7Whzamb4RaV603kFrtJQy5gm8GTxxb01DOPy+RgbqsN6KegcSR2VDE3WlBk
	 EWk34d9SdIv2cIDgOUM2w+FUM3PeKO60GUfFkjH0yMrIMgVNZdmDACO30sV9OgqIxn
	 XUUxX2hhCMHiQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6843CqdfE4114200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 11:12:52 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 11:12:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 11:12:52 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 4 Sep 2026 11:12:52 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, <jyanchou@realtek.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 0/3] spi: realtek: Add support for RTD1625 SPI Flash Controller
Date: Fri, 4 Sep 2026 11:12:49 +0800
Message-ID: <20260904031252.244280-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_041348_139568_ED24D826 
X-CRM114-Status: GOOD (  11.39  )
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

Hi all,

This patch series introduces support for the Realtek RTD1625 SPI Flash
controller. 

Please note, this series depends on the RTD1625 clock driver patch series,
which is currently under review.

Link: https://lore.kernel.org/lkml/20260901072446.2563145-1-eleanor.lin@realtek.com/

Thansk,
Yu-Chun

Jyan Chou (2):
  dt-bindings: spi: Add Realtek RTD1625 SPI support
  spi: spi-mem: Add Realtek SPI flash controller driver

Yu-Chun Lin (1):
  arm64: dts: realtek: Add SPI NOR flash node for RTD1625

 .../bindings/spi/realtek,rtd1625-nor.yaml     |  68 ++
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi |  16 +
 arch/arm64/boot/dts/realtek/kent.dtsi         |  26 +
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-rtk-nor.c                     | 637 ++++++++++++++++++
 7 files changed, 764 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml
 create mode 100644 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
 create mode 100644 drivers/spi/spi-rtk-nor.c

-- 
2.43.0


