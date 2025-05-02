Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D792C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 01:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CehEGIBBkZsYSKsJF9Zdkd4eHMw4e4d9SMsUpWBo7PY=; b=PKn+h0uD3I6XIfC/0KNdPXzrAn
	5o/HlEkA3fGD6m5MAZnKTJQr15q3jOPTBX5vIATfMaNu7m6irs2mpTksvFkSaFljP2dYjj16v7Xi1
	6ysyGGiov86tNnoSqAYhyDz27xdHyBvfgiZhAMlncbzp3HmvEUPC5M/xmGWwrZSQ2uyPrgK91X/Q0
	HuUzK4uzKY4ySo/a/m2Snt/XXHY5y/b7NpOoHJ/I1Dbz4Ldwt2X2uuPCisdDAoMvMgLdEKJzgozva
	RRcim3I5e2DogZo6HW2tqVNIQtASVxGXYBwZuFPD/HTDD084AHExJMB+eBQpZMM+LEXCuWs/UeKAE
	LCRN8e1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAfG9-00000000W29-2flu;
	Fri, 02 May 2025 01:32:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAfED-00000000Vtd-1Eut;
	Fri, 02 May 2025 01:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1105A4BE7E;
	Fri,  2 May 2025 01:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CF4C4CEE3;
	Fri,  2 May 2025 01:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746149412;
	bh=7yPiM/BTKprD4dt1k+8OG/eUHYXJCorznVvQ6X6X/Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYjHviPrXUxcfLLV6rgJajN7utTKn9Gt6bKvVT4rPDHzEFeRV4Zabxll1z5MPMmNq
	 wFfAcZt4grrvoqSvzcHZGU4rPJGY8e5QA1awo/Fzopelk9bvu4/rUwKaA1ptjQrKqH
	 mkM8d+aldzRzIhac950E6ITQG0OXA2Z8rsNH6AZlnO5LxvtXV4oy8lDwJVd5poQlgw
	 USpMSEBhvs1f7zAU/YBQo2pZ8+MlKJUiEIYmXhc5Exd+ujSYSQcpH1jpTq6V+kHb29
	 iySZwI6udC+ygJ4CFxig9QneVM7rE1/bSXJsAcrh9EnX/B8QdSChNW9i5BWYis6j9M
	 5lIHItPsE7smA==
Date: Thu, 1 May 2025 20:30:10 -0500
From: Rob Herring <robh@kernel.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Chaoyi Chen <kernel@airkyi.com>, FUKAUMI Naoki <naoki@radxa.com>,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3399 industry
 evaluation board
Message-ID: <20250502013010.GA3405545-robh@kernel.org>
References: <20250430074848.539-1-kernel@airkyi.com>
 <20250430074848.539-2-kernel@airkyi.com>
 <174602375195.3396795.11425847299435773154.robh@kernel.org>
 <9c51863c-95a6-4c40-9268-0b2be9b8835b@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c51863c-95a6-4c40-9268-0b2be9b8835b@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_183013_401369_4455DC25 
X-CRM114-Status: GOOD (  19.17  )
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

On Wed, Apr 30, 2025 at 04:48:35PM +0200, Quentin Schulz wrote:
> Hi Rob,
> 
> On 4/30/25 4:36 PM, Rob Herring (Arm) wrote:
> > 
> > On Wed, 30 Apr 2025 15:48:47 +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Add devicetree binding for the rk3399 industry evaluation board.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > > 
> > > (no changes since v1)
> > > 
> > >   Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > 
> > 
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> > 
> > If a tag was not added on purpose, please state why and what changed.
> > 
> > Missing tags:
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> 
> To be fair, the Acked-by was given on the v1[1] after the v2[2] was sent, we
> cannot expect Chaoyi Chen to travel back in time :)

Usually a sign of sending new versions too quickly...

But I just send this semi-automated email so we capture the ack and I 
can clear it out of my inbox.

Rob

