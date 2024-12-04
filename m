Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24169E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wf6CEilJbwd8lHy0ndxTActmOsu8tzbKBpEHpl727pY=; b=zCSb4PGYagO/LZUNwiuNhOuEEK
	PuQFb7XqhXsn0JimJGBbRW0sWOeRpRLhgZ1/AUmKVjYSIfnTDHE6uAiHbRva53pIkxt4Qhka0IGys
	uonw+S7lmz1bPjmPRXXh53+fuVjGbhsEV/HnitSpOMWC3BOiWni4NLqWjT9x29woPZa1nN6S/KbuM
	2WQYp9k7jy6FChslYqRBdPMuEmpkyAGx7pSiKsOp9fKiDCQTXkc75GYYTmsvbE/Wr+Rp7W1Gz0vPk
	ppqGiJ3xV43skG7DnpA/VEFDex3mCC144C3lxRxS2Ft8V6Hi9/OLmWNzAKhUf4Ddf1SIpO/hCjtI0
	wVG9pCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItS4-0000000DQGN-2FWZ;
	Wed, 04 Dec 2024 17:46:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tItR3-0000000DQ4W-3sKu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 17:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F6225C64B8;
	Wed,  4 Dec 2024 17:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F212BC4CECD;
	Wed,  4 Dec 2024 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733334312;
	bh=wf6CEilJbwd8lHy0ndxTActmOsu8tzbKBpEHpl727pY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGp82C19f3rwQXalbvgRLx+83VFRM0kwVocrV4Q+uR9oSQx1BbAty3iyusJbjALfc
	 8YAXRKrF3WC/G8vZnfHYC/nWis90Dxf1KdQZa30WkKxc94E8S5XWEScb1IZQs9libG
	 D6RDPBPiq1qxorKq/5bqV6bnyAK3AOEoVWVrQMdDhg5vTCIYzsXYTa0WP4lbmY8Mnj
	 0uix7MA9b1yz/oy55arLQrplfZD0qjaadl/4XjHTpOcHyL3n4Vk5dc0w9WjZfprGI9
	 VGLNn7kQffoQDf5Kxl06xPbWLiGZncwYlH11HebBmOeLlL0YidaljtuxhIVEEC6KXa
	 JAnxEEAHvnvLQ==
Date: Wed, 4 Dec 2024 17:45:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos990-pmu compatible
Message-ID: <20241204-flyover-freckles-241e17dc2262@spud>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
 <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="goWN9glBiQhpQ2Qv"
Content-Disposition: inline
In-Reply-To: <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_094514_002676_65C3BEFB 
X-CRM114-Status: GOOD (  10.23  )
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


--goWN9glBiQhpQ2Qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 03:55:58PM +0100, Igor Belwon wrote:
> Add a dt-binding compatible for the Exynos990 PMU. It's compatible
> with the Exynos7 PMU design. It handles system reboot, as well as
> other system control registers (i.e registers for the USB PHY).
>=20
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--goWN9glBiQhpQ2Qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1CVJAAKCRB4tDGHoIJi
0mUeAQDYQ4nkN/nPls385/Cfaq+RGGyLfxIq0/BrJdSoN9IglQD/XZYhF1NfKp7Q
jT6zhIMDGugUT/G4n+VglbsyNkAZNQ0=
=bhAe
-----END PGP SIGNATURE-----

--goWN9glBiQhpQ2Qv--

