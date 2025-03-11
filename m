Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1D8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBYt0BHsxul+nTaYflhpms2js1nZoTfEFczz9ZKES00=; b=q12bCnGTFLKgmkI9pcB8f6dXha
	QIDT/kLzbbxl+iF4RKZBbhwkI79tL6jq/T8eBgXIPcTVfzLi18tijayhCc9ezPDrkruNHmv8t6jjx
	l80VK8ntbzU4fB0w+gM7gGKudMh7gJ4eXAirJVhWuw59vjo1/2/zogTYLAjN9yVksneI9okfKrH5h
	0t9CHvNOrmWqhQpft0Ow7+rBC6o+MMAgDkjRuJhExVsJjfLi/Zp39zHYM0keBUJNFbZFnoUQ7JcCy
	iSm9smGnsA+Ubu7zS5Kz6apNbU2Y4Iw5ZGlrlWxJp62OIA5p43qFwVAwcfH6Hs8CBz8DM1i2CXbky
	+TEwF3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts51V-00000006kF4-0Z05;
	Tue, 11 Mar 2025 19:12:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4yQ-00000006jkE-1QCo;
	Tue, 11 Mar 2025 19:09:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so28177225e9.0;
        Tue, 11 Mar 2025 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741720144; x=1742324944; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QBYt0BHsxul+nTaYflhpms2js1nZoTfEFczz9ZKES00=;
        b=HG2JOsojHKTy6obaiyCsNrhfRJxp/6d8S4KVQYWy6teC9UtxISdY9CEeG/C/Or1gOG
         j0Mu9z05svFcmjJyQbI3HSubZGNj1WWFw0wuBG63BHYugu93T1a3iTpugeJMyzkw9fqG
         pYVypnyGciYrY83jg0NKjT3omq3g0DaP3eCIeRsGKStXtD+n7VwEESVoksNrHs4d3DZK
         4gTX9naGI+wdaZwv6Aw1XJK/PcJ6jRAzfjiYttLHCtwwIbwNRBvVxZ+12Enk1hI7onOl
         bgNO465YXUc0mZdj5FHlhW8YDU4DN1U80/wyUqBTeX130WNUpTT0/N40Iz6kERdtbRS4
         XJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741720144; x=1742324944;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBYt0BHsxul+nTaYflhpms2js1nZoTfEFczz9ZKES00=;
        b=RoYv/mQ9Gpbv+GfGsI5fKB0mFM5n7pxM5fz1xfTpErHyRPRpw8/9NCSb9JLB72qjSo
         CDbA5tAG3BLJdQtt7jzMUYnZndw6MCxu6RYwZwgB6bWj9tyrauS5ENHjc6OZKlU0FhcS
         C98Z62fYYrQqiQI2/a+NL6Dc+USHYBcseVNVsdjAyvVRrK+k/ECrHGysmFOKL/zZcWe4
         29Zyr05NC0YtrlbIunpPc20pHDU2v8wNSXRHor8PrHv/xqkaRhqivNfSayz3LkczgsSV
         yjEDxtSM4u0pC7uo/OPDNuvuA+AQot+sVq3Ot5HS/QQl0K3iXUP4cmQNnR90b73D83sV
         xR9A==
X-Forwarded-Encrypted: i=1; AJvYcCUjFrGidooe4v9slQnG0i65va0JKaeqIs0/li4nRqav4KR8accMGNZjrLHfDq4Ey7HzELSkM7+/Tf8R@lists.infradead.org, AJvYcCVJ15VbGGWaocU6LwTM8IYnKSKhtQ4vwHLXrNb/QDDrfGuOv4qQ5LlYGL1FSiO4ndfkV3mYOzn61GXBhyD6/rM=@lists.infradead.org, AJvYcCXuoA8+YQwV6ZnpUp2777ILBHF8qAcwQYf8Oq37KcFKSEpJMyTFxAnMnWgjrYcgZ5vLvuo87mmMMldj+pTf22X4@lists.infradead.org
X-Gm-Message-State: AOJu0YwylrupkSkzdcGlaDpSxLbEufOR6FxIzVBPsIZNIco7IvIgpqFw
	FWQkw1+/Td/KE51fNEWYSVZkDzsuTL6P8Vvvf/IPQRBqzia0dQyA
X-Gm-Gg: ASbGncvCJurJM9eovoZRc8ejCP1/ZrgscPJhMJzfPtHXwmr7spjoUcmy5pXsIUDc1KH
	sHVzVK0ZYqiwEb+yBNrYwk442OTuRzxdp8ZRDCv7JJrgoTz5Q6Ir0qicPlrD0bBAJEo9adW5vbi
	auk2ytUH00c4IksWpRn2u1MtSrbeTU3lN8cjWoGsDVBhdgRHlcNaEize4GpDnjK5Qf/QmTPBH5b
	hEeTm5ANz7npuqYJ9jnGlUU+/c5QDDFBEX/iqPnmj9MXfC1nnKOqM59hzHGDUPsIfpoFMPIAIEt
	XZlsZV055nfQoCA1mp6MUd5huItLeqQsI5d4EB8362ZXaQaP/GLliSvcqWhPGrIg078hFCulg4b
	yUPlqCPVOyzSh
X-Google-Smtp-Source: AGHT+IEVvLB1J5PdZXBMZwLdi5Sfx5U8w2F5CDI5YD3a5o/Tqdo42jSaYp7CF55JMp1UKEuKA0N/8w==
X-Received: by 2002:a05:600c:5618:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43cdfb7e4b1mr144023345e9.25.1741720144407;
        Tue, 11 Mar 2025 12:09:04 -0700 (PDT)
Received: from Ansuel-XPS. (58.43.196.178.dynamic.cust.swisscom.net. [178.196.43.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf7c8249bsm81906155e9.7.2025.03.11.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:09:03 -0700 (PDT)
Message-ID: <67d08a4f.7b0a0220.8fe9e.44fd@mx.google.com>
X-Google-Original-Message-ID: <Z9CKTrERYllmbczJ@Ansuel-XPS.>
Date: Tue, 11 Mar 2025 20:09:02 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 05/13] dt-bindings: mfd: add Documentation for Airoha
 EN7581 SCU
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-6-ansuelsmth@gmail.com>
 <c1227083-a4ea-4dac-a9db-d6a5386c0437@kernel.org>
 <67cec328.170a0220.27ecbc.9c6e@mx.google.com>
 <026296c8-a460-43ca-a423-0fa38269fbc2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <026296c8-a460-43ca-a423-0fa38269fbc2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_120906_379461_98135464 
X-CRM114-Status: GOOD (  53.16  )
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

On Mon, Mar 10, 2025 at 12:41:06PM +0100, Krzysztof Kozlowski wrote:
> On 10/03/2025 11:47, Christian Marangi wrote:
> > On Mon, Mar 10, 2025 at 10:21:45AM +0100, Krzysztof Kozlowski wrote:
> >> On 09/03/2025 14:29, Christian Marangi wrote:
> >>> Add Documentation for Airoha EN7581 SCU.
> >>>
> >>> Airoha EN7581 SoC expose registers to control miscellaneous pheriperals
> >>> via the SCU (System Controller Unit).
> >>>
> >>> Example of these pheriperals are reset-controller, clock-controller,
> >>> PCIe line speed controller and bits to configure different Serdes ports
> >>> for USB or Ethernet usage.
> >>>
> >>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> >>> ---
> >>>  .../mfd/airoha,en7581-scu-sysctl.yaml         | 68 +++++++++++++++++++
> >>>  1 file changed, 68 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
> >>> new file mode 100644
> >>> index 000000000000..d7dc66f912c1
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
> >>> @@ -0,0 +1,68 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mfd/airoha,en7581-scu-sysctl.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Airoha EN7581 SCU (System Controller Unit)
> >>> +
> >>> +maintainers:
> >>> +  - Christian Marangi <ansuelsmth@gmail.com>
> >>> +
> >>> +description:
> >>> +  Airoha EN7581 SoC expose registers to control miscellaneous
> >>> +  pheriperals via the SCU (System Controller Unit).
> >>> +
> >> One more comment - there is no such thing as "sysctl" in your hardware.
> >> Look at the SCU binding which clearly says that it is the hardware you
> >> are duplicating here, so the "System Control Unit".
> >>
> >> So you have existing "This node defines the System Control Unit of the
> >> EN7523 SoC" and you add one more node which defines the "System Control
> >> Unit", so you have two "System Control Unit" device nodes?
> >>
> >> Look also what Stephen asked for:
> >>
> >> https://lore.kernel.org/all/20220106013100.842FCC36AEB@smtp.kernel.org/
> >>
> >> so how system-controller can now became clock-controller? Now, it was
> >> the system controller since the beginning.
> >>
> > 
> > The main problem here (and we had a similar problem with GPIO and PWM)
> > is that the Vendor (Airoha) wasn't so bright in placing the different
> > registers for the SoC so we have case where everything is mixed and not
> > one after another... 
> > 
> > Example we have 
> > - CLK register part 1
> > - Some bits that configure PCIe
> > - CLK register part 2
> > - GPIO
> > - CLK register part 3
> > - ...
> 
> This does not explain that binding said "This node defines the System
> Control Unit".
> 
> So what are you adding here if not SCU?
>

With "This node defines the System Control Unit" I mean, the entire
register space of the IP block is defined and each child specifically
define each part of the IP block.

> > 
> > The driver solution for this is syscon and the simple-mfd node
> > structure.
> 
> Let's keep driver entirely separate, we don't talk about them and mixing
> arguments won't make it easier.
> 

Ok.

> > 
> > Now the main problem is how to modle this in DT. There are lots of case
> > where the simple-mfd model is used (like the one proposed) but probably
> > this is not accepted anymore. But again this should be clearly stated or
> > we have a chicken-egg problem when other devs implement similar thing and
> > have to implement simple MFD driver to handle this. (and driver
> > maintainers say "Use the simple-mfd model like it was already done)
> 
> simple-mfd has nothing to do here. Describe the hardware - what is the SCU?
> 
> 

As I said below, SCU is just the name used in Airoha Documentation for
this IP block. In this register space there are multiple things so it's
not strictly a clock-controller (as it's currently defined)

It was proposed as clock-controller previously as we weren't aware this
IP block was used also for other usage that a strict clock controller.

> > 
> > For this specific case (and to give an answer to the clock patch after
> > this) the problem is that this register space was originally used only
> > to control the clock and I wasn't aware that it was also used to control
> > USB. Now that I'm implementing support for it, the disaster happened.
> > 
> > So In short SCU is lots of thing, both a system-controller, a
> > clock-controller and even a reset-controller.
> 
> And you have bindings for that already. Done.
> 

It's currently defined in DTS as clock-controller, should we change it
to system-controller to make it more clear?

> > 
> > To make it short, 2 different solution:
> > 1. We can keep the current node structure of the node-controller and add a
> > child node for the SSR part (with a dedicated compatible).
> 
> No, you do not add child nodes just because you want some drivers.
> 
> What is SSR? How is it a device?

SSR is the name used in Documentation for the register used to configure
the Serdes and PCIe port.

> 
> > 2. Those property need to be be defined in the clock-controller node?
> 
> In the SCU node. Do you have only one SCU or more?

Strictly speaking it's one register space. One clock-controller, one
reset-controller and one set of SSR registers, and from what I can
understand it's ALWAYS "One device/compatible for Register space"

The simple-mfd pattern can't really work for case like this where in one
register space there are multiple stuff.

Is everything clear now?

To summarize:
- no child nodes
- add additional property for SSR in the SCU .yaml

> 
> > 
> > The ideal solution is 1. Does it work for you?
> > 
> > Sorry for the long post and hope you understand why this mess of
> > reworking the binding.
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
	Ansuel

