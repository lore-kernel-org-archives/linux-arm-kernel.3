Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F95C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNL174vwz/tCDdI4eZqR8gpeHvejmSBfEPzOVpQopd4=; b=yzRWeIZgAu4zx0YZNpe+1WGEn/
	sKxjXqQZf/P/AS9GLJMQ6Ws4EQ7taFJq6isEoc5cgfyqx98MaJPumBSQSmGr33ibJB939DnvcODD3
	hd7pj6Vf49x3ekEY7ecD1XvhYkNdVjpKZ+Fa9XiO/2vxFvwT76pI+Hf9cvDYt5YBpGXYHGk8gLKIi
	2HEKSymMW1Z0PiCxwbF6uNAylnG+z8/v5hlI9+eWqkM/tEbgffcGWjbPIXtIBX47Vk0AwF4Jd9UZh
	lCJf5N4J9HKExItwZuRN+yEWLTkn4C6NI3ECpyyqKe5+rKmxUtRqPF0511iu+BwjvO1aEFx6C65ny
	P3X0W21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2G4-0000000CzwX-2uhT;
	Fri, 25 Sep 2026 09:30:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2G1-0000000Czvd-1jMS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:30:18 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78AF4C1;
	Fri, 25 Sep 2026 11:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790328504;
	bh=nJ0/J95KwyInOWIEWMeBvCOCvt3BjxmuACXDJLcEw5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luk3ajdZNh4jrsQxH9iD6EKfviUNIh76eiSR0zLlBBarwNrHk26waD4shVQ1GdjTP
	 pH3hy8YERnil0rmBJqyMJLtKFnRdJpkgovKxU6BbNTCuVFj2oKQredB78LF6PP+uM/
	 6LVUyn6Sk5xGNh8j67z4FOO9foPQcPnbsXU+hYrM=
Date: Fri, 25 Sep 2026 12:30:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
Message-ID: <20260925093011.GA332413@killaraus.ideasonboard.com>
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_023017_606013_E1F46B4C 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Sep 22, 2026 at 03:34:01PM +0200, Linus Walleij wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
> 
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
> 
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]

Geert commented on the commit message in the original series, that
comment seems to have been ignored.

> 
> Assisted-by: LLM

This gives the impression that Dan's original patch was LLM-assisted,
which wasn't the case.

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 637fc92dcc26..74b75be599ae 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>  	};
>  };
>  
> +&isp {
> +	status = "okay";
> +};
> +
> +&ivc {
> +	status = "okay";
> +};
> +
>  &mdio0 {
>  	phy0: ethernet-phy@0 {
>  		compatible = "ethernet-phy-id0022.1640";

-- 
Regards,

Laurent Pinchart

