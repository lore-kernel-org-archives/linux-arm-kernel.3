Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A19CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DczCpxNaKSvjeM3R5dTVcQppZp7elZJyeOuBB/Vqoqk=; b=qlADevoaJdRtUHEBdyz+Mekbnz
	cLD782r62SS1wrrHkx/X+plupoS1eWnFpYle57l2Kfp9tyuB82rOpMcRs/iYm+jCHVMrUgPzPMftA
	HhBoNnoL1Gav9BAYcIQ9PYv9wWREVqnmeIaJqGfufOZLXbVzNCGswofMzt7F4RlxwCbSk+NSemk2t
	GJ5X3JdqXgduTeCUMh6vj0Mb5uTf+vOf2PdDwzhyG64CJByTE6SOd+pSNNfRLskA42hGvgdwMBaay
	u2JJCGRx1ZvotNVWeUpXcnag521xXlPvSbYXjQ5nD7hjDkZXvhbMNqpavIWzFPcrDg/i8E82+GVN7
	rta2TEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2FA-0000000D47k-1Wjk;
	Thu, 23 Jan 2025 18:47:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2Dr-0000000D43A-3CmN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 18:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25A2B5C5A86;
	Thu, 23 Jan 2025 18:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED4DC4CED3;
	Thu, 23 Jan 2025 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737657993;
	bh=xRs52lnDW+3EPY7W1diAkuIowIIBS5h+ZR8ZnRYlmzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KcsoVOsYhlA3/ktn1A28fZL/qamOfSb69vNnRHZ+Coo/Dyd1ghedXYE9e7P5KTQBv
	 6l+StJwvpCLUY1SXLif+6kXE8Xl3Dx1sQrUM54AhbIVrIdcp1bO2jTrTSdbaF/G0SX
	 gA7HVvE2W/1WIPVBs7FPUtuRp9rGHrZm1acQaDeNvcwaqzsE89NOm4fotvusPNtUOB
	 8tnW9GHA3+n6fuXfIR6JtkSgBZmyv7KOPS1N29/0k5GS9HPb68Vgu+LAswGZVLamGs
	 2UZZu7k+soKHtupNJN2ML6a+31dkrTpplwEOplV1m2glK3C24TwdAbzVMc1X7jizCE
	 fOYbvYaX3TdEw==
Date: Thu, 23 Jan 2025 18:46:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH v2] dt-bindings: dma: convert atmel-dma.txt to YAML
Message-ID: <20250123-crucial-yelp-de4a63b0e3b5@spud>
References: <20250123-dma-v1-1-054f1a77e733@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="USuX8QMl72gqtfih"
Content-Disposition: inline
In-Reply-To: <20250123-dma-v1-1-054f1a77e733@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_104635_892159_8FBBE06A 
X-CRM114-Status: GOOD (  20.97  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vinod Koul <vkoul@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Durai Manickam KR <durai.manickamkr@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--USuX8QMl72gqtfih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 02:58:01PM +0530, Charan Pedumuru wrote:
> From: Durai Manickam KR <durai.manickamkr@microchip.com>
>=20
> Add a description, required properties, appropriate compatibles and
> missing properties like clocks and clock-names which are not defined in
> the text binding for all the SoCs that are supported by microchip.
>=20
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
> ---
> Changes in v2:
> - Renamed the yaml file to a compatible.
> - Removed `|` and description for common properties.
> - Modified the commit message.
> - Dropped the label for the node in examples.
> - Link to v1: https://lore.kernel.org/all/20240215-dmac-v1-1-8f1c6f031c98=
@microchip.com
> ---
>  .../bindings/dma/atmel,at91sam9g45-dma.yaml        | 67 ++++++++++++++++=
++++++
>  .../devicetree/bindings/dma/atmel-dma.txt          | 42 --------------
>  2 files changed, 67 insertions(+), 42 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.=
yaml b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
> new file mode 100644
> index 000000000000..8d0d68786cbc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/atmel,at91sam9g45-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel Direct Memory Access Controller (DMA)
> +
> +maintainers:
> +  - Ludovic Desroches <ludovic.desroches@microchip.com>
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description:
> +  The Atmel Direct Memory Access Controller (DMAC) transfers data from a=
 source
> +  peripheral to a destination peripheral over one or more AMBA buses. On=
e channel
> +  is required for each source/destination pair. In the most basic config=
uration,
> +  the DMAC has one master interface and one channel. The master interfac=
e reads
> +  the data from a source and writes it to a destination. Two AMBA transf=
ers are
> +  required for each DMAC data transfer. This is also known as a dual-acc=
ess transfer.
> +  The DMAC is programmed via the APB interface.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:

compatible:
 enum:

You only have one option in your oneOf list.

> +          - atmel,at91sam9g45-dma
> +          - atmel,at91sam9rl-dma

Blank line here please.

> +  reg:
> +    maxItems: 1

--USuX8QMl72gqtfih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5KOgwAKCRB4tDGHoIJi
0t3xAP9LuhUuGfr5V4YXaUTK/z6aZn5QphsTGsu+j2FxTWKPBwEA2L8ZpbVYVkzA
sY6/DEzfAl4U+5LlJFfTSIilXui4xAk=
=UYo6
-----END PGP SIGNATURE-----

--USuX8QMl72gqtfih--

