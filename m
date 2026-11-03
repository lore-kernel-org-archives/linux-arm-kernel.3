Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299AB606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1oWpsSAB;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Odf8DaH3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ztl+pbmgGYCgH6Cy8DY8nxr8DlBMb7+Zh30yCIxB2r0=; b=1oWpsSAB5hbVmy
	ECydwWfE+lllFHZ+OxXmqWCdpIhx5f6svTbgdtijokmfxQfaidEManERkQzgGLPzAW79N3JRj955Z
	kXuxVFcMKHoXQz4QHwCDhV+3+Xo2vHOZHgJVr3N51Ea+iRFrZerU4vBZSFKRUm6T/qb69UNEUT2yM
	PcSQ44NEpzE77uhoesyZygNltSJftw049DXRTd4UTw7nyi6AsRNPn6vdC8jS2oFALppGiA3cqpI+i
	zv4WW1urm1IK+XiWQDML4mQp4A53XYoJSlKBtUcTSq/u8eTmldOz1STCNFlUW/PoaG70Od2PCPYLQ
	EmDe8vyNjWMBKnltHo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ4j-000000058Yc-3QVt;
	Wed, 04 Nov 2026 11:22:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ4i-000000058YB-37Bp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:22:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F12CF60F2F;
	Wed,  4 Nov 2026 11:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EEC1F00919;
	Wed,  4 Nov 2026 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793791359;
	bh=ztl+pbmgGYCgH6Cy8DY8nxr8DlBMb7+Zh30yCIxB2r0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Odf8DaH3lB3Xb3zWUiGnVJI/XusuvTPu5NLbI6ktQ23kihoSEa3/48M3bfvfCqz4L
	 17Q0azT8KYpXJDPQjmwpVCMWjPrQr6hPa+zHsE4uYxdsP8vADV+IhY7e7fz7cyf1ts
	 ltacVOtyHxD2xFHWEHyJcbBcWJSPdtUpzEeQ5x2Q2LnYN99dW6a5jJE9EFfUwUHCfL
	 9syH2po3qxgQlPWT9RKl839WBlD/CNdBBN3MqJItdNffOB3ZN6jM1UVbO2dSnTeswC
	 YJpKc3wSZBhGLKSmB0FsDVba/K/OA7MeZyaVgfTCeptSHhQlb6Fl3Kv/qREjaGNIHQ
	 CkMulk2LrUCUQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 38CED25D9AA6;
	Wed, 04 Nov 2026 11:22:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, heiko@sntech.de, 
 Jude Gyimah <jude.gyimah87@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: rockchip: fix missing REGMAP_MMIO
 dependencies
Message-Id: <179374840410.2186205.8917422053194660674.b4-ty@b4>
Date: Tue, 03 Nov 2026 23:26:44 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026 14:25:32 +0100, Jude Gyimah wrote:
> ASoC: rockchip: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 5 drivers, so they are here as one series.
> 
> Affected: rockchip_i2s, rockchip_i2s_tdm, rockchip_pdm, rockchip_sai,
> rockchip_spdif.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/5] ASoC: rockchip_i2s: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/1c57404bf9ba
[2/5] ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/b8284f2b73f8
[3/5] ASoC: rockchip_pdm: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/420c7918a61b
[4/5] ASoC: rockchip_sai: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/829904994e7a
[5/5] ASoC: rockchip_spdif: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/67a7e2073909

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


