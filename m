Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05060CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xFlrCpI+Yd6quURj+Qcux9BYhkPUHzJhK85eTLRuPtQ=; b=IFvhPpJoeJ7Esr
	GOXgspqXmYEmyxO5ci/CZAGxiXM2G5G/8cnFUuuVHRSOlcXJdaDydxscjCRg1up0IiKitD7+HtOK0
	kg8jZkMe0kma+r8Sx8zlCgq4npNSvQ8XrBQFjS3HZOyU1+QRSfwz7TJYAmFx5OXGU6ORw2Jynl1pQ
	Cz9b0YhQ5RVnlfuzobi2vI1J+CwlC8SY3Kvcf1YACSibWHcy+p6MY6896GQMny4HtHl/bD23JN2Zp
	GPq7PLiazaXV8iA7u9QzNtbFfcJUHH5nVmm9KzNu4ML62i2M0cRGJBevstUbyZT4LdOSj2FcOmeQG
	qBbp2Dfc/Ta/245IzSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4x-0000000CSTo-0RzJ;
	Tue, 13 Oct 2026 09:45:51 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4t-0000000CSRL-0ets
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:49 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xFlrCpI+Yd6quURj+Qcux9BYhkPUHzJhK85eTLRuPtQ=;
	b=JfXvW/utIoeD4MZQd3eJagYvekqdJYySucnkcJCxq1c4OU1UjSrqi07ALYjlQtnbtPAAx/
	Tyn0p1FcYInTRyaXs7BPryg1goO09j8PBBGVRVC2BS84rw6wAnUg7C7MzaHDoCKx7YXGhL
	iYt6zqc/AlI8zvSqEwjeMHieqzDfODvap0V9oUpssMWchqk56FpqbYFM2br8goGo4+7BAR
	FHURH/zGUZK9e8ZWZ4JhlzNiTW4OHsJDQVAES0V2yL6c1PwuS39tDNVUWKCO9kM1HIWORY
	EOMA4AATGd1vd/4A7C8imNpz6xCjPKetqf9zSPpOYu17FYYXqMrtbX323ZJLkw==
Subject: [PATCH 0/8] arm64: dts: Kontron i.MX OSM GPIO Label Fixes
Date: Tue, 13 Oct 2026 11:44:45 +0200
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQtJqFVxEXSfwTR2oaMq0Ip
 Xc36vLjwdtIUQVK526jipeozLnBHDoKd5cTWG7NNPSDNb0ZeS26VLin5MSpyMyT85g4yhvKNkY
 bjuYU7OipLUrFL7TD5fq3rv6BsHyftO8f0SdoR4AAAAA=
X-Change-ID: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=DsmKtAg9kHXbhq0z1HToW5DmnXyp+tUTcmp0uuadwcs=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs3x1rN8ia6Hje3i605r+myoRD26qMDh21s3KMmiej1
 qC0MulURykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwERWdDP8D2G6WP3kyxEH14VC
 T8LrOnh7BarbY5ef754UV9y88OOh6Qz/w+f83Jfe5NZ4qfz93+vO65iMZ6aY6ynrCR5pm/2mOOw
 BLwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_024547_674300_5DE847B7 
X-CRM114-Status: UNSURE (   4.99  )
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

The OSM spec [1] clearly names all pads and GPIO labels should match
the spec in order to have unified names across all boards. The intial
board support uses different labels for some pads and contains bugs.

Fix these to provide the correct labels the user expects from the
documentation. This invalidates some previously used incorrect label
names.

[1] https://sget.org/standards/osm/

---
Eberhard Stoll (5):
      arm64: dts: imx8mp-kontron: Fix GPIO label assignments
      arm64: dts: imx8mp-kontron: Fix GPIO labels according to OSM spec
      arm64: dts: imx8mp-kontron: Remove obsolete VDD_CARRIER regulator
      arm64: dts: imx8mm-kontron: Fix wrong label for SPI_A_SDI_(IO0) pad
      arm64: dts: imx8mm-kontron: Fix GPIO label for PCIe_SM_ALERT#

Frieder Schrempf (3):
      arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
      arm64: dts: imx93-kontron: Fix UART RTS/CTS pad names
      arm64: dts: imx93-kontron: Fix GPIO labels according to OSM spec

 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |  6 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 84 +++++++++-------------
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 41 ++++++-----
 3 files changed, 59 insertions(+), 72 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


