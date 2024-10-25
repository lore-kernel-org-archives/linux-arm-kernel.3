Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404D1D149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdZgAeQbXwDS7g4GyXvG4yiWM59tpYiPm04+9PqDW4I=; b=JQcwfF/4n6XkGxZ7LQj9r4MCpG
	bCaYazP95zH73twDEj8dujwihUKM51ZOXLMY/9afVeTLZPw3bYXuVHI5ib9gy6qeEl9+B/aDYkmGH
	iPPIKSFr1KSSh4P+hKd5txjmu8M1yZJBfixh1VjLztmU+xCuCisWs6+DbBMzAjTFLrRMwIveB+4R+
	2ZuCwhw3RmPeiGMDtB4B7kgYhkRPzvj7F6nI2v71jH9jOxQqsmhTGOjT0czkQMZR6obJpb09tMjGU
	Ds0aW5jvVOZTcXPumN7qhCFXiXHA/r5Im2OaawOCNDl6AC/zt5c7ttXk63OfSOQ/EyEq2U8kmNIe3
	0ExPa4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PXH-00000004sdW-0hfh;
	Fri, 25 Oct 2024 18:59:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OxM-00000004mXF-0HUe;
	Fri, 25 Oct 2024 18:22:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cd76c513cso21992945ad.3;
        Fri, 25 Oct 2024 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729880558; x=1730485358; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CdZgAeQbXwDS7g4GyXvG4yiWM59tpYiPm04+9PqDW4I=;
        b=Z00i8ixt67PMw0OTxYuD1uqomwzYywYv94cD4d3Iq4IxSE6IxFG712hKk5Nbw5ewRX
         Spc3aMzebTMkZVdVGZkVgjxhcjvdn5FAkIUvBQUJNccwMZEDIdoJnkc6KZeTEnpjPOLp
         rtk4W1M8verhmWhOW7nKjsrEyzEhUJYf5rCdMac2dqrEBQvmvUVbsiQP39xq6p9Gv7/T
         gkvibR0gENkw51XGf3VyDK+ZKO2/AgROtDncbrHKGkK69wFs7zxPDV3IIXUCx461c4UR
         3K5aHMTSTEUyTHnvyC5O8T9tOyhE1GT0riX0Pf/ERXhEsx0RlgknB1Rc3MyiTYrRfR7b
         tJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880558; x=1730485358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdZgAeQbXwDS7g4GyXvG4yiWM59tpYiPm04+9PqDW4I=;
        b=a1tBbSvG+A1yejsU/B4Sgux2gwmk1qlVyu1RbodIOWzL0EZYyYHClSNv34YUUaUAvO
         eZ7NPOrIumhOoweNn0xiFKgAsAidbFB3XlKR0zKeyTpRXXWeM2Llb7aoW13+O6/RfxuK
         14Qa+SUzz5gsUoxCpxsoUtlU/CBxXyfFkFN6qBxtg0ZwEaXke79RCvD/TBjpUvw6XviM
         oi5I2LHVZpGdCiXU4AInetiqBvqpbvTjSnIYvc7LVLNQgl5mslTwNSNldy3/dJP3cE8M
         8/MMOmXBVP5vmWfB6KrnVQJoDrXGca/gVy1uBTOf4XPb09V0WtcWfONK5MDI4Dq6hVTy
         GsTw==
X-Forwarded-Encrypted: i=1; AJvYcCUaZ1Ot+oNH1xI7X13XDWVISU2iktLTXCQwvsadxm7U8rZH/LzQIbeD1Ks8Oc7ttGQaMDQhrs7U6F9yY1f2r1Tgvg==@lists.infradead.org, AJvYcCXpQPCcks37OdWmVKXcTb/4zdgsvGGvJXK5H4NwTE6/lXrn5j62xI6FirBwQ3NpZPl/Y9Cg1gQ6LScQoOUCCoV8@lists.infradead.org
X-Gm-Message-State: AOJu0YwiatR7oYOp/p1OdWtGCaEORn0b6W/sYrsConNEiwl6XFpXs50c
	1sbJTC+o+Jtbt4kOnv1AOJMw2Z3DYLqadqN1WTes5KBFVrWzp3xE838bM7VE
X-Google-Smtp-Source: AGHT+IECgj/DRT4MIRpjfxiNTH0AcYMnjzisn+25RaTmGnxcNSh6nxoiQDFDrmRc5aFmXn9tiE4VBQ==
X-Received: by 2002:a17:902:e951:b0:20b:6458:ec83 with SMTP id d9443c01a7336-210c686c57fmr1051845ad.4.1729880557787;
        Fri, 25 Oct 2024 11:22:37 -0700 (PDT)
Received: from Emma ([2401:4900:1c96:f151:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc043d13sm12038805ad.233.2024.10.25.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:22:37 -0700 (PDT)
Date: Fri, 25 Oct 2024 18:22:28 +0000
From: Karan Sanghavi <karansanghvi98@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexander Aring <alex.aring@gmail.com>, 
	Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v2] dt-bindings: soc: bcm: Convert
 raspberrypi,bcm2835-power to Dt schema
Message-ID: <zaqykppssizdpd2mynpoatp4smbzkr7atuurxkkegbegk5dw6s@a2daqovt2aod>
References: <20241022-raspberrypi-bcm2835-power-v2-1-1a4a8a8a5737@gmail.com>
 <lfzxcilud65ype66frb7eihq2hvranzxp6fomjvjyxvciiixlj@2efv5266wt5r>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lfzxcilud65ype66frb7eihq2hvranzxp6fomjvjyxvciiixlj@2efv5266wt5r>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112240_137583_B87BAA29 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Oct 23, 2024 at 09:12:53AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 06:17:03PM +0000, Karan Sanghavi wrote:
> > Convert the raspberrypi,bcm2835-power binding to Dt schema
> > 
> > Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> > ---
> > Changes in v2:
> > - Added original file maintainers
> > - Removed unnecessary headers from example and formating from description 
> > - Link to v1: https://lore.kernel.org/r/20241019-raspberrypi-bcm2835-power-v1-1-75e924dc3745@gmail.com
> > ---
> 
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/bcm/raspberrypi,bcm2835-power.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom BCM2835 power domain driver
> 
> Drop "driver"
> 
> > +
> > +maintainers:
> > +  - Alexander Aring <alex.aring@gmail.com>
> > +  - Eric Anholt <eric@anholt.net>
> > +
> > +description:
> > +  The Raspberry Pi power domain driver manages power for various subsystems
> 
> Drop "driver"
> 
> > +  in the Raspberry Pi BCM2835 SoC.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - raspberrypi,bcm2835-power
> > +
> > +  firmware:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> phandle to what? Missing description.
> 
> > +
> > +  '#power-domain-cells':
> 
> Use consistent quotes, either ' or ".
> 
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - firmware
> > +  - "#power-domain-cells"
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    power: power {
> 
> Drop label. Node name: power-controller
> 
> I don't think this passes tests because of this. See power-domain.yaml
> schema.
>

Below code is from bcm2711-rpi-4-b.dts decompiled from the dtb file.

firmware {
         compatible = "raspberrypi,bcm2835-firmware\0simple-mfd";
         mboxes = <0x1d>;
         phandle = <0x1e>;
        ...
};

power {
         compatible = "raspberrypi,bcm2835-power";
         firmware = <0x1e>;
         #power-domain-cells = <0x01>;
         phandle = <0x0b>;
};

I had a doubt that as above the raspberrypi,bcm2835-power compatible node
is defined with power keyword, so should I still rename the node as
power-controll or keep it has power?

Also it does passes the dt_binding_check and CHECK_DTBS=y broadcom/bcm2711-rpi-4-b.dtb
but does gives the message as
soc: power: 'ranges' is a required property
so do I need to add the range property here?

> Best regards,
> Krzysztof
> 

