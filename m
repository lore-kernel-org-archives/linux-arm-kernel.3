Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86AEE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKAe5kse7ySflMCJRkFpPfXqxTPpttrr2GUL45Mgi3E=; b=HbTFnWsGHV50UfyY9qjsv7qDeb
	ijohP8suhJhGVCdoe2N89MJN7ImZ7zkZCzlt9xCrVlqSiFc/IUWJTFdZKkzkxdf3zsUSOSSDQVzfU
	T0DpPWOpwKljFoINzR4nIlpWP+ax3TCiasV6j32ypqrHJQexFU5M95NolGVcXkfwDw5gebKvLqof3
	AVoRDZVsmhGDrm36x8Q2FxN0iFoQ6Uhetia1D/uMRCso4BFwE77r/m0Q8S/hgKu94Wqe5WlgkjZmA
	ObMoiXTtwLZvGk7yebDXgrjPyEi979+SDcn618eGIzNqSoi6ammWYtCgyO8zs5RDvIOYb9g5YVp62
	fdNbMxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPLlS-00000008J7O-49hp;
	Sun, 22 Dec 2024 13:12:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPLkE-00000008J2m-0wJ7;
	Sun, 22 Dec 2024 13:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54C865C4A6D;
	Sun, 22 Dec 2024 13:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07341C4CECD;
	Sun, 22 Dec 2024 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734873099;
	bh=FKAe5kse7ySflMCJRkFpPfXqxTPpttrr2GUL45Mgi3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9ZdRSmuOQqaqgY7flqvIKQDAiVr/brZk+7capi5EzXBwEMU8X4p9IAfYVZiYGZ2M
	 6uR/dNJSVyVNuKQfzTZPgIo66DPBuGUHf10o5TxQEckau79iMKxoUWeXLjY/dKyNiz
	 WxeZRfO4XPkl9E2jlvdO0uzffLtzGhYwpLEDUjUE4axBqDe7OuiBd9eceNiaASplPC
	 KlznabphS6rRh/NjTmCJF5Meq66pagfQd4liMTlrA+9ej+9e69sII8gbX4F7BUUsGH
	 QrmRXS/FjFB74uXFnMu+5/h/JfNqkOcT/bf9daiE61lDDISxByvXOGkCh0jw02oAC2
	 fF3O5FI9YOX0g==
Date: Sun, 22 Dec 2024 13:11:33 +0000
From: Conor Dooley <conor@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, maz@kernel.org, tglx@linutronix.de,
	jonas@kwiboo.se, macromorgan@hotmail.com, andyshrk@163.com,
	liujianfeng1994@gmail.com, dmt.yashin@gmail.com, dsimic@manjaro.org,
	tim@feathertop.org, marcin.juszkiewicz@linaro.org,
	michael.riesch@wolfvision.net, alchark@gmail.com,
	sebastian.reichel@collabora.com, jbx6244@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Radxa E52C
Message-ID: <20241222-wrench-chill-cbe767f2bd90@spud>
References: <20241222030355.2246-1-naoki@radxa.com>
 <20241222030355.2246-3-naoki@radxa.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fp1Q5ff1LwMJP26w"
Content-Disposition: inline
In-Reply-To: <20241222030355.2246-3-naoki@radxa.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_051142_312502_213E1F60 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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


--Fp1Q5ff1LwMJP26w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 22, 2024 at 03:03:54AM +0000, FUKAUMI Naoki wrote:
> Add devicetree binding for the Radxa E52C.
>=20
> Radxa E52C is a compact network computer based on the Rockchip RK3582
> SoC.
>=20
> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>


Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Fp1Q5ff1LwMJP26w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2gQBQAKCRB4tDGHoIJi
0uvTAQCSXWst0Dvvu8rAl+NaSj777VuzcFo05j0UdeB1rUQ1VgD/W8LkajXSX7iK
6MXKbUzZ2OysERW4Y00htFufiEDl6wY=
=3ruU
-----END PGP SIGNATURE-----

--Fp1Q5ff1LwMJP26w--

