Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CEFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl4D9hUZUtyBRnsjCdqkFO48i3UvAPyAgu61Fe1pMqA=; b=vHz+xfStBazam/QDdsZXqlD6My
	VIXgMIGxnjpfAci8jQZY6CtFCotIZCOykw2TfV3sFcUZKw61rPa3j1zqYqoI8bXXUIkiiSd4vVc2p
	CHpNW8QiLxihzyJryXLpELlXjBAT1Bm+K9oO+SEbWNZBT0FX2Vb7uwt87HPaJmFPeXZcKa1WpMqjF
	iZDr1FJiMoFPRufL27YmYrQFnYlno0hPnShTZfEm2ANlGsPLAXnzW5blTiz+rjPXPGR9ZVY9MmW2p
	8Etv5rf9XM+IlMM8QiWg7QsfucRnC6EdvAKMYizBOaXe2YLhoid0WAUbpMxkuYYDmTdwMka2l2gbl
	ngSFt6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QSB-000000088tP-0SVl;
	Sun, 21 Sep 2025 20:14:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QS9-000000088sr-2Haj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 20:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89DE1601E2;
	Sun, 21 Sep 2025 20:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22780C4CEE7;
	Sun, 21 Sep 2025 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758485672;
	bh=cl4D9hUZUtyBRnsjCdqkFO48i3UvAPyAgu61Fe1pMqA=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=ft7MDVZhvzwLKhSLnLGy4LeQsQqHDTT+WpQBwUZumZg35Q0aCxnefg3NgVlXMCdOz
	 aHocKJn8hvrxBJf7LdYUTlKCfjLsjYhrM8GowuDYuQtydIvjWRELRobP7nVHOIP9x8
	 rQCptIq89alfez9/H2/x1UypW/8/1yZFo7Cx3ZOltpvtgEzXvMHBfZERlM8Wmmnn8D
	 WW1uFGCTgUjNDP6gMe2L2HF6R2vPcg0QhGGM+oGevxWPs4tlTfK4kpG4fnsXeSNwMC
	 Kl8MlM7MM3VHbt7qmyXFHyGG2ncriGbvdU5iM4wnLS5nA6zdTgHPxbjDX16udYWBUP
	 huD0TIQDDNQbA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250917020539.3690324-3-ryan_chen@aspeedtech.com>
References: <20250917020539.3690324-1-ryan_chen@aspeedtech.com> <20250917020539.3690324-3-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v14 2/3] reset: aspeed: register AST2700 reset auxiliary bus device
From: Stephen Boyd <sboyd@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mo Elbadry <elbadrym@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Rom Lemarchand <romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, devicetree@vger.kernel.org, dkodihalli@nvidia.com, leohu@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_chen <ryan_chen@aspeedtech.com>, spuranik@nvidia.com, wthai@nvidia.com
Date: Sun, 21 Sep 2025 13:14:30 -0700
Message-ID: <175848567081.4354.110591763861485292@lazor>
User-Agent: alot/0.11
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

Quoting Ryan Chen (2025-09-16 19:05:38)
> The AST2700 reset driver is registered as an auxiliary device
> due to reset and clock controller share the same register region.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Applied to clk-next

