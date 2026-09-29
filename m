Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2859CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 01:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCOyJgXNLn4t6nhstSaqAU+H6h/KyoanWz7Z/fkjkeg=; b=UmgBuacQCxWwUCnYssDZrvqy0F
	mNh6XxivHeXcLwFMDREZUVSmKXkjWmPfaVeK3HkSkW74VZ4+TON32uJJtTEKElFI3457X54Ld2JRj
	hzlt9uLmkf9EF7ap6+3m8LpbEZF1RkifzPYM21w1m2Bi8q/B9KsiKPsYU9SWCAmAIaOym/TMisYyG
	/vJJXFiATv6+4BR/EpEkeD+DToivd83AiBgbahZhJ7w66Oy+mjCVwyxbmxM1dy59GfujQZHm8erWw
	oinKkw/USULdJH8LN10ogrQPbXhuvrIrxwL0WinMizBwOW96Kz0cbliBCgPdPhD9+q86WHPjcfOBU
	MrnPF0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMsi-000000024WN-0UlU;
	Tue, 29 Sep 2026 01:43:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMsg-000000024WG-2xWH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 01:43:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 281D5601DB;
	Tue, 29 Sep 2026 01:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A971F000FF;
	Tue, 29 Sep 2026 01:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790646221;
	bh=qCOyJgXNLn4t6nhstSaqAU+H6h/KyoanWz7Z/fkjkeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GtwKUCxjF2f/7J+ewptb3vuiKbKxstD5UOcWeWZ7msCi3LRBagExeaRtSjqLfZ3UU
	 nejRYh9257MRajfAaatS73+nHM/8GUULvg9ca8uPYi/PD1jZrQzXuwlV9kmoXCZJ4x
	 WYbM9kgCxQJeQvuzNGNKZ9zSy5jwhCVp0DwR/f6sKvnj1Sz0sPJDIkic/eyO2wU4pY
	 ZPlfOpEClKQZFQDndrFWstVNfA+GxQwz+X7kTvLcN/U3Plg/qBqy4W2AxwhMXyviM+
	 iDWNWJgjeZgfk0ulgpRlPKmUot4OCURk5Uj4ez7g2Ck1a8MiCQL6bDBbvBl5Pa/c8P
	 Gt2c0fu+Dhrwg==
Date: Mon, 28 Sep 2026 18:43:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com, netdev@vger.kernel.org,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Add support
 for Agilex5 TSN GMAC with FPGA converter
Message-ID: <20260928184340.51da489c@kernel.org>
In-Reply-To: <179047973223.2160803.17475492528833274893@kernel.org>
References: <20260923021823.46649-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
	<179047973223.2160803.17475492528833274893@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 27 Sep 2026 03:28:52 +0000 netdev-bot+sashiko@kernel.org wrote:
> - [Medium] socfpga_agilex5_tsn_gmac_setup_plat_dat() rewrites every RGMII
>   variant (rgmii, rgmii-id, rgmii-rxid, rgmii-txid) to=E2=80=A6

Since Andrew acked I'm assuming this is false positive..

> - [Medium] The DT binding's allOf conditional was not updated for the new
>   compatible.

but from the info in the commit msg this looks legit.
--=20
pw-bot: cr


