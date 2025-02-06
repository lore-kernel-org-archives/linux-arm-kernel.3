Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4F4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 20:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJgWwT2p7GfYcJIlpxyoCyypFGm1csU0gqhOVgqrtpY=; b=RR1RiDku0SzCkIZ1nt9ubYJ8cG
	17U/aw/Gv3DzSOcY3G82d8TRvGHWrs2uu82MAqw25CPCDa4oXw0yGzYPEsL7TQFz9hztAXQmhQV5R
	Tp8WFDXtzBEvH8u1aWkhpESxlYqEawx23GIcB09KjIkxEZyd3vAnFP5CaQm6dfWZSxCfQNETY9jhV
	K7CWkfqG8Ncgz2ZowUanw2VcdgnWnUmfC/pVyFtAiueen1xdeJHbkMjJfVcnDLlVyHOtXYbVmVCr0
	HZaeUpPJzEXZNHK+ZrjcdPlKlmtDEacZeqoVwhRP98nxQhoE/JeaeluIjZIRO+aykd+h1ps/kdm/r
	l8HyY3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8l9-00000007W4L-0xCf;
	Thu, 06 Feb 2025 20:46:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8jl-00000007Vq1-12YP;
	Thu, 06 Feb 2025 20:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB7635C5A58;
	Thu,  6 Feb 2025 20:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192F5C4CEDD;
	Thu,  6 Feb 2025 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738874676;
	bh=qyUFi/a/PAEf26vNDRfycjP9CzYrFMnd6NlOxfFcf5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iLN//yfLRjTKEmMY7Q630butaCkl1R7QRg7Ey8X8OjM1fugY5DtdlCE2iFqnrQEQn
	 84T3gYsfLOFgPmHwFXxeo0CZg06SRDKNmOzQNiwhdYK4xoD83/pT3so1zvpfqbaUuw
	 cKeVzY8ldGsjdcD1yhhK1nKpiFDd9Q2d8tgDexSJQF+0AAIaLjUdaDOE5qtrxPFhqD
	 /lKNRw5F8wC14BA1QsSkiZwumeYhfRWRJBmOa6zK+vyWRrAP7PXZ5N/G+1V5n/2WN7
	 8yNNdQ5KF8EzHJ7Sq+XBRLOKxO82Qow5xT1uFX0Xk9DN3xjtkyvFDnaBVriJtGq4XR
	 yZt03Y2WfAVBg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux@treblig.org
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250206014028.237423-1-linux@treblig.org>
References: <20250206014028.237423-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove unused
 mt8186_afe_(suspend|resume)_clock
Message-Id: <173887467380.363675.10029607802179953957.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 20:44:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_124437_334058_736A0669 
X-CRM114-Status: GOOD (  10.32  )
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

On Thu, 06 Feb 2025 01:40:28 +0000, linux@treblig.org wrote:
> mt8186_afe_resume_clock() and mt8186_afe_suspend_clock() were
> added in 2022 by
> commit 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control
> in platform driver")
> 
> but have remained unused.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Remove unused mt8186_afe_(suspend|resume)_clock
      commit: 78e66dd5f32a1a8e5ee6decadd4e4dffa7d2c40d

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


