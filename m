Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA0C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GL9W4iPI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0m37OO+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=; b=GL9W4iPIqqrbJQl7qfmy6RLQh6
	ZDgDBhbcC+B3n4gKyljoQ6/NL+Uo1VGymrGlJ1tWg6fuXD8qmD5Su0gxdVwIDTuillg1cRDxQ+B1f
	BaCqq8mzIAEkl/YWUuN89syzYx562oXypD/kxDP29fJL25TJrYYcQO4A4R+ZAS2RtT3RqkwvByYB8
	0jwnyJ58G0hOpanWGt9xdoHa6MxDUHl5dfm9HA+aC8SRNJOUHRey+06TjUFiU/T/6u8aYmbVE3VUN
	dxsNbbe6LjlUrKXqmFL/1v6s+sf9fpBmJJGSKx0jmzTVS11c9dqHiH01X3DFQ2SEsSWUcLo0OQgS2
	cF2y0cVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyUb-00000000I4Z-1xJC;
	Mon, 02 Nov 2026 20:18:57 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNyUX-00000000I3O-02Fc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 20:18:54 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5365d26ccbdso49839561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 12:18:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650731; cv=none;
        d=google.com; s=arc-20260327;
        b=RT8heW00ACsXGLQvVz8S3sEmiP2yADhp93Gh2/1AiXDJQBVYJ6ovHi4v4PUWiwsYGT
         bsJFFLDE2tGOzRIvUajcgtJ41YwPmlEnTeTGBlXyUrnSigToRv8nNRUrI+L8seEas63O
         WCdtXFS3TMn4X/Z6tEOObT2A5Bk/MeIgy5QVWN2s2N4Iyw7i4W7c3U4qF30E3u+Hq2VG
         S2EjW5bSFqZnHFdYKF5KQphKR/iP7BhTqoAdw4GWsMfmSVGRoN1J4Grpb5OBqPYfDhHj
         p/bY/eXhs1jIY5SR0Rpb/VAfYAsYZFa+02jxnYEV3MDjUcPp7b1kqJdPXWebd8jIz3wO
         gMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        fh=MmaKcG76CBCaHveczw5TIoEExovUHbUbIsNu4cGi8sg=;
        b=QYqYBuC0i6e9hEzXFAKxsR0B9JX4K41yseC7z/mgT2AgSQf1hNzzQzCUI48voOCRM+
         PXjpiL0BZNPKaPRxNU//c4Sm+JzaMNno7JY+qE01FKa4L0Vuuwbl+p8wngvUso9AubZ2
         oCoO8VHnCgR65rFeBE44bvR/1MnGnwAVcoz0t6Wb9109JGUD/2RjirD0928F2oWX3MWw
         sB4HeQe2X6wLSEPtAj4t0tv6CFUglGvxhG82Bkjn2SG7dIFgh9U0PolIl8vXeaBuYdRH
         QmI5gxB/P1LZP4gEB33zPWpFs0SrYGt6b8/eAS7SMYvq4vVf4PipgpgnisVjdqCmhhXY
         zVNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650731; x=1794255531; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        b=0m37OO+t+Tilni9S0BiVwWlMTzB85v6ZrrKw+iydxIUqZ2k1ayAQh4SO04Plz7pn4b
         +YbZ/XboitHDwf8aNwZfK+oBF7zb+R7sWq+KFb3Uxz+j/mINBPH5T/mr9hRk6d3G+5EF
         Od3W9jTDPbwx6mzCwZHUjZDspW4cfIv0R+ga/u1cLOQd+Pb66dMS7nufjUoBhAhXPpgp
         XbplyZs33YFxabdRpTWKa0OMDVMfDdxR5xLhl/zgDmdEwC2wnvv12Vz/XLmydkb94tBC
         Lss01qB/bsXCtVft09mUJWgmeC5L28XpzeCqvR9btphaXI8IqI0T0N813qZrDryoy/3u
         mHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650731; x=1794255531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        b=dIyzQsguP32rKxtvQds5INRKbMH1hHeGG1T7bIGVnwlRthvrwmIaaYjpYl8ETL1SQb
         9BCaZlk3W/1GPr7jmP23flfpGgbWZZJqESSaskqh7Ie5dpfxG0z9kqoTMhwMdF5ID8LO
         UGqBJHCwRPqSGUvELlV8X1kprEXMaMsxi1jymWAzLhjEvMGQR8khhUycCoUhRxD0W/Hx
         m02kNR14cSiXNAeQG1aXR0XBLmR5QqZRyUpEOQqUOV8akFR/NeAvI7JUapOoKRNBc9Ye
         w+gJ1BUDAqfA2LsKBKZzlHaUPujsVnNlZ3pfnmKtxx2BWo8j5S1/MRGNcTum+YsZFMDo
         +eMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGtOtHr48b4Bd2pTntF3D3KPzYhawdh7bSGiSwgiIL0Yi1LlYWgdR2770CXtyEhuOnHc/twFQkNG54GdMTlwvD@lists.infradead.org
X-Gm-Message-State: AFq9FYLtz0HEVsOii2zyha16XcnB9FJ+Iv6qXZ4p/iYO0dazhDmldGNm
	hQSBflVOjFea8k1Q+KrZgrYAV4MF/kOB1XRyvT2H8jhNWidl9dvQF3iARJ2spRD+fGy4pq71dDm
	Wl1CaGacAUtyRtSE4BBRpyBMg+020rZ8=
X-Gm-Gg: AYBFou3hgZosaG3hJNq/CXQXCEpId+RZ/h0YPTlDI1tx3qUji/YZQCJz+9ShywEUaww
	SUpgOvXi/S5ZCJ6+REEc03e7+0lGe60v6yF5cvs01S7w5ShLbd6JgCEg6Rp1D8CLfe4U+PA2dL7
	IRxE01ncXIPr7pCjLaayqxd2fm+2JkPwOuOF4h2sV5vg0cdodqiezIJYEmLHmr0f20hEh0DsUsq
	IofSRQQGxkG2n5wS2wj6okfJDVYOTrPXGxTTSwSoC4L+j4EtoQKbE9AgQKWODQV4cWCkZCjjQ8A
	gaJPtjdIlikqX50NdjEV0QWg910EahH0L57iUlNwZHptXKOWdlSTD7pb8scks5qyzubei11taGu
	tYBYTOH+fCiXhfL4EuDAcWOQNXvpW2BDr7EFnXM6f1+qboEfp6uc9aPSiIRDYM0ronMu6rj8Kvw
	JlMYEouxtbCCcIQWYsjNLIEccW3XwoMIwxWE0CdFi6KnIqMrQW6xTbdoXRzefXhAVJ11P+ZIh3S
	CpIz9HOUgKjxbGftHAvvuXN86l+iZdtWr4=
X-Received: by 2002:a05:622a:2510:b0:536:72b4:b835 with SMTP id
 d75a77b69052e-542b7141e17mr189658521cf.46.1793650731219; Mon, 02 Nov 2026
 12:18:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
In-Reply-To: <20261102-email-target-d3191584d234@spud>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 2 Nov 2026 20:18:38 +0000
X-Gm-Features: AclHuK9-yjv7ad1RizN3tUZLE_u9kHWCoEZqwdsahJwce9NtT6g6vb4WuuUHq4E
Message-ID: <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
To: Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_121853_060030_2E3571B5 
X-CRM114-Status: GOOD (  30.70  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> > Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> > described by a separate node covering channels 11-14, and for the
> > BCM2712 DMA controllers. The register address of a node identifies its
> > first channel, allowing a controller to be split across nodes.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> >
> > ---
> >  .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826c..31d97a10a0ea9 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> >  maintainers:
> >    - Nicolas Saenz Julienne <nsaenz@kernel.org>
> >
> > -description:
> > +description: |
> >    The BCM2835 DMA controller has 16 channels in total. Only the lower
> >    13 channels have an associated IRQ. Some arbitrary channels are used by the
> >    VideoCore firmware (1,3,6,7 in the current firmware version). The channels
> >    0, 2 and 3 have special functionality and should not be used by the driver.
> >
> > +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
> > +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> > +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
> > +  split across several nodes, the register address identifies the first
> > +  channel of a node.
>
> Uh no, a device should not be split across different nodes. This should
> not be needed, why can't your driver handle the upper channels having
> different capabilities?

This is the way it's done in the downstream kernel, unfortunately
Broadcom doesn't publish the HW details so either they'd need to
contribute the support (which they've not done since the RPi4 was
available) or I'm not sure what the other options would be. Open to
suggestions.

> Thanks,
> Conor.
>
> > +
> >  allOf:
> >    - $ref: dma-controller.yaml#
> >
> >  properties:
> >    compatible:
> > -    const: brcm,bcm2835-dma
> > +    enum:
> > +      - brcm,bcm2835-dma
> > +      - brcm,bcm2711-dma
> > +      - brcm,bcm2712-dma
> >
> >    reg:
> >      maxItems: 1
> > @@ -99,4 +108,22 @@ examples:
> >          brcm,dma-channel-mask = <0x7f35>;
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    dma-controller@7e007b00 {
> > +      compatible = "brcm,bcm2711-dma";
> > +      reg = <0x7e007b00 0x400>;
> > +      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "dma11",
> > +                        "dma12",
> > +                        "dma13",
> > +                        "dma14";
> > +      #dma-cells = <1>;
> > +      brcm,dma-channel-mask = <0x7000>;
> > +    };
> > +
> >  ...
> > --
> > 2.56.0
> >

