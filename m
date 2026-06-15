Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F93CCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oPS+Y1pYLh2LoThtzAEMH5rc8g5VXbsmKl4ASL/bE8=; b=D9d+vQQo9LScdbFKREe+GE70H6
	ZfZhUd/Wd547JRIUQVNfcaCH1qYki+e5A2SZIjPyhMldzkqT9jnJ0XPWCk5SE0bS2Xe24kkU0OBQv
	AlnqylpR26ULceQXxVItZU9k8QKziSqQqBJEn3DHnH85Jsxxx2sDRG4Y3vGO2a7mXfnUXaHDZGt06
	jnx1HQLIlNPWZTwVPqcKX2lJ2kQDrpEwBu9J6QAZveNaLvNdNCKlDPzixhsCHR1xQpkCKjttlvqj3
	vZWravJlhRThXMcxHjvPyjSaWN3RyoftF289rJ4m711REhW+hnKlP64BVqN0jcqlbMOXpc2oGTv39
	43Gsxmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAXi-0000000Ebgv-41gZ;
	Mon, 15 Jun 2026 16:52:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAXi-0000000Ebgh-0QGh;
	Mon, 15 Jun 2026 16:52:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B2BA600AB;
	Mon, 15 Jun 2026 16:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04DC1F000E9;
	Mon, 15 Jun 2026 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542329;
	bh=0oPS+Y1pYLh2LoThtzAEMH5rc8g5VXbsmKl4ASL/bE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BKZ5Tb43YYrUg1ln3/B3cJ9bwglkhABMmJRVElKe62Jz9oCIljLckqtwlCHuV36cb
	 gaKNzgMuQVRwSJKVEqkqTlX0GSp4lKyFxGxurLqgC3o1PZq4NKRu6RQ8tSaq0ZVBkp
	 CFX+gmhcYc/ps8dqk8AxGpRvc2bwWxz/GqhDqgBhVYmdxxMl+CGSRG4xIX3JabxiB6
	 sElsBfK3Zj8uXhf77PRzFIKNnva7m1vLuWjTvUNgj2CcIiCl7T1U3ggApt/vun6mHf
	 TEXE7PX5Zk11K1mUsBF5rDPEU/k3Gdfcn1Tl4zL3DvSXTOdRp6/YvnEe1z12T94ePk
	 aM84bdmQqhTTQ==
Date: Mon, 15 Jun 2026 17:52:04 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 gpio irq property
Message-ID: <20260615-ultra-pagan-84de490070e1@spud>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NjemHPfGrfprJAyg"
Content-Disposition: inline
In-Reply-To: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
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


--NjemHPfGrfprJAyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Given Linus' comments on the cover letter,
pw-bot: changes-requested

Thanks,
Conor.

--NjemHPfGrfprJAyg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAttAAKCRB4tDGHoIJi
0od8APwK8rXpQw86pv1NXaMpKqdBFRw9Bu135w/2LvMhUYg16QEAofCtWZ2oW1Wc
CZPw5TNiFlXIuEJtG7Dt3Lvo6SMYqwA=
=LwtE
-----END PGP SIGNATURE-----

--NjemHPfGrfprJAyg--

