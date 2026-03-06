Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2E5F01806
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmmOg7Qgy7SYampv8rJxClEuNQe8dN5J/u9wgnd52/s=; b=ti4K1JPn536LiZne1/Yc5m83pD
	ffNzTaZaj4zr8TTdxXeniu8HOCzd8JACcVRKn1n7YJDYxTqaqmjWgN98qzOnvt+hh5yJGO2Los08W
	sv7kN5jxvxAS5zaXDY4W3ND7s/lPC7iHrZhqWqzONp8akwyO6QNIW2QL2j++ZQuqzEhfZVzIgI3e/
	YKPXdnf4i1Er3Daj4vObLxfbULo17/KuHASSOnDfRPsgvzuT7CFcvu0PBJdfsqUSINWVJx2jFZu5B
	uRsNEnDfSEBVx5FxE7lvm2v512wG4jbAVKbgZPLInozbjfQ3/5t1A2cfGklqsq5s2iPwgM60NbZMB
	7jsQbLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPk2-000000039nT-3Bga;
	Fri, 06 Mar 2026 07:36:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPjx-000000039l7-2mPV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 07:36:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9502600B0;
	Fri,  6 Mar 2026 07:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1943AC4CEF7;
	Fri,  6 Mar 2026 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772782612;
	bh=ODvio30d2U39SOyQE9o3r70lLsCN1rTtdRiiHLywxLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HkFDc5bMXNYfmBMwQaaWuqd0OKTasExEF96N5g5MPImBTRBZfbKnC7a93tBaV/kTJ
	 uLoOANJ2eldrtDywnk0Hq0mrDL7JLveGXWRrpwRf2i+QLheux5xswai6e+6aJHNOtM
	 pUQd/sp8g5L/kxNhwLfzlHKY1XM0Zam9sBaXyviFYO6oX21Vb14VFzxl62KEAya62l
	 WuCKcXC88+yKXPjZcv0mOC8Xr+AUCczmgVdhvCQGhnCnn6UzohFPLh5d+CshHclIub
	 LlMkK3KGAzw4rwa07LbV3tQ6NDkGivS/6/vHfVlHJo7n9rM4IFvzsTgdmMNHMHeCwS
	 nxqd+L3/aQxzA==
Date: Fri, 6 Mar 2026 08:36:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v6 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
Message-ID: <20260306-hopeful-amusing-sawfly-e60c6d@quoll>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
 <20260305-gs101-pd-v6-4-8cb953c1a723@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260305-gs101-pd-v6-4-8cb953c1a723@linaro.org>
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

On Thu, Mar 05, 2026 at 06:11:53AM +0000, Andr=C3=A9 Draszik wrote:
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
>=20
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

It is impossible to test a binding in a meaning of "tests", thus you
should not add Marek's tags to bindings patches.

> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> v4:
> - consistent quoting using " (Krzysztof)
> - add samsung,dtzpc to example
>=20
> Note:
> Because the properties added are 'required', this commit breaks DT
> validation of the existing DT for Pixel 6, but a) that's simply because
> the DT is incomplete and b) a DT update will be posted once the binding
> is accepted.
> It is not possible to write the binding such that it supports old
> (incomplete) DTs in addition to the full version, but as per above
> it's not required to keep supporting old DTs.
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> index a06bd8ec3c20..c1ee9575092a 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -16,6 +16,14 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
>      type: object
> @@ -39,9 +47,23 @@ properties:
>      description:
>        Phandle to PMU interrupt generation interface.
> =20
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object
> +    description: Child node describing one power domain within the PMU
> +
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: google,gs101-pd
> +
>  required:
>    - compatible
>    - reg
> +  - '#address-cells'
> +  - '#size-cells'

I don't see improvements about quotes.

Best regards,
Krzysztof


