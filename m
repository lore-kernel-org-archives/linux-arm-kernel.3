Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63BACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9nuBhEHPYwAElfjrhTdPYqXOlqxpKHdN3+/pPMWTXPw=; b=g8Meb6HaS00IwiBF4zbWj8RBlN
	7g85axTBSjvZkHfNnVEmx/2bhQCBZWs5xe1qum0W/N+e4n2d5LThlhfUlQMGJPHzo+HLZ/j0RTOK8
	6zkHfnYe/CXnZ00woJQ2/lnK21zKOBmmK76S9JomQ34CCa6MTpaswW2pk55mym6Gb6cgZeLybtv3v
	YkzKUek7ZorOU/Pk/+l4LbWPs4U5jzemUFh0ca9qNs3uMpnOcegtlcvYBwnabtE0toaDnmaEHrUXT
	F6Fn4mlOte9UpysIDhv6Zw+96OcJfrXnGGJXqFN5+bzWPDg68wiaSkNYjjcIFd/YhGRHRGDWi1NgG
	gQExs5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZb4-00000003X8N-1mIJ;
	Fri, 22 Aug 2025 21:46:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNwQ-000000021kb-1OTw;
	Fri, 22 Aug 2025 09:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DAFC44DEE;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00678C4CEF1;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755854409;
	bh=pJwGTa7qHTBfaL9aAmiyFWO5jIhPuYuiPmJDsbad+Pk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ithyFqKzBpsqFCto1lla25dIcWrrpms+WcZ1ObPegaM+CFRAK84nk4Sd5sV5Xf7Q2
	 TBnllAA+zXV7007H4f4Y64zvbMDXzLPRKXV08Ke2Plp6HSS28EZydNfLuPKb6TIoZR
	 OGz5HECLHLEzX/yKeHvhM4PwovzDVWvrzTPxMRsU5aC4V2eH3dE1/ktNlB6zqR5E+9
	 oYxZrq2GL2CgjPTzlCxrw2Gbx2i+UsDha+6UH/YqELRgdguxjInI7lNJUoNBfyXDY5
	 jGcHp4BL0YcAOrB2IkxVlVKdpB+l2cRaQ21UBrn0qO+z/0DQmOG7eqDwFRykQqPvW7
	 4lc9u6X/6xwRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F41CA0EEB;
	Fri, 22 Aug 2025 09:20:08 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 0/2] dt-bindings: phy: ti,tcan104x-can: Document TI
 TCAN1051
Date: Fri, 22 Aug 2025 11:20:04 +0200
Message-Id: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQ2qGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMj3eTEvPiCjEpjXVMTozRTQxOTZMtUUyWg8oKi1LTMCrBR0bG1tQB
 jqt2YWgAAAA==
X-Change-ID: 20250822-can_phy3-542f5144c9e5
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755854408; l=796;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=pJwGTa7qHTBfaL9aAmiyFWO5jIhPuYuiPmJDsbad+Pk=;
 b=aHvGYtqv3q+QlxMdbuZHJYuNTM+a/CTkqkpJlO5kTKnARtfvn9Yn5wTvrT/45eBcUvBYDcmUg
 NFQXckPE6eAApx+Djex8Konhp03Twirzntgp3C5YrKWzmdCzfpbqyyN
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_022010_398755_889BECF2 
X-CRM114-Status: UNSURE (   6.88  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Moduline Display mainboard contains 2 TI TCAN1051 CAN transceivers,
properly document these and add them to the devicetree.

Thank Peng Fan for inspiring this patch series.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Maud Spierings (2):
      dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1051
      arm64: dts: freescale: imx8mp-moduline-display-106: Use phys to replace xceiver-supply

 .../devicetree/bindings/phy/ti,tcan104x-can.yaml   |  1 +
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 46 +++++++++++-----------
 2 files changed, 23 insertions(+), 24 deletions(-)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250822-can_phy3-542f5144c9e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



