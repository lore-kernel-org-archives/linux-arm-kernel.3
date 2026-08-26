Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF68C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 16:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnxgNR5WWQm0yDzd+q6sVXxurB4Rd56QMbymwCLpFJk=; b=mYmOeob2PVGKWZB5JKxd2r/NS9
	f94KoEXJtWU9zPHMPT2C3xjzi/0Q6hHSfVxMrUj85xmofGzOjTP27pSxVmP8NOiEsB4y6Zm2qyV8+
	A8H8rtv128FMHuMnOESP8DvAxTzfx2RaWw1K8jwcg8iMsg+p2HZSee8D5EWDMlWgsEpjRXzuLNstn
	Vu6LSlEPOHQpOKlSQVpd5beZl7OJXkfZ1oP619ZO+7/3VFAmUfWutlcJHFmkyGyI/wj1ye3A1A2E8
	urYft2ZvIhEwrGkm9aCg9o7XFTAChvlo+cHt81eUTMa3xqPCsSK7t/49HjrzI8f9e6dw6go1L2gJy
	62HX5sWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG6H-00000002i7g-1nXu;
	Wed, 26 Aug 2026 16:03:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzG6G-00000002i7O-0tQy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 16:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B348A43DE7;
	Wed, 26 Aug 2026 16:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6ED1F000E9;
	Wed, 26 Aug 2026 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787760219;
	bh=RnxgNR5WWQm0yDzd+q6sVXxurB4Rd56QMbymwCLpFJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ETpPhqfns3CwldzFBG2OS3/dN3QyUtCNwkRid+oTT5k0johGXheLILQnPHig0u4l6
	 o+LEp1Boqs9+w7iUQnnVD+zdz5kzNuLcLcmS92A/1smUwI2UbRjQoZ+npq2ym96Q0Q
	 3o44NWDb6BRuw1fmeaOm/ki9OJ/kCauy1zLeiRcHFD3idQBOH9YFF5Qp+XDpZjZh1X
	 wmisNPy0IyhAmLq8DO9Q3Kuxwi/foR/bvFwNccL+b/iB8UHN/Q2CySsIrHYHs2liOI
	 UpBu1gUSmieU+xpNcE7sPn/4LcI8jA3hoif//XnRWDC7WEr6wsHhUxPO3SKimMtA7O
	 Vs0AvqpFpH1Uw==
Date: Wed, 26 Aug 2026 17:03:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: xlnx,xps-iic-2.00.a: Drop bouncing
 mocean-labs.com
Message-ID: <20260826-reprint-sputter-86be94026ad6@spud>
References: <20260826103042.147735-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CAxsDecBpRMJnNHp"
Content-Disposition: inline
In-Reply-To: <20260826103042.147735-2-krzysztof.kozlowski@oss.qualcomm.com>
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

--CAxsDecBpRMJnNHp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

JIC,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CAxsDecBpRMJnNHp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao8OVwAKCRB4tDGHoIJi
0q5ZAPsHM01xyuXDdgNxlHnBRoBPYW6bTBHfKEXhHFO0/fDDMAD+KIaPaGVuljPj
KDYwN2tvcsIUMznbWT3sPiILRBIRdgE=
=T58V
-----END PGP SIGNATURE-----

--CAxsDecBpRMJnNHp--

