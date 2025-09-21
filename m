Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16689CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6yIaPi7mcGJcAYGgK8aQktSJhsIi/eYMgFAw+22rRU=; b=UMfSBhV12zfgAds7J8EXdFUN8r
	qQKbN0e3wKhbeRNNtAwxXfgr2HuJ+LDGIXtPHgjAIRVzkpru07yvap2mL4FzwQgvq9U9XMr+SBNIJ
	dP5k6uYZaE2kRFGQKa4nCyXRU0sjSLUY6ODA1gTBDbcBJa4Rb9RyfK6ZTK+w8byUvApHyDR5zRUCL
	riR1c5MGwnL8e+YrFOiGM4BnakYXxQ2hWpLzXEHrks2mgt3oI2AqjJbdF2FV1RMSQdozMH3IX+fH1
	zDHhXwf6meKUM+tRJn4RoArfr0OKYD3r7/qogeEL0T3KaUsTx5NEsLShR0WH8EDRhk9IUtoawYkbx
	WXZEvF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QS3-000000088rT-3Qjk;
	Sun, 21 Sep 2025 20:14:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0QS1-000000088qx-07ei
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 20:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D74D43F1F;
	Sun, 21 Sep 2025 20:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A8FC113D0;
	Sun, 21 Sep 2025 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758485664;
	bh=n42wuk3fRc2TVRisCoqEGhMVO97pJsliEokdZLTtgUI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ik1F8vFlhgeEufvWs7RZ9i4++Y6dbD/OC6O/1znESUCp+t8/7tBmKMDz1O0+4kRKN
	 GCBaTdy9VJOKZkLEtKBArW9mo9B8QGGp9UtvCe0ET0GHRfPktVBWzJHqUBKyrJlmip
	 d4ROLrGMv8ZxI9OHZK9KnxWsezjFEMynoT64DLlHlwZufX9RznzuJL4GOV/YeQspLE
	 3Tr8zuvp6MqeT8sedQst3GjqHi3+TAj29+jYvjgAuZxXW/vDvctl5QRj8J3Z09mtDf
	 BDLD/wl6fx3c+hOLPHgk6xkH6Kser6Ng3rDkF67roBvbiFrrc+BAZA1zx9MB9nHQv8
	 /fTg/12iOYKpg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250917020539.3690324-2-ryan_chen@aspeedtech.com>
References: <20250917020539.3690324-1-ryan_chen@aspeedtech.com> <20250917020539.3690324-2-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v14 1/3] dt-bindings: clock: ast2700: modify soc0/1 clock define
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mo Elbadry <elbadrym@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Rom Lemarchand <romlem@google.com>, William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, devicetree@vger.kernel.org, dkodihalli@nvidia.com, leohu@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_chen <ryan_chen@aspeedtech.com>, spuranik@nvidia.com, wthai@nvidia.com
Date: Sun, 21 Sep 2025 13:14:22 -0700
Message-ID: <175848566245.4354.2484705489084607414@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_131425_092795_81D4CDE0 
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

