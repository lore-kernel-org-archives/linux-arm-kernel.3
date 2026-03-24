Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62195F532E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 23:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATuLVAq1ts7ScRhCkDaGsLUh7/lhKkLjo1yD6uExeT0=; b=FPqUhjBg6CYU7UGYUklFIqrOAB
	UyhcqipkZeISTpOMonh1XiqxA6o4kxOUo06qrkWEazji5bx23zSy82gmqaxMV+FQICirpF+kpIJJO
	8vft1tPjDX+xfeiFlOW+jFxFuRwAY+PBIlject+4F55xW+gdzvU36XkcD1bj+CvIyMAgeOicZAKDd
	ZQP6BGLopAU7H/WgL7ypif/mgcaTJLrngkULieFybxaJQk/xdKhPMJOKn6gg8y7pSEAynOqphCBh9
	U15GTb4aXA4GmRStHvjgwchu9dWJ9O3m4GvxBMYCWlAQiDiXoRXlFzEEue6KLAoBi/BSY5FL/dtHs
	gz1ynSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5B7m-00000002LvP-0hJH;
	Tue, 24 Mar 2026 23:25:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5B7j-00000002Lv4-1viG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 23:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFFC541A14;
	Tue, 24 Mar 2026 23:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C481C19424;
	Tue, 24 Mar 2026 23:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774394721;
	bh=8M2lfLTY30frg/KZdYPe5W7EMROR9Qeg+pO68+yl6Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUpZcUDxNxE64Me8evCj/8m/kPF0rqXW7NULInKarHq6hDsx+EqcsOsDT6YLE5YOv
	 84fGJofuOiE+XO1hX9kXSjaWRfDKUxSVi5nGliR4H0V9q3sK7Q2gfLO0QLoWEHj7jy
	 Pz565Tn2iB0vhZsZYq3eF61JXpEgYloT3UIJuVAvpRLfS9siV1zagiZPAM4c8J/y8D
	 VKu0mdfWbmlNkzT2VDYl/pU1NOb79EUW2nLU0ZL3/gzxQhFVQ3YOi/ehEazBVjpy8E
	 NuWE95DnBOqmilyUXeULaVocQ+bME4KzYMeJECGqpCuAJ5WKsm1mMmWlDEettZg+3Y
	 7POC+XZ5K5oBQ==
Date: Tue, 24 Mar 2026 18:25:20 -0500
From: Rob Herring <robh@kernel.org>
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Add power-domains-child-ids
 property
Message-ID: <20260324232520.GA2225579-robh@kernel.org>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_162523_522087_7A95A48D 
X-CRM114-Status: GOOD (  21.07  )
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

On Tue, Mar 10, 2026 at 05:19:23PM -0700, Kevin Hilman (TI) wrote:
> Add binding documentation for the new power-domains-child-ids property,
> which works in conjunction with the existing power-domains property to
> establish parent-child relationships between a multi-domain power domain
> provider and external parent domains.
> 
> Each element in the uint32 array identifies the child domain
> ID (index) within the provider that should be made a child domain of
> the corresponding phandle entry in power-domains. The two arrays must
> have the same number of elements.
> 
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
>  Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> index b1147dbf2e73..a3d2af124d37 100644
> --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> @@ -68,6 +68,21 @@ properties:
>        by the given provider should be subdomains of the domain specified
>        by this binding.
>  
> +  power-domains-child-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      An array of child domain IDs that correspond to the power-domains
> +      property. This property is only applicable to power domain providers
> +      with "#power-domain-cells" > 0 (i.e., providers that supply multiple
> +      power domains). It specifies which of the provider's child domains
> +      should be associated with each parent domain listed in the power-domains
> +      property. The number of elements in this array must match the number of
> +      phandles in the power-domains property. Each element specifies the child
> +      domain ID (index) that should be made a child domain of the corresponding
> +      parent domain. This enables hierarchical power domain structures where
> +      different child domains from the same provider can have different
> +      parent domains.

Okay, I guess we stick with this. Sorry for the detour.

With the example fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

