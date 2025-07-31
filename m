Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE38C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 01:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RByfFOm84gFCuH1C3dTZYF3rk3CT71WUz0pewD04lSU=; b=rnaG7CL5haZNeRGTRIUKqs5EVC
	mHrSf1g/Hij5+VLCKrlveUYXKJSm00v/9kAjogb76WAXz0GQ+7npVuOM7PRZkBkzQriGVDbm1ByNH
	NHLLO+aLZK83cxunp+QI36pL5ND3Rq/4G734qH8S3jhHDPyVfig5zbldiTMSd3gfpUfWX1ePCevb2
	tns00YJZRULVqmFZZK/9gCeuOhXIRsE0CY8FSphziN1COF0fqpy5p9ZwU56Y1rExrk7Tc+Hs83Voc
	/YDPNrVusfTy9BWsM1+vwbcWb1to/ZKRldwHzZxPkNCOBDBlgjFhQroNzoH9f2ZnaNdoJwr+qb+4n
	u1gGZ4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHrQ-00000002hzN-139O;
	Thu, 31 Jul 2025 01:13:32 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhHow-00000002hog-0UM2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 01:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753924033;
	bh=RByfFOm84gFCuH1C3dTZYF3rk3CT71WUz0pewD04lSU=;
	h=Date:From:To:Cc:Subject:From;
	b=XO+hygm7GL7hEfIsv/UeR34pXE+HKdCkQzaJDgXR8QZMeMAgFBnre8c5EGo4Cq1sR
	 Fa2mxEOoI22Dn/zVW9Jsb462/0eXdG84T1u+/2nRETf48egQO4vUmK/0bHIOLXRPZZ
	 o1B3nr6uht0Nxq/r/r/ZjxBV5sG/4DVpEcW/FpSu12babmgbK2H3omiRRXolmAtOub
	 k+finnSiqosj5uNonToRUNU1YyqDMaPwSBEMkZtjk0Gbe7GcvqryOurrf2XyaBf9nx
	 W2obYR2qpIpqf97ZcpBEyNQtX7Pjai4scc9nEjhH6TDxMmjuLLqQxxj6/+Jm7EMJ4p
	 gxcVFDIvuHWYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsrXK2228z4x3d;
	Thu, 31 Jul 2025 11:07:13 +1000 (AEST)
Date: Thu, 31 Jul 2025 11:10:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the broadcom tree
Message-ID: <20250731111054.4081a799@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0takSCvwvQxRyGogS.dqchZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_181058_300655_3AE860A5 
X-CRM114-Status: UNSURE (   8.46  )
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

--Sig_/0takSCvwvQxRyGogS.dqchZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc-fixes tree as different
commits (but the same patches):

  abb787a63fb9 ("clk: rp1: Implement remaining clock tree")
  36e97205b507 ("dt-bindings: clock: rp1: Add missing MIPI DSI defines")

These are commits

  add858eff8c5 ("clk: rp1: Implement remaining clock tree")
  d516f0002b79 ("dt-bindings: clock: rp1: Add missing MIPI DSI defines")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0takSCvwvQxRyGogS.dqchZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKwp4ACgkQAVBC80lX
0GwGTgf/dH7HqrcIeWudOYmXBLwGKtbmZW+NcBHoqVKZSzGaiHBGlmMjZuoLIWfE
slvoasaDI5tVm6hR93AvMW+b6wMZnMz+0oOmAss2SzQSixMmfDkOMeqyXh3nTdxu
Y1zifC2bpRSOjgHuwhii/wmHaNdxpBfrJ9V/2pA80Mufiz2ZP0ymkIthnDv1nqqn
Yh/2fYt0QiWyXCaq/M97DfAkFJWRHkQV4TA9RILdnxu20hsNb+9beeX/4MT5CARB
aNKeBWiQpKnnCVEkcsKiofE4h/zHfESHYS4ENyQPnOI37GfxUxEXqvd9GUWnaCG1
Affb5bBkUt2gOMpeWK421F8TmGKKsQ==
=IPlu
-----END PGP SIGNATURE-----

--Sig_/0takSCvwvQxRyGogS.dqchZ--

