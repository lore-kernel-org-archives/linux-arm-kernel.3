Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF39E67A70
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 06:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Pd1IHZrTY03dZ7O5xKLgyJKeO2qrgel3KP5ZUCWbs8=; b=upH+Lq7gYv62ZOUVSuD0VD8mt+
	trGCr9Moc+orCnX/eq69IjjFYIgEc29X9lCkheYsbwFg0UZcswPkpllsJib3dfuIU+u8dp2RzNtpe
	uD31YgbKprPn3quwMlTKrnDBV2Vr9fwLTDklQKvN3XYPGZRWU74JhDyO3pT0mPIpwFUjnehO25R9b
	ZQ2r5/6STk0Z8Q1yS0PVuTgEOzOvokmLnImqV7Hbri8PtHlNVxaKpZvlM3rvJocZTOqStYORQsdeE
	W00hAiF66cPOt1ZhMo/tmQorDoQGevkT9j3eWcIU4h6a3644qeHgaVxmnyu0ZVjOHLI4urez+wIpe
	6P72Abhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJUK-0000000EcqE-1jTT;
	Tue, 03 Mar 2026 06:44:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJUH-0000000Ecou-2fan;
	Tue, 03 Mar 2026 06:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6BF7442C1;
	Tue,  3 Mar 2026 06:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03677C116C6;
	Tue,  3 Mar 2026 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520247;
	bh=9zYNNRI2Q7A4txbtHEUZ0XbB7KUSfcEmFITlL2iLQ38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBUe/JSu+08xGAhX5bdw/+KOyZFqyiSky5ZMFVDFKo+6sJMzrQSXiE+oMLTrl9Q8W
	 qy9xj2q9RW1aoPlGTSlpMDhWcYQGkm14UiNz7v8ccYAQlpxD/GY0c1vnTJhKrP4vHJ
	 uPyuRyVh7++255oup1e00jxcf//n0J0aBkqSj+VjuR+HyZhKWzvq2FmWMi6dUGJ4Vt
	 ydyyIpDaF4teM/y4iRgYung1XVvT1sJ7jTrrLrW98NC3YoB6J5YnrqfAzJSFQzMaRV
	 IvAhF4251bSn9/PjiBxI0u5oTpM4F2MbyL0PSH9gmmP3FauLNXm/1NKAHGIbGNWJA2
	 s944xsSdpcAlw==
Date: Tue, 3 Mar 2026 07:44:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, atenart@kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: inside-secure,safexcel: add
 compatible for MT7981
Message-ID: <20260303-brainy-dalmatian-of-proficiency-adbc3b@quoll>
References: <20260302230100.70240-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302230100.70240-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_224409_694978_119527B6 
X-CRM114-Status: GOOD (  14.33  )
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

On Tue, Mar 03, 2026 at 12:00:38AM +0100, Aleksander Jan Bajkowski wrote:
> The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
> This commit adds a compatible string for MT7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v2:
> - just add compatible strings
> ---
>  .../devicetree/bindings/crypto/inside-secure,safexcel.yaml  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
> index 3dc6c5f89d32..6c797b7ce603 100644
> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
> @@ -18,6 +18,7 @@ properties:
>        - items:
>            - enum:
>                - marvell,armada-3700-crypto
> +              - mediatek,mt7981-crypto
>                - mediatek,mt7986-crypto
>            - const: inside-secure,safexcel-eip97ies
>        - const: inside-secure,safexcel-eip197b
> @@ -80,7 +81,10 @@ allOf:
>          compatible:
>            not:
>              contains:
> -              const: mediatek,mt7986-crypto
> +              oneOf:

Drop oneOf, you have only one enum there. This is just enum directly.

Best regards,
Krzysztof


