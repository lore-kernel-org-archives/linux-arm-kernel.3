Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D14D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jD9IhMlTkTKhEl+qsJul7DlgC95YTdQp6DQwN3sXz+0=; b=drLTZrr/oANJOwD049ceqFIApa
	CqlIHvmey+b7DnpaEqXzvOzbyiYVCeZjendRtzLjqSYzwAWeY9SeAEu6gA16JYfrMoE24ZR9WGie1
	Wampg6eXCDAVholbiJju9mclYTVnXWqmIKPN1Iy09RC1/XZZr2WYG3zwkePXhDSJkrbL9RTaKvx3z
	A2Jdub/OgGfrIIxEtXsIGfA5XkquinNj8+DV9c68WcAEKQGOj361DkdQnrnJ0tT2c/68RA+F3if2k
	wmN7O5l3gbAz/iFp9yJABySldWd7tXssORn8S7X6YOa7dfegClnYdC/47+zgXCLTxomho7TeCiLBv
	GU25cUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbEW-00000001EEN-3AVP;
	Mon, 11 Nov 2024 20:42:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb8a-00000001DAz-2CJy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70651A40849;
	Mon, 11 Nov 2024 20:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2013C4CECF;
	Mon, 11 Nov 2024 20:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357351;
	bh=jD9IhMlTkTKhEl+qsJul7DlgC95YTdQp6DQwN3sXz+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7RtvOxe1eV3paQTMZF0E0wgHOJpUSQW55RWoEzh0rl4StvYNcsuSnFGPKe/Hk5FS
	 N6vmxXLr7gtRL3Dt7vzXRYhHjhMZdDb7EDHJG/RjsAQOX+ZIC0ECkrxDQYqUaj8K/O
	 uOu7PKW/L1Xpkgc/Z1jkWSmD+gt02S8oT9+8PqRI5v4rNr7k07s9kTGaGwgvchfgpt
	 jqMwefgYmDT0IudkGj+k+qBjaIEzKionTyiGltvqu1mCAwvnDQZuk3VxQvdyO9Kamg
	 AmhJzK6eGRA4Ot7hxkK/dAexGGE6fDYag/G7m67LwAFQPsY1hR/c687JuzeE/xvSdP
	 lRSK33AFYzpFw==
Date: Mon, 11 Nov 2024 20:35:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 03/14] dt-bindings: watchdog: sunxi: add Allwinner A523
 compatible string
Message-ID: <20241111-esteemed-tissue-337ce5f108a7@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rlQpuSGKQTNIpwjz"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-4-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123552_648764_8D694BA9 
X-CRM114-Status: GOOD (  11.61  )
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


--rlQpuSGKQTNIpwjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:22AM +0000, Andre Przywara wrote:
> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
>=20
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rlQpuSGKQTNIpwjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJqogAKCRB4tDGHoIJi
0kZYAQCM0zsg+49iqBqKBacKijQrJerc8T6Xw/ZyGsmo0adCmQEAjkchuYxIObPb
zZukFFH5sHTMlLvxdQ8GI/592mf5vwI=
=tNH2
-----END PGP SIGNATURE-----

--rlQpuSGKQTNIpwjz--

