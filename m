Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A026C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7DAD2zZXWNg2HkwxBcjlBg+AYTe/jXHTqJJj5avZbQ=; b=YJI31SKB9R1kw8Guv3pJHrS7Nr
	fPRDsa9F7LtBFtXzEYkaz/kATlBEDP/nWazE7b+QVEfB0JHE/5JQ0/F83UoCbx8l8hl/2oaBR/K8M
	xrAdDMloHjvbdZ5CjXn7g8ZTLydZRinhJA+lQyLFWVHF7VC/WDLLNpwvvcNn8XMtYw69gVCK50lxf
	TBA/TbALl0ntrJ7hQCx3yae7GrYl913sQPsWrYAc9KhXgeOMTQ04Ta/2HfOd23FtPgbFzlNdnAcmF
	x68sTRUXhJ9yVi87ekq0PYVUY2uOpiL7Sls55ye97EI+zPoaJhTfT8TE8rnz/Ac9c4f9bOrPoNfPC
	ueJ5bL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYuk-00000001Fbg-0p62;
	Thu, 13 Aug 2026 17:08:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYui-00000001FbO-2IRp;
	Thu, 13 Aug 2026 17:08:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F43E40BB3;
	Thu, 13 Aug 2026 17:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F951F000E9;
	Thu, 13 Aug 2026 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640900;
	bh=f7DAD2zZXWNg2HkwxBcjlBg+AYTe/jXHTqJJj5avZbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lKO4mVWKyB8Ivz2mi24upBjMU0iMatY3dGdaAGvpsM+0faGiz7uJGh3a8UBatCynD
	 IraLXb3soVF0Dbcf14GcYiTPEaInqZB2dfT+H94Y2f6zZ88az6um2NCzv0fFVg1i78
	 RIqyFEDoeBuaYeOVpR8yUHM1aRa0K18Oefo5j3pbzWVqbkIKX4FMxU9wFuOyA29rdK
	 6RQAEfMKer/jQIJLjPMQ0N2Grta+uztfaCe5o/1+t9TeivYfYOYd1Btdk8yjFDXJYB
	 qmU+EVu27iZy5Vj+oPmHgsxGdxtzJOJFSH54cqzp70j854lX1HyiGmsbN8oylLnUOm
	 VQqJ21dYJBLTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
References: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
Message-Id: <178662342504.110398.3190102623647989462.b4-ty@b4>
Date: Thu, 13 Aug 2026 13:17:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
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

On Wed, 12 Aug 2026 22:50:34 +0200, Jerome Brunet wrote:
> ASoC: meson: aiu: make aiu_formatter_i2s_drv static

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
      https://git.kernel.org/broonie/sound/c/583e44f2828b

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


