Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B54CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 20:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLLpEUL7lzg5XioJECbzA7FMtui9Ch446kVmlYlsSs0=; b=lft3CLsT6kooPpJ0vCXhunLZgc
	xRueeWkWXBm+LKy4xNw3vqSNmxa7dwmfwD9ySUwyM3wdp7DdMPQGIRB7u4fatz6LxKo9BWS+g5qlg
	dLamzRvrpVrRx1QEKMjqVgA6lHdIuPMv3XQUDPykoKZYAPafWoRMMH/zZWrmsWv6adk/yECZbpHZa
	lH32+tAsSJzW/s+z0mV6GIz6IUdZlKmZid3FlDjU55hp9PNeqEFcxkKtex6i6JucvbIlL34SsNR9m
	0/LJcyDa6ZkfA5ZgEykdjnn+JzMs3a/N5MMR1OCAim/oBsH1hmqWntJ4E9JR6ZPUhV0N92H5ConTG
	6qVd4K5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEurO-000000051md-0em7;
	Thu, 08 Oct 2026 20:37:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEurN-000000051mN-3JJj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 20:37:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DB78600CB;
	Thu,  8 Oct 2026 20:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB8D1F000FF;
	Thu,  8 Oct 2026 20:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791491819;
	bh=zLLpEUL7lzg5XioJECbzA7FMtui9Ch446kVmlYlsSs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i7+ThHKEw0iaMpwi7o+DGnu1BvfsKYLCKvE008JQi+uxi8VcOvhnu8lKVys8xwiyk
	 95+AQrFzjC7cVLCUIl5y+xrYvTJJK718Ed62Jgw8dszBDNfTybXmObzGXSWp7YV9cL
	 h/RYua5BJlYvmKDOE5OPMajmnElhaBEwgZiaPsP0Wy+FKIO/SvzUK48h3EBk+VJk1U
	 qRasNU+gJtmh4T6kEnfZq43wc1V3/ohIIMJNTJ+b1klmwOsdg+ZtX7g4jX0ZESUvJm
	 PlAFP4+1d8mv2rQnr79DP6DZhew4Vr3TIDCzZ8SGg4NEFRHMpr6jrtWOiLVRge3Kn+
	 pEnapfejy+vcQ==
Date: Thu, 8 Oct 2026 15:36:58 -0500
From: Rob Herring <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 0/3] arm64: dts: imx8mp-skov: add new 7" variant
Message-ID: <20261008203658.GA1198136-robh@kernel.org>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
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

On Thu, Oct 08, 2026 at 11:15:58AM +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 7" panel than the existing ones.
> As the already upstream boards and this new one are almost identical,
> convert the other device trees to a base devicetree and apply the touch
> controllers and panels via overlays.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Changes in v9:
> - fix dtbscheck error
> - squash new compatible into 7" devicetree patch

That is not what krzk meant. Squash patches 2 and 4. Binding and .dts 
patches are always separate.

Rob

