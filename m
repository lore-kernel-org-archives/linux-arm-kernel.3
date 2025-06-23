Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EA3C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34TxypIJyscDJLphDBw7+DPinr1/GPNGSO+jpo8aCL0=; b=rXBpQBU6M/4Ludr9Pq9t+M6qGG
	LukxNgosYemNruB09mBbWk3wAdr/dv0euwnkUXOPLQmOspCvS8Izx1DkflwWbTHRX1D4+xlPhib55
	98ebPm0gBdiMcTgev7RWcXVWM1VLb7eosh/BNsSZLEXVZL6el3CnCsrlyu30IiU8+k1ijp91390kK
	2Zb64qTMUR2E6QBOJb6GggBQQcT54Zn4s/8OUJKp2eR9BUUVHEnKwWqD9wyxtlKRhxVIdwDKd7Ydq
	IQ98F/hsuk/nlIyaN3OMVIu/6JtrSlFiwIpBn3yKNVdYrLxOYAikaEWsKajZxOdo4M4puV0Z8mKgV
	gdY7vdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeZ6-00000002NkQ-1l56;
	Mon, 23 Jun 2025 10:38:16 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdJi-000000028zh-1s6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=34TxypIJyscDJLphDBw7+DPinr1/GPNGSO+jpo8aCL0=; b=drXULibQwGxgidQrP7A6XdplMP
	YFYg4bPm5y2irU5k0RG2tJU3tjk1xkOdUXoGbpAwV4RRbDVk910WkE8wC58VhuBZRBKmLJQnwnWJj
	KtYTWmlYqxuQzTjNv8/n8vd4hUySlo5Kksl8XPEGCru9CFj9LyS+36CbPd0cKCDBejg7li2yWTNFj
	3imYR6R3fVY6gu/hg6Qsj1r/6QEpzZ664vd8QneO6gv+WXT36RFg1EAvXl2/JQRf8QFT4y3drW6M5
	JI+F1P4YabWroEYJ7GSS+4OdKvlYzmTLaRrsutQBIZLncxkYJ6owHvSvswAE5D/HwmIrY/l6gYVPd
	OjQP0/3g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uTd3z-000FU3-1a;
	Mon, 23 Jun 2025 17:18:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 23 Jun 2025 17:17:59 +0800
Date: Mon, 23 Jun 2025 17:17:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: John Ernberg <john.ernberg@actia.se>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 0/4] crypto: caam - iMX8QXP support (and related fixes)
Message-ID: <aFkbx_39WopOdwdV@gondor.apana.org.au>
References: <20250611113748.2986988-1-john.ernberg@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611113748.2986988-1-john.ernberg@actia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_021818_488196_7F57694E 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, Jun 11, 2025 at 11:38:08AM +0000, John Ernberg wrote:
> This series enables the use of the CAAM (Cryptographic Acceleration and
> Assurance Module) on the iMX8QXP (and its variants).
> 
> v6: (detailed changelog in each patch)
>  - Fix property order in bindings (Frank Li)
>  - Collect tags
> 
> v5: https://lore.kernel.org/linux-crypto/20250610085110.2295392-1-john.ernberg@actia.se/T
>  - Fix indentation issues in bindings (Rob Herring's bot)
>  - Collect tags
> 
> v4: https://lore.kernel.org/linux-crypto/20250605132754.1771368-1-john.ernberg@actia.se/T
>  - Declare more compatibles in bindings (Frank Li)
>  - Move job-ring compat check under the job-ring subschema (Rob Herring)
> 
> v3: https://lore.kernel.org/linux-crypto/20250528144259.2603914-1-john.ernberg@actia.se/T
>  - Fix devicetree CI detected errors (Rob Herring's bot)
>  - Declare the compatibles correctly in bindings (Krzysztof Kozlowski)
> 
> v2: https://lore.kernel.org/linux-crypto/20250527071552.1424997-1-john.ernberg@actia.se/T
>  - Clarify in the commit message how the crash fix works (Frank Li)
>  - Restrict power-domains only for iMX8Q* SoCs in bindings (Frank Li)
>  - Collect tags
> 
> v1: https://lore.kernel.org/linux-crypto/20250523131814.1047662-1-john.ernberg@actia.se/T
> 
> Horia Geantă (1):
>   arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM support
> 
> John Ernberg (3):
>   crypto: caam - Prevent crash on suspend with iMX8QM / iMX8ULP
>   crypto: caam - Support iMX8QXP and variants thereof
>   dt-bindings: crypto: fsl,sec-v4.0: Add power domains for iMX8QM and
>     iMX8QXP
> 
>  .../bindings/crypto/fsl,sec-v4.0.yaml         | 41 ++++++++++++++++++-
>  .../boot/dts/freescale/imx8-ss-security.dtsi  | 38 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  1 +
>  .../dts/freescale/imx8qxp-ss-security.dtsi    | 16 ++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  2 +
>  drivers/crypto/caam/ctrl.c                    |  7 ++--
>  drivers/crypto/caam/intern.h                  |  1 +
>  7 files changed, 102 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-security.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-security.dtsi
> 
> -- 
> 2.49.0

Patches 1-3 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

