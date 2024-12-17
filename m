Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B91E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sbBvDuhs4dH19A+TJjyjA7fZtevh11swNjccUwIf0Y=; b=tV0mAhq0DIyf+nCpKKeDzLGiKG
	Li8yr1nUmXIeniT9ks3/XNgKjwpD3IInIy/o/z9Q0mngCzxxRi5+tUYqLEPUOl3Irf0knwUUf2ldG
	xnFWrZfZl4o18YgeLiRp2eZenxJCQalZ9eKyCDAcRAgXbhDfX8wC1Mqq1dwm18uppceSUjKxIwXpg
	Fj0crQrDGcg1g+6Qvyib+c4LTlHkV0HJhoDdBNvF6p2xl96SFK/+aRjXSQkkrRoMPTKT9uSpxrIVl
	AiIELfPITJZb5rBrVdUryG0OJzuIS0ke3F8Wl0ADc9Gp6b25m8i78mCg1Dto8gJxC9pdY5qzhArI6
	5B8MGmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcHf-0000000EXHB-46lX;
	Tue, 17 Dec 2024 18:27:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcGY-0000000EX2t-0K7z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0489A41F42;
	Tue, 17 Dec 2024 18:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20634C4CED3;
	Tue, 17 Dec 2024 18:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459953;
	bh=5sbBvDuhs4dH19A+TJjyjA7fZtevh11swNjccUwIf0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWz+gcczWJ1xJeJsETvul4MmoE4EKFFA2aEgNoNr4wSIUrwO+IDJbPrgXFldeltcj
	 B7157twx6vXJQ3073e1wnjc/GdL7NAHGqf56f9qiDT8T/ynQRw5egSbuWIPwY+0M8a
	 T5AK8nzsmHnl4GnLULal7eA0zsS3YhBlyxjhXgMVK3LN86nb/VRc1IchjeOwqf2ezW
	 9qYeG+ZtclrGKt/zPNBWsUA6fIXLQR6sI7JBnbwEomg4qGAv8FnSqW5AgmBPqefHEe
	 NsVKDDWkUqjnh8GibmHf7WurEMNQu2IGiWCJ+Hxaafefl+0vKuGiMRwCOMM/SNAM5+
	 E9eHChbObZ05w==
Date: Tue, 17 Dec 2024 18:25:47 +0000
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
Message-ID: <20241217-moving-rubble-712bba91af4d@spud>
References: <20241217032821.1712916-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="irNW15vzf8lQLXCc"
Content-Disposition: inline
In-Reply-To: <20241217032821.1712916-1-david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_102554_177387_E945CA9F 
X-CRM114-Status: GOOD (  10.59  )
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


--irNW15vzf8lQLXCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 10:28:17PM -0500, David Heidelberg wrote:
> Use the reg property instead of text in the description.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--irNW15vzf8lQLXCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HCKwAKCRB4tDGHoIJi
0tyiAQC0iy2jX2LBj7PYVNqONiCpx88AuaFbzMJXh/vYVCVf+QD/Tmz+g72CKmZo
B4P8X7o7961wpSemOaHoBTCBMbbbCQI=
=4fjz
-----END PGP SIGNATURE-----

--irNW15vzf8lQLXCc--

