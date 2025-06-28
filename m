Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F32EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IjCx//d1qx+mqfIPU3sajy9SJfXmPgvsGkk3PQ/Qvo=; b=VnmDRQJT6p2MUNmYsb1itKlWlS
	j4FC8pZ15yM0dKI+Gvwhamgx0CIJ4NcuhUdzomQvKl3vRWTp8Sp8dLlKQ+8Nws1EsejXx23U1Ne1/
	rY5tGjIAOcq8kqowljQaEcy6mOmhEiLHDW4HK6GkzNYCyDVR2s6pRGgOPIfdnsHSzqRu5691RX/Ra
	BxwfSUP1WURDdJDohJp1nNP7ijJkozfE3cM7pL3YVGyb/B7a4wRkxGprTgdru+R1sPGe+cFgUACTM
	9gszEQQqzkvSFQKziJDoztsFMXb1BuLcp/v80dJzxxECkFCskFT/BstAeJ7oNsBwh/ExmZD5ylvE9
	Hoq98ycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJac-0000000G5gs-0UTO;
	Sat, 28 Jun 2025 00:38:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJYH-0000000G5W3-2O63;
	Sat, 28 Jun 2025 00:36:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45377776935so3277195e9.3;
        Fri, 27 Jun 2025 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751070975; x=1751675775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2IjCx//d1qx+mqfIPU3sajy9SJfXmPgvsGkk3PQ/Qvo=;
        b=JfB/rOr2WGo7pwG6SfoxeGF0RcWtI+VjvZw+Kf1JKhoaq3Q6OTsQCc7Df4NOeackxu
         nhjyPovSEBZX2TCasprZaqZI2c1zyqfGHnx4P6RpqATfHWtvMCt99aRCSZORJgoO5Uhz
         QMrrBNHm51Pz8OfZHrveprq1xBlXlqhOgJ8jmo+fyV7kK+ILEa0s1CthA7taZHQqCuPA
         mlbBaMzT3VsmwtDfNVuQa64by5piYAN8jDCi/kgxSsA95jcjxhKdq7kYMgW7EkMRS4D2
         HbEbpXPtvMnK8nboqS1k4SNU0wruEBJZKxC1W57woIETMZSq+Z1G7f+SD5ElrwLCjHI2
         9nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751070975; x=1751675775;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IjCx//d1qx+mqfIPU3sajy9SJfXmPgvsGkk3PQ/Qvo=;
        b=U+0ToKM5bZpe6TJJcBh19GO70GMhVmGOi268InBL8mLuR70ZRBhzdG73ZEnX8PEIav
         1AU+GHc6fvYs8lxjN8oybhhpfD4s8Lg+27xiMX3yxACT591KGRjBxLWjUVBil3AMucxO
         6f5FL+xgYWAX512EP1xb/NlrznuacPcFlapKtb52D5n9Jwnukh3zJKZc1IhFSnX18HFj
         lenA3ZMYixh3MbBYhqtdodI6C5ZVvbbvd5HaSrnTdhTJDfSznfHt7m67F+bdPmY7MfAM
         21IZl5sMfTfhabUoBS6c75MBvtMAANXNzAxx4UO0jOYwCTy+tLFy94T+54tgv9ldWJMc
         Zv6w==
X-Forwarded-Encrypted: i=1; AJvYcCUPBEvjvVGaiQIQwqMF+SM65ondyOt9SYBpo4+NrKo3n6RvRXNoz4PjDiHxfHrOBQecUQez/Zp+sbw5EXS+91I=@lists.infradead.org, AJvYcCVLr4RBENctcJe7cmnJ6T/X/AcQ5w0tDjeJavwzULSrwuJIVyp/gqCCaXIvG65SGmKIxbWuA0TCD3HuQpVjcYIf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7MxSt8we+Wc4UuulaUd6KWYUYFytRHtPYKIUbudVCQq47++nX
	xpByLusWTtgyE1kpwHsYe8wPPwg6lqYTJzzO09/0QJ1gfP8WengIEJ0aC0+fuQ==
X-Gm-Gg: ASbGncvTDdieTP08lmNxMFF5aFn38/dRsjpDG0E/O8fgGT63xsCxbXAT1YyKXWYXUnU
	WDi4ZlHaDakmfo53mLnF3zjFDgYA+xCdccpwnQFr6OQwuPm5P/Wssc6Hct+O4b1tORCWcndoDyw
	+uhxkl/zaBcLS3O6uAog0IccJud4tfOxCmKRBnHigQe/8DCQKqU5Og7wg0bdVakoAXDnKwBKEaf
	C/pwKqHMsKrsieNwarG3x6VFJ6rqc1kaCHKapjuhrj00I/XN82lvnsXP3P4KxRUAcDoF/bLyfJJ
	7CyEPQ7se7yUbJHtowdoJ4er0r/W6q/RWGjbVFF9e/R4sm2Ys0A0krE3j327tPygOAOCVJxDb7j
	kiyVFtBLMRqanLuMyWw==
X-Google-Smtp-Source: AGHT+IEHtgdm3EqO3yYOzPZBoBm9oQn2yfor9srRlvtz2pBRLHW+QMm335DExTwAQ8ukAdcvDpliTw==
X-Received: by 2002:a05:600c:1e0d:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-4538edf0902mr66989185e9.0.1751070975337;
        Fri, 27 Jun 2025 17:36:15 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm99310995e9.40.2025.06.27.17.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:36:14 -0700 (PDT)
Message-ID: <685f38fe.050a0220.90fe0.c75c@mx.google.com>
X-Google-Original-Message-ID: <aF84-zuyPkn07ui4@Ansuel-XPS.>
Date: Sat, 28 Jun 2025 02:36:11 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v15 05/12] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
 <20250626212321.28114-6-ansuelsmth@gmail.com>
 <20250627214821.GA195510-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627214821.GA195510-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_173617_619361_25AE5FD2 
X-CRM114-Status: GOOD (  21.49  )
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

On Fri, Jun 27, 2025 at 04:48:21PM -0500, Rob Herring wrote:
> On Thu, Jun 26, 2025 at 11:23:04PM +0200, Christian Marangi wrote:
> > Document support for Airoha AN8855 Switch SoC. This SoC expose various
> > peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> > 
> > It does also support i2c and timers but those are not currently
> > supported/used.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/mfd/airoha,an8855.yaml           | 175 ++++++++++++++++++
> >  1 file changed, 175 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> > new file mode 100644
> > index 000000000000..a683db4f41d1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> > @@ -0,0 +1,175 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN8855 Switch SoC
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: >
> > +  Airoha AN8855 Switch is a SoC that expose various peripherals like an
> > +  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> > +
> > +  It does also support i2c and timers but those are not currently
> > +  supported/used.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an8855
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  reset-gpios: true
> > +
> > +  efuse:
> > +    type: object
> > +    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
> > +    description: EFUSE exposed by the Airoha AN8855 SoC
> > +
> > +  ethernet-switch:
> > +    type: object
> > +    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
> > +    description: Switch exposed by the Airoha AN8855 SoC
> > +
> > +  mdio:
> > +    type: object
> > +    $ref: /schemas/net/airoha,an8855-mdio.yaml
> > +    description: MDIO exposed by the Airoha AN8855 SoC
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mdio
> > +  - ethernet-switch
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    mdio {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        soc@1 {
> > +            compatible = "airoha,an8855";
> > +            reg = <1>;
> > +
> > +            reset-gpios = <&pio 39 0>;
> > +
> > +            efuse {
> > +                compatible = "airoha,an8855-efuse";
> > +
> > +                #nvmem-cell-cells = <0>;
> > +
> > +                nvmem-layout {
> > +                    compatible = "fixed-layout";
> > +                    #address-cells = <1>;
> > +                    #size-cells = <1>;
> > +
> > +                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
> > +                       reg = <0xc 0x4>;
> > +                    };
> > +
> > +                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
> > +                        reg = <0x10 0x4>;
> > +                    };
> > +
> > +                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
> > +                        reg = <0x14 0x4>;
> > +                    };
> > +
> > +                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
> > +                       reg = <0x18 0x4>;
> > +                    };
> > +
> > +                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
> > +                        reg = <0x1c 0x4>;
> > +                    };
> > +
> > +                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
> > +                        reg = <0x20 0x4>;
> > +                    };
> > +
> > +                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
> > +                       reg = <0x24 0x4>;
> > +                    };
> > +
> > +                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
> > +                        reg = <0x28 0x4>;
> > +                    };
> > +                };
> > +            };
> > +
> > +            ethernet-switch {
> > +                compatible = "airoha,an8855-switch";
> > +
> > +                ports {
> 
> Same comment here.
> 
> Why do we need 2 examples of the same thing? Isn't this 1 complete 
> example here enough?
>

Do you prefer if I drop example from every other schema and keep only
this?

And with this change is it ok to keep the review tag?

-- 
	Ansuel

