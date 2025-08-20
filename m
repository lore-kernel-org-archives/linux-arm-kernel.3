Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5220CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D8W1wgzBCU1IBhsaL8Ih4oXH5oLkuQ2Of2eNQ1Kv40=; b=xntvqu0aUcObmMkfw/R2Wgy9Bf
	Ln6uH6q/e10PXWYbqFXycu3ooXC5D1V19AtpNgjZeM684TBQ8ER4mXqfmJRV/DTHpHFNxpgvG11z0
	ReWBDbt95ytPz6R8pCs431e1nIzjQq0TGiq5MkmLHL+qW6cAxAXyLnKCVh3uyV4xDu7iG/3wC/LQX
	vWyCezsO+BAGaNzp0qd1Cxmd4Eg4ghFqDTlTG5T3sAKJsjNIveqofZFEKa8EJxGFQLU/3u3spVtsr
	Oa7AkF93MJGuvcWZX9u5dYMuUd5UbUxKmHiDuyHcreGZGDVrRJdd0c6evuHJPn3fMmYlxw4Kwj5He
	s3S6Eq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeKy-0000000Cltv-0IUZ;
	Wed, 20 Aug 2025 08:38:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodss-0000000CgNv-2mZV;
	Wed, 20 Aug 2025 08:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C901B4531F;
	Wed, 20 Aug 2025 08:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A65C4CEEB;
	Wed, 20 Aug 2025 08:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677365;
	bh=VAzAJjUiSUbgkKmTprNwXqi/ADJs5TrO9JHx5kVkx+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOfMF2XKuFZ9r6EL8l2uZd7HA9goBHFWsgTRwXYqi/9aD1JkjH1+9nYdJhcNdF81F
	 /x21Oi3ERxVy8/ymXXrlZ+lLjoOPtlFcHPiE/Ku5CZnylZSt8bfD6nRSJab0HteLVJ
	 4vC7fWx0cZLX0oft0A+tZuQs7qCAeihz5+617N6dV52As+d/j6asfxC5H1gfEmdpDT
	 fZ0pCdW7aj1LfQkblAQ0R97PWE1rqasPnoXXidgELe0exyfLt2pFJLDQvHgMYDy0NY
	 097C3qB18uWPqp2dAhmO9b98jnyIoLl07bZZDNaUjPFvJQKzfzNl2mEvBV0BB9uW8z
	 MegMfa+DzfofQ==
Date: Wed, 20 Aug 2025 10:09:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/13] dt-bindings: soc: amlogic: Unify the compatible
 property for clk-measure
Message-ID: <20250820-shapeless-devout-pig-defdd7@kuoka>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <20250815-add-more-socs-to-support-clk_measure-v1-5-59f04ba67457@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-5-59f04ba67457@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_010926_721913_E575434B 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, Aug 15, 2025 at 04:37:31PM +0800, Chuan Liu wrote:
> The clk-measure IPs across Amlogic SoCs have minimal differences, so
> they can be managed with a unified compatible property.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> index 1c9d37eef5f0..a7927acde2fe 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> @@ -15,15 +15,7 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - amlogic,meson-gx-clk-measure
> -      - amlogic,meson8-clk-measure
> -      - amlogic,meson8b-clk-measure
> -      - amlogic,meson-axg-clk-measure
> -      - amlogic,meson-g12a-clk-measure
> -      - amlogic,meson-sm1-clk-measure
> -      - amlogic,c3-clk-measure
> -      - amlogic,s4-clk-measure
> +    const: amlogic,clk-measure

Obviously NAK, cannot stress more how wrong your approach is. It defies
all rules for writing bindings.

Best regards,
Krzysztof


