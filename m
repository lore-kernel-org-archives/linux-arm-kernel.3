Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZoRyVnubsCTXnGDN0W6JhwZ/Q5YmmQyUD3hy10ebHg=; b=dbnMH+LaA1i5C6EM98bEQG/CXV
	YEiLRI81QX6D7T2QddI4KVODMT47i/xnEMmCQc7KWA3szWw6yaw+SjbMFoF1rk6T2BKCOFYGhL1cu
	Oo9qCFkzHgj6Io3up4kB24zB9TnrkcLMX9fJcIz8iRYFYqkBmaKcRNzDrjbkRMkszURpMOOoUMdsV
	WKGUwSwr6E6VutBKVwHLCli6pFppwn7yqlmdxYzbgLabfRPuJthc3eDM5wl1+4VUqllrk/b9MJm/T
	R+xLy64ImDjvUxDwLUxutddga2RecghxwYQh1/BWoV8QPv3GoyCHzj5cufKOyAfq/M0t/5xJvQ5Xu
	H3GGz27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Mq-0000000CkhX-3wO2;
	Tue, 10 Dec 2024 21:02:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7K2-0000000Ck1H-3cSv;
	Tue, 10 Dec 2024 20:59:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3862df95f92so3068698f8f.2;
        Tue, 10 Dec 2024 12:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864349; x=1734469149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aZoRyVnubsCTXnGDN0W6JhwZ/Q5YmmQyUD3hy10ebHg=;
        b=JJGG+tPSxpRlgHdPIhAIJ16JkOkNbgLhoE6FFC/gsRvi1zpqGPDvi/ebtrfGvZ/f3q
         j9O2uPxLP7qzwMqa1dR36eVqBQ57XRS/ng/v8GKPGEb1ZQxBUXQadGztgNBeYGiUE7C9
         C99GfCKy2dnlmfkXUIiMf340VKNZ0sRxSQcWNQfqEJjZmghqDg3cEcTcrZirJmWOb1of
         vo1ZJVQSPRGtYIn1hWNVJ2R988m76VtS0fIFw5O8iZDyNJJ5dahVXoD72GI4bQXiaqyt
         URB/ULpRQOacSRcNGFix6z65bsg/qesAPNMW+PYm8pPehhLSzvtGHy5JJFWRMus0z3zn
         F1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864349; x=1734469149;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZoRyVnubsCTXnGDN0W6JhwZ/Q5YmmQyUD3hy10ebHg=;
        b=A74WAvtuS9QAwa+fi8mjTVONZQXN7LGlvre+EWcREsTgFwuQtbE4N18E7mIgV9o6Xl
         lMtCr627xYpqfPOtEb9lUuw7OcLK7LgfHD7dQ/gft113g1C6rbG0lFQofiXQcbkz4Y5o
         Pc/gHE37301T3T3IBaTfx3y24T53StxpgQbvjI7iZ7JmnClw8YwBpwb2hooEBkVheFDu
         J3vhtKJZ3vPVmchgNtkhrH0ANbzEdE3R0zYdyu6LnhAHw46WrAhi285Y2uG7BCcrF4yD
         Rf/LbUN3Y/RcWr69iI3u+6r5qwOyhyjMq1/vslwT0AJeMzVe5QNVeeKWkkh1ReCvzM7B
         iblg==
X-Forwarded-Encrypted: i=1; AJvYcCUISqxlZW0kmUtP/cLx7jGf+CXFu5tcWRsqnzHFl1Eqm8N4/yBW/KQKXqkatFt+Mq0FJdNO3ppAFX0dHsUSGGqB@lists.infradead.org, AJvYcCUZj65+gBcnJJwAjvgBN2Q6nn6jLDemzTWdAL7J0lJd0CxL2Ru+vvfohdF9k/opruYOj+9Gduo7SOadK10OUpc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/i96nYxI5t6ExqHTMgaBE9yYbPrRyq2hZZ7WaYnCxuQDWHLQ
	ZVBb9yJB+aZhjrtDWSftwR5vvrOcQyUfVz36e7JxK8Q0z3qmk1hj
X-Gm-Gg: ASbGncs2LLeaBxJr0KhZkA544s/jl1x4BLuFL9hb733JeBe3igy/JEU2ByblvHf8FIi
	a6rsyI6hROTXmxWw9ALI6LO1JaXhXK2ysC58aVFGdbD6BpAawT5fvhmMlfseaLTF+kDtIocwfU8
	untWk2O4dMiQi1guX4amnhOzZrbBi8Y5kUFnfaEGOiF/JlpJUomJpDH5fuaXqWMrF9LGPVt/u3c
	vs6v5/rvAQB1vP6hZT3Vhuxyflv3zC71c2rC4HpAx5/KqcW39/QzQm/pAnXM5sm+YCGHtpTdU8/
	Tz+rXZjHYA==
X-Google-Smtp-Source: AGHT+IE2p4zS0d4ssJx5pitNO8yM+2jWAE85KmDwhz76rWPYidu8fzQPEOifjDJac/byApIZwC84jg==
X-Received: by 2002:a05:6000:1843:b0:386:3b93:6cc6 with SMTP id ffacd0b85a97d-3864ce54e5fmr442280f8f.15.1733864348810;
        Tue, 10 Dec 2024 12:59:08 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f5774454sm94941465e9.13.2024.12.10.12.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:59:07 -0800 (PST)
Message-ID: <6758ab9b.7b0a0220.3347af.914a@mx.google.com>
X-Google-Original-Message-ID: <Z1irmE4BWBl1jIz7@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 21:59:04 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 3/9] dt-bindings: net: dsa: Document support
 for Airoha AN8855 DSA Switch
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-4-ansuelsmth@gmail.com>
 <20241210204855.7pgvh74irualyxbn@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210204855.7pgvh74irualyxbn@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125910_901326_1D6C6577 
X-CRM114-Status: GOOD (  27.01  )
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

On Tue, Dec 10, 2024 at 10:48:55PM +0200, Vladimir Oltean wrote:
> On Mon, Dec 09, 2024 at 02:44:20PM +0100, Christian Marangi wrote:
> > Document support for Airoha AN8855 5-port Gigabit Switch.
> > 
> > It does expose the 5 Internal PHYs on the MDIO bus and each port
> > can access the Switch register space by configurting the PHY page.
> 
> typo: configuring
> Also below.
> 
> > 
> > Each internal PHY might require calibration with the fused EFUSE on
> > the switch exposed by the Airoha AN8855 SoC NVMEM.
> 
> This paragraph should be irrelevant to the switch binding.
> 
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../net/dsa/airoha,an8855-switch.yaml         | 105 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> > new file mode 100644
> > index 000000000000..63bcbebd6a29
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN8855 Gigabit Switch
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: >
> > +  Airoha AN8855 is a 5-port Gigabit Switch.
> > +
> > +  It does expose the 5 Internal PHYs on the MDIO bus and each port
> > +  can access the Switch register space by configurting the PHY page.
> > +
> > +  Each internal PHY might require calibration with the fused EFUSE on
> > +  the switch exposed by the Airoha AN8855 SoC NVMEM.
> > +
> > +$ref: dsa.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an8855-switch
> > +
> > +  reset-gpios:
> > +    description:
> > +      GPIO to be used to reset the whole device
> > +    maxItems: 1
> 
> Since this affects the whole device, the SoC node (handled by the
> MFD driver) should handle it. Otherwise you expose the code to weird
> race conditions where one child MFD device resets the whole chip after
> the other MFD children have probed, and this undoes their settings.
>

OK.

> > +
> > +  airoha,ext-surge:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Calibrate the internal PHY with the calibration values stored in EFUSE
> > +      for the r50Ohm values.
> 
> Doesn't seem that this pertains to the switch.

Do you think this should be placed in each PHY node? I wanted to prevent
having to define a schema also for PHY if possible given how integrated
these are. (originally it was defined in DT node to follow how it was
done in Airoha SDK)

-- 
	Ansuel

