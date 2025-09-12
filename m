Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5B9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXJ2oC8S6Z4A+5++3zfnVH2BmkG9EAisRMz2UFUpNFE=; b=zBf9h2ARcWPitNu0SLs4LimOX7
	glc7f4wq+gIJy+C8+YKdMmGNv6VSgbN2euFNufzpY5yMrV/pcjP/5dF8moJ3YJjiY3xJ+REKWxSTb
	4KkJce1l1kQmXBSF/V7Z3OmTLlMlYVH7uU58uGFWUI3EiH3AjacRbV3hUWwpBnpwnBMzkgbctku1N
	9oAKqbkLLkRsraUBIfPhlV7NPB88/ZpU9l8W1iwKSR+bPLH+4c1cyg6lXdVZ1fHM6D3a3jlPeZC3R
	20Kdamf3llzW3+vve5/UAwQj1JyNTWg1sNMKEI8qOxCKEy4/7ippn4D1+FPy7OwhyWV/se8NbWhQq
	sX0AluBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0bv-00000008Rtd-2JVO;
	Fri, 12 Sep 2025 10:02:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0bt-00000008Rse-2HvC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:02:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A59116A3;
	Fri, 12 Sep 2025 03:02:18 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FED53F66E;
	Fri, 12 Sep 2025 03:02:25 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:02:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via B4 Relay"
 <devnull+j.ne.posteo.net@kernel.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Initial Amediatech X96Q support based on Allwinner
 H313
Message-ID: <20250912110222.5e4153ec@donnerap>
In-Reply-To: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_030229_619836_F420E83A 
X-CRM114-Status: GOOD (  14.81  )
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

On Fri, 12 Sep 2025 01:52:08 +0200
J. Neusch=C3=A4fer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:

Hi,

> This patchset adds an initial devicetree for the X96Q set-top box.
> WiFi, Ethernet, and HDMI depend on drivers that are currently not
> available in mainline Linux, and I didn't enable them in the devicetree.
> The builtin infrared receiver produces IRQs when a nearby remote sends
> events, but I have not checked whether the events are decoded correctly.

You can either do a simple "cat /dev/input/event<x>", then check whether
keypresses generate (unreadable) output, or you use the "evtest" tool to
decode some information:
https://cgit.freedesktop.org/evtest/

But I guess if you see interrupts consistent with remote keypresses, it's
a good enough indication it should work.

Cheers,
Andre

>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
> J. Neusch=C3=A4fer (2):
>       dt-bindings: arm: sunxi: Add Amediatech X96Q
>       arm64: dts: allwinner: h313: Add Amediatech X96Q
>=20
>  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 235 +++++++++++++++=
++++++
>  3 files changed, 241 insertions(+)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250911-x96q-57e63380804e
>=20
> Best regards,


