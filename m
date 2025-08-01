Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C067C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFI2pTssP7nGhWUGJLnw+yPgpk5f3RrGH63eLLAPMrQ=; b=PStZ92MS9N+t2GJ60w3SgIXWfM
	nQf5OW0kIvFjCJybkQ9KYnAF1kmwBrfAV1psJ2Sk1VGzeMy2XeY4lunbOJbRpU4WSvdA5AiFaGEZg
	eSVIZHwuJwP+W2asc+u0yJTeJ1KigDW+oi/7fhGaUcdbc0f1MQ5HrMylaVmlfjmUoqDejS0EO9mm2
	GxtsPOtbTi52pgie3dcc6sqMVLL3AQ5k3e9PJo4LXVkCkJnc7bHRq8j8vvOnQE8GK5kL8OpMMvOAD
	co1ZAbdSzEcJ6pNSap53+MGyja0wExIXFwH9791iitbkaiP96tdQzHkpxXABd6Dvw/vEZZY2hUvYc
	yoQoqQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTo-000000063pV-25uJ;
	Fri, 01 Aug 2025 13:07:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoxy-00000005z6g-0TTb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754051668;
	bh=gFI2pTssP7nGhWUGJLnw+yPgpk5f3RrGH63eLLAPMrQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ntAzYNM/xoPxg7tl/ecqiifizscOEUvCqWHrGHx2xpq39nBPiyDD6fPoZXq7PEjtx
	 1rDJE08GD7psMW9/F45FXfSVl3/IaL9r/WD48Hhbx82eWT0xUrLXQJjoNZJTnldaym
	 PFV8i6rPg2GuC6AMkqFlnOjKyyJfrlBwcYK/4CtXOWFyRPLk9MpLc14DwU0SUc8+r2
	 Gy/xjTX8sdd8Cfb8orMGmSyVm5EHQ240PCCZqV8H/lRmvT49XDj2AKFBCvN4LKAXrr
	 IhB9rcrOJFXEbBt5pyjBLuWxdjHQz3Yjs8wI3sz6Sg1eA0UAUczuF0jEt3rBBp/CLi
	 qHRNxYJVfat+g==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8F85cF092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5D0217E0202;
	Fri,  1 Aug 2025 14:34:27 +0200 (CEST)
Message-ID: <ab6fdc6a603bb1d09c4c28b73ac91e67f27bb833.camel@collabora.com>
Subject: Re: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
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
Date: Fri, 01 Aug 2025 14:34:26 +0200
In-Reply-To: <20250716193111.942217-6-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-6-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_053430_305732_AA8CF49D 
X-CRM114-Status: GOOD (  14.99  )
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
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
>=20
> Document the compatibility.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../devicetree/bindings/media/i2c/maxim,max96717.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 9afaa8a7a3f52..78ecbab8205a5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -25,12 +25,17 @@ description:
> =C2=A0
> =C2=A0=C2=A0 The GMSL2 serial link operates at a fixed rate of 3Gbps or 6=
Gbps in the
> =C2=A0=C2=A0 forward direction and 187.5Mbps in the reverse direction.
> +
> =C2=A0=C2=A0 MAX96717F only supports a fixed rate of 3Gbps in the forward=
 direction.
> =C2=A0
> +=C2=A0 MAX9295A only supports pixel mode.
> +
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: maxim,max96717f
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - maxim,max9295a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - maxim,max96717f
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - maxim,max96717

Reviewed-by: Julien Massot <julien.massot@collabora.com>

