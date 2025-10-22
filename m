Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E5CCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9wYn4JjhoELl4McnTmqZ/g/EJnZCFV2/TUGySvijHk=; b=MLkQZ5zqbAVS9cqhuueTMWciet
	yPtA10q4rZY6YO9C2YPQnHLRDi4jxA0VdGnODPYu6cJGsF9kr1zHZEMRJfQsxKm5keMBGQGn8NZvm
	yN5rCrwi7WZsM442NT1wA7JgOblPbqVZVmfyD3x5AyDDf+tYUdNT0MqUYkXWpVwRlacO/r3wBETfZ
	HUQBKVFkTEipyqhP6t0I1leqksrGldlgxedt7sRoVGRx3ci8KZ2jsaix5huRQc6oWZVYCN2ys+HG5
	c/7JS9VmGa9voDGDeWaL7Sac8xm5lQo+Qew9af5zFjEafL5ehMf42wXIu/VyicJOWxN5p9/qjG6ZA
	3Larbtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTWY-00000001vhh-0HvG;
	Wed, 22 Oct 2025 07:44:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTWW-00000001vhZ-12S3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 07:44:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99D49628A0;
	Wed, 22 Oct 2025 07:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFA7C4CEE7;
	Wed, 22 Oct 2025 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761119083;
	bh=dOaaUGpCoWK/3UecfDVD5nwyOjAWut3PtEie6hbPpME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtxWl178ZkpUUG2PeSVOEvkUfpCWl2Z9D/H7AHnF49qhriBnzBKTAomAu0XHM79kP
	 Qh4OA2nyXfP5c3KXZ0bfpbmrVC+k5IjtHeOjePT3P7vUUM40/ju8ykgOCgjSB84+dP
	 bvbrOYvPJ6wwSG0253pFzGmNSLmLGf5E4TnWr07wd/Gh8I4DbbSTNMYqwl/DknLWb6
	 qzzegwwkCUrCNpyA3hXYOCjS8jSsHhuI/GptCDOl0udsIx8KnGUdMOyZpOfaYqlope
	 2vTADlxjpsBfJtJQj5KU5Bo6lmoUNqFseRrxGFBV/eqaJ5uAyB+JlEndQ8AA/s3wKj
	 7z2frVqTgDKUw==
Date: Wed, 22 Oct 2025 09:44:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add exynos8890 SoC
Message-ID: <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251017161334.1295955-2-ivo.ivanov.ivanov1@gmail.com>
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

On Fri, Oct 17, 2025 at 07:13:29PM +0300, Ivaylo Ivanov wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-aud
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_AUD PLL clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: pll
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-bus0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_BUS0 ACLK 528MHz clock (from CMU_TOP)
> +            - description: CMU_BUS0 ACLK 200MHz clock (from CMU_TOP)
> +            - description: CMU_BUS0 PCLK 132MHz clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "528"
> +            - const: "200"
> +            - const: "132"

We do not want the frequency here, for sure not frequency alone. There
is no such code/syntax. Really.  Please do not invent your own style.
That's just pclk. You describe here the logical name of this clock
input.

ACLK is AXI bus clock, so if this block receives only one ACLK, then
this is just "axi" or "bus". Recently we were calling this "bus".

Same in other places. If two AXI bus clocks come in, they could be named
bus0 and bus1, or in this case - because these are sources for
generating further ACLKs - bus_528 and bus_200, to indicate that one
will be for AXI bus clocked 528 MHz and other for 200 MHz.

Please wait for some other opinions, because same rule I would like to
apply to ExynosAuto, Artpec and Google GS.

@Raghav Sharma, @Alim Akhtar, @Sam Protsenko, @Peter Griffin, @Andr=C3=A9
Draszik  - share your thoughs please?

And to clarify in simple terms for others or for the future:
1. HCLK would be the AHB bus, so also bus. Both ACLK and HCLK are for
memory accesses.
2. PCLK is APB bus, for registers.
3. SCLK is for main operation of the block (called special clock, but no
clue what is so special about it).

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-bus1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_BUS1 ACLK 528MHz clock (from CMU_BUS0)
> +            - description: CMU_BUS1 PCLK 132MHz clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "528"
> +            - const: "132"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-ccore
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_CCORE ACLK 800MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK 264MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK G3D 800MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK 528MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK 132MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE PCLK 66MHz clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "800"
> +            - const: "264"
> +            - const: g3d
> +            - const: "528"
> +            - const: "132"
> +            - const: "66"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-disp0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_DISP0 ACLK 0 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP0 ACLK 1 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP0 DECON0 ECLK0 clock (from CMU_TOP)
> +            - description: CMU_DISP0 DECON0 VCLK0 clock (from CMU_TOP)
> +            - description: CMU_DISP0 DECON0 VCLK1 clock (from CMU_TOP)
> +            - description: CMU_DISP0 HDMI audio clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "0_400"
> +            - const: "1_400"
> +            - const: eclk0
> +            - const: vclk0
> +            - const: vclk1
> +            - const: audio
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-disp1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_DISP1 ACLK 0 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP1 ACLK 1 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP1 DECON1 ECLK0 clock (from CMU_TOP)
> +            - description: CMU_DISP1 DECON1 ECLK1 clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "0_400"
> +            - const: "1_400"
> +            - const: eclk0
> +            - const: eclk01
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-fsys0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_FSYS0 ACLK 200MHz clock (from CMU_TOP)
> +            - description: CMU_FSYS0 USB30DRD clock (from CMU_TOP)
> +            - description: CMU_FSYS0 MMC0 clock (from CMU_TOP)
> +            - description: CMU_FSYS0 UFS UNIPRO20 clock (from CMU_TOP)
> +            - description: CMU_FSYS0 PHY 24MHz clock (from CMU_TOP)
> +            - description: CMU_FSYS0 UFS UNIPRO config clock (from CMU_T=
OP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "200"
> +            - const: usb
> +            - const: mmc
> +            - const: unipro20

Just "ufs"

> +            - const: 24m

No... really no. Half of these names feel random. ACLK 200 MHz is "200"
but PHY 24 MHz is 24m... That's SCLK but I don't know from where does it
come from, so what is the true source. Since it is used as ref clock for
PHY, I would rather assume this is not "SCLK" but some fixed oscillator
input. If you don't find the source of this clock giving any reasonable
name, let it be just "sclk".

I understand that without hardware manual it is difficult to figure all
this out and my requirements here do not make it easier. I appreciate
your work.

> +            - const: unipro_cfg

"ufs_cfg"

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-fsys1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_FSYS1 ACLK 200MHz clock (from CMU_TOP)
> +            - description: CMU_FSYS1 MMC2 clock (from CMU_TOP)
> +            - description: CMU_FSYS1 UFS UNIPRO20 clock (from CMU_TOP)
> +            - description: CMU_FSYS1 UFS UNIPRO config clock (from CMU_T=
OP)
> +            - description: CMU_FSYS1 PCIe PHY clock (from CMU_TOP)
> +            - description: CMU_FSYS1 PCIe PLL clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "200"
> +            - const: mmc2

mmc

> +            - const: unipro20
> +            - const: unipro_cfg

Please keep common part same with fsys0, so the lists share as much as
possible.  Same for other blocks.

Best regards,
Krzysztof


