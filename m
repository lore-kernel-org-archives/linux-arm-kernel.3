Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938B2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf0dzUvkuTi4RkebswcGsF8OpwOBzlMwKn8xGnO/JgA=; b=NoLk66CJUMBBPXiQd+NrdAHQ9+
	byC4XWqr6+qu7tCh4P/GkleGV+/gsFvlPC2BoGugYfP74emBmcq7H2sotN8/oQLA5JLpjLEDukLVu
	u5tRcSEvbnQp8TWKUg7kKRwWStUnW4toj94Ll+0wYmmgooM5x2DXB4nQ4790Vbr8uAIFtGnD3tygP
	nJJRhbI3JmkiGp0hfFk3hGSA5TtPGmCbtDWxHDm7vPpqK++OZqlXodDS5d6Exq8siD/KFfadgMkkT
	xaCPtoTXkgapPy0atydSxSPnDQb9ac4TAY5jq3w8fZX7m82TPe45VS/6NgYtZWCZqDWUlGpD2UFvl
	5nLjvdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhowu-00000005xzH-1vps;
	Fri, 01 Aug 2025 12:33:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhohH-00000005mWE-0qtE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050633;
	bh=iqWJ70y9buvA8nkZlc67QtTGQA3nl96+0Hhd7pFajYs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jm6lQfizSsqJcUBefLSOsUCpwkP4p4z7b52sE+/dPAVQ1hkpBEC16xy7KV5DWiqld
	 91WqMEiPfOi70qjgsNEYG6hIGMJx+8gamdhu+wgTwND8hTTUtRWzatTaeIz9LYW9nY
	 MvOoAAIDNP8c9kmnqWIWqSHQ+t5e+dQrwsN+tNZ9rBBMKWkaTndoSOsFIlkJZAVRet
	 03yilDAdCIAO8EwEyk09foPNuHQbNlmz8i8yJXROUFKQkVNZkEh1x07oTEBSD4Tr7o
	 XOiTxKoeUA3zSBNHV9FHKRHmTTiTt6umyTO/9AvlWm+POtimM/XEMm6bL7SKS7BxaV
	 Qe7+4T+ujMs2A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85cF092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C88117E0DD7;
	Fri,  1 Aug 2025 14:17:12 +0200 (CEST)
Message-ID: <b8d48519e607698ada70ec1f87ee6e222e14940e.camel@collabora.com>
Subject: Re: [PATCH v6 02/24] dt-bindings: media: i2c: max96717: add myself
 as maintainer
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:17:11 +0200
In-Reply-To: <20250716193111.942217-3-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-3-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_051715_425106_C064ED15 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Cosmin,

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1=
 +
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..15ab37702a927 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
> =C2=A0
> =C2=A0maintainers:
> =C2=A0=C2=A0 - Julien Massot <julien.massot@collabora.com>
> +=C2=A0 - Cosmin Tanislav <cosmin.tanislav@analog.com>
> =C2=A0
> =C2=A0description:
> =C2=A0=C2=A0 The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted =
input
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24c557ee091d7..e973b0a985815 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14761,6 +14761,7 @@ F:	drivers/media/i2c/max96714.c
> =C2=A0
> =C2=A0MAX96717 GMSL2 SERIALIZER DRIVER
> =C2=A0M:	Julien Massot <julien.massot@collabora.com>
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml

Reviewed-by: Julien Massot <julien.massot@collabora.com>

