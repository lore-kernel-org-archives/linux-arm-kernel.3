Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AADEC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5DEa09wiscb4LqtVRJpNAy3hWViEqi+/FfXF2zENFo=; b=1gLSDwgTcqURg8c8PbRaxOVvuH
	r5MoZAO+H0/s4RD6UqAFUuLOJWBwBqM5gNYQs+vPdFCGmvFVL1noYh3g2ukLjI3Lr4psticIwWTGH
	2jhr2iDnzx996jOchEKjfPyKTkjN63bbRLrO+dvwi2VfwmogXEuh+YU8hJmZ8hHUwCngpT2aUBiTQ
	rY6us85LmuYTEt6lt5ZWRMUdQFF4Kj2+huQATBBGb3hGgZwMnFCb/i3d9dEBJvLJC5EIbNoXsKx/G
	jKIKtG9EbdjGzZciaPftFTqjFkWPWTQVOsIHCL9isLKbgFWc3nqhxtufNupNUOM/TPPQuH/KEZWUg
	HU0g9tXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trb3H-00000002O4W-35LO;
	Mon, 10 Mar 2025 11:12:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traf5-00000002IdW-0jRB;
	Mon, 10 Mar 2025 10:47:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso3275666a12.2;
        Mon, 10 Mar 2025 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741603625; x=1742208425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l5DEa09wiscb4LqtVRJpNAy3hWViEqi+/FfXF2zENFo=;
        b=Cx5cYPcnCGGMfNcMBtb5XE3jwCyf0u3ODuhUInmhbMWOjUtxgcuXPPs/I9zur0EN/E
         fGCPZQ2vfJ5BTWwcxgmGCKl1/WMapbGJ+APvHfA7pBHOVHsfvGRIPd5C5B1RZ3+H/Fa+
         MCC/VU0djcX3wDFc/gYduQppkHpeNL4EeFMNe3rsaRcGRAEVZc/sE8iyQofxU9YdJRGY
         ykbdTNo5fgsVr99twblkXhw2KOv3I1Ear+Xh0l4wr1+aXOFHrWa/mfoIy32qyD2C785d
         b5P5RzOvf0Cd1KL9CiO+QdQaw3UUnyj5jjhSlXKZPnms69GoghISHShrfEuCRhLFoCTF
         Ks+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603625; x=1742208425;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5DEa09wiscb4LqtVRJpNAy3hWViEqi+/FfXF2zENFo=;
        b=f9ybJapv8YqNNhKS52fHtSB+60eaehnCcYE30242tn9FBNNms4D24EHC2pjxxp1ATE
         z/qNvjWha+YMzlJxuOhLJ2UraPrizoTqi25pX0NUrzhNpb/ryeL2fd1FRvWjpFcUq1mf
         xWsMzweyDWoEOmZk6JVbr5MaL24y7I+ntw4nSoxFSe8vVj0UVSdG6GsEFuIQgjUAmbJS
         xwvoe7rc93qHbygk40xbz5maN6HFYYzfDtLAM0sKyQh/+MjHkQoigzHUICwE90cKLiNT
         htiWSSKk+hA1DDTQ8TjFaUzE9D+Wyrrx7XXYP4Yg9wOhx/ospbvKcqxERX6AoVR/6HgU
         +A0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8eE+YVkB7+5AKYaSv4YGBpwiSs5fsuqeXPPsxQpDkLVWgCGTRH0yCH+M7ep4hdpa+ylxGPBBcY020MIMRB0k=@lists.infradead.org, AJvYcCWRRaapixFeNsWsXa8dpD4jujV/wuvvbS531yqL5m0u50CQjIPoqdW+gFXxdUGHAVTnf8KZa3ujJSXf@lists.infradead.org, AJvYcCX+uNrLgeHAi7NzM4XXikBIabLaO/abTeZjjv+jq6AsTaTexqDqewyS8pT7mSIUKd+R0Rmc+kzac+aBhOrXR5gQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4sn287jILyat7HG+mE/2zCxutwnHNwJY8hS15MG3Cer2nakE9
	uNuZcpssRbdolzD5FGJWyAMTbKlpskVFJ0gSTR9p8ulcnTgGZS6K
X-Gm-Gg: ASbGncu+BvR/DE1EJjnoi2YjtJ04KTwhL+B8opbQyw10z8sM467ucuwbUCTofj8/u9i
	jYc9v7Oc4pVk0hz1qz7a9uBhQacByZBi+VVbiABYlBiK3INUge8wN9CuKvmXvNAZswDFolmd3rC
	uFFpZid2yxFNBi72yrSUOWos3+SIIvakCD4Jtog+csjqQ2K+iRgO6Ekf98VEy8EyZQuHzIC8ZAi
	nBV1BwkQKFbeaNLmsloqFJrVBbHC1rZcg3jlo6OwfZdInPgX181VRqxwyq3UOVQLtdBmE2shLhR
	HzM/alZSSmNJx11ho0jLltJ77m2v+F6/MgxpA+Ds5g==
X-Google-Smtp-Source: AGHT+IGY9ZNuN9LrERXjHUYAwL4h4LC1ygOPlOz0b6pfTQ2hSZ2sXX5rhh5cw2fWoVRERYPwHIfVrQ==
X-Received: by 2002:a17:907:8281:b0:abf:67d7:7816 with SMTP id a640c23a62f3a-ac2525dceb2mr1171265566b.3.1741603625111;
        Mon, 10 Mar 2025 03:47:05 -0700 (PDT)
Received: from Ansuel-XPS. ([85.119.46.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943d8absm742184666b.20.2025.03.10.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:47:04 -0700 (PDT)
Message-ID: <67cec328.170a0220.27ecbc.9c6e@mx.google.com>
X-Google-Original-Message-ID: <Z87DJANlBejnqJHR@Ansuel-XPS.>
Date: Mon, 10 Mar 2025 11:47:00 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1227083-a4ea-4dac-a9db-d6a5386c0437@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034707_217125_2E241F12 
X-CRM114-Status: GOOD (  33.49  )
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

On Mon, Mar 10, 2025 at 10:21:45AM +0100, Krzysztof Kozlowski wrote:
> On 09/03/2025 14:29, Christian Marangi wrote:
> > Add Documentation for Airoha EN7581 SCU.
> > 
> > Airoha EN7581 SoC expose registers to control miscellaneous pheriperals
> > via the SCU (System Controller Unit).
> > 
> > Example of these pheriperals are reset-controller, clock-controller,
> > PCIe line speed controller and bits to configure different Serdes ports
> > for USB or Ethernet usage.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../mfd/airoha,en7581-scu-sysctl.yaml         | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
> > new file mode 100644
> > index 000000000000..d7dc66f912c1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/airoha,en7581-scu-sysctl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha EN7581 SCU (System Controller Unit)
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description:
> > +  Airoha EN7581 SoC expose registers to control miscellaneous
> > +  pheriperals via the SCU (System Controller Unit).
> > +
> One more comment - there is no such thing as "sysctl" in your hardware.
> Look at the SCU binding which clearly says that it is the hardware you
> are duplicating here, so the "System Control Unit".
> 
> So you have existing "This node defines the System Control Unit of the
> EN7523 SoC" and you add one more node which defines the "System Control
> Unit", so you have two "System Control Unit" device nodes?
> 
> Look also what Stephen asked for:
> 
> https://lore.kernel.org/all/20220106013100.842FCC36AEB@smtp.kernel.org/
> 
> so how system-controller can now became clock-controller? Now, it was
> the system controller since the beginning.
>

The main problem here (and we had a similar problem with GPIO and PWM)
is that the Vendor (Airoha) wasn't so bright in placing the different
registers for the SoC so we have case where everything is mixed and not
one after another... 

Example we have 
- CLK register part 1
- Some bits that configure PCIe
- CLK register part 2
- GPIO
- CLK register part 3
- ...

The driver solution for this is syscon and the simple-mfd node
structure.

Now the main problem is how to modle this in DT. There are lots of case
where the simple-mfd model is used (like the one proposed) but probably
this is not accepted anymore. But again this should be clearly stated or
we have a chicken-egg problem when other devs implement similar thing and
have to implement simple MFD driver to handle this. (and driver
maintainers say "Use the simple-mfd model like it was already done)

For this specific case (and to give an answer to the clock patch after
this) the problem is that this register space was originally used only
to control the clock and I wasn't aware that it was also used to control
USB. Now that I'm implementing support for it, the disaster happened.

So In short SCU is lots of thing, both a system-controller, a
clock-controller and even a reset-controller.

To make it short, 2 different solution:
1. We can keep the current node structure of the node-controller and add a
child node for the SSR part (with a dedicated compatible).
2. Those property need to be be defined in the clock-controller node?

The ideal solution is 1. Does it work for you?

Sorry for the long post and hope you understand why this mess of
reworking the binding.

-- 
	Ansuel

