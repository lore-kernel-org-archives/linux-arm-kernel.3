Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E070CE95A69
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRBqWK754HQ+VnnEgg2rE343u4CjO7SAOMhkmKds39g=; b=Au5ePrhNZe7bbjJ0UhmD/BQTN/
	SIIfoWYcp/lhSEg4q0PNR9uyZWUTSNEZYM11WwFenN5tU77oeYW9Uy1492Yj8oKTpaQEn2Y1n070N
	wLgqto9nTbuRin3h1+ym8JuNO/A/LnDd8JTujSFQEed72L5V8LETHJwR/4ayEx0eytDTVxG2wxOmX
	2+2c3P122Jv7IoWAqhs75L7oer9OEzq4qHuWouWbjHQiIZzCBXNaqU7GC68muqqSmVFwcOwSag+3i
	skYapgz4FEATAwrtsgOULdnOaEYbpgvNwQOd2R3jAAL2k3pkYcbzTB60JbvBu8RaUuq7YY2fLuGDH
	fBEPabXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWOW-00000004gPB-2QR3;
	Tue, 30 Dec 2025 09:52:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWOU-00000004gOe-1geE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3812B43E78;
	Tue, 30 Dec 2025 09:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA6CC4CEFB;
	Tue, 30 Dec 2025 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767088317;
	bh=gBRYhXzdxpgW2LbKNyYvsM7152M325zjOsxLOggdP+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbXCjB2fOucaUCT6DZ/4HYmb/t1btB8YpboCpdi4/TkEXOCWY5BL5HZ/thDpGB5SI
	 kB/7ou2/eMO0Ov6ktO87snHDPIlPI9nvsNYZe3l1S70JLx4i15nK/kytMr2Lo/aaL4
	 +MQcWMtecazKK1IY7rNYBe480dAGT51WHhSJlGIz8DV28oMXnJSX3MFL4xEVLPOTrO
	 Jo8JOVZlm+WVSYlzNNL3NXsRB+eR2/8yLu+9Ui9uzpKggDKRJG8q8Om7WPhwYdQ1RR
	 t4t8nJ4jILRNVX+8jU5qfBwi1l6GA1yUcOz+35Z7OdO2fKc6eMfKCL0VgK4sNbeaBE
	 Y5LGO5wODwDSQ==
Date: Tue, 30 Dec 2025 10:51:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add
 exynos9610-wakeup-eint node
Message-ID: <20251230-dramatic-gregarious-stallion-15bc07@quoll>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
 <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_015158_467656_A461732C 
X-CRM114-Status: GOOD (  13.70  )
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

On Sun, Dec 28, 2025 at 06:05:52PM +0000, Alexandru Chimac wrote:
> Add a dedicated compatible for the exynos9610-wakeup-eint node,
> which is compatbile with Exynos850's implementation (and the
> Exynos7 fallback).
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> index f3c433015b12..deb2730855bd 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> @@ -48,6 +48,7 @@ properties:
>            - enum:
>                - google,gs101-wakeup-eint
>                - samsung,exynos2200-wakeup-eint
> +              - samsung,exynos9610-wakeup-eint
>                - samsung,exynos9810-wakeup-eint
>                - samsung,exynos990-wakeup-eint
>                - samsung,exynosautov9-wakeup-eint
> @@ -107,6 +108,7 @@ allOf:
>            contains:
>              enum:
>                - samsung,exynos850-wakeup-eint
> +              - samsung,exynos9610-wakeup-eint

This is not needed. Device has 850 fallback, no?


Best regards,
Krzysztof


