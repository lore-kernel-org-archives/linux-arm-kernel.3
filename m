Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2158C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWdlyaF+KG51YLulUmkmo08VX1xVYyysDPYMmtl6pvE=; b=30AuUr81fygLR1MduXC5dV0OAj
	zRyguS9O+/nSONu4q/hG+bD7LhpSwXN3oNQSmpT/MiW/K8QAgVLNn3Y2C1jn6JYlGfZcIscN31nzv
	cC6rLF0XlPr2RgTAdYacwN5OV3XDUxUt66o5f1+uWGn6bNRVdAEHptAjd8jjzMg8qQDbeNdyJ+vef
	HvGIMsUg4Bkk6Io+wAGAfEaFP5qf7nUlCVrINrq6QIyg/O3iwNriNNYnOEtc5QCip4xjnF0pP/qkB
	PYDH1yDXbPSYntU0BPCxXRu3JKf0i7e0if5W87rLUaqOolyJNJHCagIW+Vd2DCka6l+/U5Q6kap1F
	2sHw3MGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tir5i-0000000E86g-1KaZ;
	Fri, 14 Feb 2025 08:30:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tir3F-0000000E7Z9-20Rr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73717A41981;
	Fri, 14 Feb 2025 08:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21CFC4CED1;
	Fri, 14 Feb 2025 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521676;
	bh=BoRysOvekYDA4kO3GR1yCKqhh422oc1fAiBZ2HdLOvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPH1wC+aZsA9yZhCw7fK5KlP3yKl+CSu4P7qaTcf/n0xCDu+7Q6KgnLNqD0/6zb8R
	 DZ0BXrOaWvV/hfWh5Vtx6WYQErdUHCN7nZM8B+6iGO/y1nx9UpgnaiiHT8vGpnPNLy
	 9zjeOPrHIjm4JaE+YFeAUz1lpp61AjwLndaVjYu+XeqGeRyIyKjFcHGWtY/rJ6jbfo
	 QFeJ1tCeWsi78+uTdVZg6rzKOXfcQ7CtM5H6STxL7yGs7g/jC0QXQG9ZCSYjeDW/jh
	 loU9x+QiyOB3UmFeDDMqnxF9Hb9OZwR2KPABGet6Y9z3/pHHZ4j7KNG+OqO7qv1Sg0
	 +/jwbNfV2+/+g==
Date: Fri, 14 Feb 2025 09:27:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v2 06/15] dt-bindings: rtc: at91rm9200: add
 microchip,sama7d65-rtc
Message-ID: <20250214-fat-elegant-myna-bb2c6d@krzk-bin>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <a0338f3d05ed43eeaf2121dd22a9f0dbf25f2fc0.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a0338f3d05ed43eeaf2121dd22a9f0dbf25f2fc0.1739221064.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_002757_575428_0B2D8B6F 
X-CRM114-Status: GOOD (  11.96  )
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

On Mon, Feb 10, 2025 at 02:13:06PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RTC compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> index c8bb2eef442dd..0c878331170b4 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -25,6 +25,9 @@ properties:
>        - items:
>            - const: microchip,sam9x7-rtc
>            - const: microchip,sam9x60-rtc
> +      - items:
> +          - const: microchip,sama7d65-rtc

So that's enum with earlier entry?

Best regards,
Krzysztof


