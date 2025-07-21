Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3C5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 01:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s//7MjuX07y4aMFmJCpTEwCT9TCj/TYkQ55O0eQjT4I=; b=VNKKiv7yx0yTv05YKCCfvCnnMe
	WRWflDeOQGPxW7yT5bO75vyGUYoM2al/9eqfEK5/UKgqyonVkgLBY9Imwk4FY1vB5RYyFicj9LxDj
	7ZI9RZESDWf8YPPmEplAsOC+AlWHMaZJ0wc0utpWlUbwqDveZw001owL0JMAn+NF0bXg6mRC7pSLH
	M6tSxhMrKIvpjENTw5Asm7PZ2BdtJmiA30WwBmgA6hyqyIiwNtMmd19AaDYSpP6gzaCni3JShFIDV
	pXloO0YIH7Iz/pygQ2eQfAMvq8J1hYRQ1EgrKMeu+3iAtfNlC19xZ19Sw3j0DvMCvKDB0+zYmfjnV
	P+nOMUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udf72-0000000FurI-3DLf;
	Mon, 21 Jul 2025 01:14:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udf4b-0000000FuiG-1j46
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 01:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753060326;
	bh=s//7MjuX07y4aMFmJCpTEwCT9TCj/TYkQ55O0eQjT4I=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Pqbl3gkgwV28WX8LMF7FFKluhrO2t0iskwad6rrW6ZNv0dkVaSarK2ey92y9gEMOX
	 LGvjl/Zy4czwCdITA9MMQ+6srHX+KsESqY1ZXNfQwzQSvcojwuUhGk8pU7Bw2LI5iI
	 Q6YGhuceFsEqgcshG/gHVKukz3OGhTPgNE1AULMrQwsHSFB1B9JBGN8zjtm+C+DH+O
	 OSnOr0fyXffZpA9nrC8Nyg07E5EzysIyFJp0LkHWr216oO2+72EUjDABLyiIXo4IvM
	 wQZznT4B56QHjxwOIp+OeAOI04nLwIE62l3BKzZYkOg5wWJYHUqLsPKNmViXqy0C9f
	 IXHrXVKuscvpA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3FD3D6443C;
	Mon, 21 Jul 2025 09:12:04 +0800 (AWST)
Message-ID: <0b9b6c712bff18a25da218c507d18b9a8f18c7e8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0
 partition to 64MB
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: rentao.bupt@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Tao Ren
 <taoren@meta.com>
Date: Mon, 21 Jul 2025 10:42:03 +0930
In-Reply-To: <20250706042404.138128-6-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
	 <20250706042404.138128-6-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_181209_646433_8EB71C2F 
X-CRM114-Status: GOOD (  15.53  )
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

On Sat, 2025-07-05 at 21:23 -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Extend wedge400 BMC flash's data0 partition to 64MB for larger
> persistent storage.
>=20
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
> Changes in v2:
> =C2=A0 - None (the patch is introduced in v2).
>=20
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> index 3e4d30f0884d..cf6c768cbad5 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> @@ -92,7 +92,7 @@ tpm@0 {
> =C2=A0 * Both firmware flashes are 128MB on Wedge400 BMC.
> =C2=A0 */
> =C2=A0&fmc_flash0 {
> -#include "facebook-bmc-flash-layout-128.dtsi"
> +#include "facebook-bmc-flash-layout-128-data64.dtsi"

My preference here is that we maintain two separate DTS for Wedge400:

- aspeed-bmc-facebook-wedge400.dts
- aspeed-bmc-facebook-wedge400-data64.dts

We do so such that we implement aspeed-bmc-facebook-wedge400.dts like:

   > cat aspeed-bmc-facebook-wedge400.dts
   #include "aspeed-bmc-facebook-wedge400-data64.dts"
  =20
   &fmc_flash0 {
   /delete-node/partitions;
   #include "facebook-bmc-flash-layout-128.dtsi"
   };

aspeed-bmc-facebook-wedge400-data64.dts includes facebook-bmc-flash-
layout-128-data64.dtsi as usual.

From there we can consider aspeed-bmc-facebook-wedge400.dts to be
deprecated and can remove it in a future release. At least with this
arrangement any revert of the (future) patch removing aspeed-bmc-
facebook-wedge400.dts has no other impact. Further, both layouts will
be supported in at least one release, making it possible to update the
kernel without requiring a simultaneous update to the flash layout.

Andrew

