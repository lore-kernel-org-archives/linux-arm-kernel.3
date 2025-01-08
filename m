Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ADFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1nqGFwSLEIQQlWMEuJhlbbWKw65viq/8hUrXqEZ2eg=; b=Z5+kEUZG+ipq3UB/ILDS+t0pTM
	e5nIU9p+380dSnY5RLL2FD6tLAS+354eOdNWxR1s7YKgdr4aYA7IBui7oO3WYB9lxD5QbZjsbLzcx
	O7lwizHmthkgdVPDd8TjMjOIDidgezUsTE6iWmWHkp/l6thQlUWEXoPVG9X/V04xJA+IDv4iBx23U
	NOfPMRSE7uzaRbpdyFon+pHNCQD4RJBs+g4+QkLYQyB/vWmRoXrV0km12RnpAa2hSsZ0MZJnh2LbH
	n+tQrBO5TVVRIK3DxBN2ijtJfmHf0+wgZSl8PhHxbMGX6O7kk++0mxwM0Wb74gW7xH+msUtDvlQuI
	hR8Uqi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRUV-00000007ZKI-1lHl;
	Wed, 08 Jan 2025 08:32:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRSL-00000007Yx2-468y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BDE85C4C05;
	Wed,  8 Jan 2025 08:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39ECDC4CEE0;
	Wed,  8 Jan 2025 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736325025;
	bh=lSdp/Tf14ZXeM2+DPwDlUFDomlBVvyqUfx1JcR+/Bag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPiIwrOVK8BEyg6KgQZ58eDlM1ck122ZWw7hRYUSiyScdiabQZTUjAQi9utpEqywd
	 mQWNx15YyZY5QFOgOVNYf+AjiuqU4qooNB0AzyEIKea/T0jJXO3TZaRx8w8UtVZwaf
	 KVEAynjsH7CxTOz5cRnot8Q4WpqPyey5QqVdxHfEWOZy/FpPmaBS4i6JwP97y11Zyq
	 YlH7oMokk6NVI7OUjofoqovbZ/QQ6p/8jqsZdgT2QSz3G3hR/5F17Rx7NKyfoX+sVP
	 bJCz93Y3YBUV/F5Q9xEkKCsC9V0WfXRI42BIyNFOetTga6JBW1jjSf2eJEXAg0rYj6
	 PWQdn1cOIFlYQ==
Date: Wed, 8 Jan 2025 09:30:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <ataxete4izo3hpyuqve3isktvvbuwoosc6burnkhqcratfgv4c@ycejvdx6k3cr>
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
 <20250107113512.525001-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107113512.525001-2-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003026_054057_5B7E25B6 
X-CRM114-Status: GOOD (  19.81  )
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

On Tue, Jan 07, 2025 at 01:35:10PM +0200, Ivaylo Ivanov wrote:
> Add new constants for choosing the additional USIv1 configuration modes
> in device tree. Those are further used in the USI driver to figure out
> which value to write into SW_CONF register. Modify the current USI IP-core
> bindings to include information about USIv1 and a compatible for
> exynos8895.
> 
> In the original bindings commit, protocol mode definitions were named
> with the version of the supported USI (in this case, V2) with the idea of
> leaving enough room in the future for other versions of this block. This,
> however, is not how the modes should be modelled. The modes are not
> version specific and you should not be able to tell USI which version of
> a mode to use - that has to be handled in the driver - thus encoding this
> information in the binding is meaningless. Only one constant per mode is
> needed, so while we're at it, add new constants with the prefix USI_MODE
> and mark the old ones as depracated.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
>  include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
>  2 files changed, 79 insertions(+), 37 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


