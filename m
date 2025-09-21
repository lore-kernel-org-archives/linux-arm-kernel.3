Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB470CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxNUxatlX2j8pSiDe8L67uJzf4cC07GJgtefdwBeAOc=; b=iFWdwRvnchBcqKQ5Vku7ga4ws6
	z6tRSZLEQPZOs3dw6IsxOWWKSljw7TofKBQkFvhwVRrLnIoK0y2hv6oPZbqE758NRx2viro/WwgAE
	nPOqncbuAoIuskKjN4Kq4l4oHCvzILmj/SGgUhZ7UG242hmANLJfKWbI2g3y8hfE1bz9nTw5qNEV9
	y4BqQo1bI36RDQOcM7Tv4ISWqiskK7kBSbPnYae6n9fkv9jUR7YmtOn9+4O2/42eZXKmVrhxzzJsQ
	iJuEb/tOXwk7BYr4XRosJjAIH6UDrA551KCSgmcwnwUXAyAUtarqqnhnB3hzZaZAT7cqDwEBTUnHK
	UIrDDE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QSI-000000088x8-1jVN;
	Sun, 21 Sep 2025 20:14:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QSF-000000088vl-1TDv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 20:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4712601E3;
	Sun, 21 Sep 2025 20:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E845C4CEE7;
	Sun, 21 Sep 2025 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758485678;
	bh=sxNUxatlX2j8pSiDe8L67uJzf4cC07GJgtefdwBeAOc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l+FCO1T8tvENOND7RAa71AtzmmxkWP0XSoMcte7v/zC16QH0QouPQbhef+DT+YfSa
	 K25SW5z7RnbyTDpqldoshrGCtlTmD0w2nl5PsoheUsr40aPn0Qy5seXFb34w7FdsPJ
	 Hvq0HbGQzLh8kY//BA/+P/Q75Qh3/utaO+HhgSnjhlqJsbPNLxhemWqdSK8mr7ENz0
	 DD02q+ocPjpivFx1nI4PfFCmf6Q7nbRuKLa2rgk8AttUQCs0mooX0eQrNMmxzehQt/
	 vihxFlBUWkMxzWtaea8Nca3O9vX/GXg+RpDQ8fB3+BasCLoYwQyohIO3QT1bxaiHuv
	 mABM/E7M+CwLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250917020539.3690324-4-ryan_chen@aspeedtech.com>
References: <20250917020539.3690324-1-ryan_chen@aspeedtech.com> <20250917020539.3690324-4-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v14 3/3] clk: aspeed: add AST2700 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mo Elbadry <elbadrym@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Rom Lemarchand <romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, devicetree@vger.kernel.org, dkodihalli@nvidia.com, leohu@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_chen <ryan_chen@aspeedtech.com>, spuranik@nvidia.com, wthai@nvidia.com
Date: Sun, 21 Sep 2025 13:14:37 -0700
Message-ID: <175848567705.4354.18321442549280624891@lazor>
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

Quoting Ryan Chen (2025-09-16 19:05:39)
> Add AST2700 clock controller driver and also use axiliary
> device framework register the reset controller driver.
> Due to clock and reset using the same register region.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

