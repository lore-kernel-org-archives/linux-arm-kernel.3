Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB33C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 22:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq5Svr+0mkoExl6RExPJDLf8AuUnGZxC8idcmofzQaM=; b=SPK0TIS5tcDFMlwWAV+ZDV+V/z
	sWDzvRoERwojg3/gueH4wUesj7/gScNYT/7VOHAjjYZvFUNJbQpwEqa6iBhS8xIgPoKXbmTO5VTIS
	OvCIzeI4J6FqmwOL8LHeCn3fiMOl15srXzyPykTwjFU37zI2ocQl3c7htc/sd510VdKTtJtWv7nZx
	y4farUSGvHcFPWFZK8wdEhGlzcThmpeM0kLGGKmFLwLtnG9GuRebeBMlyk6EIYvzijbbxPwu747Zb
	AbioMDmMbHt/5WbBl2RopsOdq7JKSQZYK6kU9aqxa6IsbFHpZQ55cXFom2k0gh8I2Rk/uGYYbk2da
	41FUs/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5Wy-0000000DOSi-1QHB;
	Thu, 23 Jan 2025 22:18:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5Vg-0000000DOMX-2AHm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 22:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7570E5C54F0;
	Thu, 23 Jan 2025 22:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA96C4CED3;
	Thu, 23 Jan 2025 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737670631;
	bh=pcG2D2/E0u37nyJWQeA42BhrzuRLXs0n2hWP0puC9mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4R4wPYqGTTiYnldH6jl4hR7pTwLxm1N71v7m5eehLbDNhx+4mJyeyqxiR4pFwI0h
	 BzRQ3n+ZUAgEwvc/4Y5lI7iZ+ncK5tubXKO7UKpRdK4bKBQm9EudmHDLsJXh5EwPOa
	 QjSuiqxT0/Hetex3f6MmQggKiggCAIBtUlqvdcDSscMT/Lve8uS38Wyg3GRSfyr6cD
	 bDZj4PoYC7S8FKd/BwB0XJ+jxpy83STlru5dq0DXwLPPRZFgUURvm70nA/IWJBegL3
	 WGwaeSntD53ucCbC2AqECdcEAHJftzwl/qu33tBvVmrOD/yqI95kMCNF4K3CKWszYS
	 C7GaiHLKajSaA==
Date: Thu, 23 Jan 2025 16:17:10 -0600
From: Rob Herring <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
Message-ID: <20250123221710.GA448645-robh@kernel.org>
References: <20250116203527.2102742-1-ninad@linux.ibm.com>
 <20250116203527.2102742-4-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116203527.2102742-4-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_141712_596696_AF2F0A2E 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, Jan 16, 2025 at 02:35:18PM -0600, Ninad Palsule wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> index b9afd07a9d24..0497d19a60e9 100644
> --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> @@ -46,6 +46,12 @@ properties:
>      minimum: 12
>      maximum: 232
>  
> +patternProperties:
> +  "^(.+-hog(-[0-9]+)?)$":

This can be further simplified to: "-hog(-[0-9]+)?$"

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


BTW, no need to ping. You can check the status of binding patches in 
patchwork[1].

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/

