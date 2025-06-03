Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4725C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k79/t0nkrynCfBdnkrMBZYitRqiJPksoN+vCidZA6tg=; b=xg9MIIcMyZfrke4yc2RweyKhsD
	UZWhfutLR6drJ0ScszeX5md1b9XvyJZhyqFyLyUqz9JZuBQWL4/s+MBhriRK22k63mSvUdpz34jYq
	WAdiynhDKMVHYr4IMChm3LToyHVfUkXoWL/R2aUtqaEk4HbnwNhepFzijRJtv1jybs+Tl507zZQJX
	RQvQsvqrt6I8iuH7Gbsqp6zJFCi0iZfRRUsO51MdT0fk7lpCLJtPIfkftupQ8GdvPoJ9tZU/H0KKk
	UAgd8KPXa16CHxhvK2WVcukS3tnYqvy7cr+HrO09MCgSv7iekgKUOs5R4pluv8IqSZaLBzSUCpnds
	Pzb25/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTyH-0000000BKzH-0YEz;
	Tue, 03 Jun 2025 15:54:37 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTpv-0000000BJvD-2Jop;
	Tue, 03 Jun 2025 15:46:00 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553Fjb4Y3549572;
	Tue, 3 Jun 2025 10:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748965537;
	bh=k79/t0nkrynCfBdnkrMBZYitRqiJPksoN+vCidZA6tg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LAIDzCaGtrG7BOYxjg2Zy5SWUgjPSOlLbzKuTEjYh/xUtaU3Ngn30qsYvcZeXbOUf
	 e+PmZpftIyyC5AdxoaRviwrh6UP/f9H/+jYz5OBXeqxh8jy9KDtEkTt8BBAZKQZ3E3
	 KTlOUYZnkGYFn/ST7gI7cjN8yWxgA+R8JAAFv+pk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553FjbLd3852667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 10:45:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 10:45:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 10:45:36 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553Fja5C649814;
	Tue, 3 Jun 2025 10:45:36 -0500
Date: Tue, 3 Jun 2025 10:45:36 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing
 reg maxItems
Message-ID: <20250603154536.cfa6galvuwkq2qxp@recipient>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_084559_778483_95698C12 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 13:57-20250603, Krzysztof Kozlowski wrote:
> Lists should have fixed constraint, so add missing maxItems to the "reg"
> property.  Since minItems=maxItems, the minItems is implied by dtschema
> so can be dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> index eea822861804c259068aa8c4598188db28895518..682ccd76f5c25fc13bb3375007d39e6208cdddc0 100644
> --- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
> @@ -36,7 +36,7 @@ properties:
>        - const: scfg
>  
>    reg:
> -    minItems: 3
> +    maxItems: 3
>  
>    interrupt-names:
>      minItems: 1
> 
> -- 
> 2.45.2
> 
Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

