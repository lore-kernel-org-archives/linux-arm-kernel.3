Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B0CCD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JpnVsZFsIPTPuJBPO8NxiEJrLCSiAZmgNj9J0Bjw4kc=; b=ogf/PD7t3KBTjrXL/HhRniHbu0
	+UhLzRcetr78nCyRnJ3s8YqLppp45D8gAthFj3P2iGfKK24zopMpogG3tza6AiU8WRzvfwIWUG27P
	nQBb7qYkTgnIdrK9jarv57J/72gTZKO6AVATNrM7NVPs8NT8UsZPKqPicgz+qVMGkjEV+adLXaVgZ
	hWed65qGSRiql3kPDEE0gMwsz281UdQ26xY0bRSRJFNunYinnBLIu+pooiyM0VLuLr+FGb8jeohYz
	zcYTphzn0cDg+NkjyOg6j1u6gl0bA9Ado/+otr3VHhepralq7wIdbg0GGvuAA93UhHWaTWu/m4trS
	aKk9P+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt7-0000000FNCE-1JSk;
	Tue, 12 May 2026 03:34:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdt2-0000000FN8x-2uMd;
	Tue, 12 May 2026 03:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JpnVsZFsIPTPuJBPO8NxiEJrLCSiAZmgNj9J0Bjw4kc=; b=OpJc+7If8IjZeLDUWyR5z75zju
	5dxNzeMpJTKLyjG4qbtAYm+BhiXgaqf4zw1l/dTo2nrmZJM5hS2WXIvBcGOaCHXCe9vnN7lzMX2Qr
	34JrislgCE2F9Xp0g/DKPRg1rZ5aFzSwf8TmCVTcx6L5HbETlMOI0I156nCtG0Bx1lrK/tC/bFphS
	KcY7KYkLqhFlvswsigfTiVOqhMIRNvD/X+1jjqmWOkdRCaXc9XELAflTzsP8hURWgyNG+HwkTa9FL
	T/qA+bkGjxXveBNEsZ95VPET2rAY9Csd1CCi/iWc6+YZ3x9FMoMCUrgMsuSehkM1rsDwubxO4geaW
	wQTPcebA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdsw-0000000DYbG-2BEn;
	Tue, 12 May 2026 03:34:23 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64C3XHVE03571926, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778556797; bh=JpnVsZFsIPTPuJBPO8NxiEJrLCSiAZmgNj9J0Bjw4kc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=laDma3c0Ay2CyWvf8BKDTXdlC9DBgQwfnqs4SHQIioUfoxPovpOhgeTORHquWP0oU
	 JYCDOyPo0PVtkDKqGM7UP+wxpyEk2oowB+tx7H/HtqaUACwdHD27Z5++UvEYs8ZfkG
	 bvzFymh06eq5V7Ix8tc2Sr6zmc/YycrjEItFq7X9sgRwSVI+h3cZyMM8FLUEuPpk9/
	 G91e0Nj4C5Vc9D4jvWME3QGyT40H/NcvGzLG9ZXZO2IBxq4840HNVsI5oEGhrMaXLf
	 86PRuBjEYuNG8viHysxKdkV1zebMC9yFX7boPuEkV8r6TBx/cDNCNEtJe6MtgutPpy
	 HLSXFOP8CJWGg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 64C3XHVE03571926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 May 2026 11:33:17 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 May 2026 11:33:17 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 12 May 2026 11:33:17 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <wbg@kernel.org>, <mathieu.dubois-briand@bootlin.com>,
        <mwalle@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <jic23@kernel.org>, <nuno.sa@analog.com>, <andy@kernel.org>,
        <dlechner@baylibre.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <linux-iio@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>
Subject: [PATCH v3 0/7] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Tue, 12 May 2026 11:33:10 +0800
Message-ID: <20260512033317.1602537-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043420_084907_654D47F3 
X-CRM114-Status: GOOD (  13.28  )
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

This series adds GPIO support for the Realtek DHC RTD1625 SoC.

Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
the RTD1625 features a per-pin register architecture where each GPIO line
is managed by its own dedicated 32-bit control register. This distinct
hardware design requires a new, separate driver.

To accommodate this, we extend the gpio-regmap core framework to handle
per-pin register operations, write-enable mechanisms, and add custom
set_config callback.

Best Regards,
Yu-Chun Lin
---
Changes in v3:

patch 1 (gpio: Replace "default y" with "default ARCH_REATLEK" in Kconfig):
- Chang "remove default y" to "replace it with default ARCH_REALTEK".

patch 2 (gpio: regmap: add gpio_regmap_get_gpiochip() accessor):
- New patch

patch 3 (gpio: regmap: Add gpio_regmap_operation and write-enable support):
- New patch
- Update all drivers utilizing the gpio-regmap framework to accommodate
the new reg_mask_xlate function signature.

patch 4 (gpio: regmap: Add set_config callback):
- New patch

patch 5 (dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio):
- Remove description for reg.
- Add Reviewed-by tag from Krzysztof.

patch 6 (gpio: realtek: Add driver for Realtek DHC RTD1625 SoC):
- Refactor to utilize the gpio-regmap framework.
- Create a custom irqdomain.

patch 7(arm64: dts: realtek: Add GPIO support for RTD1625):
- Add Reviewed-by tag from Bartosz.

v2: https://lore.kernel.org/lkml/20260408025243.1155482-1-eleanor.lin@realtek.com/
v1: https://lore.kernel.org/lkml/20260331113835.3510341-1-eleanor.lin@realtek.com/

Tzuyi Chang (2):
  dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
  gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Yu-Chun Lin (5):
  gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
  gpio: regmap: add gpio_regmap_get_gpiochip() accessor
  gpio: regmap: Add gpio_regmap_operation and write-enable support
  gpio: regmap: Add set_config callback
  arm64: dts: realtek: Add GPIO support for RTD1625

 .../bindings/gpio/realtek,rtd1625-gpio.yaml   |  71 ++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  39 ++
 drivers/gpio/Kconfig                          |  15 +-
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-104-idi-48.c                |  18 +-
 drivers/gpio/gpio-i8255.c                     |  13 +-
 drivers/gpio/gpio-idio-16.c                   |  16 +-
 drivers/gpio/gpio-max7360.c                   |  10 +
 drivers/gpio/gpio-pcie-idio-24.c              |  15 +-
 drivers/gpio/gpio-regmap.c                    |  80 ++-
 drivers/gpio/gpio-rtd1625.c                   | 608 ++++++++++++++++++
 drivers/iio/adc/ad7173.c                      |  32 +-
 drivers/iio/addac/stx104.c                    |  17 +-
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c         |  12 +-
 drivers/pinctrl/pinctrl-tps6594.c             |  10 +
 include/linux/gpio/regmap.h                   |  51 +-
 16 files changed, 963 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.34.1


