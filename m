Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B66FC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1T9J7a4wvw+eQlYg0BzdhhYoh6hx3LuKNuaBwNMHByw=; b=gh8HuKSCiAP2x6ShjFg1QJSSIE
	Rz5+e9aXjX2KQcvK7+zyaFw///wOPJRv/Ir47Oa4SvsP+za9FXCj3g+cgxuyKo58fd1Z/v836jwk2
	Nj6qkkAkBWaMyz3GFsWDwTXKcNP9hTZcA4jc5X78TP84gKmGoOunLr9NeLOlJtzGCKOoFHYd0mwiJ
	Cz8DpFL4/Z8ChXZAHazgXdgMSvWAbEs/xK39n76Sy1eeLcBhG9+wd0cFZNH2Js7cF08e3JfhTBZY3
	lurPqkbqWLBF4/JiMmBVG+IsXb9z3NTq6+ILQFMDqTbOmZ8pB5hxNnnUDGMq+uMX+81oGB6IMhX99
	PWQWfJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2C4Q-00000004qri-2Otr;
	Tue, 08 Apr 2025 16:45:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2C2d-00000004qZq-1tZD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 16:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7BA65C0599;
	Tue,  8 Apr 2025 16:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62F3C4CEE9;
	Tue,  8 Apr 2025 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744130594;
	bh=6euOao2eAtJ0Z0zrGfX9QrQRF5t21fg8cXwT3RaDtnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ca7Fs8XkQuFb/FKXa9ESOVTGRnOxXszAt9veA7MdGHW4kgZxhe59XHkEaq+8kw3ll
	 pXNR/byP/mEmOPyTEl6SBuQ3om/gkmXVFEKFQ/ns+SpNY29osxxcVDwCRiGIb/EDq3
	 6XDeNSatxaE2mCbe97AoV6TY4rs61CeUAXcvm0iCC8+THYKhaRaYBBMwCeGfhXJimI
	 MKjBli7k+OIDjYp3JoM5EYEoUKPYHP5Q44O9BrqvUqmxKT2TZ6essWe7I8dRlivnWP
	 8MNdh2lrZeMQ3V5zaOBBZHNcIswbyWAPWElPGzwEhT77spADk8JLKvGeLAYXulGEza
	 MR7kTABOGDVJA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 christophe.kerello@foss.st.com, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
References: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
Subject: Re: [PATCH v2 0/2] spi: spi-stm32-ospi: dt-bindings fixes
Message-Id: <174413059164.2217856.1996505992127496471.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 17:43:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_094315_536863_24281B3E 
X-CRM114-Status: GOOD (  10.90  )
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

On Mon, 24 Mar 2025 10:40:12 +0100, Patrice Chotard wrote:
> Make "resets" property mandatory.
> Update spi-stm32-ospi driver and dt-bindings accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: st,stm32mp25-ospi: Make "resets" a required property
      commit: d58b4eb7c03cabb10d4eebc89d7596e06376e54d
[2/2] spi: spi-stm32-ospi: Make "resets" a required property
      commit: 69e3433fa5e24edc94e94b4f34e3dbb754bdedbf

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


