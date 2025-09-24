Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02376CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1TL9FcBEKBPktZuNee9w+LuTn6dwsMRfe/Fei5GdKk=; b=Xtyjlss5GFCWjX031ViOCcDVia
	mvcJPVhQLBGfOypuVfxkDnZsOcur+oONawmvG9KovxfpyyavbQU4sT8vC1bQnEi7hC06GfZNhIuFj
	z5Wcx01PAVjKfX0nuACf4ZXAxdTFlyFnOCbBnN2PSp8q1usIUftsqbf/i/veekhLKKknF3feMN4v6
	NrWwn+z2pDv5XUOUEH1N2MolXibO2HWzZRUtmX6qs6BsNQy7OekIkdiIh9I35bt+bdfWEWhZFVOfd
	9oPmK/HXJAG74N/aqsIQQ0qsQNG+ArocS3wcVhxGwW9BY1Amlacd21nY91YQZBTQ03zTKkVEK+FVX
	oG+UGQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ux8-00000002yEr-07qd;
	Wed, 24 Sep 2025 19:14:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ux6-00000002yDR-2qKA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 19:14:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E80CA441A9;
	Wed, 24 Sep 2025 19:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCF4C4CEE7;
	Wed, 24 Sep 2025 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758741295;
	bh=T1TL9FcBEKBPktZuNee9w+LuTn6dwsMRfe/Fei5GdKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INQUvJ0OY0IOTHbUTZKHChE61SxueHG7+lMs0JuSjmuGlq4BYPz0ltJxR8CRUrD6D
	 y5EKM7acqcikuGbOf7gjtZMjHttBwb2iz6jhVKtAFY1KInbmzYbXu+mQAoyoNQFQ4n
	 Hj/JEUhZq18XXYDiJ5vfhnA61l7olASU7WiPfPkzCQ9FPDcrKPP2lKktBU22aZqI/A
	 zlY91HSMQx4zd2vB1cOe69qurZzOl7crwf8g5B1/Qr1gUJ9bNYe+MW8/ZqM4HP6YLA
	 w61zu1+fmOZDoRMD5Pa4ZxNx3bZLWi7PmjfIFZ74T1hxkWpgXFdYOkkqG6R+wYjVSQ
	 yuZUc9pXAr1Aw==
Date: Wed, 24 Sep 2025 20:14:50 +0100
From: Conor Dooley <conor@kernel.org>
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Guo <alice.guo@nxp.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: nvmem: imx-ocotp: Add binding for
 i.MX94
Message-ID: <20250924-chomp-shakiness-c1882c9ea038@spud>
References: <20250924-imx943-v1-0-0d32d7852ecb@oss.nxp.com>
 <20250924-imx943-v1-1-0d32d7852ecb@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+IiXT27lUb0BdT98"
Content-Disposition: inline
In-Reply-To: <20250924-imx943-v1-1-0d32d7852ecb@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_121456_731197_367574EB 
X-CRM114-Status: UNSURE (   7.18  )
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


--+IiXT27lUb0BdT98
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+IiXT27lUb0BdT98
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNRDKgAKCRB4tDGHoIJi
0hTiAQCYzrrbAXZdYICVu4J1no5zRkudK4GVF6AHWu8BHe/eegD/cymuT+8GmqkU
zWJ12fxOOaXL19LJlF/sxDbSY1sHago=
=yioo
-----END PGP SIGNATURE-----

--+IiXT27lUb0BdT98--

