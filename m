Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71E7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbMTFBkaNempQ9R89eRUdq5Tnnibi7nvv+qJWfTi2ys=; b=rOkQ9oHQysxlSul6PrB5HSfNxz
	kqTyutvv+upYm6MDBpxCmoTpjAAXON3Gnx/VSD3ButJ8SUC8aESnuQK+WAmVHabVFEPvGz7Pb0Vw2
	v5M9xbQU8/2ytas5COST90fUimRPmmP9dyThx8AS+bI1TNJOtBnsXK/Y0EoCQufIePe/bjSRPCMUZ
	lvd8VVNZjDqwmI6woXK3/+qEhKqX3jrREnOzv8eZe083/dfZwqardIU4OtDb0px8u9+GRfqBj9czO
	syM+cF7ffCWFsgGZzqVo0LjdWo5gi+ZdpQG340UBOM+W4KHDnxDPVOM7yFlrUSE+j2V0M0XkAdmmi
	PIPzL1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WTi-00000008dC7-1i5n;
	Mon, 22 Sep 2025 02:40:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WTe-00000008dBF-1bIJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758508823;
	bh=sbMTFBkaNempQ9R89eRUdq5Tnnibi7nvv+qJWfTi2ys=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GkIVyXN3hTKABUPSJs3w6GjAn44kF9bvQknDdWFdldCOnDKkSNfoDnN1uylHmcHD5
	 tvO4lPlxKNJLrZjgvqLxgjxv7nOdwyVqOJO9ta8+M/EQ73dCxpXBptqdTm0wUmSmfX
	 SGuVqkXmK0Yorlsugi587z7v95484+DTFgx25q3w8lJDwFRWtWBfoGexDbaMBtE334
	 MVZ34FU0g9+PdEvqSfuRanyzXxW5cGO/j2EkZ93AOID2fiec5rMi+WhzQBXL+gYEeO
	 A1F5BfbwyH6j3zQRAvBV6KsRe63IrO8nyCIWSjl/LHXSqt/ggdrUQ+lXWfLuDmlUwH
	 dGitfe2CtzYLA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E29CF64755;
	Mon, 22 Sep 2025 10:40:20 +0800 (AWST)
Message-ID: <dd660ce0388afb61e476f164335600f3fc2b1fb6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] Add device tree for ASRock Rack ALTRAD8 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rebecca Cran <rebecca@bsdio.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 22 Sep 2025 12:10:19 +0930
In-Reply-To: <20250917180428.810751-1-rebecca@bsdio.com>
References: <20250917180428.810751-1-rebecca@bsdio.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_194030_617490_CC6399F3 
X-CRM114-Status: GOOD (  15.50  )
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

Hi Rebecca,

On Wed, 2025-09-17 at 12:04 -0600, Rebecca Cran wrote:
> The ASRock Rack ALTRAD8 BMC is an Aspeed AST2500-based BMC for the
> ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q boards with an Ampere Altra
> processor. The BMC runs OpenBMC.
>=20
> These patches add a device tree and binding for the BMC.
>=20
> **Changes between v1 and v2**
>=20
> - Reordered nodes to be in alphabetical order.
> - Removed status lines.
> - Fixed naming.
>=20
> There are still several warnings from
> make CHECK_DTBS=3Dy ARCH=3Darm W=3D1 aspeed/aspeed-bmc-asrock-altrad8.dtb

Thanks for checking!

> I believe the only one which is reporting an issue in my dts file (as opp=
osed
> to included files) is the first, and that's because the code partition co=
ntains
> the TF-A and UEFI areas. I couldn't see a way to suppress it.
>=20
> aspeed-bmc-asrock-altrad8.dts:578.16-581.6: Warning (unique_unit_address_=
if_enabled): /ahb/spi@1e630000/flash@0/partitions/code@400000: duplicate un=
it-address (also used in node /ahb/spi@1e630000/flash@0/partitions/tfa@4000=
00)

It seems odd that the partitions intersect. Are the offsets correct? If
they are, can you add comments to the DTS discussing what's going on
there?

> aspeed-bmc-asrock-altrad8.dtb: /ahb/apb/memory-controller@1e6e0000: faile=
d to match any schema with compatible: ['aspeed,ast2500-sdram-edac']

*snip*

> aspeed-bmc-asrock-altrad8.dtb: gpio@1c (nxp,pca9557): '#address-cells', '=
#size-cells', 'gpio@0', 'gpio@1', 'gpio@2', 'gpio@3', 'gpio@4', 'gpio@5', '=
gpio@6', 'gpio@7' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0=
-9]+)?)$', '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#

This one needs fixing.

Cheers,

Andrew

