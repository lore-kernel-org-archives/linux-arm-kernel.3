Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C82E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfW+FErZ5uemWJ+QBpgvCgdf7t8nzwinnsolNQHp+n0=; b=2tfU/q6waWV2trcKFgNqiW3gNL
	1i+mQIz3PXRfW/GfIamZliVJAi3GrcMoygzIp+j7q3bdba+br9+b1tBXbiFmxqgPiQYS6ZAPciBI/
	XNumG2GxFRYhIRHAx0wkTOtOLuV4StJp42A+4Ceo8u4oEixkIlfsjx3JnRHTs+ropWGPvjIYNZ/uO
	WOlN66n21QKjc4XADmtBgcD4W+esd3YQlGIC5paI5U5YjLO6edFk9sIA2RRRicL2uwZBE9fa2zaHz
	GifHcrYLaxKHVzDhR2ntcleao34yPvizPMTlR9TKLQaIDXnDPM6EvKZ1UFGfLNeKxT9YSXOzhWHdK
	qCDMEfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQcJI-0000000EguL-409u;
	Thu, 26 Dec 2024 01:05:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQcI6-0000000EgGN-1AJ1;
	Thu, 26 Dec 2024 01:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XfW+FErZ5uemWJ+QBpgvCgdf7t8nzwinnsolNQHp+n0=; b=Wyeka9DBsSFrg6HICJYAVqRxiY
	my9eB04uh52BOT/tBX1j5WJuQxSZIa/GzRzb+5Ynui7I6BsJdFiVqDCN9JOCIGWuykZzPsDQVyD8F
	gtaCbDRDL92CeKRLdGFMSRQ1UGo36D8dn9TlFH0bYef1/rmtiMyB9lsieoXHKOjPoyJvKuo7Lbxa9
	KbfCaJEeGp7XlxX7cWRBbcCIbv9I15oKiDqPCITa5zWlO6uVKc+D48e34tjVZCJIoDUaJ6ONvuCM0
	ITse8dipe3ZKshaKLc0Pp9BA4Yqex9rCGBj4C1bRuAOV4Gh0n+HBab7uzAvMbcwK52wVUVfXywAlx
	OWVI4RGQ==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQcI1-0004ql-OB; Thu, 26 Dec 2024 02:03:49 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/17] dt-bindings: spi: Add rockchip,rk3562-spi compatible
Date: Thu, 26 Dec 2024 02:03:48 +0100
Message-ID: <4045324.kQq0lBPeGt@phil>
In-Reply-To: <20241224094920.3821861-9-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-9-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_170354_323218_F60F0754 
X-CRM114-Status: GOOD (  14.25  )
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

Am Dienstag, 24. Dezember 2024, 10:49:11 CET schrieb Kever Yang:
> Add rockchip,rk3562-spi compatible for rk3562.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
> index 46d9d6ee0923..104f5ffdd04e 100644
> --- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
> @@ -34,6 +34,7 @@ properties:
>                - rockchip,rk3328-spi
>                - rockchip,rk3368-spi
>                - rockchip,rk3399-spi
> +              - rockchip,rk3562-spi
>                - rockchip,rk3568-spi
>                - rockchip,rk3576-spi
>                - rockchip,rk3588-spi
> 





