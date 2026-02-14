Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6C5EF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxr61V8XNLfdiPJHCCBrXGD1CfZlEt7pH7ytXuYehjs=; b=Bd+QZm/un08UbuAWqwmuAbrarH
	nFNL3RWkjkkNeysBgcJW7jowjsNEzdErsWLLmCtRD9IzAjPDypWxnCrVGMOOmHCBKo2OM+oz7idex
	/4RfMLo6d5grtDvr1nh7J7ElV6rF/VxdQ4oF6yZ3FEI7JNjQowUAx2F3tevMLDrr9X5C9EJKpVp7p
	eElwqg9/tfMBnEdrmoYk34oCioP2jIfCuc4GTrYy3hcVl7uz2LxL9NFalXOLr8/HZSUTsbKqURlM+
	OCLYkhs/8HjBUJOSgTekVNXL2zcU5EPW5duUEuLFJ/pzmKlveS+pHyw1kd3HEentcCskK1+hEltbT
	ME+no3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMiN-00000004vYC-2xEk;
	Sat, 14 Feb 2026 20:58:07 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMiL-00000004vXp-3HkB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 20:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771102681; x=1771361881;
	bh=sxr61V8XNLfdiPJHCCBrXGD1CfZlEt7pH7ytXuYehjs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EJS9fNsfAWiozXrIhF49dOoEcdCHU7MKfZjfPab0vXYsVHuarc3w8dJCnvXsRBjvn
	 IbwuijpFtgc1FXy8Or8gpzmc3+/XXSCN0azvsoOjnsceY12HFXRb9NWwTpWeUEnQ5m
	 ErqG85kbZ5jdkRDxgwTxOlFUtPC/81V7m52VGqC/1aRqVxcW1kjr0pa/5s5k//H5dt
	 ClUcB4Hla18ztWAzrAaTzWrhpd7PU0FpUW82z/xHQmTSCYaeFQ/w4jnSsDEo/XTpx5
	 vTnI/TrHYcH/Vn8PKjm5wPnoswg/rOxl2r56UP2axUn/msYxpDEd6ODgPGtcNNOGaV
	 uhPjXwZ7p/w4A==
Date: Sat, 14 Feb 2026 20:57:57 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <NptKiK70heOFOIj9x6tz-gtS1m7ueBoa3SNCijidv1yeFPpt9OAPd-LTgBUbrEfAA2u3DTJHzlUDjv17fuddIPZ4m2YEZ1dTaMQuiXDGkD0=@protonmail.com>
In-Reply-To: <20260214-daffy-roadrunner-of-inquire-babdce@quoll>
References: <20260214180933.42143-1-hpausten@protonmail.com> <20260214180933.42143-2-hpausten@protonmail.com> <20260214-daffy-roadrunner-of-inquire-babdce@quoll>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 8f085b10f653e4932cb790b844da8b3a2cfb1a13
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_125805_970632_794A76A5 
X-CRM114-Status: GOOD (  20.04  )
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

On Saturday, 14 February 2026 at 20:40, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On Sat, Feb 14, 2026 at 06:10:16PM +0000, Harry Austen wrote:
> > This Xilinx clocking wizard IP core outputs this interrupt signal to
> > indicate when one of the four optional user clock inputs is either
> > stopped, overruns, underruns or glitches.
> >
> > This functionality was only added from version 6.0 onwards, so restrict
> > it to particular compatible strings.
> >
> > Signed-off-by: Harry Austen <hpausten@protonmail.com>
> > ---
> > v3 -> v4: Slight rework and rebase, removing Krzysztof's R-b tag
>=20
> What exactly changed that you removed the tag? Rebase is not a reason.
> You MUST be here specific about the reason, otherwise why would I like
> to review if next time any rebase and slight rework will drop my tag?

Sorry, good point. By _rework_ I mean that I have removed the allOf. I will
be more specific next time.

>=20
>=20
> > v2 -> v3: Add Krzysztof's R-b tag
> > v1 -> v2: Fix binding errors by moving interrupts up front, restrict la=
ter
> >
> >  .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wiza=
rd.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > index b497c28e8094f..7688601f1f31b 100644
> > --- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > @@ -38,6 +38,14 @@ properties:
> >        - const: clk_in1
> >        - const: s_axi_aclk
> >
> > +  interrupts:
> > +    items:
> > +      - description: user clock monitor interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: monitor
> > +
> >    xlnx,static-config:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description:
> > @@ -66,12 +74,24 @@ required:
> >    - xlnx,speed-grade
> >    - xlnx,nr-outputs
> >
> > +if:
>=20
> Why isn't this in allOf? Code is fine, but why changing it?

There is only a single if condition, so the allOf is not required. Removed
for simplicity and reduced indentation.

>=20
> Best regards,
> Krzysztof
>=20
>=20

Thanks for the review!
Harry

