Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ADAEF06EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BrKi9yIdPU93oR5n7QCpvPkIx8nOF7iBBagrv0ShfY=; b=cd1sTtBflOzNR8kIdRCEt43zRj
	Dy2vRa7/TdzGNlXc6J2Un/lS0DADpW1AX1Lg2R1omaZyyqMCqquAGWtfUuFQy+yzhT38xSpX7QulK
	p6bskMFmtOZHfiJSWl6zZ7OtuzJIdXhf/6hLnXQ6Lu2XS+xWJqhUcrgEcXlcH3gVl0UQBrMu5loQk
	gIp3CwVcsedLSo1XdvrGgWzY4/LZ29Q5ltJMNwYxpqEIA72rMCeNWfdsy0K1T/idMOyElU27bo6KO
	x29PWTeA5/CI90WbZR18xRcoTBOvi76VqYXvjwTII3RhempSS8+TX6L6JKP9+ACVbEb92Dg8UFkH9
	omC2Tpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpCDp-0000000E1sv-2DAJ;
	Sun, 08 Feb 2026 21:21:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpCDm-0000000E1sV-3BR1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 21:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA8F4440B4;
	Sun,  8 Feb 2026 21:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A8BC4CEF7;
	Sun,  8 Feb 2026 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585692;
	bh=WniId9rylPyWCg6DYb8OFQ8yG1Mf1fld/+NjW0lsf8k=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OL0cmPMGq5hb4ML2UnBGJ7XL+Cd2QuvbF2LHCwzNxbt2D5NdVfL1HUi1K2BJFm7qe
	 FO6ErvhzO/VPNdM00QJdKkXJThRqPgNp7pgtPAQo/is0wG00tWKu3YsT/8AmKsB/1W
	 Zi1lF6Y52pNAoJeqjcGO58ozFPqmmkB78ZPpN5gF7Rm4ov7vZt63BXQhH90d9GhH+x
	 H91figU7ZpSIpGrvLTiHduM/rwS4K7YyONIs7mDupxe+jsBe89IhoDPyt9tfHYoH1B
	 st2sf9XgeYYZK0mZpaXpkvQ6oZ9d6j8K+a05oJGBzVFy/Pwc3s2M24i/5M6I0M6eHX
	 rdhZtuE3oXrrg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
References: <20260206014805.3897764-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 0/4] ASoC: fsl_asrc: support the i.MX952 platform
Message-Id: <177058568882.654564.1085917355716546232.b4-ty@kernel.org>
Date: Sun, 08 Feb 2026 21:21:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_132134_825288_857053B3 
X-CRM114-Status: GOOD (  14.35  )
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

On Fri, 06 Feb 2026 09:48:01 +0800, Shengjiu Wang wrote:
> Update dt binding document and update driver to suppot ASRC on i.MX952.
> 
> Changes in v4:
> - add Reviewed-by from Daniel in patch 2/4, 3/4
> - add Reviewed-by from Frank in patch 4/4
> - update the commit message for patch 4/4
> - remove 'retry' in patch 2/4, reduce the threshold for timeout.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
      commit: 37bb773b4a5a5107b92beda3447a7c6c0cfc1237
[2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC before DMA device for M2M
      commit: 83447a38ba9abac52bc110566d3e117753899f69
[3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
      commit: 6a8c6f5587337eceb387812b6f47bc16c125b883
[4/4] ASoC: fsl_asrc_dma: allocate memory from dma device
      commit: b010c782341b79edbeb80706360b772db908daa6

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


