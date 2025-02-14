Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF6BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TgDol3ZKmC13trfTd/MXH4fT+JWynhsU2ObrjYJWWs=; b=kseFc1JXyt2rMT5pbvZrxNGMT5
	lfiBhLS9iNhGqmtjP8P/syqptrCyjdtxG2efmqAJbeW++NNWSKUkLcVGf6L8pHt9Gs8Ndos+BR9r4
	8zZ8oy7Hrt6j0DjY5rEUPSfKvv+7PHg2xgPpXxByI6tJZk706idjW5PPHbIc6oZvY2nneZjJg+2TH
	1rxi4DBtU2j4CZNTu+cuJsRxhADzLfZaQfWPnU3b2lpSk2/YqddM+vy6lxQ9c7lmGb1iLH+kb6iFD
	Csx7UUEzifTlVHXiFzn6yRGenYnoSlUcf2to90RCcC2Zckhx3qNbmI9sxf/C7C9FCx/WAey1787cx
	2CY8tYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tir76-0000000E8Kp-47yp;
	Fri, 14 Feb 2025 08:31:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tir3y-0000000E7hz-0r1X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CBD15C576B;
	Fri, 14 Feb 2025 08:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72D8C4CED1;
	Fri, 14 Feb 2025 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521721;
	bh=KO+4oZsMAUFcx91vxIuqec0dnxFJQO0eihmeoC5Sj+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhNhiMYjLtTSSkKiSa4nhwRRYrn+y3P1wEKQwnh0HC8J5BzL4Sb7t3DTsTvsoqg4K
	 evX/K1/pDmhNbzY5Wq2rk55M/3BU3U4nutfxSmljEe7CcvXbCpe5sE8DPeTQ68F07L
	 tN/GST8oeKidnjTIRU6gSQ54g5Ywsij3NUQB8WaoRS0u3+NVxdGGpI07IzRCRDlbDx
	 kBUaf8ZJlTHFLmWiI0JtcbCHkdm+aMWUWPkP/iUoir2LaJe58/M2o8SSihSH9VP2DU
	 8Z35Ek3cwBOaZAFcFDgrFO7ibpKEmOMq2JyNz/mh55fKdjoQnSHJBTxRki83hHNaIU
	 CNet6dc/8XU1g==
Date: Fri, 14 Feb 2025 09:28:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v2 07/15] dt-bindings: at91rm9260-rtt: add
 microchip,sama7d65-rtt
Message-ID: <20250214-wondrous-strong-shellfish-77f07f@krzk-bin>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <b437898b518910a2f94f7d827608db35e82c5828.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b437898b518910a2f94f7d827608db35e82c5828.1739221064.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_002842_301837_5C6B32E3 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lee@kernel.org, sre@kernel.org, claudiu.beznea@tuxon.dev, p.zabel@pengutronix.de, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 02:13:07PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RTT compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> index a7f6c1d1a08ab..48a2e013a6b24 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> @@ -23,6 +23,9 @@ properties:
>                - microchip,sam9x60-rtt
>                - microchip,sam9x7-rtt
>            - const: atmel,at91sam9260-rtt
> +      - items:
> +          - const: microchip,sama7d65-rtt

I don't think you tried to even read this binding before extending :/.
Look earlier - there is an entry with enum for this.

Best regards,
Krzysztof


