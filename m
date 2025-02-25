Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99453C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q75SJjdHPFq4OBLSzd80XjV92sqwrKwESU1frVTY8E=; b=4tcw7U8Ib9oiP/BrJ5W3NK060a
	eKOB9ZkXgyHKUdrjNR7gglFnhDayh6HGdK+q4n7B7G5jGs4/wS94ZWrGYNi7DCt5VS13VtmTqjjEd
	eVLkT+nHrGwfFEjBPQrI7DBIGBbV+qBUPPjJt43eYnHpZlvBMiuDJ+BnlUOmOIiZiqsl347eDKUFz
	vu3e3gt2Hr7g2xVitqcTaejZg1E0ceojysQA6soZ3Wrno5pKpsl4zQJcGi39YAE/AMjNYd9j8Y+Np
	pTeQ/NMugS6ab6f6agaiustm4Ph+4cByFglj1sRUKSAaDoK4Ba/BjDrHyVWq6ZDZYpSMGnj5FiMfu
	gs6WmKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZP-00000000Zz5-1mcV;
	Tue, 25 Feb 2025 17:18:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyLc-00000000Wd1-0tzQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:03:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B50296129B;
	Tue, 25 Feb 2025 17:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE95C4CEE8;
	Tue, 25 Feb 2025 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740503035;
	bh=NaOhW6Z7FzJMXfe5JimFmCTP2wgV0kwD8fHu8uLUX4w=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=et54jKHAq+LpZE2cb0Z6k64MKStYHd000g5RBK7OlGvI6u6HabfMXkkIpfFuzngWO
	 uBCrN/7ILf/aH23yEoDOcs7w6N6RN2IZP+n+ztSoK9VFcAFOHEGnft2ONTnp+ilauB
	 PxhzaxF94GXvMMVYqhmIUrc6jQVTNLyCRQE1HKTLbwuDOIzJBRNcqL3bRPwGr549RZ
	 40zH+K+aJTJoJL8dnen7aFr7bDHj22cKDfHrrcYP6Cgbk6UZU5iU58dLF5IRu1Bi6R
	 VFY3VINLtA73AOwbJbIR9JLO1RYpicH9lAdJspZualJizohEvck2UOFyiSkbtVbmPy
	 v7ycmuiMD/o2g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250224090413.727911-1-shengjiu.wang@nxp.com>
References: <20250224090413.727911-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: dt-bindings: fsl: Reference common DAI
 properties
Message-Id: <174050303228.104078.2142878652001092797.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 17:03:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
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

On Mon, 24 Feb 2025 17:04:11 +0800, Shengjiu Wang wrote:
> Reference common DAI properties for fsl,easrc and fsl,imx-asrc
> 
> Shengjiu Wang (2):
>   ASoC: dt-bindings: fsl,easrc: Reference common DAI properties
>   ASoC: dt-bindings: fsl,imx-asrc: Reference common DAI properties
> 
> Documentation/devicetree/bindings/sound/fsl,easrc.yaml    | 5 ++++-
>  Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl,easrc: Reference common DAI properties
      commit: 6542db20caf4987b938ed8feec07d199779823f2
[2/2] ASoC: dt-bindings: fsl,imx-asrc: Reference common DAI properties
      commit: 3e7b375752b5e4de56e92dfb9c43309cd985b869

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


