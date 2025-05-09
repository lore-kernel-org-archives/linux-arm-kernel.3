Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042D4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRk8EDWehAyjfLYaTwfuNFdcXvNXB2VmmN05x6dRUqY=; b=ZH1ktOU5ehOZ1E7hRVtCrQE1kH
	sBLavhzphN+09rkmQ7VfMeHaH0OUHoJdAsSN1MTTHbGSAsa1gOCzxkCykrmRQuxSTwhnf6b2wHGmy
	rVsAS/9/ffk8VaXgeHU2KxbMEMyR49h78YeWIbKEYPSrqiHwVmNHkcAtWb6ItOmRiB9QQam5TwIAX
	p4PCZeDAWMj2/C8oq9cZC9AD2K36f0q5UAKPNqBDawlYWzoEckbify7lNghIglcRpEL1Ql2ahFWIL
	JgWP5XJcms1uJqMLcIINGwAqkerdg+bzIjiDutVd0uUQafqhv73kPzZk4zTwvxpFty7ushmDDfNJk
	Az9FUGpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKJa-000000039eq-0PMX;
	Fri, 09 May 2025 09:46:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJZB-0000000310r-1kbk;
	Fri, 09 May 2025 08:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CDDB629E2;
	Fri,  9 May 2025 08:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062BBC4CEE4;
	Fri,  9 May 2025 08:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746781128;
	bh=NUJlMgnUlRyto5/zMHlqn7mzxNUcNXMEpllPFIPNjHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IwyzcisD6hzqPVhmFV/UySvLYxcE8JoriuZ19JQMlr54EzhhzyzjMaUxwqN0+gein
	 fIGJ1WizkLOGfTorbznQEOgeGpJL4ZIatfk7pxTM1ZWxWjqDhE37FaDQcUrDT0P+gG
	 6smT4sL2tqOkL4AOq28lI39sWILCKQjrR0WCH2gcaHAZq+IyS3fAaFqR86u6zeuZoJ
	 7gVL0nFNp8/+sdV+vVOAmn6l7jjgNiE4gOyh6e94cAMRs9da84usTdLdPe6ZT+nYoF
	 ieuhqHf1d7T6cdn+DLJ0wJ+kh3XDzXttrzM2dJAX5aMWEB6BtIn2KiFiFcYWfAWM2B
	 tPRxa/hechyVg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
References: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET
 set or disabled
Message-Id: <174678112414.29979.2917402833370390569.b4-ty@kernel.org>
Date: Fri, 09 May 2025 17:58:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1
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

On Wed, 07 May 2025 16:14:14 -0400, Nícolas F. R. A. Prado wrote:
> Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
> mt6359_accdet_enable_jack_detect") added a stub for
> mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
> driver to be enabled without requiring the mt6359-accdet to also be
> enabled, since it is not always needed.
> 
> However, in the case that CONFIG_SND_SOC_MT8188_MT6359=y and
> CONFIG_SND_SOC_MT6359_ACCDET=m, a link error will happen, which commit
> b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select
> CONFIG_SND_SOC_MT6359_ACCDET") solved by selecting
> CONFIG_SND_SOC_MT6359_ACCDET.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disabled
      commit: b7e3ec4e17e27420ebe976c7714881b64c28d63b

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


