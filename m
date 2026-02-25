Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC89FFD376A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4pB4ewoa93spjFFQs9SmIv7yxKVAuBrZ+5F/aXRyczU=; b=e16Zbtm+m+mW7wO9zjGaaeKUyO
	5wlH4rS8EIRqXcuV3gFq76KijGHj1E8DTaX00dgy2mIZcQJPTxSbfcw5Now1odHez2SbhQSa261tY
	UNC8JM6GWxhg/ukFID7OrNPXkFpGLJ6XY5t1mlqGaGTP2wSTlxlywSUIp+ToM0OkVojcGvLxKfCgm
	ke/MQ8RGmKfZQcoEUqo5+so1a2MQ0ZKrHT5bEAbSEP7wDii+1ZuVLFrgwXEJzjkn6A3Bwd9cBBH06
	XMKNfAAbsnbjHOzQ9X93yTsIuctuD0BhrE3NMP+BC0VBQazpdCt/tKHoyEOx1yI2N8l4CYjkOI2wz
	k5efLhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRQ-00000004S4T-2q8A;
	Wed, 25 Feb 2026 16:08:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRH-00000004S0Q-2t7q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71B5C41B5D;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7D7C116D0;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=1R+1GPZ7oHsV11otnMezIlBcaLhpwQJU4kYs2FxjRqU=;
	h=From:To:Cc:Subject:Date:From;
	b=FRUKSeHL5v4Yi4cme4faAxkQraoNCEhFqiAL9NAwDPsqOsO9SWGs/vVJDdKFwtNrN
	 DaPbASyGdK9y9nZaZNWi6HzwjXhm5FucDD/+QUFKmCPzBCkYr61QkYrni78/qXijrZ
	 1uLeTJDEkouYuIeIR1diPfHY6NF4Jim6724Z1MXd1R2cZTlsZ99eceEhvoO/C4QV5t
	 tP29mXVCKWYJGdsBB2LmG0TCQLP1aqHRp6rp5XG3byrFAJLOtMQXhFPzgNlCPOZG59
	 HmvH18ZDgN6yOuzGLhVBYYSJKeoBVpMNPRUxnWOwE/QIvdLsYKLfc7J4tuG1uRP/do
	 x5J1JPa1lacRA==
Received: by wens.tw (Postfix, from userid 1000)
	id 963C75FEC5; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Thu, 26 Feb 2026 00:08:23 +0800
Message-ID: <20260225160828.1687643-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_080839_759900_517C9974 
X-CRM114-Status: GOOD (  10.12  )
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

Hi folks,

This series enables the RGB LEDs found on the Avaota A1 board. The LEDs
are connected in series to the SoC's LED controller.

Patch 1 adds a new compatible string for the LED controller found in the
Allwinner A523 SoC family.

Patch 2 adds a device node for the LED controller to the dtsi file.

Patch 3 enables the LEDs found on the Avaota A1 board.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
  arm64: dts: allwinner: sun55i-a523: Add LED controller
  arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs

 .../leds/allwinner,sun50i-a100-ledc.yaml      |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 ++++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 3 files changed, 64 insertions(+)

-- 
2.47.3


