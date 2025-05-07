Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD5DC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEKpOrRhsQ2YP9LuE5uuusGSBbmELZW6cBfrFElICDQ=; b=N0p6QIH6rjzXsMT1r8Fd43S71k
	ZdAFy49FfAZmUr7mgYN6fNnv8g2FUbF0nADAni0UDMwEBdZMysfIrhbFnBnORPGS/O46fLD2hU+35
	RUoEAIWDhfUNml+auj9KDtASY3FGBOwXr4fELSwa4h6NLW8RvFVVVKbumYZ2Rtn55UuC3hu/U2EIC
	0Xtb8mu3kvpuvxcNkrnTV1bwP6Ro9jbdnaXTITYAiOKY56nT+f7/uWM5bF/chVCjJZEcb++m7sqyT
	Lu98DT/xGkVGIW03R/P6vS3EVcZ7I+dMm3mI0C/cgXChB2nERM6NMQqi4RrJrGZ9ja6b/qHbNHvZo
	A9VcWHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWuJ-0000000EDSK-3jVK;
	Wed, 07 May 2025 05:01:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSyA-0000000DoOd-2N2u;
	Wed, 07 May 2025 00:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F0905C5970;
	Wed,  7 May 2025 00:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E439C4CEF0;
	Wed,  7 May 2025 00:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746578945;
	bh=XKxvYVU7eC+gRceCUM5Tn+8dTbfgkloh/AOA7YMVN04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WrAPPnz5GmzzxWrq8VEPQRa53RMjWDr/dBXmY3t4fMgXrtQgO2DLuj+9SCz8CP6hC
	 l4D/dS9nNjsMj/m68X0XtAndk+s5o2VZsYVVHiRo84neojMHTTJi8GjKx61Q4usiLG
	 pnLp4C2SCm+nxc3siFi6T2TJGoUGc7wByCAgVWUmtg8nBKqGvHe+XJ23NCdrQPv1NG
	 +Mk984BhGV4djm6hT2x1zffZ4fI/k5oj051xtvswa8mi/oal9FRcq/uSFBwbhWbI8D
	 OSp74FVZkPS+zMnvbaxtLRnA1cfeu/V49Yq74muI4BQw1jOwxjqHY0LJojQJShR4A5
	 EB4QzsZFnUPyw==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250505052106.1811802-1-arnd@kernel.org>
References: <20250505052106.1811802-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select
 CONFIG_SND_SOC_MT6359_ACCDET
Message-Id: <174657894243.4155013.16755704226665079789.b4-ty@kernel.org>
Date: Wed, 07 May 2025 09:49:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_174906_670599_398D2B38 
X-CRM114-Status: GOOD (  11.99  )
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

On Mon, 05 May 2025 07:20:52 +0200, Arnd Bergmann wrote:
> The driver support was added without selecting the codec, which leads to
> a link failure:
> 
> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET
      commit: b19fa45715ce9cfcc597ed140df31115e969b39d

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


