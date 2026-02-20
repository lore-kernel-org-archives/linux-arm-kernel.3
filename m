Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA039C55184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAJ079v3EuGaMgXIGsa8tTVoFFB51aEPHIUaV4fqzFE=; b=dmimuPayhfIb3lcyoeEWsg/CQ2
	DS9Fr4ZBp+j2Z1AuPcu/AzOx9foNscwzQ+xzTrtxBW7IPMqDjA/9RgWavGwlDq7XlwRGQ2KOcJEub
	f/lL5fGZGlprnI8M53rjLJh0Qk0r30un9mHIxxX3Lj//ib3/RGjCEgLTCIJ6EDxC69fTtlQ9H7thL
	EoeDc9CxUl+V7PcrjNCXiyVQ8yN/ayazOMUYATOwli9jCUhXfHKxwcjxJNsDiqrHR0BINKvnlMcfS
	vLup87aO4/lwWOAeEESK9g1ysyo6Ox3FXXezV8AVyo4JnE+ZVm9ETfJMSBMSLnIAzgPPR26lanBPv
	o0enrRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNHW-0000000Djjp-3Ucq;
	Fri, 20 Feb 2026 09:58:42 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNHT-0000000Djf0-1vjD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:58:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2A481483628;
	Fri, 20 Feb 2026 10:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1771581512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sAJ079v3EuGaMgXIGsa8tTVoFFB51aEPHIUaV4fqzFE=;
	b=TQZtoTDwMs37I4I8gIeJassjf9/U8KxmeaNXN06BKIdkR1LarQVTeOACFa6dVuv7HyImUU
	jpC1NWJ+7rWEnR4VtuWsnean0F3+u1oy/xgO9XdGgCd5FiRTV/2yJM5xVUnBBm06iChh23
	QKW4OTYaKL4lGYB5yCM+jPLMS3H1RwPgyygxZAP7Wlc0r+xKvl+n05v0CHdJIXO+hhcA0/
	HSNnMXv2VpPGcZNpQRdxKSkwp04wkWuey9qIf1mgZKSO2OyGFBvFPxzDm/pTCWnG0Ozun3
	BUKETuB47iUekQhoQEX97zQflz2lnUiWDfBxqm5hySPsG2ZC4buBAIzQAkpzCw==
Date: Fri, 20 Feb 2026 10:58:25 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
Message-ID: <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_015840_180523_BE15DE32 
X-CRM114-Status: GOOD (  27.42  )
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

Hello Claudiu,

Am Sat, Jan 31, 2026 at 05:47:05PM +0200 schrieb Claudiu Beznea:
> 
> 
> On 1/20/26 17:44, Alexander Dahl wrote:
> > The OTPC requires both the peripheral clock through PMC and the main RC
> > oscillator.  Seemed to work without explicitly enabling those clocks on
> > sama7g5 before, but did not on sam9x60.
> > 
> > Older datasheets were not clear and explicit about this, but recent are,
> > e.g. SAMA7G5 series datasheet (DS60001765B),
> > section 30.4.1 Power Management:
> > 
> > > The OTPC is clocked through the Power Management Controller (PMC).
> > > The user must power on the main RC oscillator and enable the
> > > peripheral clock of the OTPC prior to reading or writing the OTP
> > > memory.
> 
> As this was not mentioned in the previous datasheet versions, the current
> driver don't handle those clocks, and it probably worked as the clocks were
> enabled by bootloaders, I think the clocks should be marked as required and
> this patch to be propagated as a fix along with fixes on driver and device
> trees.

What do you mean by "clocks should be marked as required"?  Where?
How?  Is something more necessary, than already done here?

> I'll let DT binding maintainers for the final decision on this.
> 
> > 
> > Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> 
> Why this link here?

That was the original discussion and at the time the sama7g5 datasheet
mentioned a thing missing in the sam9x60 datasheet.  So that
discussion was the only reference for why this change is needed for
sam9x60.  Will drop the line in v4 then.

Greets
Alex

> 
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v3:
> >      - Removed clock-names (led to confusion, and not used by the driver anyways)
> >      - Removed redundant example
> >      v2:
> >      - new patch, not present in v1
> > 
> >   .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > index 9a7aaf64eef32..847dfb67c6b72 100644
> > --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > @@ -29,6 +29,11 @@ properties:
> >     reg:
> >       maxItems: 1
> > +  clocks:
> > +    items:
> > +      - description: main rc oscillator
> > +      - description: otpc peripheral clock
> > +
> >   required:
> >     - compatible
> >     - reg
> > @@ -37,6 +42,8 @@ unevaluatedProperties: false
> >   examples:
> >     - |
> > +    #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
> >       #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
> >       otpc: efuse@e8c00000 {
> > @@ -44,6 +51,7 @@ examples:
> >           reg = <0xe8c00000 0xec>;
> >           #address-cells = <1>;
> >           #size-cells = <1>;
> > +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
> >           temperature_calib: calib@1 {
> >               reg = <OTP_PKT(1) 76>;
> 

