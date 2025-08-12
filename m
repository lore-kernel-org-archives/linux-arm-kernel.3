Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC86CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPzAQef8QSKYFjsB9zrajVy9p2Sl/AruarRJaDB4etU=; b=wndyzrZHTUB5CNbE7hc7CLBudQ
	hK1cxwG5alnxKF8IEVAcTFxU67h8AIuIdCFdUlwfEpmjSRyBXCoyhIQ185j/K0BBkW4f00cDQCqcC
	PBem9MxLm0KKIZN103GHvL+YFBH0/8tquuRR08FQGTP+32EAeTT0YMR/t7kwvzGuw/C8O99CVt4+c
	pIS31DmdbOW3iN/C8sY/p14b4ApgG8WaI1vohrRNZaKhWo8cxANdibIjpwLXMfIYKfuDYfCnq2RfB
	i0ofKoCb9DrE6ILOE7YkSUWsWwf5IIAnhgieShRQh7l2R7mkctt8vL/2TKGq0+V29mUClq71fApkp
	r7kE0LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uls3m-0000000BS2R-0cNU;
	Tue, 12 Aug 2025 16:41:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulp6E-0000000Avpc-308D;
	Tue, 12 Aug 2025 13:31:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2BFE601D2;
	Tue, 12 Aug 2025 13:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2481C4CEF0;
	Tue, 12 Aug 2025 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755005493;
	bh=K8lzBB9/Bh3jP/7LMg8a5TAR/9M1qucruuqKpFB7wz4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=lb/sRMoHaDv+Vq/LarNyxaysxQc7MLWzPtxUuJtQ+k5oOp6r3aRjDQ1WpShIRb0Lh
	 ngC4YYsw/g7XBY6A/CXs/GUkpBsz5/F/be3+bDMRlDiEx9gliV/nK1W/qJMaQNzStX
	 P2taRk5Wn6j2d9r4okncraoZiSDbJbn4LUq7MOrEUJp8IDmtkxcS5M8Y70LSK18QCz
	 Vw9PMvUcl2hDohXiOOVuImNHE0IIAd9dxuaLMS/HpMmYTfXRPESZ47zxTJ+jmQWds1
	 AaWzV0LkBtoMOgmRS53eEuxJWmStnut1B6VOGzfsccOhwPzyki0A83e/SI46jDtb3N
	 0baqdca9yYL2w==
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Sperl <kernel@martin.sperl.org>, Chuanhong Guo <gch981213@gmail.com>, 
 linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Liao Yuanhong <liaoyuanhong@vivo.com>
In-Reply-To: <20250812033817.487565-1-liaoyuanhong@vivo.com>
References: <20250812033817.487565-1-liaoyuanhong@vivo.com>
Subject: Re: [PATCH 0/2] spi: Remove redundant semicolons
Message-Id: <175500549067.70594.14172853876781002627.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 14:31:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
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

On Tue, 12 Aug 2025 11:38:15 +0800, Liao Yuanhong wrote:
> Clean up the code by removing redundant semicolons.
> 
> Liao Yuanhong (2):
>   spi: bcm2835: Remove redundant semicolons
>   spi: mtk-snfi: Remove redundant semicolons
> 
> drivers/spi/spi-bcm2835.c  | 2 +-
>  drivers/spi/spi-mtk-snfi.c | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: bcm2835: Remove redundant semicolons
      commit: 0ecc0e17f05bbb953b6ea3812e78bab224f08595
[2/2] spi: mtk-snfi: Remove redundant semicolons
      commit: 528a813a5d98702cc6fd51983484cf7eec9ebcac

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


