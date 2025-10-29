Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4D2CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F++FC9mWoZ7i4GdAXKjflLMH7TrLdQrPrmw0wzZUbvs=; b=uVA2sUBkeehgSWKvu6YuOhGrVT
	wNaslcHNgwEQi34loPAcSksDwA8e0fW11iB2wm7/ypSK+QwEV2hXDq177GG+lXULG5vhmsPmrG+eZ
	1rIU1RjPOutzmBYWpt+s55CDy6TDXCuRRaop8O9PXr37p3ld1dKZNpKDZwWrWO1I6rRPWsTN3tcrj
	1A0B89xMw81/kaHuKJW5mekj/h+L60llKXais7lkl9m1JAQ/afuKZ948wSlA9jj7O5WC9Q5f6SlX/
	zOgSSo3fmFvLA2lXQKRR78b5RJDcEtAk2ZgYltoSgWzgInV85FRJ8mQTTvkYprcm3W2N+kliiMPap
	m6Zh8eBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDucl-0000000Gtpt-1Zxb;
	Wed, 29 Oct 2025 01:05:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuch-0000000Gtok-3VjW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 01:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C302B2944
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 18:05:01 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 611973F63F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 18:05:09 -0700 (PDT)
Date: Wed, 29 Oct 2025 01:04:42 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <aQFoKoWIlf7xPzZX@e110455-lin.cambridge.arm.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-1-98fc1cc566a1@collabora.com>
 <aQD5gwByEmX6GQK9@e110455-lin.cambridge.arm.com>
 <6599426.lOV4Wx5bFT@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6599426.lOV4Wx5bFT@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_180511_957006_30A29BBB 
X-CRM114-Status: GOOD (  36.31  )
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

On Tue, Oct 28, 2025 at 09:51:43PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 28 October 2025 18:12:35 Central European Standard Time Liviu Dudau wrote:
> > On Fri, Oct 17, 2025 at 05:31:08PM +0200, Nicolas Frattaroli wrote:
> > > The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> > > control the power and frequency of the GPU. This is modelled as a power
> > > domain and clock provider.
> > > 
> > > It lets us omit the OPP tables from the device tree, as those can now be
> > > enumerated at runtime from the MCU.
> > > 
> > > Add the necessary schema logic to handle what this SoC expects in terms
> > > of clocks and power-domains.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 37 +++++++++++++++++++++-
> > >  1 file changed, 36 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > index 613040fdb444..860691ce985e 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > @@ -45,7 +45,9 @@ properties:
> > >      minItems: 1
> > >      items:
> > >        - const: core
> > > -      - const: coregroup
> > > +      - enum:
> > > +          - coregroup
> > > +          - stacks
> > >        - const: stacks
> > 
> > I'm not sure how to parse this part of the change. We're overwriting the property
> > for mt8196-mali anyway so why do we need this? And if we do, should 'stacks'
> > still remain as a const?
> 
> The properties section outside of the if branches outside here
> specifies a pattern of properties that matches for all devices.
> 
> In this case, I changed it so that the second clock-names item
> may either be "coregroup" or "stacks".

Why would we want to do that for non-MT8196 devices? It doesn't make sense to me.
The overwrite in the if branch should be enough to give you want you want (i.e.
core followed by stacks and only that).

> Yes, the third "stacks"
> remains, though if you wanted to be extra precise you could
> then specify in the non-MT8196 cases that we should not have
> stacks followed by stacks, but I'd wager some checker for
> duplicate names may already catch that.
> 
> However, I don't think it's a big enough deal to reroll this
> series again.

I'm not asking you to re-roll the series but if you agree to drop that
part I can make the edit when merging it.

Best regards,
Liviu

> 
> Kind regards,
> Nicolas Frattaroli
> 
> > 
> > Best regards,
> > Liviu
> > 
> > >  
> > >    mali-supply: true
> > > @@ -110,6 +112,27 @@ allOf:
> > >          power-domain-names: false
> > >        required:
> > >          - mali-supply
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: mediatek,mt8196-mali
> > > +    then:
> > > +      properties:
> > > +        mali-supply: false
> > > +        sram-supply: false
> > > +        operating-points-v2: false
> > > +        power-domains:
> > > +          maxItems: 1
> > > +        power-domain-names: false
> > > +        clocks:
> > > +          maxItems: 2
> > > +        clock-names:
> > > +          items:
> > > +            - const: core
> > > +            - const: stacks
> > > +      required:
> > > +        - power-domains
> > >  
> > >  examples:
> > >    - |
> > > @@ -145,5 +168,17 @@ examples:
> > >              };
> > >          };
> > >      };
> > > +  - |
> > > +    gpu@48000000 {
> > > +        compatible = "mediatek,mt8196-mali", "arm,mali-valhall-csf";
> > > +        reg = <0x48000000 0x480000>;
> > > +        clocks = <&gpufreq 0>, <&gpufreq 1>;
> > > +        clock-names = "core", "stacks";
> > > +        interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
> > > +                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
> > > +                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +        interrupt-names = "job", "mmu", "gpu";
> > > +        power-domains = <&gpufreq>;
> > > +    };
> > >  
> > >  ...
> > > 
> > 
> > 
> 
> 
> 
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

