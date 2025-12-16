Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6208AD5C0F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvNrMludRXxgFxLNR7QEWDmK9gJ2gERs277nXQ2+YGM=; b=kbX8aI2cThYd1QOXGuGNB1dobp
	bJHeWTI9IjTdvjv0b7GMNQcILrgQISy2zce+H7J6O8e38TxeXXK0GYBV5V6io9T/oRJky/YTnKASr
	KNZZ4fQKDWSqHUVau2cmB/oGGKK30PXAZAiq8kbbL3it6uaGXeziV88yJRQaciKYpWs9uJrvbOo8I
	gF20sa1yIp/b2G8vrJpwgBK8sM6TEHHSiUdDyAHPDNBz7TBqcd+HXEP6tHbTvZzVnCMKIBAxmou/z
	mCcePjffFs5L/y4RbubWV1/oFTL8XnJ4SWm8cCg0KcPCVGOjx1xk5N6J7hQBbkmo6a4g0WoiTtFN+
	EzxgkhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQir-00000004wpk-0ykw;
	Tue, 16 Dec 2025 08:47:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQio-00000004wp5-2LDt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 08:47:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D77BEC19D35;
	Tue, 16 Dec 2025 08:47:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 30F5A6071C;
	Tue, 16 Dec 2025 08:47:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3461119431B8;
	Tue, 16 Dec 2025 09:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765874867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gvNrMludRXxgFxLNR7QEWDmK9gJ2gERs277nXQ2+YGM=;
	b=DIq5brBRta/TiINKp4M5huv5tPncOYq/k/KPgcFh83dyP2Ff4kqo0PKdlyN64UzI9pD3Z2
	8hYV/UlhLtD+/+EvXp59CEtjCStQ/UYa+3ZDJYzkyLgHCNtKfesWi+elbS4dfSGE5YGoIm
	KOGOCU5nkjsP/9eg90yut6i1bZ5hN/oUpGIVZh/2Xs2t7T/SJkvmmKEZqWOiPz+TGHiDDJ
	/kouSIHSFYczWt9VOtzmBImKNghpe9lFF1DPmkAJuVJlUsNAc7Yj3y04u8E2dM8gDiVb4U
	HWHn8uXh7VFwbrM+P+jW+Bkzoj9xMP9ltHAy1h6iMOUO5GxjoVI63YjKJnB3iA==
Date: Tue, 16 Dec 2025 09:47:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Message-ID: <202512160847455082a875@mail.local>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_004754_743039_765AE033 
X-CRM114-Status: GOOD (  15.91  )
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

On 15/12/2025 13:29:29+0100, Nicolas Frattaroli wrote:
> adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> property. This makes it impossible to model devices that have ADC inputs
> that should generate switch events.
> 
> Add the property to the binding with the same default as gpio-keys.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Documentation/devicetree/bindings/input/adc-keys.yaml
> index 7aa078dead37..e372ebc23d16 100644
> --- a/Documentation/devicetree/bindings/input/adc-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
> @@ -42,6 +42,9 @@ patternProperties:
>  
>        linux,code: true
>  
> +      linux,input-type:
> +        default: 1  # EV_KEY
> +
>        press-threshold-microvolt:
>          description:
>            Voltage above or equal to which this key is considered pressed. No
> 
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

