Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B04C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2G7D11aHCv3pekjxBYcfGOmrL0OlcpCmTAIxGeKpoE=; b=x/bOc5e9ReDC78z7ymcsEyqewI
	ffRyuHirndeRlSHpbCXvO9KyocTxsERydZWunhBAz/nPhwxEPzWrqIbKmi8E8R9jjoPZbxkr1snL1
	4SjGZPMZulyqElVvUwMbScSd5RIcMkLALpNaV0mAz6N0Jsdb6znucQ7T77cN+Xge4foUh3kyoOnGx
	xbuGKLbHkbB5/s+cQx0VIV9CiCblfSdLYilbyZG634sMsz6pAOLI7ZMErBG5gI9/Zi9ErEG8QVTT2
	rdkUPW1HJx5mu5vdeR0oDiubmw5X3fvO5nlBOd8dD+ptKiOyVAZjWLDbLxGt8LC3H5GcLl0oW2zrP
	VLjxpyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r1U-00000001VFH-0HGy;
	Mon, 07 Apr 2025 18:16:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oj6-0000000110Z-2vCt;
	Mon, 07 Apr 2025 15:49:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 797D36115E;
	Mon,  7 Apr 2025 15:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824D1C4CEDD;
	Mon,  7 Apr 2025 15:49:31 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id C8D385F9F2;
	Mon,  7 Apr 2025 23:49:28 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v3 00/15] arm64: dts: allwinner: Add basic
 Allwinner A523 support
Message-Id: <174404096879.829294.8545896192881134098.b4-ty@csie.org>
Date: Mon, 07 Apr 2025 23:49:28 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 07 Mar 2025 00:56:57 +0000, Andre Przywara wrote:
> this in an update to the series introducing the basic DT support for the
> Allwinner A523 SoC. It now comes with DTs for three boards, using
> slightly different packages of that SoC.[1]
> Functionality-wise it relies on the pinctrl[2] and clock[3] support
> series, though there are no direct code dependency series between the
> series. Two binding patches from there are required to pass dtbs_check,
> git put their patch IDs in the footer below.
> Compared to v2 only small fixes in the NMI controller driver: renaming
> the struct to better reflect its new usage, add adding the DS pin to
> the eMMC pingroup list. Adding accrued tags on the way, many thanks to
> the diligent reviewers! More detailed changelog below.
> 
> [...]

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[08/15] arm64: dts: allwinner: Add Allwinner A523 .dtsi file
        commit: 35ac96f796649346c9b0440413dc6c5138249b3e
[09/15] dt-bindings: vendor-prefixes: Add YuzukiHD name
        commit: acf5b947cff1b991ceb7fa53c66555242ff4c87b
[10/15] dt-bindings: arm: sunxi: Add new board names for A523 generation
        commit: f9d55227839199e928a41574e41089288a43a2d6
[11/15] arm64: dts: allwinner: a523: add Avaota-A1 router support
        commit: 3a1883f32b9b5083883624f9b39a3c6edfa6d490
[12/15] arm64: dts: allwinner: a523: add X96Q-Pro+ support
        commit: 66611715c473a9820b65322c94401a367711acd7
[13/15] arm64: dts: allwinner: a523: add Radxa A5E support
        commit: 80e0fb4e491b4994434e42c33c1387a46b7986bc
[14/15] dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
        commit: 7273c0e2e4229bca42c70e6f3c33f1756902301a
[15/15] arm64: dts: allwinner: h616: add YuzukiHD Chameleon support
        commit: 6d1cb8de157382facedf50f1a80ee033243b8494

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


