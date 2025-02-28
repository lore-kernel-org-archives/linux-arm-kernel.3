Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97469C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGb/hc8K+2fjsnWovWjPEIP4bVMi/yiy6BLv4OZLMow=; b=O6Ml3iz6VwYmUvItFwY3WcLORa
	YUYWSLHSpX/KCOVNWQRERLOydIrUYJCD/prUPenf9BQXHdYjQJn+lH7FqNBGtY9lE5QK10P76iyhQ
	p0YmZkUfF2ppEeSMsB2KAXQ62oasnqHg5yWQrN+HtAEKG8xOsaman0jY23m3wamyR/bpSsX3lwwD8
	gkc2smmE3v83UBX4HlnmC/hfEm8MtZnDvwG2BsSkhm51eVvhm3giwgasrQ1vOdceEtIiZatshy5x/
	UA34KhvZXqGgSwhJHTjgF1FeC4r8kYggf8jJHK70zG80LpPnlVC+TdX20kUD6CX8JD2vj7u9mGlUF
	MggYmpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7fX-0000000CgzG-2yYn;
	Fri, 28 Feb 2025 21:13:15 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to7cI-0000000CgMK-36BQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FDA56114A;
	Fri, 28 Feb 2025 21:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4504AC4CED6;
	Fri, 28 Feb 2025 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740776993;
	bh=7/U8iCK7D2OmaLt/mLjSMyZ4HHGedptSkAghoSNVdR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncCt9+6O2jp3/i9DzHgh2AiW0gV8u83t8GiagV54aYXYuX4ucGyeDhfhUcylciR9e
	 QgX9KI+t75Knp5nMwry11emnGByFvS6Rw7hhT6dsKMmhzaSHUm2wIdrWfwRPBfrLgD
	 TMHG8Rql1XtDoLPuejlV/Ukndp+C5rt+/z4KGsbd3nHCogN0XpN9XS4nJoRzO804ny
	 Ptxhjq3nBW7PYhTDXfn2mvAW3x1p1A2cDNkEFendNZVmwb+R3L+UR8VBb+i29Tn8Wc
	 IcXlVID0YMj+1qBMD7K8soE3wPlyi6sQIdP39Eu1NZRz1sdezNKOHj4rUyY0tUXFOm
	 J3iJ6ZlLJP/sw==
Date: Fri, 28 Feb 2025 15:09:51 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, catalin.marinas@arm.com, will@kernel.org,
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Message-ID: <20250228210951.GA3720389-robh@kernel.org>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
 <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
 <20250228-shampoo-uprising-44ae0d3bd68b@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-shampoo-uprising-44ae0d3bd68b@spud>
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

On Fri, Feb 28, 2025 at 07:03:05PM +0000, Conor Dooley wrote:
> On Thu, Feb 27, 2025 at 01:24:39PM +0100, John Madieu wrote:
> > The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block designed
> > to measure the junction temperature. The device provides real-time temperature
> > measurements for thermal management, utilizing a single dedicated channel
> > (channel 1) for temperature sensing.
> > 
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> > v1 -> v2:
> >  * Fix reg property specifier to get rid of yamlint warnings
> >  * Fix IRQ name to reflect TSU expectations
> > 
> >  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > new file mode 100644
> > index 000000000000..e786561ddbe3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
> > +
> > +maintainers:
> > +  - John Madieu <john.madieu.xa@bp.renesas.com>
> > +
> > +description:
> > +  The Temperature Sensor Unit (TSU) is an integrated thermal sensor that
> > +  monitors the chip temperature on the Renesas RZ/G3E SoC. The TSU provides
> > +  real-time temperature measurements for thermal management.
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g047-tsu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: |
> > +      Interrupt specifiers for the TSU:
> > +      - S12TSUADI1: Conversion complete interrupt signal (pulse)
> > +      - S12TSUADCMPI1: Comparison result interrupt signal (level)
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: adi
> > +      - const: adcmpi
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 0
> > +
> > +  renesas,tsu-calibration-sys:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Phandle to the system controller (sys) that contains the TSU
> > +      calibration values used for temperature calculations.
> > +
> > +  renesas,tsu-operating-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    description: |
> > +      TSU operating mode:
> > +      0: Mode 0 - Conversion started by software
> > +      1: Mode 1 - Conversion started by ELC trigger
> 
> Can you make this "software" and "elc" or something please, unless
> people will genuinely find "0" and 1" to be more informative.
> And why doesn't the property have a default?

Or just make it boolean.

Who/what decides the mode? If a user is going to want to change this, 
then it should be a runtime control, not a DT property.

Rob

