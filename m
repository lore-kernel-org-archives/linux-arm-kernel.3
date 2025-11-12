Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D1FCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVN2QH5HWV7xAhIfyazsgOs40qUJlxQiUjyk9uILWgQ=; b=qBZCVDAG/dWK4krGOm02mZAVbB
	hizRrsqkl1/ruJGEKX3zr5M9MMwR5eYkppF8AS29IL/yeaUwu/d4imv6TFIP2DAXHDzLxLcONuY2Z
	re+zO9f96gErJuG8dREhg6pHMa6M6WwWZe3cK6loEHPyo3xkOSpMF7+dgTjVLkjff5a/G8Dt7/lH0
	d1agFDC5oPtIBI/9I31dEGRiDs29RjkjZGSNieMj9FqOJMSVdAeTf9s4U/CVKHoikHn+rXwOxbDez
	ELT3lN02uhgShcwguF2JgeK9aMyasJjMKVIyg04TN0CaHAxXa+j+nu3/X3dn812kzzrrvr5whqLCT
	6BFgJ+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7zS-00000008YFK-1ZFw;
	Wed, 12 Nov 2025 10:22:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7zQ-00000008YEu-1uZT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:22:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC29F4177B;
	Wed, 12 Nov 2025 10:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED06C2BCAF;
	Wed, 12 Nov 2025 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942931;
	bh=+2175vZc4EKhJz9VBbIMRTVf5NdYmltwIG7v98qXGz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5F3grlF6DOyorR0A9eIRIkUfrB1U1cqjF4gMW/1GFIQC4ZUirmk8eDVe8bS93kU2
	 ZWFJG0JX3pQG53gvGNkucUnOakciQbBBc41Vbr7zMhFiGBSoU7lwfcddbQQfiLOnze
	 /aKgR09Pk72cvU0GgYuAzxIWAdi6MsyAY9/UVR8foTP+3yK3kBZ1nwSztwSwzQLJzZ
	 ajzQo/3mbGHXSjGjCWNe4Bn42T8qIqfenIdrweh2L1jFVR6YQZsqwFSN6VmRaV2qbx
	 u2YzXXl5hIv8jTbi4gb8RlTsOv3jNwqnJppKKbw/Gi8WMnPyhnsYDETTJUYcHz33Cc
	 bh1kkppT+xyEw==
Date: Wed, 12 Nov 2025 11:22:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
Message-ID: <20251112-naughty-romantic-hamster-e213eb@kuoka>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022212_510801_DA21CA9B 
X-CRM114-Status: GOOD (  17.46  )
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

On Mon, Nov 03, 2025 at 08:03:10AM +0000, Peter Griffin wrote:
> Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") it is possible to register a regmap without the
> syscon compatible in the node.
> 
> Update the bindings for google,gs101-pmu so that the syscon compatible is
> no longer required. As it isn't really correct to claim we are compatible with
> syscon (as a mmio regmap created by syscon will not work on gs101).
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index be1441193feeea1c12d0d5370168e9316c8dcf76..c5dd132a2b6948f8eda93e4a32ddd1b57a83fcc0 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -34,9 +34,10 @@ select:
>  properties:
>    compatible:
>      oneOf:
> +      - items:

I expect new version (see other comment), so also please change items
into enum and drop const from below. items is redundant for one entry in
compatible (by convention) and having it as enum already makes it ready
for growing the enumeration for future devices.

> +          - const: google,gs101-pmu

Best regards,
Krzysztof


