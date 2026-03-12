Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8807105A58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DMgIm9fIXbYKG8k1PJkFxs34LxL8omdNAcHFlh8vTzk=; b=GwqThplJJkELTIsZJtyFqMceBV
	G8nVl3V4FFMia/v8emoM4V4jI9Aw8fDvUzWzuomO3MOMnB9HMYlX1VzEirMB1EylGTqGP0dz97jAy
	Elq/66LLHvgoRwCY2d2NfLiyiwaOl0dgtSxDkXXC0hzjQspyy/nyQ3zLQU43OCPWg+hxyGWRmvsbh
	WSSK/dFw6O5N+eWhGOQEJOqP2EbrMeq0N0Hj4mnAsvxieYJu6mFlJi/2yCGzW3DTeLOQIHGuFUxyE
	S5suyN1z1jEgR25dtPy/VqBNNXKDtTNaEVEn490tF/i9/BSSMI5ZUupbBJBEnApnENzWNi/O+r021
	kzWlm1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIH-0000000Dx8j-0EzL;
	Thu, 12 Mar 2026 11:33:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eIE-0000000Dx6K-26xG;
	Thu, 12 Mar 2026 11:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DMgIm9fIXbYKG8k1PJkFxs34LxL8omdNAcHFlh8vTzk=; b=J+wDUqzV0t52SuUJbg1/mlwA91
	FG5rEYCMm97JkMuMbI8UIyR64rJvhLmHovrfIvGzkfmQRVZv2pXk5RtBxfSEnBlRZQGxlviVCj+hO
	vZSZJ771V6836pZX3xwL9aUaoQ64/9dnuYe/V+aPHUiT+gB6+rnVE/rJC9oCIsuvctot25KQvxpdZ
	5fIg9AtDbQbMe+R8vlNXetJ1mLrdIFWxRx3YfjhucQmYkIKNhlnnmij70yP9VnwdWrHrQXNTYEJKi
	qt6JW0Nu6LSamh3J4ZDKvhIKSgQvB2XPUxGgFhlXbmP/8eaXojA7MCQLAtHgR5yxnvkL62x9654MW
	sH+p2snw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eI9-000000011UK-3M1c;
	Thu, 12 Mar 2026 11:33:29 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUfvxE2456770, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=DMgIm9fIXbYKG8k1PJkFxs34LxL8omdNAcHFlh8vTzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=YhVBDGMaZbvVFN3rtFbJwBWzgo2KL2YWhpTCeZKSEuGDKBfFYVC6gZxGzwH/EMz1c
	 aT3hs2mAQqiqTDhh6hsRi3k91hj6PREfRu84FV1Mx7sZ5osxBUUacWxeP9APx5oSFL
	 wlzCEfDNcz4CCH1N3/RbhLzcUx406WAj1jhqRnk+5Ovj7b/XPgW6w3BxwAolipXxqd
	 JfPUb7XbenJLAvSsazQ5cVd22/28FHbzniHtEaftJhZXd0DDqaL6dJZtOFPN/4qeOd
	 BudR10SCSr9YlLKNwimiGm/EzYvje6w/Lm5amhRM0nYVU+ZuZ8fJE1x6FnENWc2q1f
	 R6qPpAEGRK3Tg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUfvxE2456770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:40 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:40 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 0/7] pinctrl: realtek: Core improvements and RTD1625 support
Date: Thu, 12 Mar 2026 19:30:33 +0800
Message-ID: <20260312113040.68189-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_113326_905008_DB8CB65A 
X-CRM114-Status: GOOD (  14.04  )
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

1. Introducing the generic 'input-voltage-microvolt' property to pincfg and
pinconf-generic.
2. Clarifying the 'realtek,duty-cycle' property semantics in Realtek-specific
bindings.
3. Adding support for slew rate, input voltage parameters.

I welcome feedback and suggestions.

Best regards,
Yu-Chun Lin
---
Changes in v3:
- Rebase onto the devel branch of the pinctrl tree.
- Revert realtek,pulse-width-adjust to realtek,duty-cycle.
- Fix binding example values from hexadecimal to decimal format.
- Change default value of realtek,high-vil-microvolt from 1 to 0.
- Sync driver with binding changes to handle PIN_CONFIG_SLEW_RATE as valid
numbers.
- Replace arch_initcall() with module_platform_driver().

v2: https://lore.kernel.org/lkml/20260306075244.1170399-1-eleanor.lin@realtek.com/

Yu-Chun Lin (7):
  dt-bindings: pincfg-node: Add input-voltage-microvolt property
  pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
  dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle'
    description
  dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
  pinctrl: realtek: add support for slew rate, input voltage and high
    VIL
  pinctrl: realtek: add rtd1625 pinctrl driver
  arm64: dts: realtek: Add pinctrl support for RTD1625

 .../bindings/pinctrl/pincfg-node.yaml         |    4 +
 .../pinctrl/realtek,rtd1315e-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1319d-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1619b-pinctrl.yaml     |    7 +-
 .../pinctrl/realtek,rtd1625-pinctrl.yaml      |  260 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |   20 +
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/realtek/Kconfig               |   14 +
 drivers/pinctrl/realtek/Makefile              |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         |   66 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   37 +
 drivers/pinctrl/realtek/pinctrl-rtd1625.c     | 3138 +++++++++++++++++
 include/linux/pinctrl/pinconf-generic.h       |    3 +
 13 files changed, 3559 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1625-pinctrl.yaml
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd1625.c

-- 
2.34.1


