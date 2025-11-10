Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9ACCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XGwFLcaddUPe9z+rlLHiz/mxVsAzIo/OmwVfsvCaD0=; b=Ot2ymBkdEsx0o3qBQLaTsKhtjT
	5jJmmARs5MfNDQWnWUlTBNiR8YgdUWn9VAAO5VMksuXmcpgMzamBG8BdNprVw+IG7Tf/H6zG4sB20
	aPxQ3KRgkuAEBPqJlkAJjCgibGAuwhB5EVIJ8QcH9YPzvyt5Q/ikzYra6wgmV3wifeWMLKI9RHV/m
	4Fp5rkQlXCX1b1AAEczbXFFn9tCgOd1tu6PAAKUhRuRaCBVQDygmjh3YtjnQGfUGsK3tu52k4MfZN
	72FL4MzNmfEYqqalfF/TV9CgsnBIW/c+Cp8gyYlRSdY8MpysXtgeyfAqVsWKWcvz3nqeiYauPyHaM
	FlMjFqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMXQ-00000004uR1-3Zpj;
	Mon, 10 Nov 2025 07:42:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMXO-00000004uQl-3mCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 07:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E03C60142;
	Mon, 10 Nov 2025 07:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20230C116B1;
	Mon, 10 Nov 2025 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762760525;
	bh=eoQpss3r6FYo/VoSTS5AtWz2fEfHuakzCuCNoTPYihE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SkY1ybXw4AE6CFT9Tnb2fjXUIAbi+gLXED5B4FtiMQLdokuofcghcxD+xY8/DB3dJ
	 RsFOoMuXNQq3d5SOBbdv5jiaHYA5OLCtdNUvt1z1m1Cfg0fR6V8suAOhTd7pG+PJlt
	 mgyglzWBw2jENzcWsjico9PyLr+Y+XkjC7+xTM9+tplbMS+EV9IAIe56PThbWWCukY
	 2dSGCF9Ip5CDKH+ldtwdtxsvV8pavZqjVHWAST1KoYe7bzXRRpYAvYCUY/8Y7iMYpx
	 z/6yPHa9cE79YCuAb2g/xvHnjCKsj4bj9ba/mmWaFKT0WkrJS/k1D54JNUOK67LcBG
	 HHreGSjFECDgA==
From: Srinivas Kandagatla <srini@kernel.org>
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
 Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 0/4] dt-bindings: treewide: don't check node
 names
Message-Id: <176276050899.18134.7729831344719556570.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 07:41:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Applied, thanks!

[2/4] dt-bindings: nvmem: don't check node names
      commit: 65c1bc002b27d1ac398e37ce031a45d59999cb13

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


