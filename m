Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6182CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9+wcbIH+w7d9dOLE/1bs/qlWBEoGeza5qooiMYcWvY=; b=gRZYYk10gFdFPYc1W6TUP5tYUw
	PlSOLBGKB9MyY3jEftGrPZyLvPFy47CYJTt+NtRXVJpmgg7pC7xp7hEnIMMZBRPTUsfdf/cnOxxeh
	5meK1tIgCjuN1m23XM0annQAqik4wQN75IiPv+whJvvJDAuB7EFU7BOShf1iYNFsL12Jl3X6oUMzY
	NGeBmHPVUursa1L7cBqgsw4c6t0uygirOjpYyiAzSAAe/4BPppoEFPkfn3jiF6+UGWJJshWVTmKg0
	6V170ZiuibeOU5U6tXU6c0HjR0EZvzoldRWHWgIoinDOwDQuXKk5cNk+9GJ1F92xDC5sg9fffzi+y
	YhMF4WCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRY3-0000000B3iN-2FOp;
	Wed, 11 Jun 2025 19:55:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNc1-0000000ARGI-1zW4;
	Wed, 11 Jun 2025 15:43:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 372C25C0F9D;
	Wed, 11 Jun 2025 15:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFA9C4CEE3;
	Wed, 11 Jun 2025 15:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749656616;
	bh=sgp9slAuf4XRQ8V2KqZqIsqojt3ZXLZ/Kwvr+u2zlHo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=enV/F8tXSRwKxJ7diJ2TyFIS6lH9xYlMrJGIjhbEmUdOq10ypB+7OzqrINdteaO6Y
	 mwLJnXN0wXqZ8GivHnGVAjTk8yyowSGm/I8TboRcTptfXygFhprCpHz3h9i7RZWnyu
	 fAMz1/2xbdPUBg8Mo3Cgc1uAg1gNGQ/wix4+gWvzBDckqwBlAveO3TgzIYaplJRwyg
	 z1fX4tFz3xfF05JiJYiqH+7xokt12hGoT/54qsbY0boKSjxDVhgoXBsubr9aIOnAbo
	 w8JVJkmhfbkvt0bzBncwaHsab/ock9eMO3UPgagPfkt2A+uWNi7A/KZP0gGLWHzM19
	 DAIrDi8sduHrw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, leilk.liu@mediatek.com, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20250611110747.458090-1-angelogioacchino.delregno@collabora.com>
References: <20250611110747.458090-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] spi: dt-bindings: mediatek,spi-mt65xx: Add support
 for MT6991/MT8196 SPI
Message-Id: <174965661418.52462.1962051636237778809.b4-ty@kernel.org>
Date: Wed, 11 Jun 2025 16:43:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_084337_570057_97AF41AD 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, 11 Jun 2025 13:07:46 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the SPI IPM controller found on MediaTek's MT6991
> (Dimensity) and MT8196 (Kompanio) SoCs, with both having the same
> controller IP, hence being fully compatible with each other.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: mediatek,spi-mt65xx: Add support for MT6991/MT8196 SPI
      commit: 414145b4cf6c64831aa497f0ec6cc1ca2d76c1d2
[2/2] spi: spi-mt65xx: Add support for MT6991 Dimensity 9400 SPI IPM
      commit: 6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3

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


