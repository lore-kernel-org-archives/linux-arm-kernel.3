Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB649D2D10A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5UXqvxa5CvlNexvTGyhh6uqwxnMOSKP7nQYANGSn30=; b=gX9Wid4u/LXNrZqF1l/Qcwdc11
	xTNtm7PSLmQTAsc87hV9wpb6uamkxMaWxIotR9EiNbmC0t3d9m5tl5NcFaTxIqYyRrPf0R3haQi5k
	Ttwb11uwzjkLhjrQyAIxHFB6I4Ngy06Zi4EL0zErtKfFiTI9doQABpKVgnfcbKFvIGYcOiniLNSZ1
	Z6i/JwV4Y1rulOFACLjbKdg2zQxM655N42SJDpZoyHlLqFuAczXw6tOyPqOz8P42SG/SNty8tb5vB
	ZWCtiWTZhuIw+QQDIFkQy0KA1iWzik1TidzclAoAG1l9pOGcg0H4OLmtrPMwdc7Q5vLFMmU+eSHIn
	LfO9AV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffV8-00000007GgW-2rG5;
	Tue, 13 Jan 2026 14:36:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffV7-00000007Gfk-118o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A66E16001D;
	Tue, 13 Jan 2026 14:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D5EC116C6;
	Tue, 13 Jan 2026 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768314964;
	bh=agm6ua/gEqt7B8Ovt/5L8e6HuY/saZKOjqNBQaE4u04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sVXSQufBTaekvIUFIkwqleReDAYz0f8vLeAtrNqUYZ2IN2wK0aOOSoLW4+vfYCLG8
	 K1rVZ7TO7hUOBCGb7QhLqJEy/Zx+CAciwQuGfHObVA4kZ5hrw3JEz4dVmv7kqQ2Klk
	 U9YKNllSIxuwAhrRjtns8yAi5ziJBdaJrFluLcQE11smT2re9WeVeSZf3zgD4NuMFP
	 vtK0y4Z1HY2Mh6n4aOId9VJkAwjqLLWq9AxAEIIB9RbKzCUvdBjLNEbNW7/sUCyUmz
	 DzWUoYULTqaAD3k4LMGGEHs7B3oY2Ij4OkamC20NL0kqq863GkD85DDcDDnXQFmWz8
	 Tbrcd0KTntaag==
From: Mark Brown <broonie@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-0-726e70cf19ad@axiado.com>
References: <20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-0-726e70cf19ad@axiado.com>
Subject: Re: [PATCH v3 0/3] Axiado AX3000 SoC SPI DB controller driver
Message-Id: <176831496192.83859.8720209174414217917.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 14:36:01 +0000
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

On Wed, 07 Jan 2026 23:44:36 -0800, Vladimir Moravcevic wrote:
> This updated patch series address the review comments from the v2 submission.
> It introduces new SPI controller driver for Axiado AX3000 SoC and its evaluation board.
> 
> The SPI controller provides:
> - Full-duplex and half-duplex transfer support
> - Configurable clock polarity and phase
> - Interrupt-driven
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: axiado,ax3000-spi: Add binding for Axiado SPI DB controller
      commit: 7b122b1eb627059bd331d5119124a2da5e142c01
[2/3] spi: axiado: Add driver for Axiado SPI DB controller
      commit: e75a6b00ad7962a7ed1c9c777e9ab1eb29043ec8
[3/3] MAINTAINERS: Add entries for the Axiado SPI DB controller
      commit: db4371d13f82fb12463fe053f4864980a2af2106

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


