Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9D1C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj4vTcYCniQX5Gp3+DCpz2aKfs6tGH9A2hzHV0N2wq8=; b=Rme7KH6yQo3SUiwKodNliu76tf
	TvTxAuTlNsCSSUdItotOml4qTKiwImRTOmme8czAchMSiF0uelmgJhD+XCokYXcQCIifrZmO80cn1
	z4F8FTwtf6VFkyhMdjuyJUHjK3Z81o6SPtdCtMFxDzs9a/qNOjc6NqpW+2X2CNXduxJb1eej7+cAX
	f6JDWJ/5zU9eLEPqTFJ4Iod3HBdyCU4XgdZ96iFWVykJEwwne+/uLU3sCiv/kU5Uht7F+rLGua1mM
	bWqi0ANdGqJ2mregnPUmauxh2U27yz6sKujVXp4tFLaK8nycTcslQ85vpEnTlny5IxDM1exPR3k5P
	fYTL/SoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIb3-0000000EyXD-2hJt;
	Wed, 13 Aug 2025 21:01:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umH3W-0000000EmrL-3PmN;
	Wed, 13 Aug 2025 19:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F03BCA575F3;
	Wed, 13 Aug 2025 19:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577B0C4CEEB;
	Wed, 13 Aug 2025 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755112957;
	bh=N477yPAUgF8MFDSi5oZ2xy5+NriyaZW/5Ft0lXfFS6Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IheAlBBIQ2Bt+CcdnxUFDJSj2gXEDefMs+XsgEE9N6Y7yBu0Nv5mj9qbxNsshF6QQ
	 Y1vQB3DWs+KMaZnajrrrq2CzT6s40dejdd7D9ok5zgISoO7dOBqAlKHY5WArlFW8Mn
	 Rb4xQESpYfHP+rUhzQjpScWPSkgmoaC571N4HTfNCBYaaXn3EqCrRwCEiGcSdpu1Tf
	 akFZy6tccfWufnGlQvXMmfWkIsatrUjjjh/JlFUTUThMpEXzfyOoQUPq1bqI6/p4YI
	 wJVkE8y/Oke8jyVdAfTBBYslChMgHuPBRgCpWNStuJuFgzKykTqzT3q56hRM3fp6DZ
	 mmOdd0TYoKq4Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250812203356.735234-1-robh@kernel.org>
References: <20250812203356.735234-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Convert brcm,bcm2835-i2s to DT
 schema
Message-Id: <175511295510.250237.5224980225208974771.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 20:22:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_122238_922603_0D24598B 
X-CRM114-Status: GOOD (  10.36  )
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

On Tue, 12 Aug 2025 15:33:55 -0500, Rob Herring (Arm) wrote:
> Convert the Broadcom BCM2835 I2S/PCM binding to DT schema format. It's a
> straightforward conversion.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Convert brcm,bcm2835-i2s to DT schema
      commit: bab4ab484a6ca170847da9bffe86f1fa90df4bbe

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


