Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7144A1067040
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oKoCAgBlsyEPL2hF6kJlJj2J+2QY9OTAT9t9lI2uzA=; b=aS+axbykgwHFPOMO9WQxwnJjwD
	+k7GyrHta59XNcXbsrp2um/3PzWRU11k/t90cRcQE/gCI546RfknLjpoyCTiIdnJ662tWbBARZtNj
	l7QoQZ7/xh3D6tWuMerCvxZXkyLFyNqpsGv/xrmnMM6luZw7AeN6Y7yKx+lLzsXb4/4SoJwm7EEuJ
	bk39rDu/ePb60lRxY7y/i78ZAPxrtmgZyWad9FdXBQ0mKxySVr6J1vUmPOB9Y6Kwzj4e5pudfKpsG
	Vzy2igUq1d7HZvBudN7lxW42cMqDsrCAymJBXVcbugvweAn0uoCVq8eA/67vZK1+MltydMmL88IuL
	wWj4wJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hYE-0000000EHyP-1Fi9;
	Thu, 12 Mar 2026 15:02:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hYC-0000000EHxX-0xzi;
	Thu, 12 Mar 2026 15:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 924D7442C4;
	Thu, 12 Mar 2026 15:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47060C4CEF7;
	Thu, 12 Mar 2026 15:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327731;
	bh=4vUNgw/dIjwg/gDC3g4/SBHB1dI6lecJoQelequ+HGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOAGMOCKc6PZumrHzBjuGeJMib1dbftYNofU/uzf0f0JJOpZHaf6N5ZPUaNdOUfz1
	 dwwLwQCGzQLy50uQjv+YVWB/8/4anKKHJAWcLF+AR1oKZacZZENDZ5uJ0S69+6sE6T
	 0uJh0vlMQqgbClfZaUCIhOQcaBjNQNSrdhSV937l46/rkXXMU7oJwUdCzCbC4o9OBT
	 Py0f3nelL6gX7nPgi5JZym1IB8ANltYOoFGx4XM8J/959YCLqI9iHSvkA68IfL7YnE
	 oge1/pdY0ZZB+z0c1AA9mg8+1ISr6Ax874vQoOJvYDZ5ePfCAJAU43p8J2sXKCv0VP
	 EQnxnLbloFGYw==
Date: Thu, 12 Mar 2026 10:02:10 -0500
From: Rob Herring <robh@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lee@kernel.org, alexander.sverdlin@gmail.com, marek.vasut@gmail.com,
	akurz@blala.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/4] dt-bindings: input: add settling-time-us common
 property
Message-ID: <20260312150210.GA3121485-robh@kernel.org>
References: <20260305192101.2125660-1-hugo@hugovil.com>
 <20260305192101.2125660-3-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305192101.2125660-3-hugo@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_080212_286027_CBAA6131 
X-CRM114-Status: GOOD (  15.87  )
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

On Thu, Mar 05, 2026 at 02:20:48PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add common property that can be reused by other bindings.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
> Note: a similar property is used by gpio-matrix-keypad.yaml:
>   col-scan-delay-us
> ---
>  Documentation/devicetree/bindings/input/input.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
> index 502e0b7eb500a..14652d324e2ca 100644
> --- a/Documentation/devicetree/bindings/input/input.yaml
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -66,6 +66,14 @@ properties:
>        reset automatically. Device with key pressed reset feature can specify
>        this property.
>  
> +  settling-time-us:
> +    description:
> +      Delay, in microseconds, when activating an output line/col/row GPIO
> +      before we can reliably read other input GPIOs that maybe affected by this
> +      output. This can be the case for an output with a RC circuit that affects
> +      ramp-up/down times.

Whether it is GPIOs or not depends on the implementation. Just drop 
'GPIO' and replace 'GPIOs' with 'lines'.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

