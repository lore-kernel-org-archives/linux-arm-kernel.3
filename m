Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AF0FD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FTzoew/ZMvCMhjpr6otK/JMZgS+ZUn1dml7NawnXAH8=; b=DYnBzEN9NAskigwOnBwu463hYl
	Rb7VkqkHomXpajLTL3jXOsDkSwc/hEsbIEsOP7ijInhlmk1cn8E5apZNBD9p1cJY0oV2JkXFBHkDv
	xKirMnpOkJ6XvVXWTw84Y6zt/jHRDxZNn+0lt55xbxsl3xhShx4owd29y7xsZc2VP7D153EHzd5Zn
	kTstZ0Om0AP1Pjwip2lKYRQ6hsBdk1T0J4aJnXNcfxz52BZR0y/UZWQPSWcpdgMbth+uGhT4ETrQo
	UWEh3CH69FmJUrixSqad4u9CBaNz1fHsTjqqLtUbKVy5BzzMlBxfr0XAIdXcJEHlwJRxujsH8kHip
	QnRn54pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2l-00000006FDs-1mm9;
	Tue, 17 Mar 2026 11:57:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2Z-00000006F7P-3YQJ;
	Tue, 17 Mar 2026 11:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=FTzoew/ZMvCMhjpr6otK/JMZgS+ZUn1dml7NawnXAH8=; b=eSiyxmtKn8Djm+lYBg/bpsqpvy
	dL9ptt3UP0CPbNVOG6HooN+Y50sCjjCL6/l/28ARJRT6V0HvYXjXJt4u2LcXQCfHOf/aowxYK8CdJ
	nh4P/u9c9jIsxgpzk7hE8bQe9JZIzlEc1I4719UpxMQHKCGCoziIoz+VsQWTbKhF948Jz6s0QTygV
	J4CzkWVC8CYZMX4bFHH+XKXVKDZmAtGI5446uYrs2O7NYMtl12LFhaM95HJ+VieO7SsiaQO9G1hTs
	4SZt3kZeemR1uXs9jtDyGRUbbu7YaZS8yFmwAKtgbhfmb4s4faBZGN6jq7QK4S8SbCQhY7QoKJPjc
	KrwiU9VA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2V-00000008taT-2qdZ;
	Tue, 17 Mar 2026 11:56:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBcvD3851620, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=FTzoew/ZMvCMhjpr6otK/JMZgS+ZUn1dml7NawnXAH8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=jaTIJ6mvYDvh6kBQuEgsfjpE3MXweheH8fPz7ML2iqBKfOTf4xBWeBqfQuz5RtXka
	 eMXVHLMCXFPzD3UhZh9f1B4M2bGZUQlM0ROA0HUcRjjsqLkJUZ+kvQY9W0hFb7OR3i
	 iX/GCweaIViD6zdINUoBs7DTUZu3MC3UC/MngbdaPy1vI8QNPIM9GRW8uGlOZtXdtt
	 3yNsnbEnfExQtSqhrm4eEd9fD2Oqjtewoi7kcXhASVa8RegKuMTGMckm70odjJZkPH
	 xh1QQRYlG51JefNgf75/gDOVgzLNvpTYmnbwDssKfCAsBMC3N76up1/4c2Jn3VPNBA
	 6G7msU3vzBE9g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBcvD3851620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:11 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 0/8] pinctrl: realtek: Core improvements and RTD1625 support
Date: Tue, 17 Mar 2026 19:54:02 +0800
Message-ID: <20260317115411.2154365-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115648_260321_51C3EA11 
X-CRM114-Status: GOOD (  13.84  )
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

This series introduces pinctrl support for the Realtek RTD1625 SoC.

Besides the new SoC support, this series improves the common Realtek pinctrl
driver and the generic pinctrl library by:

1. Introducing the generic 'input-threshold-voltage-microvolt' property to pincfg
and pinconf-generic.
2. Improve other Realtek pinctrl bindings's descrption.
3. Adding support for slew rate, input voltage parameters.

I welcome feedback and suggestions.

Best regards,
Yu-Chun Lin
---
Changes in v4:
- Add a new patch to fix the argument type in rtd_pconf_parse_conf().
- Rename property from "input-voltage-microvolt" to
"input-threshold-voltage-microvolt".
- Update pinconf-generic to reflect the property renaming.
- Add tag from Linus and Conor which received in v3.
---
Tzuyi Chang (5):
  dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt
    property
  pinctrl: pinconf-generic: Add properties
    'input-threshold-voltage-microvolt'
  dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
  pinctrl: realtek: add support for slew rate, input voltage and high
    VIL
  pinctrl: realtek: add rtd1625 pinctrl driver

Yu-Chun Lin (3):
  pinctrl: realtek: Fix function signature for config argument
  dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle'
    description
  arm64: dts: realtek: Add pinctrl support for RTD1625

 .../bindings/pinctrl/pincfg-node.yaml         |    6 +
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1625-pinctrl.yaml      |  260 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |   20 +
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/realtek/Kconfig               |   14 +
 drivers/pinctrl/realtek/Makefile              |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         |   68 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   37 +
 drivers/pinctrl/realtek/pinctrl-rtd1625.c     | 3138 +++++++++++++++++
 include/linux/pinctrl/pinconf-generic.h       |    3 +
 13 files changed, 3562 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1625.c

-- 
2.34.1


