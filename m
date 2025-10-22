Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2233DCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iahSHX0sUCHfsmN2KqyjTCcp+AetzOSltt3B0RZrKnM=; b=Z6FxPAJEq286ANSycXpvI3BKDV
	VTwSa+/ShgI/Gj/cunmgHsp6zXkMjOH2BKSqJuJIp3poPwyObq4dkGl2XG9jvJbdurIECRXbE0j2V
	3Sik+eau0aIVHlCJsmCGKtsk4Xuq8LnDDAtbLdKZz320Yt1h2BUoMiX0Pl9mxyuGlWZKAn8buoWIS
	NTERPvfJocMATzDONccp6E7JEi0cqosjInDLGD6Bo2zTyWa14N8wcBtTVI+4V6pBkmmgYQty9QcZY
	FeaoG6cIUCOCsKxwa6P3HON9MIBEp2Mjryk0U/Vl+OQBQhroctaFwDoBtbKwXc4eHd8HTtU15TnR4
	ZTeaFtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSVI-00000001h5p-1nRr;
	Wed, 22 Oct 2025 06:39:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSVF-00000001h5P-3RTN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:39:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C7D148B6D;
	Wed, 22 Oct 2025 06:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB49C4CEE7;
	Wed, 22 Oct 2025 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761115161;
	bh=cjz+4FLk0fJPFbORna7dS+dCkdfSE0IQ1LJUuc7G8xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tA5kH5d8tnc4x0lWs6nncAVn4lcZFa6Ei/FUoLmKOibYiWV5QeEutr90QUpA9F0EC
	 gEB7QE+Ll41XfqMiHtsehht+Jm3lk9mbkbWZgyO6JynnyklJQmCRNjue2qsqBofsw3
	 2CL4Gb/NzJC7wKw+1o9yAKiV1enxChDt0U2J1YIE6ApiQWqPa9xM93ha/+KGp91+yJ
	 1dL97UO/RrfOHbGzoWuZt9e3dGAG9KmB+bdsOy/lphn+j9PuPrsygutxdKxArro7h5
	 bdd6NJDe4VCmQikvWUrFQJI2HZ4n6kwq0bgNVbydcOFC7HPMnpf8SZcWbfXiAgY65w
	 1byX8U4PKuKtg==
Date: Wed, 22 Oct 2025 08:39:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 03/10] dt-bindings: soc: samsung: gs101-pmu: allow
 power domains as children
Message-ID: <20251022-uncovered-soft-uakari-4b52e3@kuoka>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
 <20251016-gs101-pd-v3-3-7b30797396e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251016-gs101-pd-v3-3-7b30797396e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_233921_930398_11AD3DA5 
X-CRM114-Status: GOOD (  23.11  )
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

On Thu, Oct 16, 2025 at 04:58:36PM +0100, Andr=C3=A9 Draszik wrote:
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> Note: Ideally, the newly added properties (ranges, etc.) should only be
> 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> as they're needed only in that case. As-is, this patch now causes
> warnings for existing DTs as they don't specify the new properties (and
> they shouldn't need to). Only if DTs are updated to include
> power-domains, such an update should also add the new properties.
>=20
> I've not been able to come up with the correct schema syntax to achieve
> that. dependencies, dependentRequired, and dependentSchemas don't seem
> to support patterns. Similarly,
>   - if:
>       required:
>         - ...
>     then:
>       required:
>         - ...
>=20
> doesn't allow patterns in the 'if' block (or I didn't get the syntax
> right).
>=20
> Rob said in
> https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
> that this is a known limitation in json-schema.
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 40 ++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> index f7119e7a39a3fe0a0a23d1faa251d356f83ba501..a24390f6d2a54afe1aa84935e=
03f719a62f4fc8e 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -26,6 +26,14 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
>      type: object
> @@ -49,9 +57,23 @@ properties:
>      description:
>        Phandle to PMU interrupt generation interface.
> =20
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":

Keep consistent quotes, ' or "

The problem is that you mix children without and with unit address. I
guess that's the limitation of syscon-xxx drivers because they could
take the reg/unit-address, so it's fine.

Best regards,
Krzysztof


