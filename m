Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED36FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opy8dIdrddEsGkpfFN+/dihMU+8Q9LFflKlxfEQE2Vw=; b=ahVC+nz8X8W9A9VAh2ap8fpiFl
	YiIhBZ5Rp1RH/49N0DD7AvWI4VpFH8LmRkJwmcfNu5Wni0V1ovUpfqjywHw/GRMW4Nk2r9FUgYPxX
	y7gnaHetj8OKfwxgyYD9Vgj/wDbyFU4DSPYNif4EZusB5kmvPvT9H+TS27kH8V79CAT1HEq2S8CRY
	d57EyfMyoeNR2F6hyZ0KJnWjKZIRNqV/EvUeBWeK0lIWmOrW+I/uJb9axKmXzVIKShZlG/Cz67O+H
	v3KIf7Menp9rqoIbfQ29q6KstpHH/BP1YrPG4AmTvNIoV4WWuXguaX+mE8Pz8ur4dRtkliglNR5UQ
	mwwALbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL01B-0000000BXjf-09cJ;
	Tue, 10 Dec 2024 13:11:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzso-0000000BW9p-47Un
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3A995C4C86;
	Tue, 10 Dec 2024 13:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7782CC4CED6;
	Tue, 10 Dec 2024 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835754;
	bh=F2vH4626vYgw40Ceayp20jPvVMqJsIKsnESbzuZjRQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bG07bQA1J51c70OfLhPReyDwunegtHW/31Ge1MGXfkrhXFeiZouEHzoajnjpA45op
	 L0pvcFrMEFbTfUVvIRRu4pKJMDrWyiX8cixq9P0G2OdjqnYRSiOn+hEbLR7t5NA9zn
	 ZAjalYrSV1voRnFKk8RGun1IBGcbm87Pmbvwljs2UVnLAsadTkmS1MVFT37C28czh9
	 0rrijlF/dBc9Txj/kfqyRv1DOhB60HnkLn+jrtJC3z/VG8MzheVG7qgfu5ll4iR3No
	 mOWxDcEgim0nimzOnM6dPHVeocIY1dzXDPCLzBMBXqiGZbWru6Xq3CSGDeERdonP3w
	 D7qgzYDzMvxsg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, joy.zou@nxp.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241205-pca9450-v1-0-aab448b74e78@nxp.com>
References: <20241205-pca9450-v1-0-aab448b74e78@nxp.com>
Subject: Re: (subset) [PATCH 0/5] regulator: pca9450: collect some
 improvement patches
Message-Id: <173383575122.36957.4079934608520923537.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:02:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050235_064142_279AA77F 
X-CRM114-Status: GOOD (  11.33  )
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

On Thu, 05 Dec 2024 11:51:08 -0500, Frank Li wrote:
> Add pca9452 support
> Use dev_err_probe() to simple code
> add pca9452 support in imx93-14x14 dts
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/5] regulator: pca9450: add enable_value for all bucks
      commit: 229773f90b1f886e8fd542f98b495c66e43be5ba
[2/5] regulator: pca9450: Use dev_err_probe() to simplify code
      commit: 0f5c601098bd3c9cdfea3e01aacdd9d0c4010ea7
[3/5] regulator: dt-bindings: pca9450: Add pca9452 support
      commit: 17b531c162e5dbdce9a184ccd1c730ae3f31576b
[4/5] regulator: pca9450: Add PMIC pca9452 support
      commit: 017b76fb8e5b6066f6791e7ad2387deb2c9c9a14

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


