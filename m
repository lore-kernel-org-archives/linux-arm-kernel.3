Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A05DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CL0w4oOT9XgoWfanym0NalBxR1t1EggECPLc3rv3Sk=; b=PdiP8Bt3ZvI5bssXfl3+mpqWPB
	JkY4KrWhM8WCvYu7uw5yCuALC8pRQAwJz9RT58rouYn7keOglsfBWLMa6AkAZJ+UPejOjWcWfiVH3
	GvwPrtwt0NVbzM01OATINvcXdJ+k+q8SOdNdWuhKRVi7AY4DiZpO0l7GcmwVnW5KWhfXDiG2iucmj
	lWyNtim4Yy0FjiRtVx50jAIHh5d5AXSGzOFJk+fF1Plm2jWZp3xLI/bs8zwnJc+b62Fg8mmha4gqZ
	X/WMBXTnYHEY2904vSOfdhUDRiRdZnPNRE+BKsP8W+llXWq823Wiwg8Vn4s0LfqG/u3OIero9qREB
	3ffkAZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxYE-00000003x6t-3uko;
	Mon, 17 Feb 2025 09:36:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxFl-00000003u4t-1eOg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:17:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tjxFZ-0008U5-7G; Mon, 17 Feb 2025 10:17:13 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tjxFX-001Nlp-37;
	Mon, 17 Feb 2025 10:17:11 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tjxFX-000479-2q;
	Mon, 17 Feb 2025 10:17:11 +0100
Message-ID: <67fe157ce8ca3c3c4e08451da52f7c94f73439b2.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/8] dt-bindings: spi: Add STM32 OSPI controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 christophe.kerello@foss.st.com
Date: Mon, 17 Feb 2025 10:17:11 +0100
In-Reply-To: <20250210131826.220318-2-patrice.chotard@foss.st.com>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
	 <20250210131826.220318-2-patrice.chotard@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011725_434207_706811FB 
X-CRM114-Status: GOOD (  19.60  )
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

On Mo, 2025-02-10 at 14:18 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Add device tree bindings for the STM32 OSPI controller.
>=20
> Main features of the Octo-SPI controller :
>   - support sNOR / sNAND / HyperRAM=E2=84=A2 and HyperFlash=E2=84=A2 devi=
ces.
>   - Three functional modes: indirect, automatic-status polling,
>     memory-mapped.
>   - Up to 4 Gbytes of external memory can be addressed in indirect
>     mode (per physical port and per CS), and up to 256 Mbytes in
>     memory-mapped mode (combined for both physical ports and per CS).
>   - Single-, dual-, quad-, and octal-SPI communication.
>   - Dual-quad communication.
>   - Single data rate (SDR) and double transfer rate (DTR).
>   - Maximum target frequency is 133 MHz for SDR and 133 MHz for DTR.
>   - Data strobe support.
>   - DMA channel for indirect mode.
>   - Double CS mapping that allows two external flash devices to be
>     addressed with a single OCTOSPI controller mapped on a single
>     OCTOSPI port.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/spi/st,stm32mp25-ospi.yaml       | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32mp25-os=
pi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml=
 b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
> new file mode 100644
> index 000000000000..5f276f27dc4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/st,stm32mp25-ospi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Octal Serial Peripheral Interface (OSPI)
> +
> +maintainers:
> +  - Patrice Chotard <patrice.chotard@foss.st.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-ospi
> +
> +  reg:
> +    maxItems: 1
> +
> +  memory-region:
> +    description:
> +      Memory region to be used for memory-map read access.
> +      In memory-mapped mode, read access are performed from the memory
> +      device using the direct mapping.
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: phandle to OSPI block reset
> +      - description: phandle to delay block reset

Are you positive that these will only ever have to be reset together?
Otherwise I'd add a reset-names property just in case.

regards
Philipp

