Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF6CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HAdTMLfTcVQ4191gVd1/1rV3DUrFsL9dsaDiRayHQP0=; b=U1e4Lj3o4MPt7iWCmhOcJiYTEK
	KZ5QSIgQMxcc348bvqvOQlhFcnfqrbzJW5FNVXhXELj6qEoPw/OuynEo0XIveKPYptPzV/4C2oUWn
	ETuIMdO1lf+1sTHopXmfQiBh/V3pCopTbe3O6NdW6eiH4fM1yyZuB1/zZmzmbxhCvuernEjjSijVC
	BfjYgNUnwXDFjGQqqgRuCLWcRAq1V7x2NtyiRPCD3QI/h1eikoHdXQgNaqH1ovdEPT2zRoSabCom6
	olAAAG7arixcoI/ufeAFTZPTqV0AI0nbXuHzu/T+b4syZqA8HboiejedJCUyBxlloBvfuNfr44cBc
	Hti/L4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66J-0000000Gd6n-2o0s;
	Thu, 04 Jun 2026 11:19:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66I-0000000Gd6F-31l0;
	Thu, 04 Jun 2026 11:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HAdTMLfTcVQ4191gVd1/1rV3DUrFsL9dsaDiRayHQP0=; b=V22iD/XpmEyTwQHdn2jX6g65rs
	GHbQfgINtssPycwgKO2FvC7cq2Uyinbu6TUYsy/daLm2HFmhxf7vel65mXhIK0ijZmWszTmGZnyj3
	IQrq+KfHu7URCIWkS53XNULpOzMCrLHIElqIknW19nALmPH751DxPm6vf5U+0h8EIWOEWpEBafHFw
	1w+N9oyE3gwphXh3I8poNnpO99eA71a8S6kE4byJa8cVLZcPi5JnSj38sYMA7iqj/QIOMgl3+lZbU
	MjLFI6d5c/2+r9vGWVIQ+oI7zEFuRO+szCSnnN53O5edkD9zcQKVBNGgsnmqSIrxwkIXzGEUc7LYv
	NrN9vMvQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV66F-0000000EEpC-00co;
	Thu, 04 Jun 2026 11:19:01 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 654BILZE0299928, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780571901; bh=HAdTMLfTcVQ4191gVd1/1rV3DUrFsL9dsaDiRayHQP0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=D/apseytm8byWbAdVC7HRIuiReSeiOBvaLafRHImzrn93c/3MLQ76jjdntrwogCTH
	 zgIwMZ+FtmK4FiC00Z1rO/vvuHFIh0C8dNhld/hOTQSOYK11KF7qACLMnfZxFTjdqw
	 TB22gJBJhjjaXUH3AzvPaB3Hc6XliH4lXIoxpUWg50GdFyi/vDodwpw8u8VP2ibM0V
	 7/ET+VNmxyM54TA7uUMfDhyAdntfAmteoks3N+OwM81TwXPEVIc5t62DXmWVLSOk2h
	 2+T78cRAN8FA6SY4nXwnlII9haTwJ/G+h1erKLGY2Y8OeqCZfYMaiWsuJWt0TLeJYE
	 OZSBRZsK+EPBA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 654BILZE0299928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jun 2026 19:18:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:21 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:21 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Jun 2026 19:18:21 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tychang@realtek.com>
CC: <eleanor.lin@realtek.com>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <james.tai@realtek.com>, <afaerber@suse.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 0/3] soc: realtek: Add Realtek DHC I/O level detector support
Date: Thu, 4 Jun 2026 19:18:17 +0800
Message-ID: <20260604111821.975624-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_121859_695401_871D100A 
X-CRM114-Status: GOOD (  11.44  )
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

This patch series introduces support for the Realtek DHC I/O level detector.

The Realtek DHC I/O level detector is a hardware block responsible for
detecting the I/O signaling levels (1.8V or 3.3V) of various IP blocks
such as RGMII, SDIO, eMMC, CSI, SD, UART1, and AIO.

The driver reads the hardware registers to determine the current I/O voltage
levels. Based on these detection results, it dynamically selects and applies
the appropriate pinctrl states to ensure the correct pad configurations are
used for each interface.

Thanks,
Yu-Chun

Tzuyi Chang (2):
  dt-bindings: soc: realtek: Add Realtek DHC I/O level detector
  soc: realtek: Add driver for DHC I/O level detector

Yu-Chun Lin (1):
  arm64: dts: realtek: Add I/O level detector

 .../realtek/realtek,rtd1625-io-detect.yaml    |  77 +++++++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi | 108 +++++++++++++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  28 ++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/realtek/Kconfig                   |  21 +++
 drivers/soc/realtek/Makefile                  |   2 +
 drivers/soc/realtek/rtd-io-detect.c           | 152 ++++++++++++++++++
 9 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
 create mode 100644 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
 create mode 100644 drivers/soc/realtek/Kconfig
 create mode 100644 drivers/soc/realtek/Makefile
 create mode 100644 drivers/soc/realtek/rtd-io-detect.c

-- 
2.43.0


