Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DBDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VCUIIUrab/Ij6Ur23OzvtXOHDAu9y4qtidV7a5tuD+Q=; b=WDjTnsvubb4tf2
	JMwImkOnGl33fdYa3rZ4AkW5tYA3XyubyBN36gslnSP75wJKnysm7WIerC4R2v7hz8iAAXO8iPw0k
	Cpri/3EwQTbOBGjGRbiEqLyh53a0odgl8vRmuFh4NOISNOdE/utBjBdFJsYfs3dTEU14B7hApI8u5
	9mzzzlBJqd159tVzCiZkROCsUAgDEF7fpHdy9RuXdNJ2euwL3dfvlbctZ5S9GpCGToks8yttvsBnp
	Dt2cgjfyCcxOC7TWoYrDPU7JtaHeZr5YDwL2C9LznxNjlUNZQKU4cBYaGWhH5AkMIr+93FqZffJo2
	EeNROyVYkQobsyVNWvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHqz-00000004ZWw-30ct;
	Thu, 02 Jul 2026 13:53:21 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHqx-00000004ZVN-0QBa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VCUIIUrab/Ij6Ur23OzvtXOHDAu9y4qtidV7a5tuD+Q=; t=1783000399; x=1784209999; 
	b=ytRRnewBhSPY6O6bOZ/HSQLdRtIcx+c/48YX2bxi0wgSPmUz8uFxkZHpH8pTOh65HOO58KuAf9+
	NhNRrujPYtjzHPfAfUtYweA8C1iFG+2EKhxL4hzNM8g0vGQ2GXsS+8Y8iySNRllueoMPVPIeW39ZD
	56Zo+6/kQTJ7+i7Fx2rJxKq/bLVZOmJ3qIG/s0IAODTaMCE9zorsVwUvN5CH0bjM8ghpUBn0gW8WI
	JZHA/cWr+lxoUP0vmGnUiKIX1Ql/wYLZMUAz7sMrlT6RNmhOeXSjKPsLL4vk8F89LnzpzaO1C2ilU
	ch9yDJ5kNmiCXgaj85OD8xatHbhvtJ7WIOPw==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] ARM: dts: ti/omap: embt2ws: define RGB LED
Date: Thu, 02 Jul 2026 15:52:42 +0200
Message-Id: <20260702-b200multiled-v1-0-c1799ad45c96@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACptRmoC/yXMQQqDMBBG4avIrA1MR6rgVcSFiX90RG1JVATx7
 k3b5bd476KIoIhUZxcFHBr1tSY88ozc2K0DjPbJJCwlVyzGCvOyz5vO6I2DVCh80T19SSl5B3g
 9f7um/TvudoLbvg+67w8Z3pWPcAAAAA==
X-Change-ID: 20260702-b200multiled-ce27e3f3a5f6
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <andreas@kemnade.info>, Pavel Machek <pavel@ucw.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=682; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=SsHv7eglcq/3f807scK8C7Ri2u8BTa5D48XTbqPe5So=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFluuZaXel0ebnDnbNh3ylGcbR1zj2jmYq5dZ3tnXpLYM
 nOBmZxNRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABOp2sbwP297SPHZ5+ytwSX9
 xXbt+3YzGTWv9Ly7ePOKPxOOCncrZDEyPOo+OUO4Rp3DVv9X/vfJawS3Tl+itOrB1X+btDaZzCr
 8xQcA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_065319_143547_4E8B08D6 
X-CRM114-Status: UNSURE (   7.46  )
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

Combine the LED definitions into an RGB LED and add the drivers into
defconfig.
This has already been suggested a long time ago.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (2):
      ARM: dts: ti/omap: embt2ws: use mulit-led for RGB LED
      arm: omap2plus_defconfig: Enable multi-LED

 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 13 ++++++++++---
 arch/arm/configs/omap2plus_defconfig              |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260702-b200multiled-ce27e3f3a5f6

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


