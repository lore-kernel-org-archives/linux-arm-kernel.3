Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDCCC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2J0i+WG/PKJ/ZkG9vyA2DkvGy1gkKZsqlYj/4o9WVc=; b=363WibpZgkFOkvssKIHg7TS2fE
	8KpYd+dGRRFvXq1NSGhCfIQl0Lj+xmqxTG3yYq77GqwkxQdQegZwT8GXK9zd6JKB7hG25HVQTx53g
	vDodBmFU3liJfGaJGc8yn1A3jI+2spnV1PG77s0n1a0uZVlMmROCqPOvDZO1raWo9LLvtquyQXBFV
	ky5O+67nCovGclGB2fQsY3v7Qh/UttSU9ycoTS+xSY5pPJ1POfyIs1Ke/WefLPLSsJQp/ZEehNiAW
	KWHQutXgIccr/EC8FCBr35eat04Q60+T3xXJfeBXgz1pwFmicg21QeoQ7M4f0eL0ej0f1ikqsrDmK
	3IIb42Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLyr-0000000EEOp-12Qm;
	Thu, 19 Jun 2025 20:35:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLRO-0000000EAer-3VSF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 20:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F39E7A54405;
	Thu, 19 Jun 2025 20:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3DBC4CEEA;
	Thu, 19 Jun 2025 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750363253;
	bh=W2J0i+WG/PKJ/ZkG9vyA2DkvGy1gkKZsqlYj/4o9WVc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UJ02kzcbZJZeiNEHd5b99bUhLyNEtRcBgfSKjSh+UOnyIc7kkQLDZFtwAZMz1ywhz
	 7/SXXYjPRqVYlVdLVBpLLnv/0AdaP5zLVChg+Tw4+8CuqLhghPw+PajRVJop8jHJ9g
	 7aoYF4o1rAUSU1tRakIJq4BHPyQC8FaUyLbmoWCiZBNWED3ibxKpPtxLs2xYsmhpcb
	 Vr6I1QEx469iI9xEYTi15uvFqFwAkO0grFJvGWl5RJE9ZA69jqpzL1JDIOzpxWohyg
	 2CMKHT1xuftnB62ZsAJGxOJ0TjfrmYKLdeRI+zzmBb9xPjdtnPFonlS4Dca3fHGxVo
	 xLXoKV1K/Wewg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250610012406.3703769-3-jacky_chou@aspeedtech.com>
References: <20250610012406.3703769-1-jacky_chou@aspeedtech.com> <20250610012406.3703769-3-jacky_chou@aspeedtech.com>
Subject: Re: [net-next v2 2/4] dt-bindings: clock: ast2600: Add reset definitions for MAC1 and MAC2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, mturquette@baylibre.com, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com, Conor Dooley <conor.dooley@microchip.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Thu, 19 Jun 2025 13:00:52 -0700
Message-ID: <175036325275.4372.17530886047439204374@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_130054_941763_4DCD51B3 
X-CRM114-Status: UNSURE (   6.92  )
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

Quoting Jacky Chou (2025-06-09 18:24:04)
> Add ASPEED_RESET_MAC1 and ASPEED_RESET_MAC2 reset definitions to
> the ast2600-clock binding header. These are required for proper
> reset control of the MAC1 and MAC2 ethernet controllers on the
> AST2600 SoC.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

