Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D2BC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhmjHnHw3vjWo+tkwmIIDKtbQQYkCfKwRVCsE4/6FJ0=; b=qqWulwk5Q/hJ/Uc/fpCnx7ObH0
	o9cFKdDbR8LHvWYMG4p8BkhRKat1ZjOripbIaliD4bkUX1VXCgEVzOCioF+0c8Ul4g6jfISAx3GpE
	SQa4d7O2BIsyA5EnNky3IrFzYX+M6Khw+PS4DwD1H6ISTdJw9qjjJm4h3dV0oCGBBXsKB3WOzu9l0
	v0SMaizFbmphg0crL/Sm1822ouvR/rkcmh7FLhwn6mGbyXBY5/QNJgjmYt8WmnBMtoDh07a5pbTOy
	g/rQBWW01qqC4buCcAMPK4xvKTPPnjJxd0H+kC8MCqeE7kT1FJ95fCP7IRgS9xzfiwiyoRYBMh+g0
	gNfKhN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkM6-00000002mpG-2GT4;
	Tue, 11 Feb 2025 07:06:50 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkKg-00000002mer-3KXE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 07:05:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 395C81480388;
	Tue, 11 Feb 2025 08:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739257520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhmjHnHw3vjWo+tkwmIIDKtbQQYkCfKwRVCsE4/6FJ0=;
	b=fZ3S4PNWa3z+AJjC0z2Rbjb5irYPnhzFSGve2WHv/xVHrClSkkw1Oes9qbeC/rN/TQZh5m
	KrVmjp6tTe3JZa0PMnQEZFj+kESGp912bmTFau0QfHIltHr4fb0isN2eAYvm8uSYjR0TZg
	NpUqCvPoVIOFWaolUjEMi4nruboGJWZco7zOLxrjNKaYfJcOOChhvyNaNs26HVnmAvR6Tg
	XyS9tX9ilujx0t0bxAxs45yYEXWzCm4SG8fhljKGhNvao+jh7Z+VK9r33o2Ov7q5sIsCU8
	Pll5wN5r0QX6RRXhKR/8Jrazpa5tfCXRic9raMqghv/C5Bk0FPfe1Gl2Mh5RhQ==
Date: Tue, 11 Feb 2025 08:05:14 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 08/16] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
Message-ID: <20250211-primer-epic-d07bc3752569@thorsis.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-9-ada@thorsis.com>
 <8e9562c8-5c01-4b5c-b2b0-4dad3d16e7a8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e9562c8-5c01-4b5c-b2b0-4dad3d16e7a8@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_230523_151563_C6534056 
X-CRM114-Status: GOOD (  25.85  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

Am Mon, Feb 10, 2025 at 05:59:52PM +0100 schrieb Krzysztof Kozlowski:
> On 10/02/2025 17:44, Alexander Dahl wrote:
> > The OTPC requires both the peripheral clock through PMC and the main RC
> > oscillator.  Seemed to work without explicitly enabling those clocks on
> > sama7g5 before, but did not on sam9x60.
> > 
> > Older datasheets were not clear and explicit about this, but recent are,
> > e.g. SAMA7G5 series datasheet (DS60001765B),
> > section 30.4.1 Power Management:
> > 
> >> The OTPC is clocked through the Power Management Controller (PMC).
> >> The user must power on the main RC oscillator and enable the
> >> peripheral clock of the OTPC prior to reading or writing the OTP
> >> memory.
> > 
> > Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >     v2:
> >     - new patch, not present in v1
> > 
> >  .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > index 9a7aaf64eef32..1fa40610888f3 100644
> > --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > @@ -29,6 +29,16 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  clocks:
> > +    items:
> > +      - description: main rc oscillator
> > +      - description: otpc peripheral clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: main_rc_osc
> 
> osc

On at91 SoCs main oscillator and main RC oscillator are two different
things, and those are different clocks in Linux as well.  This clock
is named "main_rc_osc" in the clock driver.  In
drivers/clk/at91/sam9x60.c this clock is added like this:

    hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000, 50000000);

The datasheet makes it explicit, it's exactly the main rc oscillator
clock required for the OTPC to work, no other clock.

So why name this "osc" only then?  This is confusing at best.

> 
> > +      - const: otpc_clk
> 
> otpc or bus or whatever logically this is

Okay the "_clk" suffix is redundant.  Since the peripheral clock for
the OTPC is required here, I would go with "otpc" only then.

> 
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -37,6 +47,8 @@ unevaluatedProperties: false
> >  
> >  examples:
> >    - |
> > +    #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
> >      #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
> >  
> >      otpc: efuse@e8c00000 {
> > @@ -44,10 +56,26 @@ examples:
> >          reg = <0xe8c00000 0xec>;
> >          #address-cells = <1>;
> >          #size-cells = <1>;
> > +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
> > +        clock-names = "main_rc_osc", "otpc_clk";
> >  
> >          temperature_calib: calib@1 {
> >              reg = <OTP_PKT(1) 76>;
> >          };
> >      };
> >  
> > +  - |
> > +    #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
> > +    #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
> > +
> > +    efuse@eff00000 {
> > +        compatible = "microchip,sam9x60-otpc", "syscon";
> > +        reg = <0xeff00000 0xec>;
> 
> No need for new example with difference in what exactly? Even compatible
> was not added here...

Different compatible, different clocks, no sub nodes, different
peripheral clock id …  From a human doc readers I'd like another
example, but fine, we can drop it if it adds too much redundancy.

Greets
Alex

> 
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
> > +        clock-names = "main_rc_osc", "otpc_clk";
> > +    };
> > +
> >  ...
> 
> 
> Best regards,
> Krzysztof

