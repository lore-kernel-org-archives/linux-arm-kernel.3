Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F149CF45CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 20:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llcMc1rtxKzD7G/PevmqlNhSWSkkjMmDrdoUcInriR0=; b=u5jvLaCzzEv8LF3wmK1t4rZQPA
	rBK53d2f4oO4Q3puILIrLIm8u1SaFQSTFelfYUN6zaRwKICez1RWjh+CGj1Pc9qpmsEesjJF0p3Fx
	WKkEykDIEldg1oYQjzBoM0eiCdxSGA7SwVDCN/FFqRQy+MNW6OgCJL5HZA4Unjsp6Sfq4mNbhL+jj
	o6rceGNWNGqIa8vFYgcC/r7EhYoWs9A/8Dn7B7LH15OtS+FeuQOpFQdwGG0tTDQTu9eduhINhxGHH
	8x/+ZReeUZvSqu5tV3tVL2WlVGrtnbdkIyFdihffoOs2bYmuk4tLGz2UcDtiuUVN0ldfwASCI3oIr
	pTKCLqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfOZn-00000006Ami-0I7l;
	Mon, 12 Jan 2026 20:31:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfOZm-00000006AmX-0ZcL;
	Mon, 12 Jan 2026 20:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12ADD6001A;
	Mon, 12 Jan 2026 20:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCF0C19422;
	Mon, 12 Jan 2026 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768249904;
	bh=5t/PHkzuAtB5kyna98ozuNlQ3IUj+2w0FHLqCEXojQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EWSuwxEPI1SGu8lLAipl1qZ/PppmS2lxkqk5zx9Z7XyDrMxi5kBnA+KoGW3YFsrwY
	 n5w78DAQzKzodvxAj6lym6+N7Tc9usfIcSOgIPWdVs7JJCzK/z1neNO4ZKZ/psjpx6
	 3ihEz6Nam7SmaXbDgd9HHqQ9qt/3laar7dxQP2M2ANS4VYMxg/eHXtJL05A4qJbRT4
	 u2FHiGz3OFBOwhelgrRU/ylzb+L2jPI9mbe9uZILjdXiW0hbM2oG9HpMhs9fLStBaL
	 naPgBrkckrLzN59uDgKo+eVihc/zWKh6LYI95nne2gnBhThmQ3dUL1zMAz0vIk26n7
	 JoeEQ6ke1CcwA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260108224938.1320809-1-robh@kernel.org>
References: <20260108224938.1320809-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
Message-Id: <176824990272.213661.5100930797551016319.b4-ty@kernel.org>
Date: Mon, 12 Jan 2026 20:31:42 +0000
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

On Thu, 08 Jan 2026 16:49:36 -0600, Rob Herring (Arm) wrote:
> Add a "port" node entry for Rockchip S/PDIF binding. It's already in use
> and a common property for DAIs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
      commit: 70d95c5d2081faca7e849fa9c6665c9e0dae3923

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


