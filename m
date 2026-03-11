Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4271125865
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 18:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9iyV4BAqADOKjQtFBjZoNRoOzXo2dCNmcaw6qiOPDc=; b=aTsKn61N402Gtm4hV/3u88mHWm
	uGY0R6QRQxM75/H9DR77ydOL2+Rzrv0gN6Srf2oyl9FSLOpos08lVSaIJAryYvapUgWNGv28pvwfJ
	1XHYklczyKezufdjVpiK9DU0NXIXWXvjJFGkB+vkMcPkc9jR11mht6pQS0/QsNWekESV7du+MdsuO
	TDKCJm8E54H+XiA/owzhI1KlhORnpPxicHvNGUOVe/NgbWt3iKLEuVq91DP9FhLio9hvaqPN9utCu
	Ww8eMdXpKSANwR9aBYMB3Vqt526XXHk5OCYtLqUBLxyPOt3hOadUghMaJgXv5dViqVSb0t6HOoNxp
	MmXd/P7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OKN-0000000CBR4-0tRV;
	Wed, 11 Mar 2026 18:30:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OKL-0000000CBQd-35Z3;
	Wed, 11 Mar 2026 18:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8C9060142;
	Wed, 11 Mar 2026 18:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E320DC4CEF7;
	Wed, 11 Mar 2026 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773253836;
	bh=H9iyV4BAqADOKjQtFBjZoNRoOzXo2dCNmcaw6qiOPDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqqHsTW1FNZIUsSzpeDcTSk3ohzzEYANXyL8xJAX2cnewL2+GpBLJLoDT2mU/GEXj
	 332g818ldYAMvyp95Txb58wONuGezP9nnKjG0WFE9NoTuU5Wjc6IX84Jlbqcp8dakS
	 WQqKMiGsRe4aZ9IK3PgaEU2akJ1qoF+4ZAYQckeFEaNqLIHS8YxdRbBBGILA0051hT
	 iTZPnIujwO6WMGicVHf994zoxjT2wx+8746ioxZVQghm+uObypYaGy6HjibN/8l+qa
	 +Cn6Avd37scMH7gOY1/s8YgRG1sO5ZUuQfd8eMlkeWxC9WqVHUl/s2/Ka3vC8I0MDK
	 Ss5kgSlKosaJw==
Date: Wed, 11 Mar 2026 18:30:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Hynetek
 Semiconductor Co., Ltd.
Message-ID: <20260311-reprise-cartridge-a8f9c470c243@spud>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
 <20260311-husb311-v1-1-f25bcb58cff7@flipper.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g9wwrn7c0e9Ducz2"
Content-Disposition: inline
In-Reply-To: <20260311-husb311-v1-1-f25bcb58cff7@flipper.net>
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


--g9wwrn7c0e9Ducz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--g9wwrn7c0e9Ducz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabG0xwAKCRB4tDGHoIJi
0lz1AP4haoaHSQSCTFXf2VkikeqNx9Iano/zc6eK3AkPkUhT1wD+Pz67k5Ynrl1g
BhHnDtJhHMCBkhuW1qQ51yemvru8iQI=
=t7Zv
-----END PGP SIGNATURE-----

--g9wwrn7c0e9Ducz2--

