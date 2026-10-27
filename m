Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C003606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cNUtx5nB;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UuR7/ceK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T79Dr75s1wvEXUoDZaE7cn4PwcHACPes5COGJi8oy7U=; b=cNUtx5nBjruOIM
	FKepSO2kFz4uC4PV6zD5tXy4ugIfn/0NX05xwMh4A9aDukDjbmwzG/6oesAJAo09IIMb/Gi05C5Zt
	jD2lEV+J6BnsF3tFgegss5lUDPgFXs12Ip+cAOKTzYFF54gvthor5FPU2/XpAPEsCC+RXK61HwdH4
	zGr1fP7RVwI2VSnSUfNNhljTKWpkNeUE3JmFAVt+reue9hTCmlBOZK0jDXzxmMYnhQyE7GYsU08/Y
	89D9UwLbrzeWkxlPmsjPBaEP6QLpPC+/EBc9SK86rscrctcYxRYumf/q+cfnXerhj+kjnpmThN2k1
	a7ZRt9i+LH+o5nTwjRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdDq-000000048R5-26YA;
	Tue, 27 Oct 2026 09:11:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdDn-000000048Oy-1BhJ;
	Tue, 27 Oct 2026 09:11:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE9BCC5846F;
	Tue, 27 Oct 2026 09:12:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E838603BD;
	Tue, 27 Oct 2026 09:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C36211032904F;
	Tue, 27 Oct 2026 10:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793092309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=T79Dr75s1wvEXUoDZaE7cn4PwcHACPes5COGJi8oy7U=;
	b=UuR7/ceKR3WvRHfZBPIedxhdV4OfAZXNIaXp3g8W7wt1efy1uoDsg0DMZTk5cRNDiNtala
	Omvkg8mIONIePJs1AXs12/YATeNT0fD5h/EXQZicnjbXevpQ2CpHVhz/8haGqX0ZlIo+JA
	EG6OC5DHxEGXP9hOB3ylx3BkmW4u5czjzb4XHEq4dL9KXjgmT9wjq8veuW4iAgbI/Q6kOE
	Tq92N6JhK2VGV1QVFyN8UjliNVqXShOUtGsP3SZLgsFopKDji/FB71MDawONogQloIyLEt
	h9rUVj8ZpDSYFZlyEq+sOxwNupUnHhkapAE3hbDZlc4ft2t38vmFeyK1r2tU1Q==
Message-ID: <42d26a0b-c517-4fc5-8d19-e0b7c4506cbf@bootlin.com>
Date: Tue, 27 Oct 2026 10:11:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] dt-bindings: pinctrl: berlin: Support Synaptics
 SL261X SoCs
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti
 <andi.shyti@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-14-jszhang@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260929061417.20733-14-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_021155_488950_A414A80B 
X-CRM114-Status: GOOD (  12.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Le 29/09/2026 à 08:14, Jisheng Zhang a écrit :
> Document the dt-bindings for pinctrl in Synaptics SL261X SoCs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   .../bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml  | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
> index 6ace3bf5433b..fb60a310a24e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/marvell,berlin2-soc-pinctrl.yaml
> @@ -37,6 +37,8 @@ properties:
>             - marvell,berlin4ct-soc-pinctrl
>             - marvell,berlin4ct-system-pinctrl
>             - syna,as370-soc-pinctrl
> +          - syna,sl261x-soc-pinctrl
> +          - syna,sl261x-system-pinctrl
>   
>     reg:
>       maxItems: 1
> @@ -44,8 +46,10 @@ properties:
>   additionalProperties:
>     description: Pin group configuration subnodes.
>     type: object
> -  $ref: /schemas/pinctrl/pinmux-node.yaml#
> -  additionalProperties: false
> +
> +  allOf:
> +    - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    - $ref: /schemas/pinctrl/pincfg-node.yaml#

The special value bias-pull-up=2 is handled has a strong pull-up in the 
code, maybe that's something that needs a documentation in the binding
(or the strong pull up value is really 2 Ohms, and in this case, 
everything is ok)

>   
>     properties:
>       groups:
> @@ -60,6 +64,8 @@ additionalProperties:
>       - groups
>       - function
>   
> +  unevaluatedProperties: false
> +
>   allOf:
>     - if:
>         properties:

Regards,
Richard

