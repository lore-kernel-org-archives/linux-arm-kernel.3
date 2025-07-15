Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C432C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcKo8QxCb8Q9jT97ujQTQmKqx0LSzc9mKA1VvRcUn+s=; b=Nz6TRyONGURiTFZEIbolamV5GU
	OS+nRuNl6PpES7zSmUIaJyOZhdVBYPIOa77iuZDS5u/rxDSs7jTtqtXnEum4d1i+c85WURsowZB9A
	absa63quY3ov1BsxlA/4NLO35R39Vc0FT9JrM4kE2tQmQC8yD/xxWrgYSd4bAcYguPqm3DGgtCo/q
	hogRNIFy4uyiorAHaQbQYFm+jeCViNpoqO4nGn0IeUK8I9yIw03YP51uowsNtd4iz21vZ4t8ss8+S
	8MklVk5unGcMu1g0/RIeDuZpUHFDalPonE+S7iuGY+DWn0X5jE8SucJOw9JkNmYsytBX9I8DNtUF3
	z0VWRY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXOg-000000041Db-32J7;
	Tue, 15 Jul 2025 04:36:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWnN-00000003x26-256X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D20DC45D44;
	Tue, 15 Jul 2025 03:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F93C4CEE3;
	Tue, 15 Jul 2025 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752551852;
	bh=yNYf/5GrOEloApVhcJRWeVo8jGDjSwjPC5llKFeyqjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAQxvwGm7T8NCV72OekW63lZSdHOrDZ7rOLs43Md28ykY5+1th5ETo1YyxM13FG/t
	 d4RCfn1PhESPtTyi8lZUrcWwF54bJKHCxfWO7UZ25//F6s2fdhCH91UuVfyZKyO1ay
	 zPhpY3Vc/PrVNY3jL2v9QT+1bg8e1A/nX4Mb8t6ZPbcF31VUbL8nZjAQ7FACfv3fXp
	 UnMK0tYTh+rWIpaKLNX1NdRrDmOc1/XLcruFHTrbSvJwJ4lUFsoETCBdvFFsCETNah
	 Upvg9HObSABmdYJq1yL6702X18GN+kfwW+tJVfoahJjXV8Rk6ztizGxrT8IWYtTFPv
	 yg+svbHcO/73w==
Date: Mon, 14 Jul 2025 22:57:31 -0500
From: Rob Herring <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, dinguyen@kernel.org,
	maxime.chevallier@bootlin.com, richardcochran@gmail.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: net: altr,socfpga-stmmac: Add
 compatible string for Agilex5
Message-ID: <20250715035731.GA14648-robh@kernel.org>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-2-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714152528.311398-2-matthew.gerlach@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_205733_557406_33CEFB9C 
X-CRM114-Status: GOOD (  17.29  )
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

On Mon, Jul 14, 2025 at 08:25:25AM -0700, Matthew Gerlach wrote:
> Add compatible string for the Altera Agilex5 variant of the Synopsys DWC
> XGMAC IP version 2.10.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml     | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index ec34daff2aa0..6d5c31c891de 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -11,8 +11,8 @@ maintainers:
>  
>  description:
>    This binding describes the Altera SOCFPGA SoC implementation of the
> -  Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, and Agilex7 families
> -  of chips.
> +  Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
> +  families of chips.
>    # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
>    # does not validate against net/snps,dwmac.yaml.
>  
> @@ -23,6 +23,7 @@ select:
>          enum:
>            - altr,socfpga-stmmac
>            - altr,socfpga-stmmac-a10-s10
> +          - altr,socfpga-stmmac-agilex5
>  
>    required:
>      - compatible
> @@ -42,6 +43,10 @@ properties:
>            - const: altr,socfpga-stmmac-a10-s10
>            - const: snps,dwmac-3.74a
>            - const: snps,dwmac
> +      - items:
> +          - const: altr,socfpga-stmmac-agilex5

> +          - const: snps,dwxgmac-2.10
> +          - const: snps,dwxgmac

Is the distinction here useful? I doubt it, so I'd just drop the last 
one. Generally, we've moved away from any generic compatible for 
licensed IP like this because there's *always* some SoC specific 
difference. 

Rob

