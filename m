Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3041FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZC3JiUzQ4zNETHjQs5R9FR7KQTQ/Ai1iBCs/3GwcqGw=; b=Wek0MjBdu7ehMVUhFBR9H0j2zp
	wCMotGKYryR9xz9nSauEQ+J1B3lL3DBBpaoWjrHLg14EllxQS8mSPPGXzreB05waQFYHro4THZP6B
	WXaJZRhFgc45vxeuWkqoeFir93g+uMK9f49LQx86gTlYgKtRiv2ZxrboReOdV5QCqjsTpV9a73QeZ
	jTrm5xfcfVTQCInGCE5F4n8payi9toxNez5v8StPMWSsCTdlEAaP8jG+9P01A9413PqfwIMICdt0I
	rMflYCt+bPE0g8f59u0qL7VAjD0rGbQylqJtLQVIRhAdAGKNAvdQPyrPUKAo7i8kvdulWDolUKQ1k
	eNQdUQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeKm-00000009p3h-0PDT;
	Thu, 30 Jan 2025 23:52:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeJS-00000009oxO-3iFH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38D15A42530;
	Thu, 30 Jan 2025 23:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047F6C4CED2;
	Thu, 30 Jan 2025 23:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738281069;
	bh=CXkPOjcny3vetfrWYsxwyCNypUJvo8NXQtKAtso3d9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gpRyInydaL6BItpyZo9f6LIndF0jEQC1eBbQoOhqQQ6YCIwhO+FNm+BpTrt2IWoeA
	 kmp7qtIV8V5HCHbJ+VthUU21TTnymeXdqqd8DKpFA/G78Lm8h+AEc5dOgcdD3U+k3P
	 ji36Kr4aM6eEX4EGTiTH7Ajskja5LK3zJwirY7rJDDhyEVqGfp+Bdmy4QGVv2opYBk
	 SEgkzTy5YvU1TgqujPhYhd87eiElDS1q1DWH4adVhDBwr+DdWgoBupDB0JIsRkhTvo
	 fjfSp5riCTismgJXk5dUAblbU9E3YI0JY3Y55xJP/i+iuaxGw11M4Ag1EzNgPqqUue
	 TN22vbc2Z7GqQ==
Date: Thu, 30 Jan 2025 17:51:08 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 08/16] dt-bindings: at91rm9260-rtt: add
 microchip,sama7d65-rtt
Message-ID: <20250130235108.GA1889615-robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <f5642fad5d7a97772ae22c76840c5c51ee79ec0f.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5642fad5d7a97772ae22c76840c5c51ee79ec0f.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_155110_990143_061FD7F1 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 30, 2025 at 10:33:48AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RTT compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> index a7f6c1d1a08ab..078b753f453b4 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> @@ -23,6 +23,11 @@ properties:
>                - microchip,sam9x60-rtt
>                - microchip,sam9x7-rtt
>            - const: atmel,at91sam9260-rtt
> +      - items:
> +          - enum:
> +              - microchip,sama7d65-rtt
> +          - const: microchip,sama7g5-rtt
> +          - const: atmel,at91sam9260-rtt

Does being compatible with 7g5 provide something over 9260? If not, 
probably better to just have 9260 as the only fallback.

>        - items:
>            - const: microchip,sama7g5-rtt
>            - const: microchip,sam9x60-rtt
> -- 
> 2.43.0
> 

