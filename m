Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63262E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RB/vl1xZENeqYUPqxa8Gv9J0tIN+fUFldgQCXs2ENbk=; b=1oEQ+KYJSF5eOGkthGdUDyOoux
	k8WEzdqQZiMPQiF60uW8QngDEy8YMlU0QqxiaxRijhtIjjoW9zcKKAwXU27mz2EMJ3lcx2PEYDVzQ
	Xevt5PWG3Rw027kl6/M+jPlmY23jkoCe+yoC9IQIEqbA+JLZVm+NaktqIOZb/P/pMFGbgC/TX3hcc
	pzmzwgHz/Uqwwv5qbD9gVLHU8peinq39Q1TURIYMDdAp9nrJr4JzbtmOChuu88IO7AHZ1z3tacGXL
	HtBuWcCK+9vaaY36X0F7tld4gIZDNsXuRXHMNiUdNc6Fvsjv5BdGi8iuO+axIOHLEsmy07KLoQ3z+
	UdMECRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcJ6-0000000EXZU-2ZRk;
	Tue, 17 Dec 2024 18:28:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcI1-0000000EXMF-0JXF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 497C85C3E39;
	Tue, 17 Dec 2024 18:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D930C4CED7;
	Tue, 17 Dec 2024 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734460044;
	bh=RB/vl1xZENeqYUPqxa8Gv9J0tIN+fUFldgQCXs2ENbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMHOyiam9cF06gX0sD/20gWYwACF7ZcYC4bAxANmYK5U8cBWBNnXUgKQqzk8W6fEM
	 HOuzdxFXxsiUbOleKLBK64JAqGfL2OvWMnV1EYDYAH73TP09xFrixmB8hzmyJNQCkO
	 /a24rjx9xtANDjlvuf6CfBqEpVD367G1tx9Rt+ZN7nhp61wp+QSJ8bQIQFhZ7S1Ueq
	 szjnRe/cluvX8+2k26fvudnR2ltiUNlMrZD+ZOu9Yg4w5ueE3vGsOXDiaQs+PEbD4B
	 LWMnhTHdlJyJmIlU9rvt6iidldoDVtPxwiS7/uac2BGtwHD9PAaPpld1lRN5XWfiZw
	 4Y8cNp6Vdvk5Q==
Date: Tue, 17 Dec 2024 18:27:19 +0000
From: Conor Dooley <conor@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx283: Describe sensor address
 using the reg property
Message-ID: <20241217-strongly-twiddle-b9e1ade32570@spud>
References: <20241217032821.1712916-1-david@ixit.cz>
 <20241217-moving-rubble-712bba91af4d@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tqzicyYakCoVLuvO"
Content-Disposition: inline
In-Reply-To: <20241217-moving-rubble-712bba91af4d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_102725_158266_47377891 
X-CRM114-Status: GOOD (  12.77  )
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


--tqzicyYakCoVLuvO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 06:25:47PM +0000, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 10:28:17PM -0500, David Heidelberg wrote:
> > Use the reg property instead of text in the description.
> >=20
> > Signed-off-by: David Heidelberg <david@ixit.cz>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Heh, I was super confused as to why I couldn't find this in patchwork
but then realised Krzk had already acked it, d'oh.=20

--tqzicyYakCoVLuvO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HChwAKCRB4tDGHoIJi
0kFoAQCOhVUZvn6NqTMY+RR2X1uEyOAU6/iXeUyvpRjegTYoMgEA++gnaSbACMxl
hhbNIVzB2UIPcvKgT+yVJURaMtryjA4=
=MDSt
-----END PGP SIGNATURE-----

--tqzicyYakCoVLuvO--

