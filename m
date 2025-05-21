Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBC3C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4eOzqfy+OSYT6EMR+QrkkaUuSD/b/Rd8foI2zl5JbG8=; b=2GntRITCrqcHLs
	KZ7mBFBybmdiJdeMf7DZOjFTH4XsUOimASVYP8rIeRAp/+s3atUSC4gYD9LALH4OzisVul19TEb4e
	RWuE9SfJyMyxa+Oml2DgcZygsn5UOGf/WPr+dpig9qUGaFQ9t+yfNk8gQHfjUyPkEZGezpZeffe0o
	uCPliek1Tt0oRq+bA0K6MDIGBV9SGjQoxXFtYi+4oknNKadmfA5JzcOBJ2ODRTa0m9TsrFezsB4Je
	yYWM8LRRWNsdQi/RBhr0cvxolAOqkjAS81fgerXQVJyHHmX9YOkl8M/Q7Nxnatf94nOPW96EqhLc9
	htPnmAuXcFUksbBpBc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHleb-0000000GKou-43pz;
	Wed, 21 May 2025 15:46:49 +0000
Received: from smtp-bc0b.mail.infomaniak.ch ([2001:1600:7:10::bc0b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlcO-0000000GKG6-44f6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:44:34 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b2bML13WHz10xj;
	Wed, 21 May 2025 17:44:30 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4b2bMK2CbzzMn4;
	Wed, 21 May 2025 17:44:29 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar -- cover
Date: Wed, 21 May 2025 17:44:18 +0200
Message-Id: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANL0LWgC/x3MSQqAMAxA0atI1gZsMRS8irgoNbYRHGidULy7x
 eVb/P9A4iicoCkeiHxIkmXOUGUBLtjZM0qfDbrSVJFWOFq/24gT3zfyFjCdsrmAhuqahl45owl
 yvEYe5PrHbfe+H9DUt01oAAAA
X-Change-ID: 20250521-jaguar-mezz-eth-switch-75445fd1c725
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_084433_158917_3FB0AC48 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

This adds support for the Ethernet Switch adapter connected through the
mezzanine connector on RK3588 Jaguar.

This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet
connectors, two user controllable LEDs, and an M12 12-pin connector
which exposes the following signals:
 - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
 - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
 - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to
   GPIO3_D1)
 - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)

The whole SBC can be powered through the M8 3-pin 12-24V connector on
the adapter.

This also adds the ethernet1 alias to the Jaguar main DTS as the GMAC1
is exposed on the proprietary Mezzanine connector so anyone using GMAC
on the Mezzanine connector would likely need it (actually need it until
https://lore.kernel.org/netdev/20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de/T/#u
is merged).

Note that for this to work, you need this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=ba54bce747fa9e07896c1abd9b48545f7b4b31d2
otherwise most packets are ignored by the DSA switch driver.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      arm64: dts: rockchip: add ethernet1 alias to RK3588 Jaguar
      arm64: dts: rockchip: support Ethernet Switch adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../rockchip/rk3588-jaguar-ethernet-switch.dtso    | 189 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   1 +
 3 files changed, 195 insertions(+)
---
base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
change-id: 20250521-jaguar-mezz-eth-switch-75445fd1c725

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


