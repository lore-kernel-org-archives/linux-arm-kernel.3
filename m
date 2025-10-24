Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33ACCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlMf4+mpawnuMtbDhQjVx7fs2kIdk89H4dSjhUqA4DM=; b=MNLw/Iy7sjzMwYPe/rqp9Z2ssV
	UdxG1jQtKxaAZBqNDg36uhAu4darnBKv5L2eYELmC5g1mFX1tEuv8ALpIHgnc3TKbF0wuAPCFArdC
	g21QKERtDC5GtKwDtFTEoYq6jWRGVSz8B/jFAhAFSybe76y+f3ep1r+BsOLOk9YrEUgG1/ciPTmQK
	fpwtr03iNYUhxe+CrKNTX/Fon4apdbmceMEzNfGPq7iVsDwpolHAbZQY82p9IpTfKn7FFNeDsDgKH
	OYc04uq8XrBVJdqIVJW8gRxWnxhJR3ihWAnGQLult7/4X5leY1rLw/M0cfHYTBmFjixFKelFWxdqQ
	ZKSAJnvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCExz-000000091Ap-3UK1;
	Fri, 24 Oct 2025 10:24:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCExy-000000091AC-0nGe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ABBF60576;
	Fri, 24 Oct 2025 10:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE23C4CEF1;
	Fri, 24 Oct 2025 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761301453;
	bh=mP6SmCP7woCF8wcDSk+2F5q73XTTlR0r8Zgwb35TMho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MRDUWkaZavqJ8zqtZrN8TV+fbecejBQ6lfljI8HBEI5ozMc9cDeHm+Imy9BNGtmbi
	 QvJmOk1jPfARrhjR8RcuhKHZxCcArwZDFjKtKBaYI278DpExcwQ8RGurp0lq7oN9TE
	 alfagv9VzcQSzlK/WJr3FjD30zNCda9PiX1xPHIfwZTspN0mgnUdZmvEQC5njCWZYQ
	 5gLINhyXbo8FRwx+doWTZz4Kem6Gca+vhAGY0cZxFyDGwAkBmObRim4YtjI1hRTD3f
	 LxTbFtFnHYLDx7Fpz1kSeVyb54KMoqacr8w35rBTpSIzvicn9kZO1zPmpZk4xJctu7
	 G61H8R3sQwZsw==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, imx@lists.linux.dev, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 0/4] dt-bindings: treewide: don't check node
 names
Message-Id: <176130144489.10577.5538260652511597774.b4-ty@kernel.org>
Date: Fri, 24 Oct 2025 11:24:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Mon, 20 Oct 2025 08:09:49 +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
> 
> These are all occurrences I found in linux-next as of 20251015. I did
> run dt_bindings_check successfully. I haven't done a way to run
> dtbs_check yet because I would need to identify the proper architecture
> first, right? Is there some tool which tests all DTs of a certain
> binding? At least build bot is happy, I don't know if it checks DTs as
> well, though.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[4/4] dt-bindings: spi: don't check node names
      commit: 7c69694cec869e3bf7c810fd94f860253aeb8053

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


