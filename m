Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBEBD0C85E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15PeX4g/MRruDh4JAfYiVhc+voMmNMSAGAJ5XZMnZp0=; b=RkrUw4jXwnDkDES2P4a8Wt2iCI
	z4A8A7FLdePDd+tu4vAVRTtL1QiICifgXoUifGmobF8ETcDXpfEjxPqucpwUiJNPc1r6ERlxShHVq
	gSxGCuREg8b7J8PjxCWeFdOHJ6i7fPbpGzcxtzEw5TbfGrTKf+AjgCGe/v99ncvEdlKbLZBUK8ram
	2vYRX/z9cmxgJu5aqDdsypZbo+Zo1H55Yc/2pj2Yn+W7Dz+jAwpACMzCftu9Sl4D7UGivKJD+ksyf
	cEMd3yVKhQ55EvyVgCZcZpSBHacDXBiFFYqwm4NgvKytV5TSK22R8g8NkiaeAsObrsMMF3ni9r6Dn
	DUCOoO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcnW-000000071zU-0VGQ;
	Tue, 13 Jan 2026 11:42:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcnV-000000071zO-0cfm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 379A660017;
	Tue, 13 Jan 2026 11:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A74C116C6;
	Tue, 13 Jan 2026 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768304571;
	bh=8ZCIZAy2nNpThhX5goPfWn6peYuTFVOzBqggm9jLdYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jLF0qILWfJSSPsB0tCWU8I2oEnZg4tIJRINrpWsKdIGY6coGzEWna9cXjc6TpfVVa
	 bWhCzXYeGQA6aTrF1hAR3/CP9CCziRmU5XX/f8lkkzIgEP4l7FdVL7x5Ie00RGYBKB
	 C4QEaySQTfYIXOLsgJTetxHnWMUwc5PbwyTCFUrBBie6va6++eEyyW4X4BKVAS9CRP
	 icJYXtRKa9fJ3j08A4cELtESyUT/0PF/8Os4l0WtzIP5QNXw7TYOw3tyXpyP3umCwp
	 YGlTm4fyH9QsX/dFhWxNKLseXLDPsSoOwt94bRKqL62YemonmMX/gp3Vz4GZjS3gmg
	 1QU1rqpEkCJ4A==
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260109075032.3287109-1-vz@mleia.com>
References: <20260109075032.3287109-1-vz@mleia.com>
Subject: Re: [PATCH] spi: dt-bindings: nxp,lpc3220-spi: Add DMA specific
 properties
Message-Id: <176830457004.25724.10171206431125136162.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 11:42:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Fri, 09 Jan 2026 09:50:32 +0200, Vladimir Zapolskiy wrote:
> NXP LPC32xx SPI controllers supports DMA operations over rx-tx channel,
> which is muxed with SSP SPI controller DMA.
> 
> For additional reference see Table 69 in NXP LPC32xx User Manual.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: nxp,lpc3220-spi: Add DMA specific properties
      commit: 8672e4b51adfc57150f3862b1665faff0acf1bad

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


