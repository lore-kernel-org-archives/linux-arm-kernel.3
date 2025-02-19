Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0FEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OikHu5+C1ElAxEyuhG5xz19F3KdtQ7ba96OVsfyNuI=; b=NYvA1eA89cg0YxR1XCHaBLxIUp
	ze5zKxxaNop0G8L0ypkkjqKj8Red8TQDENsxhHu+JjfPLJlY43Xw6Tkpmf5lQBlD+EFEQJbJeBWZs
	hUY3DCUUX3yn8eRaJB8r5d24A9k1pvM9ud5OMWDRDYn7SdtAB7Tap3ODyMicxzeqFmSMjotayjVRM
	//w71rsL95Q/1pHagBXliN8BtEESRH0mAt63UDY04ZcuIMOG9mMyas0FcWmGk6+44dzmN737xF/7k
	0PnaC2QxgrxiE+oMxiXopiWbF1XRvSPlqupfOMwjELLdZEr3u1kpXhH/YMvwMpYmh9dvvVs7pKeFf
	LfPJzROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfK2-0000000BTkQ-3lmK;
	Wed, 19 Feb 2025 08:20:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkf5j-0000000BPnd-1l0y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81BCC5C5823;
	Wed, 19 Feb 2025 08:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A40C4CEE6;
	Wed, 19 Feb 2025 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952358;
	bh=mjCUzREEp607MSaIY9+burmTdQYRMJRZfKMZFQK9qjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtTs7k5448c55/qTkprhKuOd2Qy3r5GNrqgGlI3kmpGlLZauRS0NkATXtOr23HMVF
	 oQv7yvc3HvB+7UwiknxrUblX+ci0rfWpcvSgff6Oo8/RpQl3SwAN9H9obgkP8x6r+z
	 YsBct4IZ5DzMQ+OUvPTVsPsJuXSLOElcyMwi+/lEYITH1jeR/3iiDJJVoJLzt4v2NF
	 GrEbwq2RWX2ALB3lRyEpGig0PpiGPmxmTyLkeSS0WR0jO74JDap/ZzYw7hoy4bOb/b
	 9C5DnzJRAxpGTp3xHScogUvHC6w+MqkDBrHTi7Wxs3dCCxZ6874M6KpSwnEphYyVlO
	 uw7so1h4DQJYg==
Date: Wed, 19 Feb 2025 09:05:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Message-ID: <20250219-competent-bullfinch-of-justice-09cbfb@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-2-0d1e415e9e3a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-2-0d1e415e9e3a@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_000559_546751_D356386A 
X-CRM114-Status: GOOD (  12.77  )
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

On Wed, Feb 19, 2025 at 12:20:29AM +0530, Kaustabh Chakraborty wrote:
> +  Exynos7870 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. The root clock in that root tree
> +  is an external clock: OSCCLK (26 MHz). This external clock must be defined
> +  as a fixed-rate clock in dts.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'dt-bindings/clock/exynos7870.h' header.

Full path and drop quotes


> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos7870-cmu-mif
> +      - samsung,exynos7870-cmu-dispaud
> +      - samsung,exynos7870-cmu-fsys
> +      - samsung,exynos7870-cmu-g3d
> +      - samsung,exynos7870-cmu-isp
> +      - samsung,exynos7870-cmu-mfcmscl
> +      - samsung,exynos7870-cmu-peri
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 10
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 10
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#clock-cells"

This goes after clock-names, to keep the same order. No need to repeat
old mistakes.

> +  - clocks
> +  - clock-names
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-mif
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-dispaud
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_DISPAUD bus clock (from CMU_MIF)
> +            - description: DECON external clock (from CMU_MIF)
> +            - description: DECON vertical clock (from CMU_MIF)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: decon_eclk
> +            - const: decon_vclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-fsys
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_FSYS bus clock (from CMU_MIF)
> +            - description: USB20DRD clock (from CMU_MIF)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: usb20drd_refclk

Drop _refclk suffix

Best regards,
Krzysztof


