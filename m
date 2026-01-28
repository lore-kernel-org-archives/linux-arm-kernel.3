Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB81D35668
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 03:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11LjQZs7Jg6KN/lPD+EdYnoLZC1e/r9eYLPs7UXOZ/0=; b=WTdQVlPqJ7Z6O5UbkpsXd61g8P
	yzWgs+qz6SpUMRZRPZgWq3M6+1G5NXnBehA/UX19vmLVoZrjCasuZfko3DI2cB2jr+R9a9HwoEH1u
	qDyxOZ/0XvGb0Q5MuZlLCkRFz4eRpRdbj48+slSBCbzCdoo9ZyJ9R3UrJXJrnqaSHtw3ZnxD1qtl3
	REW9wkngEU4tzDIZIQs4bdT70/zWqtFsRzxh1+qItYUJYAA9Ivya55Pyed7B4NpOrVE59FCqgjUp+
	udNSGqWoNZ0EFOtfLOnIxRpgVAaVQIX7xIfcH0eIcBhWMr0eXeMDl6wTA+TmHUi/NmTfisH32XAXg
	qDNEyzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvow-0000000FKpO-3hJ9;
	Wed, 28 Jan 2026 03:02:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvov-0000000FKpH-2VC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 03:02:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B7EA60007;
	Wed, 28 Jan 2026 03:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E8DC116C6;
	Wed, 28 Jan 2026 03:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569336;
	bh=i0/csCwZU0v5d+zAzQkM4cSs7zUQWkjnC/H7rL+YtSo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SEK4aTxJAdkH8SyjzWKmABDtsz0stSBCdthsCALme8UvCk/GoSLBvbL36/0OFY1dU
	 RF/5q8H70kJBqVapBYJ7W6K4kzPqh2c9TnMd3/EIChExsfU5V4bG5y4AxjrFAqv+W8
	 rIs+e8fVIThjD6m2A2PoTynujyeBIxbICAuzPb/RgME48DfnObUMUOw7woHea9N4++
	 1fc5IT1HkRh9jZom0LP3uUDWp5DzepIX0FhMFZSwT2qvVmsKrLlP6i9A5Rxkv/ae5F
	 0iDTGj7ISTgeaCuguRFJgz/WLZNNYImV/p9Pl2C+WX8z7lOhCn8B2M2PFJTaXXiEFy
	 qjBMQbcj835nw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
References: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 0/4] ASoC: fsl_audmix: Support the i.MX952 platform
Message-Id: <176956933264.1515833.4946244987105746224.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:12 +0000
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

On Fri, 23 Jan 2026 16:24:57 +0800, Shengjiu Wang wrote:
> Enable AUDMIX on i.MX952 platform, update dt binding document and
> driver.
> 
> SAI is connected to AUDMIX, and the AUDMIX can be bypassed, so
> add 'fsl,sai-amix-mode' property in SAI binding document for this
> case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
      commit: 7550d6263b9b2015a806f66bf7ad356b6f25d050
[2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode support on i.MX952
      commit: 4d3b56b8a3504dab98d5f9a91ed9091431749863
[3/4] ASoC: fsl_audmix: Add support for i.MX952 platform
      commit: 291f2f908823832e932582500816ad614631d568
[4/4] ASoC: fsl_sai: Add AUDMIX mode support on i.MX952
      commit: 19b08fd23b20593ebe43708308dbddb02507877d

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


