Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38544C88CB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8FmHEvnmbzUP4vtQLOTlZM8bMrMzhs7Se6Hmqknmxg=; b=O2h/PEaWTdOHlhjfj68LZ1ipcF
	a/k4UjhDsH0bheWrrfiCuZkyVgr4/mUhF07x6csUVdL5XVTGV+MHCSFCgC4ZsPYf6KFk5piIhHHQi
	b94GiL0LRyNk8qIj+VQnIXB8iNSg9hDif8uF9WTMf0OZD0oQopVELzdaXXcnjS9lvrRUET0WdXE7L
	ZcW/lIgxRIRfnZUzyRU7ukx6CZFkpfl9gemNH7VY5QEzl8nEc3pXShYL8AwrSLc2WDgPQgz87mMBx
	w/+G5cuBiKMZkwPSimIm1h1YnZ1AzWl2/hbeaHpfsbT0Wu3QlePG4W5vcW0KgCeknv4pzVUAb/ZNr
	29wd1mZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTp-000000063qu-1LYw;
	Fri, 01 Aug 2025 13:07:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoyw-00000005zMa-3TPG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754051729;
	bh=C8FmHEvnmbzUP4vtQLOTlZM8bMrMzhs7Se6Hmqknmxg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h2OM8FoKBU/uigF8dHwvR14102JwdYaEyHsLlmXalyFOExzw3bpBEIAuSFEqf8MhJ
	 vlOPl3sUFrPh+a0wv8VALo7NmRalG6TbVpJxZ9Hc2cWDP9EKHGCUpBsHwG0SYpSOMp
	 /mCa0hJ2Lg8iSAZSEhgcGogoohvqKcUfAbLyBVJuN++hM0673cCkhclGkpvmKQZO4i
	 rauQBq2pVMO6KLT9bU8bJSlvWmi2g7mizAbHruUUX1v05KZg0aKRQ3K0V5UWDGX8OC
	 0oEm5yz5RVRijShKZPiMwZQ5devf13niFalwG9kyJK7AxYm3xje5VwT3rW5x8osYFD
	 bZvaHnzLi7Hdg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48D9117E0DD7;
	Fri,  1 Aug 2025 14:35:28 +0200 (CEST)
Message-ID: <5a12d6adc1ffcdfca7ad2d77dc7a080839f5a375.camel@collabora.com>
Subject: Re: [PATCH v6 06/24] dt-bindings: media: i2c: max96717: add support
 for MAX96793
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
Date: Fri, 01 Aug 2025 14:35:27 +0200
In-Reply-To: <20250716193111.942217-7-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-7-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_053531_042142_200F21E0 
X-CRM114-Status: GOOD (  13.44  )
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

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
>=20
> Document this compatibility.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../devicetree/bindings/media/i2c/maxim,max96717.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 78ecbab8205a5..02a44db982852 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -30,6 +30,8 @@ description:
> =C2=A0
> =C2=A0=C2=A0 MAX9295A only supports pixel mode.
> =C2=A0
> +=C2=A0 MAX96793 also supports GMSL3 mode.
> +
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> @@ -39,6 +41,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - maxim,max96717
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - maxim,max96793
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: max=
im,max96717f
> =C2=A0
> =C2=A0=C2=A0 '#gpio-cells':

Reviewed-by: Julien Massot <julien.massot@collabora.com>

