Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE282CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+78sUPlA68mvrYRdtRrVf8Jk55aIBUQY7gbJkQ+NdB4=; b=20JyRqF2vTV2hzdsBhlghe9TfP
	V90ajHu7jtVrljff7ygdBIHl6KNczyUUZScurgwC/6vDeNolMkI+h68Aygj828gRoI/TuEV2J4Ggh
	qQbEtBNWu3EStrS7neOS/UoLPzNZWPe6DPCEZLbmgJOPAw24hiAiBzfJDkpiPzTaKDqgdRoYnJPA7
	f4X/oStFC0rtG4cpY8nozF/cIdDC2Izh+y8ds9kZyeri6DnHQxpLC18+VgB7eCsy7Pv/RbdG6qaQX
	0bGD1BODROOaz+XYbCWm7mRs/Iwm83GyZLUB/pWV5peTDmI+gntO/qVTHNz64UUkpgTsd7TVgwhO2
	p1DvfBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zN-00000008tLV-3RS3;
	Tue, 09 Sep 2025 17:18:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyU6-00000007Q4n-3igO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29BD96021E;
	Tue,  9 Sep 2025 13:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350AAC4CEF4;
	Tue,  9 Sep 2025 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757424849;
	bh=uDWe5i323HRkm1ttJ/vmDkJ/q2zljilys34SereqCRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=olO9ywJGFDBKFMTZaxoqfg70ObRIDdTVWze2NHxc25zyL9zp6NSxt4IslxEy8akZH
	 SEEIO01nvfNttmmTC6eRSdVD3vstBVWIxjsSeMzM/v+wGNgOvyuIKLC6v6bt8Qtw4v
	 AxGcNU0dhksVjqcvJ/YOTHcP9XLZQ74A0QcUSZB6rVEqL2aTH6c5enwCJSnmbfd6Px
	 itNRE8LUb8j3PO0nqty5tvdWrrhL5J6sVIig3iS48YBMl+iz5KIYR5gHmSx7HxLBAL
	 9HgbG7SPl5kP3B3kzDuApasXFsRHiXs4LwO1refUNAgZaYjlaze+ET/RuOSWsUe8HJ
	 hYSOuwGCgsXYA==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andreas Kemnade <akemnade@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
Subject: Re: (subset) [PATCH 0/4] regulator: sy7636a: define and init all
 resources needed
Message-Id: <175742484696.195386.11497376161041416392.b4-ty@kernel.org>
Date: Tue, 09 Sep 2025 14:34:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-94e36
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

On Sat, 06 Sep 2025 11:09:11 +0200, Andreas Kemnade wrote:
> The SY7636A has some pins which can be hardwired or used to have more
> more advanced power management available. As several devices containing
> this regulator have these pins not hardwired, but instead connected to some
> GPIO, enhance the driver to have them defined and initialized.
> Also add the ability to power off the chip completely by defining some
> input power supply.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/4] regulator: sy7636a: fix lifecycle of power good gpio
      commit: c05d0b32eebadc8be6e53196e99c64cf2bed1d99

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


