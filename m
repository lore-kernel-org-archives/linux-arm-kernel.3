Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5564CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+FzQmuFc982Fpyb5YqfutuQqzkwuNPpJt3TwtEdCzk=; b=32We5cIEaIJqlR5op5JB+0Qt4g
	F+lxUx/bjz8znONQ28rDsqgdrNz2X3siQbYyfSkn/JEHQZO4HfcB1myepsxHvpPoWFgqEbpkQsEe3
	RnbSGPmwFgpV9xmbPnsfogyjFZqk4usG+AHIgcYRAgWvhnT8sZmjKQpQaU1XqOVkRJTlyCJa6xINS
	wGybzaR7Kxy7DQF8FibHNeGQSKvzwGVpjm/iAUAlJcJkGjq8Wdrn7XOQgjGpXWjYDnOOw8RAyX7EQ
	2TVMji01W51Dl4Xig1eTkI5XyNfSAcHUyswhXTbLTrAR+SZFfv58ho8ewAxZSJOxkGXfqy2bHZHWD
	ZvG5u+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmDD-0000000GtQc-1puq;
	Mon, 05 Oct 2026 17:10:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmCh-0000000GtNw-2RKS;
	Mon, 05 Oct 2026 17:10:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F4D5407F4;
	Mon,  5 Oct 2026 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5531F000FF;
	Mon,  5 Oct 2026 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220218;
	bh=j+FzQmuFc982Fpyb5YqfutuQqzkwuNPpJt3TwtEdCzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MiYDJ3ljjFkgVwu4NDowIS0GwcjGcd2Z3idP3d7rEpbtUfSb82gRGKK4OmGNmopyq
	 8e6LMsNXkyiXnOskYtswS7cxFmGbF9RXeoYDwLDgEdN2n0N/pElXA9ZL6IBFjHLii9
	 jbudxFqGr6PfGbup+Z5L/O+gpaJlw0gTwMiWxcuMz66JKtrbajGhEJq94D8dqsgL5e
	 tLoH835XpKxbDhy6CX8EKudVx6CO8+ZTyzOFp0DYM3qsGuAT0ZHqUwvv7u7S6uupmJ
	 Vm0XTISFBx/6bt72pXIG3Ietg38jEVw82bUxL8eCOuR5n1J+sCH2icQMy8MY6QBY06
	 XWWq68egKuyDA==
Date: Mon, 5 Oct 2026 12:10:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, Chanwoo Choi <cw00.choi@samsung.com>,
	linux-pm@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/8] dt-bindings: devfreq: event: rockchip,dfi: add
 clocks to rk3588
Message-ID: <179122021710.1033485.12654188717454178869.robh@kernel.org>
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
 <20260921-rockchip-dfi-cleanup-v2-2-43ff34ac8599@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-2-43ff34ac8599@collabora.com>
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


On Mon, 21 Sep 2026 22:32:45 +0200, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> RK3588's DFI has pclks for each channel. They just weren't noticed as
> missing until now because nothing ever gates them, and they're ungated
> by default on power-on.
> 
> The RK3399 clock situation needs no changes, as there the hardware
> really just has one monitoring unit for both channels.
> 
> Add these clocks to the binding, so that drivers for this device can
> properly know about their existence.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml       | 70 ++++++++++++++++++----
>  1 file changed, 58 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


