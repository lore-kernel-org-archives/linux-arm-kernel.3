Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C973BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=berTcGXQjtHwphx1LhgrooNJRWxqTQYz9MoLLXGH6m0=; b=GTHqqdmPBT0yj9ilOKyE4X7YSP
	XcAp+XNPDHchHnd6pavTi8wK1ewY3NrdelyGRGKO2gtt49ezwiO7LSPGtfYXmOoqYkmJezS5CUbJj
	uEuuojGRAxXY5toSS/DYWGNvJAWvoX9wf8hrwjvMnbTIcE75IxfvLnuMxv5ppwZeLQsQzbSwIX4eS
	yAopXcE99V9AslH7qOTxcT8I1rAA28VSoM+v1sIdtETRO8CkwbNuPIYsc+RIwOeJ9bLMXxz0CM49G
	chLHK6YHRrZRimdPMPKL2NWD8WTGA4WOgnjxjKbyz+vtxU9NLscW3p0jqUuwfn7adBggV1kU6+PzY
	RMJdXusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4S3-00000006dzO-2A70;
	Tue, 11 Mar 2025 18:35:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Hu-00000006RRm-1vdV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E9925C5DA9;
	Tue, 11 Mar 2025 17:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76502C4CEE9;
	Tue, 11 Mar 2025 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741713665;
	bh=j/ih8rqykXlfvr4wDQtIJsf0OUfZm5pMBVky+N7i0ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBcUTIAZ2CvLD+/K/Mxe6qT1pABS8vM3u3BIG7Ywu3U5ybndu6p/hp4p5v0r6xbfP
	 HAUH+AaL61wYeV3wf6ZJyGtVUmgFd3Wp7U9D32Iy/eSuqXBGpQ42ogzxGb07tegxzh
	 ixEzffwd56jZflL473kvkScK7mTXDBb5xkgmDKqMuD0tVpvDGnQJ2SVqeRz6O7M3zr
	 cIgK5m351SsE46SMQFtalG6F78ySBpzMdT5SvaOq2IsaC6KolrqmeJMPzWYeha5ZGe
	 mqb6LimbAVrBb8kAznqC3LvTbCd3EVG/vPEde+TGMwHmP9rrd8IqFyE8wH3YVO3Eu0
	 K6beb6flNG40w==
Date: Tue, 11 Mar 2025 12:21:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 04/14] dt-bindings: clk: sunxi-ng: document two
 Allwinner A523 CCUs
Message-ID: <174171366302.3801768.11391725958696311975.robh@kernel.org>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307002628.10684-5-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_102106_551785_AED53AD5 
X-CRM114-Status: GOOD (  13.89  )
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


On Fri, 07 Mar 2025 00:26:18 +0000, Andre Przywara wrote:
> The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> the main and the PRCM R-CCU.
> 
> The source clock list differs in some annoying details, and folding this
> into the existing Allwinner CCU clock binding document gets quite
> unwieldy, so create a new document for these CCUs.
> Add the new compatible string, along with the required input clock
> lists. This conditionally describes the input clock lists, to make
> adding support for the other two CCUs easier.
> 
> Also add the DT binding headers, listing all the clocks with their ID
> numbers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 103 ++++++++++
>  include/dt-bindings/clock/sun55i-a523-ccu.h   | 189 ++++++++++++++++++
>  include/dt-bindings/clock/sun55i-a523-r-ccu.h |  37 ++++
>  include/dt-bindings/reset/sun55i-a523-ccu.h   |  88 ++++++++
>  include/dt-bindings/reset/sun55i-a523-r-ccu.h |  25 +++
>  5 files changed, 442 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun55i-a523-r-ccu.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


