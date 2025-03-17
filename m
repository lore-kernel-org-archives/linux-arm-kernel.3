Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C77C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HtlwG/3nglKjTrCQsmz2WEQCe1tt4B+0V3113CDo7Q=; b=XYsqPXjKtcHbpium0WkP8X257a
	0eNocM6AJXcUdc2VPRzUNz9WPpjQ6AXVrA12PuAYp5yT0erPcR06A14SjnFm1fvCVL6WDAUrOUYct
	lcKlrkatGRI912u7wGPrwXY2pChQJk0CNHm7FJVc54r40c9EF5F4++BeUXRDklCeagIGo1LE+kkX+
	EdvtuqJieFkP/REFJtBZMH+iGPpFwO+OrumgbaaLIVEERrrdtXsQjhv3t7kQJWn0rsP6HDr/UDeWR
	BWYYtL8q3gx6pUWxXWbCQ2gDlQtbiOhGHyovh0AdHaYIbm9q/Ln9lQ8FtCzGbYA4uCwXLMcSErbYZ
	JEJl1Thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFW3-00000003jlQ-0DAy;
	Mon, 17 Mar 2025 18:48:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFUM-00000003jZK-3LZv;
	Mon, 17 Mar 2025 18:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67B53A48CB3;
	Mon, 17 Mar 2025 18:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8ACC4CEE3;
	Mon, 17 Mar 2025 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742237221;
	bh=HxVzpYI9x47IeMZvH4BdX9GwVI0Qz5knIVuS0Jconhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GrAqfi7cD/H+cHzZ6RtlF3OKQfeRomkwTolDpEuIefSPVxQLcYNW8IYOTwCO8WYvh
	 0J2WN84vnd1hJ1ntjXIaGtoq+4UcqpZOjyC2XCj2ZWGRWUM+CWqjndBuSUYXsZDfpf
	 KNfEqAC47MfDUhXU27pAahMVS+txpg3AZd9o3lONjqaeR2k021kCT6zTE02DixQPB6
	 CFZq6njrOi1JA8X3L+UsLeDPNHrRd/DYFhqlHTE4wuDmB0/6ypqRuSp4J+iB/nj+bg
	 Hz/UHqHFqu/B0+/TpgjNNZYpqZe76mq3dSCEEi33VfaBhWuR12AC/DMMIjPMaBxLq/
	 5gJV6ykYWE3Kg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zoran Zhan <zoran.zhan@mediatek.com>
In-Reply-To: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
Subject: Re: [PATCH 0/3] Allow retrieving accessory detection reference on
 MT8188
Message-Id: <174223721831.287878.9212541577191425735.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 18:46:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_114702_902620_96F977D2 
X-CRM114-Status: GOOD (  13.27  )
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

On Fri, 14 Feb 2025 12:14:28 -0300, Nícolas F. R. A. Prado wrote:
> This series enables the MT8188-MT6359 sound driver to retrieve the
> MT6359 ACCDET sound component from a mediatek,accdet DT property, which
> allows detecting jack insertion/removal.
> 
> Patch 1 describes the new property in the binding. Patch 2 implements
> the sound component retrieval in the common MTK soundcard driver. Patch
> 3 updates the MT8188-MT6359 sound driver to register the audio jack and
> initialize the ACCDET driver for detection, if the property is present.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,accdet
      commit: 3fec903f2cb18805b1ef22a0e310498020c1f15e
[2/3] ASoC: mediatek: common: Handle mediatek,accdet property
      commit: cf536e2622e2b0a60c99e799995b6e9acf539c17
[3/3] ASoC: mediatek: mt8188-mt6359: Add headset jack detect support
      (no commit info)

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


