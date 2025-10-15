Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3584ECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PafDPn4o1zum9X21V8ZWHzCrHWuFczyWlljbGruwf5E=; b=RpOn9dGeg8a+/9QjEfm8aBeGdm
	wb+H3h3qdr2Eyk4pubg6T7OhA4opH/gFY0sdV5+bmOSRqda0dpSYKrWvA8OzbjSQLtNpYZjGLKQYq
	aomMaqe6P3Dt+Xjmeq5Lnk5YzvQabCWLpYS2RCAuZE/XC8IQNfMXCTnIIfjMjqwWVehjwvOV/C0fW
	66PYDBuRb2sNtYBqjLGGF9fLmeG1GystrNOp5K+31KH5umIcK4O28oeawBRvfZSbLEtxZB27RqLeZ
	eWT0jBGwSaEuW3oejw/1To/HyOApxaA7TKyEeAi8WfbTtHx0khI7dYxdSv65TLTOlln5jwo25gyXL
	DALsafnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94GS-00000002HCn-1CNX;
	Wed, 15 Oct 2025 16:22:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v94GR-00000002HCb-2NkY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC40C626C1;
	Wed, 15 Oct 2025 16:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9C1C4CEF9;
	Wed, 15 Oct 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760545330;
	bh=m5yz6FAGECP9+hJqdl/rehdUmr+YvIiUg5swfLlBFGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JuqpDqa1YOpi244K0gRdbMaFRQVKXJFoxEajxUXv4EOncI+NW2gCfk6C6742EorfY
	 cHWVCgqZ+VehNMHDpgqcrg+YsZ8wvPLEtd8kpVQqJXwNN5RlTzeS1g1PCFgEcH+icC
	 PWH6v4b1CHP21kyfdHL6+Zeyiq0ElrjtEnBCxhZgzeDKYd4jKKuEa87Nrot6kchddH
	 gIBee+jSI6kiDRyJVhnZmU8NrwPlqXtUezcSyTgTXy+0cOmIc1pFj6SxDSq2pdG3bw
	 44Q8/16bVwfAyd4Zy+R27pZ6rdx/fZg3KfvPOeDY4NbvAO1GGUS4kb0CpnyJbzSJSC
	 oAS6zTG7kSgJQ==
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 "Sheetal ." <sheetal@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
 Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250929105930.1767294-1-sheetal@nvidia.com>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
Subject: Re: (subset) [PATCH V2 0/4] Add tegra264 audio device tree support
Message-Id: <176054532703.196625.10143802503112850077.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 17:22:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
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

On Mon, 29 Sep 2025 16:29:26 +0530, Sheetal . wrote:
> Add device tree support for tegra264 audio subsystem including:
> - Binding update for
>   - 64-channel ADMA controller
>   - 32 RX/TX ADMAIF channels
>   - tegra264-agic binding for arm,gic
> - Add device tree nodes for
>   - APE subsystem (ACONNECT, AGIC, ADMA, AHUB and children (ADMAIF, I2S,
>     DMIC, DSPK, MVC, SFC, ASRC, AMX, ADX, OPE and Mixer) nodes
>   - HDA controller
>   - sound
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] dt-bindings: sound: Update ADMAIF bindings for tegra264
      commit: 4d410ba9aa275e7990a270f63ce436990ace1bea

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


