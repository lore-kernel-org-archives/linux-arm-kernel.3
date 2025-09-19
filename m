Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C225CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj/m644+t47KAw3LB4MKuqjLJmSbKJ/mTCXlvM4Q5NQ=; b=B8fOnr+ezNcxa/jZtMwi36Xvt+
	TOpE0kT6z4gS9XYNQpo7eZGPlSwOx2CM67ze4scIZZDaBgQl5/nKUOAHmL1Awo1ZksMFcNQukAs5y
	1PcLB/LtkBHDOyykACAMYKg0KrTgbFJ1e+aCoTiS0BfAgzdqYmpzXgRcFPjpAf0iQazqYQs5WjEKO
	mROHjaHoSIyFFCStgBXmtOynLd7f764hypW1uSqumIfyFKXj9WV6AlinBey81qTpVq069uQmuq4BT
	AWhd64qYyfLW+4FugYulj8HjvAhPrVkEVIBFs5W25LAhuIOYAaixqxIp0lqNxeL2yqh21vttWHkyp
	szGMpM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeh5-00000003dkB-1zMK;
	Fri, 19 Sep 2025 17:14:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeh4-00000003djz-1TZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 17:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF8E601F6;
	Fri, 19 Sep 2025 17:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10572C4CEF0;
	Fri, 19 Sep 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758302085;
	bh=Wj/m644+t47KAw3LB4MKuqjLJmSbKJ/mTCXlvM4Q5NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4hS36ry+QYbSYYmEtLZeosWU3x0Z4itK8GmXtBAYYmaFmi9RH01gYERfiCdenb1a
	 6RMyffkabKzw0nDDpwuf+qABO03smyYDKnWo7hjYYqUcVNcwlHOePxcMhVUq/syeQw
	 gjOmUnXR8OB5rPg9JM5WMf6mL7JWUYFJkhm8T9zkeUOqbVRBazugRT6/Z8IAzjxkCq
	 SLYm6CTTB78/e6ev5x1athG0v/oE/EIqfzgqaEqymCHjzCBSGb3mo/b+NF/WUxAp52
	 6DvQ18Tc5iWXawdyjZJFskbv5Rr337R8hfrMcX1nIFvCBZlsPQXhiGFBB/nN3UqZ2X
	 2uTGWDnRtCdgQ==
Date: Fri, 19 Sep 2025 18:14:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.chen@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	peng.fan@nxp.com, jun.li@nxp.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: usbmisc-imx: add fsl,imx94-usbmisc
 compatible
Message-ID: <20250919-anemia-repressed-9d8ea950ecaf@spud>
References: <20250919071111.2558628-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fEb/lBhoMoWNWi/F"
Content-Disposition: inline
In-Reply-To: <20250919071111.2558628-1-xu.yang_2@nxp.com>
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


--fEb/lBhoMoWNWi/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fEb/lBhoMoWNWi/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaM2PfwAKCRB4tDGHoIJi
0s4+AQCbK/8AUsOWCz+3KwYXizsLQGg7i0VwKgSPMS9KpKNUvgEAht/haKKbsye2
9I5raGzWfgrWOaZ+XbJyboPkFJS6pQs=
=8lcc
-----END PGP SIGNATURE-----

--fEb/lBhoMoWNWi/F--

