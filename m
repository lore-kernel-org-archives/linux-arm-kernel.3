Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B24D13590
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d6s0xefeTSok5U260N8aHMKx8xZrDbMwnkBhDKmN4Q=; b=dBTpXtlwlTsdpJ+PQkjHSJ8ShP
	5+qfdQyup/hbOvmi6ocDC4uPqsFX9UdpZD/SlRKZm574lU2kMKFxsr1ReoTf2ETMxVBbQs/cveaI1
	o0YPGJxo1bjFV7XBtT+3Oh2WB9PjHbEtqXz+IQKafvQuiVsnpOciWgY50UswrJPCsi2+OoFTQ0EAK
	fus+xnJghHnsgkizLw67jB5OZYCotIrHL4TA+SZT3AHxVBqejlYkFkDjjNyX+Zz130DETyT1WxCnB
	WcDpgZiiW+hk09jmUmhPaEwErcVCDfuZKqDq4jb9weAQMjKQ+ITrr1yKOMGESStXVhCyFa36G9fbZ
	kTyEwcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gV8-0000000DTpw-21uG;
	Tue, 29 Oct 2024 07:18:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gPD-0000000DSRm-26kk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6654BA414E2;
	Tue, 29 Oct 2024 07:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF6C4CECD;
	Tue, 29 Oct 2024 07:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730185962;
	bh=igfKIenU4dJBGawwsJvxkzCU1VOD+q+NRQ0rb5inxyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oICyg007b5Gm5w8lag5yVt14qEuHdGfETw0y6VEKHn4w/2+3Xut+s17l7d0VbKdG5
	 P+mUdW0xVf2EL4S3vtkjlyAp5avy27nY2x+JdhgoQTKP6cvMzN5zjbHQLJ0cUw74ln
	 QnWDoP2fquZxcQ073e4poPypqnnYjw2HUHIXe5W+qDXrB6MShGJw+dDrfiPNKORvqJ
	 1eTAeePVW9dQspVOjJ0Iq0SmDekLCynKm4wVOIvdaNCPUqDLpdpgoiTIZyaTmDE8vI
	 BnUPa7sckEg5rItKMix1BIJGB+HS9sEzrOTCwD9pVIaV7YuJuvPjzej8EK1CPwGdIz
	 WlSbXvlboWIiA==
Date: Tue, 29 Oct 2024 08:12:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Subject: Re: [PATCH v4 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_001243_703517_A8A7F026 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:55PM +0100, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  3 +
>  2 files changed, 101 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> new file mode 100644
> index 000000000000..b11ba3bc4c52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2021-2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> +
> +maintainers:
> +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> +
> +description:
> +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,s32g2-dwmac
> +      - nxp,s32g3-dwmac
> +      - nxp,s32r-dwmac

Your driver says these are fully compatible, why this is not expressed
here?

> +
> +  reg:
> +    items:
> +      - description: Main GMAC registers
> +      - description: GMAC PHY mode control register
>

...

> +        mdio {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          compatible = "snps,dwmac-mdio";
> +
> +          phy0: ethernet-phy@0 {
> +              reg = <0>;

Messed indentation. Keep it consistent.

Best regards,
Krzysztof


