Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC58ECF256A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nlSzAaeGkBXcEgWLyqVlZNXqlpEv85rVF3RbzvhFxU=; b=K37wiTYrsaxu1wOThhBTUaJYqz
	mzZRhffTfixCKjqxhMWlYnPDIwfXItjlJxkZS3jOWQpOWdF+/gv/gPmSi1H+8pDM+LW2maCpDLUyT
	vNURgTdC1DhJiiK0JgJentlSneHfoJHoWbChyC2PBRqKyIQbmCuu8vB5ziecU2b/ljSNbib1TgaTM
	y7Blq6TtoyCar2dJWTH8ZyTXsbrATbJ8KiOHyHMH67NhvBiaQuUfd2ebroMibR2fKyE40RZ5Sv7zi
	dhFG015mndroP6paIpCP+oW/j8qeLiF5qSJ8MLve+MxDNzLN6XgVg1yuLSOzUtEShiFo/g2BvxI23
	S00nf7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYKH-00000001QNE-0epP;
	Wed, 19 Nov 2025 02:53:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYKG-00000001QMz-13yM;
	Wed, 19 Nov 2025 02:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90204601BC;
	Wed, 19 Nov 2025 02:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677DAC2BCB6;
	Wed, 19 Nov 2025 02:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520823;
	bh=NdiVUh5p7ZNlDtEZvNZ/+7ut2DM/ueH3ssjPZlFqdHI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LsSsEj0TnYRhVD0YYRFVhtF/ktiK6dd/ar2Cpen767gU9t/u9kRMUmBgy9lZj2eJ/
	 lQo5zaz/nMhdOpHI8BEoJR2x5hEyX2t13CPfSmQJs6TQPK/e4zVLlAngGBkWdB0+Hl
	 PdUWhlHrILrVqZyXvf3BXZFcQspkyMYtzggZNL8aNRjo+vAaLBp+Co0p/1zLTDvzTz
	 lhHiLpgWfjyrlvBemFMfkCSVw/CtJ2p4vKOBZ/T2/RetuGI+CfTsZahqi/DUY/GVuE
	 AVmgp/267CGfO9ieOUsCvot/EfzI7NowJVCvR6xH443SzfPiz30+gCGjz9TBnwcOAL
	 Ynmea8veJYGCA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Cyril Chao <cyril.chao@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
References: <20251031073216.8662-1-Cyril.Chao@mediatek.com>
Subject: Re: [PATCH v3 00/10] ASoC: mediatek: Add support for MT8189 SoC
Message-Id: <176352081915.1803701.6390255355558786166.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 02:53:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Fri, 31 Oct 2025 15:31:54 +0800, Cyril Chao wrote:
> Based on tag: next-20251031, linux-next/master
> 
> This series of patches adds support for Mediatek AFE of MT8189 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes in v3:
>   - Added support for CS35L codec in the machine driver.
>   - Added I2SOUT0/I2SOUT1 MCLK configuration and enabled the clocks.
>   - Added dpcm_merged_format flag to the dai-link to ensure codec
>     format constraints are applied.
>   - Added support for ES8326 codec in the machine driver.
>   - Updated the dt-bindings description based on reviewer comments.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: mediatek: mt8189: add common header
        commit: 81f8f29a48defd572ec34d2b9c84374fd05158cc
[02/10] ASoC: mediatek: mt8189: support audio clock control
        commit: dc637ffeed6c32c951520774897601ebd9ffc3d5
[03/10] ASoC: mediatek: mt8189: support ADDA in platform driver
        commit: e3acef6ef89ffbd6c80950d5fa0d024a8d11c1c4
[04/10] ASoC: mediatek: mt8189: support I2S in platform driver
        commit: 34e437097247f92fba6fac3d6e40e33af5f32e3d
[05/10] ASoC: mediatek: mt8189: support TDM in platform driver
        commit: 9f202872ba04d71c96908c56abcc6e3f4a629a40
[06/10] ASoC: mediatek: mt8189: support PCM in platform driver
        commit: 402ff043395fd9444810c723056fe741c77dbc21
[07/10] ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
        commit: 22e9bd51e518e8fcad269c0c1f4bd84467db093e
[08/10] ASoC: mediatek: mt8189: add platform driver
        commit: 7eb1535855983f67b95c2ba777d686cc17188285
[09/10] ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-nau8825 document
        commit: 4980df101676f598ad515725a94424d244a5c5a3
[10/10] ASoC: mediatek: mt8189: add machine driver with nau8825
        commit: d218ea171430e49412804efb794942dd121a8032

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


