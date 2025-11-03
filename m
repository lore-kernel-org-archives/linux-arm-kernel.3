Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3619ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgNV5l/vcmwM3qAcCOldSF/JP53RMr5MkKHIorMUYbg=; b=SGRiD7i2tS6B0OQ4GE03objWcl
	P45Z5GeqbQswXLLA3ZiOrp9u2vsxnaRcZptAJvUGQ9fVTK8ZXbJ+hp1l7gSlNh0tiy/BWkRjf++uj
	zM9dyrOV4d2uaIhUc+jL8hAUxwYmOIGhtkSaPbhzyBgAns5/IYPxno/EjwM1SDX6mUKlBwp9vipyK
	v5GPISiy0qjpOBPLrBcfxVLyMFB7djVe/5SoX6GxTdGMHp1k3WHhfcqeeAGVrRzRSQ2SeqEhnQbiX
	IdeJFAatNMg/T8UC/g7UYofUA/BBDxhgXfqxhiMeu6yb6413pmBUR1jYYVAsND+frtJAK9m7ahd76
	GzDI9o4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwQd-0000000A8ue-1cps;
	Mon, 03 Nov 2025 15:25:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwQb-0000000A8to-1kuu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Nov 2025 15:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UgNV5l/vcmwM3qAcCOldSF/JP53RMr5MkKHIorMUYbg=; b=C8qThO++DJBFv66V8Hy06ewgUU
	TQUU1qkxx9SMoUnaqjmF4pD934xQEZ10T6n6hsTP53n5WhbSJUBV/cNveDuwshuz8UvfUNaPG2R5k
	Gw1UZIuxhOUNqFYCjwezkhFe5F4zCjliQeDboV+H0HYvA7Qnob6r5YYVGWfQJxqLcf/GW+HkrUIVs
	FaTUJ//zgjGSAHzZZe/dW7RPSjGFOtxENxow8ASPM3mmgVJ/zqfhESRODms9iOv3gm2sF7nbUKGQa
	o3T/uJy6VTtTPnwID6wLNGS7eKbUspwLJwOIRADGeenA/Zgajf4NqPjFA1SMTswKPkqOpenbvBW8g
	qv/u8bQQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvYq-0000000Fh0g-3LUM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:29:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18B6C2BC2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 07:24:51 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A38FB3F66E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 07:24:58 -0800 (PST)
Date: Mon, 3 Nov 2025 15:24:31 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v8 1/5] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Message-ID: <aQjJLwd33aVY-ss9@e110455-lin.cambridge.arm.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <6599426.lOV4Wx5bFT@workhorse>
 <aQFoKoWIlf7xPzZX@e110455-lin.cambridge.arm.com>
 <3127655.ElGaqSPkdT@workhorse>
 <aQIc39c8MvU37G_q@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQIc39c8MvU37G_q@e110455-lin.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_142933_077254_91C9BBD3 
X-CRM114-Status: GOOD (  56.21  )
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

On Wed, Oct 29, 2025 at 01:56:14PM +0000, Liviu Dudau wrote:
> On Wed, Oct 29, 2025 at 02:42:35PM +0100, Nicolas Frattaroli wrote:
> > On Wednesday, 29 October 2025 02:04:42 Central European Standard Time Liviu Dudau wrote:
> > > On Tue, Oct 28, 2025 at 09:51:43PM +0100, Nicolas Frattaroli wrote:
> > > > On Tuesday, 28 October 2025 18:12:35 Central European Standard Time Liviu Dudau wrote:
> > > > > On Fri, Oct 17, 2025 at 05:31:08PM +0200, Nicolas Frattaroli wrote:
> > > > > > The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> > > > > > control the power and frequency of the GPU. This is modelled as a power
> > > > > > domain and clock provider.
> > > > > > 
> > > > > > It lets us omit the OPP tables from the device tree, as those can now be
> > > > > > enumerated at runtime from the MCU.
> > > > > > 
> > > > > > Add the necessary schema logic to handle what this SoC expects in terms
> > > > > > of clocks and power-domains.
> > > > > > 
> > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > > > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > > > > ---
> > > > > >  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 37 +++++++++++++++++++++-
> > > > > >  1 file changed, 36 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > > > > index 613040fdb444..860691ce985e 100644
> > > > > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > > > > @@ -45,7 +45,9 @@ properties:
> > > > > >      minItems: 1
> > > > > >      items:
> > > > > >        - const: core
> > > > > > -      - const: coregroup
> > > > > > +      - enum:
> > > > > > +          - coregroup
> > > > > > +          - stacks
> > > > > >        - const: stacks
> > > > > 
> > > > > I'm not sure how to parse this part of the change. We're overwriting the property
> > > > > for mt8196-mali anyway so why do we need this? And if we do, should 'stacks'
> > > > > still remain as a const?
> > > > 
> > > > The properties section outside of the if branches outside here
> > > > specifies a pattern of properties that matches for all devices.
> > > > 
> > > > In this case, I changed it so that the second clock-names item
> > > > may either be "coregroup" or "stacks".
> > > 
> > > Why would we want to do that for non-MT8196 devices? It doesn't make sense to me.
> > > The overwrite in the if branch should be enough to give you want you want (i.e.
> > > core followed by stacks and only that).
> > 
> > I built my understanding of why on the same reason of why we specify
> > a minItems of 1 but require it to be 3 in the if branch of the only
> > other compatible (rk3588): it describes what may be found in those
> > properties, not what is required by the specific compatible preceding
> > the generic valhall compatible. arm,mali-valhall-csf is currently
> > not described as a compatible that's allowed to appear stand-alone
> > without some other compatible before it to specify further which SoC
> > it's on, so it really just is whatever RK3588 needs vs. whatever
> > MT8196 needs at the moment.
> > 
> > Arguably though, there's no functional difference here, and I'm not
> > aware on any rules regarding this. My change may be problematic
> > however, because of the whole double stacks thing.
> 
> I think I'm saying the same thing. The "arm,mali-valhall-csf" is the most general
> compatible string and defines the common denominator if not overwritten. I'm
> not expecting anyone to use just that string for a compatible, but downstream
> we have additional compatible strings that don't have to update the schema at all.
> rk3588 has a specific setup that requires 3 clocks so you cannot have any optional,
> that's why it is overwriting the minItems. Your whole double stack thing is
> actually not needed if all you do is overwrite in the MT8196 case the clock
> names and maxItems to only need two clocks.
> 
> > 
> > > > Yes, the third "stacks"
> > > > remains, though if you wanted to be extra precise you could
> > > > then specify in the non-MT8196 cases that we should not have
> > > > stacks followed by stacks, but I'd wager some checker for
> > > > duplicate names may already catch that.
> > > > 
> > > > However, I don't think it's a big enough deal to reroll this
> > > > series again.
> > > 
> > > I'm not asking you to re-roll the series but if you agree to drop that
> > > part I can make the edit when merging it.
> > 
> > If the other DT maintainers (especially Rob who gave it his R-b)
> > are okay with dropping it, then yes please do.
> 
> Rob, do you agree with dropping the change in the generic bindings?

I haven't got any answers, so I'll push the patch as is and send a separate
fix that hopefully catches Rob's attention quicker.

Best regards,
Liviu


> > > > > 
> > > > > >  
> > > > > >    mali-supply: true
> > > > > > @@ -110,6 +112,27 @@ allOf:
> > > > > >          power-domain-names: false
> > > > > >        required:
> > > > > >          - mali-supply
> > > > > > +  - if:
> > > > > > +      properties:
> > > > > > +        compatible:
> > > > > > +          contains:
> > > > > > +            const: mediatek,mt8196-mali
> > > > > > +    then:
> > > > > > +      properties:
> > > > > > +        mali-supply: false
> > > > > > +        sram-supply: false
> > > > > > +        operating-points-v2: false
> > > > > > +        power-domains:
> > > > > > +          maxItems: 1
> > > > > > +        power-domain-names: false
> > > > > > +        clocks:
> > > > > > +          maxItems: 2
> > > > > > +        clock-names:
> > > > > > +          items:
> > > > > > +            - const: core
> > > > > > +            - const: stacks
> > > > > > +      required:
> > > > > > +        - power-domains
> > > > > >  
> > > > > >  examples:
> > > > > >    - |
> > > > > > @@ -145,5 +168,17 @@ examples:
> > > > > >              };
> > > > > >          };
> > > > > >      };
> > > > > > +  - |
> > > > > > +    gpu@48000000 {
> > > > > > +        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
> > > > > > +        reg = <0x48000000 0x480000>;
> > > > > > +        clocks = <&gpufreq 0>, <&gpufreq 1>;
> > > > > > +        clock-names = "core", "stacks";
> > > > > > +        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
> > > > > > +                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
> > > > > > +                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > > > +        interrupt-names = "job", "mmu", "gpu";
> > > > > > +        power-domains = <&gpufreq>;
> > > > > > +    };
> > > > > >  
> > > > > >  ...
> > > > > > 
> > > > > 
> > > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> > 
> > 
> > 
> 
> -- 
> ====================
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     ¯\_(ツ)_/¯

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

