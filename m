Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E6CD3ABCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzTecnKDCeDvGkCgM7Zp8dDxr12OjavpH7tGEb4lQQA=; b=WcIC379+BnYLX6n6XWYbGJlpOh
	rJfJ+21Su+eb5fWoJCh+JhDilySJPD39Rh1mVBTuKs75HnD4dg9WgzlEAd5U9pO2QYAAYlHAdRLW2
	3SwuRMYGHkbJfXuOegID1n48VqQz25/qatV4yFo4T5CD32bCdSEKYmSOQrEU2xWuG4DinXqBWTtgi
	Myx4Zy+T6COz2lOqNb9WEmdfnukuIPxcT+dJEzIL64tnwb6Rvl+MgU/ocSL5tlzF9CtpfobHHzryx
	zblLw6hUKEvk0jJ8AU6yXUQQOcxte3ednf9RlzPIkXKqGU2g7cxOlj9qfq0aQyp4NxryfzEVoK8rU
	lb8vDMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXXu-00000000ckU-0Kop;
	Mon, 11 Nov 2024 16:45:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXW8-00000000cVa-0F32
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 16:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25EF15C5B64;
	Mon, 11 Nov 2024 16:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD48C4CED7;
	Mon, 11 Nov 2024 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731343435;
	bh=+THKv8bFBNp01IW6Q6So54Rj6RkeI0Ny3NWfKq5gGK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BLtK4rKL+gpP+pQFX/tBVJ+hUGq8ay9mokFf+ENetcB3Ytp3YNQJcFwiroTwhNW3l
	 wOOTS6vcYOW3P3ldDnuKW4W/yrkawF6FTVY80esbz23/p79sQxOl5S1JWvCL157Z2C
	 bE7Krbjjdh5Wqp2d0tFDRXOVlioooHJWWZGTmeodd+ZXSjIGJYdYqp/iEAvuZIwo9t
	 TFF1DyePzhqw/NgfPGnJUjvrrWOzCfjj3pYCg2kXUkJvjtc4KxtIKq2+3PGlcH356k
	 34+Bv3Q59sxsyWscJi2OpZ/okO3Z2LkkHrXU4+ReSF0iTpbVBmtopXuHAqueCypLRR
	 yKmLuiqlz2RxQ==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241105135942.526624-1-olivier.moysan@foss.st.com>
References: <20241105135942.526624-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: dt-bindings: stm32: add missing port property
Message-Id: <173134343208.341130.17895048996231459327.b4-ty@kernel.org>
Date: Mon, 11 Nov 2024 16:43:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_084356_181522_165F710B 
X-CRM114-Status: GOOD (  10.41  )
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

On Tue, 05 Nov 2024 14:59:41 +0100, Olivier Moysan wrote:
> Add missing port property in STM32 SPDIFRX binding.
> This will prevent potential warning:
> Unevaluated properties are not allowed ('port' was unexpected)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: stm32: add missing port property
      commit: 98d34ddd43de0b040bd3ff74b511be7074b0b310

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


