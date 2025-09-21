Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E85CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6yIaPi7mcGJcAYGgK8aQktSJhsIi/eYMgFAw+22rRU=; b=sRKe4L3pio0PJQ60LMjJlCM+lb
	kJFxnNsB+cnr8GbNHejMWPrfqhgj6/mVdGP7m6N/jBaBm3DoZAyEjNe80ipnziInrLGs4TSYTmlqq
	nNlOA0ZIG5eL4YRSjygUHEr+Pm+mtSMOEtFpAqzD1NHOioi0zS1zkY0YW76jyu29CrRoOXVDYXEBx
	0yi4BtlzdhROia8xCA/MY6OAQre314AxIkV61iJhVpRlc34qorKFd7n/4ChpubJvCk5xBCbIGWSUi
	Go0Gh5rokhxGWGQzZrfm0yvadL70E8MyY9HF+lTUhXwuOZgFAKQPq36UxlIk92K10GmutdAKM1HD2
	Vj87tvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QbZ-000000089mw-3uLa;
	Sun, 21 Sep 2025 20:24:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QbX-000000089me-3v3L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 20:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A03041A32;
	Sun, 21 Sep 2025 20:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C15AC4CEE7;
	Sun, 21 Sep 2025 20:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758486255;
	bh=n42wuk3fRc2TVRisCoqEGhMVO97pJsliEokdZLTtgUI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SB96mFzFx1fA+tB5zsjOGmulcvPZ3f7kLIWRwJnPolR+dmBSkVTB37P4bwjml4/nd
	 GpGxSGxIrQoc0zJspuRDGi1+nOkBCXBJ9OG2Wj5SEEH96IrVwfBLeK0s1JDsFStHZr
	 t29ixiUlz/bp0kXVHRFalJVH1bVUSadLBjGCZ2BiWgz/PKsO4MWzevGATRrkUTyWip
	 UFMtEDdNvF8H1BbBNuJfBQPV4AH+eO1JvSWsZRxkpqK6ePAp+H+L9fNCp/mVsQAMYO
	 vmR008DqDTaAZ9wEqa2dOCESo8minO4EvGE7wMKHbjdROq/7AcSXCCWOr6t8mC6m3K
	 Gcp+MH9nKtdpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250917020539.3690324-2-ryan_chen@aspeedtech.com>
References: <20250917020539.3690324-1-ryan_chen@aspeedtech.com> <20250917020539.3690324-2-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v14 1/3] dt-bindings: clock: ast2700: modify soc0/1 clock define
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mo Elbadry <elbadrym@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Rom Lemarchand <romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, devicetree@vger.kernel.org, dkodihalli@nvidia.com, leohu@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_chen <ryan_chen@aspeedtech.com>, spuranik@nvidia.com, wthai@nvidia.com
Date: Sun, 21 Sep 2025 13:24:13 -0700
Message-ID: <175848625348.4354.12803484068611642489@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_132415_989035_6CD89479 
X-CRM114-Status: UNSURE (   5.77  )
X-CRM114-Notice: Please train this message.
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

Quoting Ryan Chen (2025-09-16 19:05:37)
> -add SOC0_CLK_AHBMUX:
> add SOC0_CLK_AHBMUX for ahb clock source divide.
> mpll->
>       ahb_mux -> div_table -> clk_ahb
> hpll->
>=20
> -new add clock:
>  SOC0_CLK_MPHYSRC: UFS MPHY clock source.
>  SOC0_CLK_U2PHY_REFCLKSRC: USB2.0 phy clock reference source.
>  SOC1_CLK_I3C: I3C clock source.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

