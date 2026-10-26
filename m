Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C8C60A2608
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bdU3NuFo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+WF+8qu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w32GAT+2u9Nd9KdCv0tYjgdg8e8hiYuWmScLSClw09U=; b=bdU3NuFox62C/01PF5yKdeeMM9
	uAQUYd7JBPoA4xbqWOp1Bv20M8UyKY9ug4+1nMei6FSFEjI2uO+jhziDvpkYK3i+N/sc/Z4epfeFc
	/Az4pyJJ2bU5XMTCb8ZT4HTchVhxzP08jXLQg6Gaytrt/HX/fMhztMFW0eNMUHwaefK74uYH714wb
	0se4dKGV/+1yjSOTRmYRRmq5OI61nkKyuBdQEWpUyn2GNcplJ4zPtLZHC4kH8++YXX4qqkJtBptuQ
	Pkmw/GHXN/ma7N9ZLqx+tnNiV1y6tcbhevGzzMK1oJYVD1R2/SJBgtqipApvgYgT7UBChy/LOHaMJ
	gGYa+mJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHFq-000000026e6-03Eb;
	Mon, 26 Oct 2026 09:44:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHFl-000000026ct-1P9f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:44:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50A2760A70;
	Mon, 26 Oct 2026 09:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A041F031E7;
	Mon, 26 Oct 2026 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007868;
	bh=w32GAT+2u9Nd9KdCv0tYjgdg8e8hiYuWmScLSClw09U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l+WF+8que08J5dhB5KqdafZx8jD+3iAa2MlqD/zBEQnWYqrI+r5A2xifEINxQfK5w
	 Fq2xK4xYPa5HwAh1sODPimIMRkVdBSCuK7gszDbu4bzOmtfJ0d/4VRathIIWqqjzpl
	 mvaiNjoo+3mACXdRFBoVDHnzFm7FLvdGRPBBSFCpJIjIKxTUff57IRHTaCCIveE6P/
	 WSjRkostIJYmj8spU2Dj9xflswWxH+WyeojB7rC4RCrAGU6kx0mB+t9BO+9x2z5DCI
	 fdb/95xbaA2cMFC3/NhZVmuKoDFbUS2DRkFSbL13XkzWVYJDcJ/+Nu9DscwZJMYkyE
	 4lUlHZb8CeBIQ==
Date: Mon, 26 Oct 2026 10:44:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Message-ID: <20261026-talented-wolf-of-karma-8abbbd@quoll>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
 <20261023131501.3157463-2-selvarasu.g@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023131501.3157463-2-selvarasu.g@samsung.com>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
> +title: Samsung Exynos8855 DWC3 USB controller
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
> +
> +description:
> +  Describes the DWC3 USB controller block implemented on the Samsung
> +  Exynos8855 SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos8855-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

interrupts go after clocks, power-domains after interrupts.

> +
> +  clocks:
> +    description: |
> +      Two clocks are used:
> +       - ref: Reference clock for SOF/ITP generation.
> +       - bus: Bus (APB) clock for register access.
> +    minItems: 2
> +    maxItems: 2

Instead replace all this with listing items with description. Don't
repeat constraints in free form text.

items:
  - description:
  - description:


> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: bus
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts

Here you have correct order.

Best regards,
Krzysztof


