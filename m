Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB8CCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWAleCpYBlToJ7/WPCLhRt8yE2399HoszrhXc5+pn3Q=; b=qQ0GZbASPm7aMyMweSgh4eYubx
	2lbJIBxqXlEC9XckWRRfsn9G1t3Ns4OJ47Es4zjI4YCADsMKxdaUaiS8PDElpMTfJOvRdp9Ik/ECb
	onR5t9Fjkg0ps68fCx3I8T+abxTyXPtbmcT0aGEeXtxeLV6sc8O35BC/zHRVJDAHBIwhwqj0YeCL2
	aA4dOUJ7ciBhgBjMv0s0A0uVu8Ip+WOUJ4HwOrt5OK1nAzpjbDp9VeiQRrNeOmk0u8KQ/ufwXLCKF
	X4JzAL4sshytMLOhpMRqqWk4NDBuldiLYjbP9X9TWKfvl8KCGz8rDf3rJtpu3lnqpB04wr6Dyewu4
	lxI07UOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFg8U-00000008WWR-3Sof;
	Sat, 10 Oct 2026 23:05:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFg8G-00000008WUO-3r1y;
	Sat, 10 Oct 2026 23:05:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A8C4602D1;
	Sat, 10 Oct 2026 23:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944071F000FF;
	Sat, 10 Oct 2026 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791673535;
	bh=LWAleCpYBlToJ7/WPCLhRt8yE2399HoszrhXc5+pn3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LFn7uR61sXuM6F1QlLDwMGmHabCCyRsEvfFcMN3pktoGVHwFIXKYtE5EdTTqbYmXd
	 4le7J3X74Euaxae+4+TUGuh97jL9qZVXBR6sYN049bu7IrCzhOWJIzVQ1Oru76qYdq
	 oIjh3o7OEOi18V1B4yElYYTxwSs5giyp+uirMsmquG3WH1PUFsKjrsnnivSft4Kkc4
	 SBwwpfsMiX5zB3tS2qCjQPU6jFChE3PmdWCqw3/naMdWg8Z3q45s0vzc3Xkg2HYCFI
	 gJjaYoHW464PZtyrcxpWCfrjBKx4I8JXwlK/nO9BtEg72++03LD/C/5QIyeEDihceb
	 txcMIV07pKPfA==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Haotian Zhang <vulab@iscas.ac.cn>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
 Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on
 success
Message-Id: <179145062463.2423942.16590148509796512242.b4-ty@b4>
Date: Thu, 08 Oct 2026 11:10:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=broonie@kernel.org;
 h=from:subject:message-id; bh=skJdmd3tUQHGVzD6TZQsGKOJkI7UvX0V36y4xyypgz4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJOHdleNi2hpIbhRUL0FSYdlrW8e56+Onic74+E/DmTo
 8eWc0gIdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiP5cxMvSXKamwvzfYsz3n
 w2XGFztupbnJXpvpNPulI9vliSYzgxYyMrxpdFCYVvx7Y8v+Ksebos5y0ZtKry9ImtQq8Kl/30J
 JNhYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 06 Oct 2026 17:16:02 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Return 0 from FE startup on success
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Some FE startup callbacks may return a positive value from constraint
> helpers, but ASoC expects 0 on success. This can cause .shutdown() to be
> skipped during rollback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/5bbd6696d75e
[2/4] ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/b6b3dbee98f1
[3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/f63317c826c4
[4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/240f11af9c80

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


