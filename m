Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7449C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfpaTDEv8xfOL3kDJIHBrAk/O093H/832p07pj4aBZc=; b=iEN2gp0AbK0EPZF6Y4X3d4jo5c
	jP3O5tocYSwsqYws3j5XhxOt5oxCbU3gm62KrI1ESwQ0EbonE72O+xi5b49n2FoELg7RNU5J/Q7pS
	dfDWeNo+hgV10+uUZv2bmOI+nGsqPGfEdLpvb9cucD/ITvK4yjKM6dYCB4hOgTt241CxwPzzAAe34
	ODu7YVKRxjsV4ZbXTVfxtj1Pgq8ySJvFvvt1P6yeYbkah/3oLno8HBzcKwfxUtz7hg/RMTL6RU1b5
	U2BsLHuzEtw3c/MFcYS9Nzy5xgMLOC4U6HTjnV2as5KAChEmS1i5b7zbqNOpp0VdMVPnkSUneG2lA
	Skn+Fo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhAo-0000000EdP6-0Yxe;
	Fri, 04 Jul 2025 14:13:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgo9-0000000EZnn-3pJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DB1A5C6367;
	Fri,  4 Jul 2025 13:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAFAC4CEEE;
	Fri,  4 Jul 2025 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751637029;
	bh=H8pS8KHBQfQCZOxaW9Nq6KsExgCXwxkJothpg5OYWxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWRM1iZDqc8SoZaQPC8XvcPUt2jHoSFrYDSEVTnheFxunM40lgJSfNI9Cx1HXts/P
	 97RoWcEjhifrX+fWcApr5fRkNtO8+oXdBgQCRd8DOZLsGieMB7oboGkk5GZoiSeLme
	 I8JZgiYMgEKeup10LZ7lJZian7zgFkHq7xTGazB1AvXxyr9RBnjVfZ5fKPauEueK7z
	 StABYyemKJTjlPsIbyjzh3Qh1GjXwWEjUlJi8Or54bb5mAaojIHE/Vh3GnQhUukFGa
	 cISdUHoazFZfLMOa6RDlihqD0VkIOJmbMZ6YukcsS7/r0WLIe+Ja/dJBX3iIaDURHi
	 XVVWokqBV7jQQ==
Date: Fri, 4 Jul 2025 14:50:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: stm32-ospi: Use
 of_reserved_mem_region_to_resource() for "memory-region"
Message-ID: <1e33e6b6-845a-44bf-a398-4a9fb895a125@sirena.org.uk>
References: <20250703183537.2075746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lr37qIzB0o1A4+Ag"
Content-Disposition: inline
In-Reply-To: <20250703183537.2075746-1-robh@kernel.org>
X-Cookie: f u cn rd ths, itn tyg h myxbl cd.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_065029_994224_D2BBBD58 
X-CRM114-Status: UNSURE (   9.80  )
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


--Lr37qIzB0o1A4+Ag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 03, 2025 at 01:35:37PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.

This breaks an allmodconfig build:

/build/stage/linux/drivers/spi/spi-stm32-ospi.c:775:23: error: unused variable 'rmem' [-Werror,-Wunused-variable]
  775 |         struct reserved_mem *rmem = NULL;
      |                              ^~~~
/build/stage/linux/drivers/spi/spi-stm32-ospi.c:776:22: error: unused variable 'node' [-Werror,-Wunused-variable]
  776 |         struct device_node *node;
      |                             ^~~~

--Lr37qIzB0o1A4+Ag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhn3CAACgkQJNaLcl1U
h9DVRQf8D1AxmRv5Ojv+GEHol13LiGp7nkJN0LfuSBN6gWwV5TqcAVMFganzfiNP
XEh8akPtA7v3GAW0p3oNRN2/IrzP3kJ/XMkd65XCNMjL/eSWkhumXlAm2eG3x4I1
9QVOAHniUh7usC0bnhTMaNHvq7NQIrg0DSrWH3GkN5Zu53mYnWo8CXCYxqBEtJ/Z
vyJEvDWeyvubDhQT/rjARru7quA0vGfW9Kk5Z8tUJVrJYv6EhU3UKjfSr+FxNLsA
0ZAPRipto6tHlUe4f+BZfvvI2vAJ9r6d/vd4y+J29NAxB7/YF81V2qcs3Km7SdUS
vU4DbbrSRKtZlkaS1N4s9BYJIhO5ig==
=4Mpz
-----END PGP SIGNATURE-----

--Lr37qIzB0o1A4+Ag--

