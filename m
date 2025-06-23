Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E05C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7uybZ6Jee+DgIMG+lVOiH43zJ3SvTr/jowuILPWQbc=; b=XKwihGkASfH5hfQIK8EXD/wotX
	z0nPKJEeu0/V7WPDZrW3jfxAlBWPHqPgJfPc5gNd3q0+Z4VFhx3Yk7LNKHuR/6IyEP7LUz6T/ppNl
	v/9hmEi/NJTN80N5NhnzfC/ZKBBT6klzq11w01NOF0O25CGkcirKxr9M0YRR6M0QhSZCbxDAsBRNG
	jWPfPdCPo+cRw6ODNwQA3joObSKCiXbb9cpm7+PF9BmJLsInbHUUkCNFTEfwMT4ulfl1FbTdPCWJX
	3F3/xtv/3kzkmGucLtOx/rYHu3C5Ghg3lbbQMwb/7R50hBUgrpYK1oQpvWjm1n7tMG9pv4muAP/rP
	qeu7cpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdV9-00000002Aze-2GVp;
	Mon, 23 Jun 2025 09:30:07 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdJx-0000000293L-23iD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=n7uybZ6Jee+DgIMG+lVOiH43zJ3SvTr/jowuILPWQbc=; b=r68pb9F75zKL7vGHnhM3q3TasE
	GnEJcd6PwKGQ01hH6MjERdCWMdmSaUKyWUt3CNPlJ6ltkyPWk74NKhBuwNpdjQ4uvIYD/H1Jv0uJw
	hmIPS8SBah+NdgEqRjduZxon6P/bh0DscmQSQi5AFGTUUp3b25iVRzJ9cMfXdwfAeZYZBE+dIr5Tb
	vrgcK/sptmlNak6K1kQ+xipDGEZ+gFEEhxcDcfDtamb8CI/Ui66Gkee26EjSVSBelIDafk+TedmX5
	Ulo+CoKwH4vMdBGrSEaOdX/9nwq6ALhQ+mw77SSRCSocvr0X+//2Dz6s7oMo5oH9VDJ6j+P52o82k
	L2YTri1g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uTd4I-000FUF-1u;
	Mon, 23 Jun 2025 17:18:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 23 Jun 2025 17:18:18 +0800
Date: Mon, 23 Jun 2025 17:18:18 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ryan.Wanner@microchip.com
Cc: davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	olivia@selenic.com, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] SAMA7D65 Add support for Crypto, CAN and PWM
Message-ID: <aFkb2u8hCgHmDMsI@gondor.apana.org.au>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_021833_540322_DA7FA273 
X-CRM114-Status: GOOD (  18.89  )
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

On Wed, Jun 11, 2025 at 12:47:24PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This set adds support for the SAMA7D65 SoC crypto subsystem and enabling
> them in the device tree. This set also adds PWM to the device tree, and
> adds and enables the CAN bus system for the SAMA7D65 SoC.
> 
> Changes v1 -> v2:
> - Clean up formatting issues in the device tree and DT bindings.
> - Add a description of the capabilities for the cyrpto IPs for this SoC.
> 
> Ryan Wanner (10):
>   dt-bindings: crypto: add sama7d65 in Atmel AES
>   dt-bindings: crypto: add sama7d65 in Atmel SHA
>   dt-bindings: crypto: add sama7d65 in Atmel TDES
>   dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
>   crypto: atmel - add support for AES and SHA IPs available on sama7d65
>     SoC
>   ARM: dts: microchip: sama7d65: Add crypto support
>   ARM: dts: microchip: sama7d65: Add PWM support
>   ARM: dts: microchip: sama7d65: Add CAN bus support
>   ARM: dts: microchip: sama7d65: Clean up extra space
>   ARM: dts: microchip: sama7d65: Enable CAN bus
> 
>  .../crypto/atmel,at91sam9g46-aes.yaml         |   4 +-
>  .../crypto/atmel,at91sam9g46-sha.yaml         |   4 +-
>  .../crypto/atmel,at91sam9g46-tdes.yaml        |   4 +-
>  .../bindings/rng/atmel,at91-trng.yaml         |   1 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts |  35 +++++
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     | 128 ++++++++++++++++++
>  drivers/crypto/atmel-aes.c                    |   1 +
>  drivers/crypto/atmel-sha.c                    |   1 +
>  8 files changed, 175 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.0

Patches 1-5 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

