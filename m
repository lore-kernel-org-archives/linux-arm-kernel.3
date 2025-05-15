Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3564AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djcsMp5c+uXusuXKFCINoErIEdxrN0txK0DGwX6i8YA=; b=fkHyiZ+IJLf+xgukYIM/L7s2t3
	4zFzP677U7nRzwIjMQykyqABbe9wsVlBmA+Glf9W7VKHoo+3OAxxpn0fLPJhCzmoJZSRiMjc1rGwB
	3+WSLPQPobngqFbCH9UFSqZP5Ron+WtJLg27CNrdrHYKO+u5AeT/vYWf1na88OekTgi8fpOCJ+Ik7
	TuqHf6noyL4b6LU45H46pBjn2qZwz5UErZIYN9Z7g27GQQS1qSR311vwWZARGmkIULJALg72tCtou
	EAR8dojI3WVv+FuUS73u5iW1oFS5FmvaDbg6I1Vor8VDXG8CjXjdthZAOF78eeE0OwCNvuAFdrEl2
	aQt8LJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTJ1-0000000HOVr-32D2;
	Thu, 15 May 2025 07:47:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTFO-0000000HO3A-3XMO;
	Thu, 15 May 2025 07:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDC825C4D71;
	Thu, 15 May 2025 07:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F06C4CEE7;
	Thu, 15 May 2025 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294997;
	bh=h1lP/XXLGAF1oDoLpaZY+0OrHUGsOnllqHLKbDeAURg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K+Jk8h+dtlENycXrCf9xiGgBIODRP64nCCyfmd5mwwfFiuecBzNt+8y17DbOE/Xgd
	 WFXCvPM75xcNZQ0kk7VgG2G4G5SFydPF305XY7Z4Ox8eUI7gvz4o8JPsuRdz8iyzy/
	 HfjxbEchRRi1LpfvbNkjZguOlrlGf+bYUzR69nbCal7J2DV5h+SqEZDN15n2iFy0PF
	 NQ5v2LSL0DAO1d8yw2Bzh8wyUMnllANDiMc+IQ4WwVhkvzcKYctr9suI2rKjCnXhGz
	 2P3Pa3QDBNrDFkgpnuiSfo9Htlo8zTHTmiN3BWLsN1Rt8smb1LhsGrhW8+6RpDc+4K
	 ef6n8aMEtKYvA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, 
 Fabien Parent <fabien.parent@linaro.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
References: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
Subject: Re: [PATCH] regulator: dt-bindings: mt6357: Drop fixed compatible
 requirement
Message-Id: <174729499095.280025.830867783307923858.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:43:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_004318_926131_49E3577A 
X-CRM114-Status: GOOD (  12.10  )
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

On Wed, 14 May 2025 08:36:06 -0400, Nícolas F. R. A. Prado wrote:
> Some of the regulators on the MT6357 PMIC currently reference the
> fixed-regulator dt-binding, which enforces the presence of a
> regulator-fixed compatible. However since all regulators on the MT6357
> PMIC are handled by a single mt6357-regulator driver, probed through
> MFD, the compatibles don't serve any purpose. In fact they cause
> failures in the DT kselftest since they aren't probed by the fixed
> regulator driver as would be expected. Furthermore this is the only
> dt-binding in this family like this: mt6359-regulator and
> mt6358-regulator don't require those compatibles.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: mt6357: Drop fixed compatible requirement
      commit: 9cfdd7752ba5f8cc9b8191e8c9aeeec246241fa4

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


