Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E4EC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAnFbBdLfWkl5h5Dm3VK6r68B/v0Eum9nP/kEuvoFBU=; b=OZsxwAVuPXzrzH2vVhMAM2ezUA
	C5pchFZ4P8xny8odr11x2bBCYUYpMecMJJ8q9mPfisrNYxrQNSUhG0+uCsSeU6BGZ6htZOnPv+ud2
	mIezJ+ZZ+gZg0NlkLw5I+soEM+shHAQDKYm0oqfxsGxvcv1B9eluCyE9PwfIO2n6wNG5Bfei1Zy6x
	RCk4+tVeqg19rxb+GqDmUbY5ZBcwkUcRHuK3ly1Ms7o6lA8yZh5I4HwfWfOAwKfPFSqOtAm+BMEPl
	v/8/vb3pwvKvUCtheYQHRIEWd7c4OU6IwjMAMAd+bYjkPgre62Fc+MlGWnJwPm8eLaX7NPgriGaw5
	kuclz1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeEZ-00000009oiU-1wN3;
	Thu, 30 Jan 2025 23:46:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeAK-00000009oAA-08zL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:41:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99E84A42599;
	Thu, 30 Jan 2025 23:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6ED8C4CED2;
	Thu, 30 Jan 2025 23:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280502;
	bh=DZnH1OSKYAieF5ajIrEhZsFh+kHI8uiA/TPKhL3dw6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2KR7MBNQ4Tja4tmqdEkZ5iykHJ4wCpJOEvqyeIHvOgBCLF7/UoybAVbtfKhGjY7Z
	 gbWdeF78SBMSgoQ7xnFKODerJdP0Keg849c1MP9wDJVztXas3HtuGCU1k8US6JIZuP
	 2sG4aUR//On7A71s5W4A7CAqIWQoUHFsNEVTqDQGwKrIKQbnsZJ8fg+O0NniDyGDmI
	 KOChyx/PamnoM0xzQL4wiI1C8/9qgqCph8Gtnc04t54bJPK/5m0qWCB7xYa/T7ZyLB
	 LpRgJftE2rFgFUSE99QPR8D5Kf/9CNFaJcGteFSlgxjX93c0lXv3CNyNIEIogiUHYy
	 Hstal6Id2r56Q==
Date: Thu, 30 Jan 2025 17:41:41 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 05/16] dt-bindings: reset: atmel,at91sam9260-reset: add
 microchip,sama7d65-rstc
Message-ID: <20250130234141.GA1872305-robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <2350540fd22b181875d3cce272fba87fff924670.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2350540fd22b181875d3cce272fba87fff924670.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_154144_136509_12A0E900 
X-CRM114-Status: GOOD (  13.65  )
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

On Thu, Jan 30, 2025 at 10:33:45AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RSTC compatible to DT bindings documentation. The
> sama7g54-rstc is compatible with the sama7g5-rstc.

sama7d65-rstc?

> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/reset/atmel,at91sam9260-reset.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> index 98465d26949ee..a1c21c3880f9d 100644
> --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> @@ -23,6 +23,11 @@ properties:
>                - atmel,sama5d3-rstc
>                - microchip,sam9x60-rstc
>                - microchip,sama7g5-rstc
> +
> +      - items:
> +          - const: microchip,sama7d65-rstc
> +          - const: microchip,sama7g5-rstc
> +
>        - items:
>            - const: atmel,sama5d3-rstc
>            - const: atmel,at91sam9g45-rstc
> -- 
> 2.43.0
> 

