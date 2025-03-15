Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C34C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hJhGJ9OfCsgUOC8k5woQVSeucpJBmdlb3gPK7xykbU=; b=xnKYB0vTS3vGY2b7L/CGCzrNaT
	DJPXLUUFbD1iCanlzmbvRouaa7JdHG5boQVCDEzbE1qZBxAk8hO+XlJtfDcTQ/EcAQ6DfGc5YeNmx
	B5tum+RVrRAsAaQPMlsBM4QSqZcxn32aXFJmEp1CjZT4TY37y9lyq4Fr50b6SF8LJziASVw9G8xxu
	XQWvtgLkDDVlrpZ6beu70Hfu6Tl682jywxwapE9dxqFGTd5bI3+5ICwfxF6LZ5rEUgedYZb9/7Nqq
	4qqBb7RH5uzk9zMr3zQoPLchVrr/zIvDR1Lk/zsdVUDUtgYHu3O5gqggrfdHmCkbMu6WBHDgEYkyq
	Ptbh7MQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNl3-0000000G7yL-0wzO;
	Sat, 15 Mar 2025 09:24:41 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNd9-0000000G6Y8-4149;
	Sat, 15 Mar 2025 09:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+hJhGJ9OfCsgUOC8k5woQVSeucpJBmdlb3gPK7xykbU=; b=SF48966bNfMBDi1jBsj05t3bcQ
	rVhIVuqd612r1BUxwqrEwt76NCtqUYBn+GyGqVgxe9G9l362ZNiCuA5pGCoYo3oVQJz2Z6gjUvraY
	iQJkOxYxQJ9VHY45t9PXAYbC4NfJSSzlY+7weUa9gHX/hKHDGt/dvBDtbhFLTrV7tYfciqWx1aaLs
	7RoEZSF5ouIvpxNrJYkrhs+uCjtClsBmWosoODB/1td/ECRqqMUQB/HFqIigQk1wIwCXAf1Q+DHp/
	+VxZDT7dh4/ULAuA+NRe3OknlmUKD/2XDDO4EwmylWTI8kBuoFxPe7cB51MQ4OFv0BGJQ+1dh+wEy
	0OVA0iDQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttNcO-006o7v-36;
	Sat, 15 Mar 2025 17:15:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 17:15:44 +0800
Date: Sat, 15 Mar 2025 17:15:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rng: rockchip,rk3588-rng.: Drop unnecessary
 status from example
Message-ID: <Z9VFQOjcFxJLAlfr@gondor.apana.org.au>
References: <20250307081406.35242-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307081406.35242-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_021631_996077_DEA083FA 
X-CRM114-Status: GOOD (  10.28  )
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

On Fri, Mar 07, 2025 at 09:14:06AM +0100, Krzysztof Kozlowski wrote:
> Device nodes are enabled by default, so no need for 'status = "okay"' in
> the DTS example.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
>  1 file changed, 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

