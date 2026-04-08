Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7D8FF513A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mBZ+9wwU9W5WTYXOus5oBw4pUKaX3Z9YycBoP/w4eV4=; b=VABmsy/8xgxyynD1Z+4eMVjcsk
	ICdjDH+wlLHaCFTJY1tuxlpHaMMPjNGufA68IBV7/vCEZvZzrALCrBBVs0gu/bHrYYhejOld0RxoO
	C3qnmkq26t/YzpPzJ7NGvES/AVdGyPXCT+MlPszSrMpkdH+bdNimnmqACNCs3vrywURy3Gy993ctD
	aar7NO04D8U9+Rn3eLKLX+1pp5jwLZ5VYtI65nvDtosiUM4JPWn2duZT1df+9NNbryWoQVHbRkGv0
	8fqnsEfIfKNp+0Sc/tzzeMso+k9TGAJYex8ZiK9mynWXq121IMT036rhhEEvzD1voFj53C6N8NhED
	tKYGQ1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4s-00000008A7U-2YGy;
	Wed, 08 Apr 2026 02:55:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4r-00000008A6y-1zVE;
	Wed, 08 Apr 2026 02:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mBZ+9wwU9W5WTYXOus5oBw4pUKaX3Z9YycBoP/w4eV4=; b=BIf2QzHcSHI03YxIlWjwqG4wzf
	/y6qXGyfQeEoThmBXWXZcaHhMbMXvw4F99TyS0kLPCf0Efrk1MbUxbmaEBO9/Y/+gbehC5ksHqzM/
	99Nfx+pHACCqs1Bc92v0wKtiTO+mQBDA2qg6b1Zyn3R/0w7JDzKlskHQGVnEZ2Lh4g0z7rIoYz6aj
	zQvEyLA0kfuAiFxF/Goj4x6RjMWhKzlmZHynJXctzlQvvpFENe34U0+eZYzPBjA474KP4YPWS7HpG
	A/2eaFe3b7KCJxNbvY0oUlAD0wP7dzsO5VscT+RTVIZgIirGs8Qh7+AbPlKU7Wv4/LBcVabaY7Hyo
	bI5DNzEg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ4n-00000004fe9-2rFh;
	Wed, 08 Apr 2026 02:55:36 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6382qiW432349140, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775616764; bh=mBZ+9wwU9W5WTYXOus5oBw4pUKaX3Z9YycBoP/w4eV4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=jeLorVzTDLiqko5yaNCFmMS4xzdHQJqlhy9URTx2H43991fsL3N79veBoQHtXotQw
	 q2TL+pbd5kVxLHZYRqoizgxKjzyp5x7pLmHmc0UPiPCqplpq1n7nj5iRSLDm+2+09W
	 PtysiRVyEL3AahHlnUBZhCWN8lHOZYOhZRxkpGJl5GFsDCzbRQdfizoiyuyv/hT1m9
	 EGWTDiDGWRythgW9WKtaF+athLm5AcRwjpcfFwcJezzrwVJGoGNPMQdyNsJbVT+WHz
	 jjTQbDifbtzkMBalZI1FlUqDmqz8W8UJ++764un9U5mMzIjUpCX8NRoFdu5G9AmoJY
	 um76F+C7h1lRw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6382qiW432349140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 10:52:44 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 10:52:43 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 8 Apr 2026 10:52:43 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH v2 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Wed, 8 Apr 2026 10:52:39 +0800
Message-ID: <20260408025243.1155482-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_035534_342439_19705F7B 
X-CRM114-Status: GOOD (  14.84  )
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

This series adds GPIO support for the Realtek DHC RTD1625 SoC.

Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
the RTD1625 features a per-pin register architecture where each GPIO line
is managed by its own dedicated 32-bit control register. This distinct
hardware design requires a new, separate driver.

The device tree changes in this series (Patch 3) depend on the RTD1625 pinctrl
driver, which is currently under review and has not been merged yet.

The dependent pinctrl patch can be found here:
https://lore.kernel.org/lkml/20260317115411.2154365-9-eleanor.lin@realtek.com/

Best Regards,
Yu-Chun Lin
---
Changes in v2:
- Move DTS patch to the end of the series.

Patch 1 (gpio: Remove "default y" in Kconfig): 
- New patch.

Patch 2 (dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio):
- Merge two memory regions into one.
- Add a description for the reg region.

Patch 3 (gpio: realtek: Add driver for Realtek DHC RTD1625 SoC):
- Remove "default y".
- Add base_offset member to struct rtd1625_gpio_info to handle merged regions.

Patch 4 (arm64: dts: realtek: Add GPIO support for RTD1625):
- Merge two reg memory regions.
- Remove redundant status setting.

v1: https://lore.kernel.org/lkml/20260331113835.3510341-1-eleanor.lin@realtek.com/

Tzuyi Chang (2):
  dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
  gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Yu-Chun Lin (2):
  gpio: Remove "default y" in Kconfig
  arm64: dts: realtek: Add GPIO support for RTD1625

 .../bindings/gpio/realtek,rtd1625-gpio.yaml   |  82 +++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  39 ++
 drivers/gpio/Kconfig                          |  12 +-
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rtd1625.c                   | 584 ++++++++++++++++++
 5 files changed, 717 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.34.1


