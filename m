Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA56FC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bSZVshzrjkinWqjSAFuVs+darkV+EJzG4bFX1AZBm8=; b=RIU4zQbIOH7qFJslvbHi//vL4Q
	g/edlNgd5DuexmJj1UsyGENkiVryyWROxiiCTM5qhcksSzUvSnYwQyeNM4k9aaquS913n/6Ks4xAW
	cjl3xO/sh6NEtdgpdqt94+hZg2x1NzyGeNTb6QErciHmtykJzfZBKthUa/SUUHwwzFlYcyDa93C59
	vivHmmOejUC8Un7fMrg+RYEbbOefl22esfkljMQzUL5kuqndO/+Cz+svRhQP/51CFdCiLgK2Nf0cY
	oxi4WBZev6YV+qKMW7BA4m1bLcMkj49fKnM76rtolaFYpTko/VbV+DufuwSvWdcD1xZG2RdvaxGY5
	xSul4t/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfetW-00000003Ht9-0RMd;
	Wed, 05 Feb 2025 12:52:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfelg-00000003G8z-2YH0;
	Wed, 05 Feb 2025 12:44:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7CC8A41085;
	Wed,  5 Feb 2025 12:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B4BC4CEE2;
	Wed,  5 Feb 2025 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759475;
	bh=BKicQvUmuXjDNbRZxUNlJ8r+EcHKaqqCQZUX4SaRzuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IjYjSZvwELSQpD5fB7WkqjYVoxJq4rM1/k43Ug4L7RVYc8tveaU3L2TBDc/fdHgaI
	 qnUoeGvd/JwyW+FcHFNFKluby6U/yZP2HSsp/sTT96hMRvdEVcnPdQBBGVAWpE7RWl
	 VH3L02IuUR+P6PXu9O60xRnhSBwuurZ1MJKOEeXbHXk1vB0FQ23e498CuVggoISxWc
	 jUhCuNFw4F1zwCEql9Up5sji8o8iG9WdiwnPItFGlMBr3si2cT+1614uklRtIzzfPL
	 jhbLmnMUaiK5lMnKe8Z8wjnaPOjB9cXYXpsCDWrEcLBQQvDrNjyBGFsikae59SB1BS
	 oSdWN6fJ8roBw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux@treblig.org
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250201005021.447726-1-linux@treblig.org>
References: <20250201005021.447726-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: mediatek: Remove unused mtk_memif_set_rate
Message-Id: <173875947335.32457.7286096499117133517.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044436_722837_E0455246 
X-CRM114-Status: GOOD (  11.87  )
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

On Sat, 01 Feb 2025 00:50:21 +0000, linux@treblig.org wrote:
> mtk_memif_set_rate() has been unused since it was added in the 2019
> commit 9cdf85a19b3a ("ASoC: mediatek: common: add some helpers to control
> mtk_memif")
> 
> Remove it.
> 
> (The _substream version is used, and is left in)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Remove unused mtk_memif_set_rate
      commit: c9e9aa80022c6db71bc097a621a6145f39aa0ade

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


