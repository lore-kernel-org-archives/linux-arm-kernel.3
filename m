Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051F8C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bch9uttwVQdrheNzwa52D20UCQjfb4EkFYmaAflWFMM=; b=oyy0tPbx1NZbp4AjfbZSJ3QWcX
	ZHS31OAi+DPj0sGjeo1X9USwvGqQkFIUzaDD73ip2OFT8Bw4hfCffwtm0Cx0eWOGQJJemjUafmF7d
	4azBAvr5E7L4GxJLrS5gXe7CAnaXqH7GEyEOwGqPJegBrmHGfyQowJVuyhHEZ9w0Kgj/inzdVoi4G
	R1yezmMySzEcHlojVOJ64gRbmMRMKQjkZZLQdbu3OW27K0XJ62vhHea2Bg2XC/wfQncsMgPBMJY/e
	OqNiUAqhDiscBMKvrVUTji5jJACg2dTMf98pgykKk7tCYny/b2pkQp+3puwMw7syainmRwJhyiOnK
	Pc8gsrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHwA-00000002GTn-2o0S;
	Fri, 08 Aug 2025 07:54:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHdj-00000002DHh-3UEW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A27D43AB4;
	Fri,  8 Aug 2025 07:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1E7C4CEED;
	Fri,  8 Aug 2025 07:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754638546;
	bh=fSFQ4BFpgAzz0JTLtrpfPT919diDmGwK+Dw9OkWmuBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZy8Mme7TpW+NGxATpczCzeRM6bqUT5ztLWouhxQrAQQ29h9gpy4Efhg9SvkfZ86Y
	 Jk/Y60NKWGoRpxKrKAn/gYvH9JDy+jqeUQdckwhWK/+NoJVphBCR+FxAqCCfUoyj6i
	 meBtj4HyISCka6PY43NN1jLZiqLazDBiihwTP8gZRWFA3Sc5oqVHnFp1DMpYUNXOBc
	 hsKvtpVvdhFG++wPnQ5GLIjl5oeZHn36yw8Gq/+ehwBCsL3zxXW6W3CaUpOQNag2Kg
	 BCzpIBrdztWJbwAVvFRVxun9GjgHOg/+bCVwefGxcZ/L67C0yT9A2gweRTeiC9lAm8
	 P22Evj6X/7TPQ==
Date: Fri, 8 Aug 2025 09:35:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, David Wronek <david@mainlining.org>, 
	Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 1/5] dt-bindings: clock: marvell,pxa1908: Add
 simple-mfd, syscon compatible to apmu
Message-ID: <20250808-amusing-ladybug-of-joviality-3fb371@kuoka>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
 <20250806-pxa1908-genpd-v1-1-16409309fc72@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250806-pxa1908-genpd-v1-1-16409309fc72@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_003547_904500_F5A48616 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Aug 06, 2025 at 07:33:20PM +0200, Duje Mihanovi=C4=87 wrote:
> Add required syscon and simple-mfd compatibles to the APMU controller.
> This is required for the SoC's power domain controller as the registers
> are shared. The simple-mfd compatible allows devices whose registers are
> completely contained in the APMU range (such as the power domain
> controller and potentially more) to be children of the clock controller
> node.
>=20
> Also add an optional power-controller child node to the APMU controller
> to accommodate the new power domain driver.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  .../devicetree/bindings/clock/marvell,pxa1908.yaml | 36 ++++++++++++++++=
++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml=
 b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
> index 4e78933232b6b925811425f853bedf6e9f01a27d..5e924ebd97e6457191ac021ad=
dafd22caba48964 100644
> --- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
> +++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
> @@ -19,11 +19,15 @@ description: |
> =20
>  properties:
>    compatible:
> -    enum:
> -      - marvell,pxa1908-apbc
> -      - marvell,pxa1908-apbcp
> -      - marvell,pxa1908-mpmu
> -      - marvell,pxa1908-apmu
> +    oneOf:
> +      - enum:
> +          - marvell,pxa1908-apbc
> +          - marvell,pxa1908-apbcp
> +          - marvell,pxa1908-mpmu
> +      - items:
> +          - const: marvell,pxa1908-apmu
> +          - const: simple-mfd
> +          - const: syscon
> =20
>    reg:
>      maxItems: 1
> @@ -31,18 +35,38 @@ properties:
>    '#clock-cells':
>      const: 1
> =20
> +  power-controller:
> +    description: |
> +      Optional power domain controller node.
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: marvell,pxa1908-power-controller

I commented on next patch, so oly to re-iterate here: no, don't create
nodes just to instantiate drivers. You do not have any resources here.

Best regards,
Krzysztof


