Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907C9C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN0aaT6+bUw/Kg1Ouvk9kDnxJXHWJDCZ1stvd2Xc8u4=; b=tBB+XJTziJuNO7vud1MijJR5PP
	A7nYthvKSdyrPbNReJz+wbpACCARqp9tTLIl+nyASUOos8+xdDmgD1TZ3nNfTyH5AUPDSkf4AcEan
	pMqZS62nzf2IaueqKcFOTlBluSRfArXRa1dWFTOmVjD/gvoYBVrju1y0cAHPeptxu/tQAGUpuDcQF
	4jLJSrQDVCQ7m1iynseKw84r1DyXfqHiz8agI8VChbiy65vYlvGpyIFu8F9ztVhZDJwhCUBzHh3Rv
	bhhIwSHOZGc7z0CpOifPYQLwNurhzUVQhOMml7lchUSg0Bp6bwEE8V0O2TwYSTppXJWi1C6hDlaJ0
	jUjcBVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpRS-000000045eW-1WDN;
	Mon, 23 Jun 2025 22:15:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlB0-00000003aOs-2Wyp;
	Mon, 23 Jun 2025 17:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6907AA50B29;
	Mon, 23 Jun 2025 17:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03739C4CEEA;
	Mon, 23 Jun 2025 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750700509;
	bh=xN/A8HvexlN7YR43s6eAIX13svQo3ngl0HP/TpVfgL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JkLc4AK5rsNIaammDjeW4cmKVnVKAoa2c54D5jWoFfJvWgMWEZBsO6E746V/w2EHR
	 uW8gGVkIe10A50Dadg5750SaRxEOw6bc7ZZSalsTsbSvAJr3DKikCBQlyVpLrR3rnB
	 WggFC+r7Tq3wCbGXgAwZ/rLPWsF/J6LW883h+BwV0CfmzrRKjaelkXb/bQW/thljcE
	 Dwgpd1XRh/1ZbR9NCzkB/5SsCPh7yumJTLdtgGVbONVFll5ikzQ7AqmZSv3dEgX+fV
	 sNlURWvQXOQF3iXJ7bvYJCAOzae9+86xObv2DzJH8R1nTj0Uv21APn03y1wf9XHz7D
	 cQfJnitoVHhmg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/4] regulator: dvfsrc: Add support for MT8196 and
 MT6893
Message-Id: <175070050673.180798.18078248798013183788.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 18:41:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_104150_721371_3B8F5270 
X-CRM114-Status: GOOD (  11.65  )
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

On Mon, 23 Jun 2025 14:01:40 +0200, AngeloGioacchino Del Regno wrote:
> This series adds support for the DVFSRC regulators found on the MediaTek
> MT8196 Chromebook SoC and the (unrelated) MT6893 Dimensity 1200.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
>   regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
>   dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
>   regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
      commit: a6c05c2e6871c94b349703c1ec8584763797fd8e
[2/4] regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
      commit: 7aafbb463be85472dc6db194ab9df45fd497c998
[3/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
      commit: ae77b8e8b0326818bd170818b37d055aa57a1569
[4/4] regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC
      commit: 024f39fff6d222cedde361f7fe34d9ba4e6afb92

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


