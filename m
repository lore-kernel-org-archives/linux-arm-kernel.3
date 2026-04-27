Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B0CFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mhyohh1HXnwBgAR4BR6g6L0ve+gccVeyspOB5HMBrqE=; b=2Ft2DKuyEsRyTMRcDQS9Q4ae6X
	KYmn8i0dkNHC3MQPjahxf8tD+oj4GAPhk/GGwETBapSV3LlnEOurnHpHa5wc8EwPS+KTCilWExnzF
	URflxh5Cok/Wdbimp0RK55pJC4lPmc60wi21aCS93l0Ho9WnWRsI6OZS9crIgnsFcgR6Sux0/l02v
	Erll1kZb8tUgi3Pz5MmjIgk+in0zhTFTDKFZp0eapj4YQsuX0eJ5Gnruy/Pk0aqS7n/9dqXJQSkN0
	Rai1iY0Mv5r4/Pe8fcykPHLDpR55OKN6nR7AyPG39FiaE3Do9RDxeKmYZ7jK8yiMSD8Ncg+egPcUw
	qdjYLGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRH4-000000001Ze-1Bzz;
	Mon, 27 Apr 2026 19:05:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRGy-000000001ZH-2psM;
	Mon, 27 Apr 2026 19:05:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23A13416BE;
	Mon, 27 Apr 2026 19:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D481CC19425;
	Mon, 27 Apr 2026 19:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777316736;
	bh=Mhyohh1HXnwBgAR4BR6g6L0ve+gccVeyspOB5HMBrqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ff5NIzK13KiJmVmOM3rZi1ac7+0JpRvDmH5OHP5nlmXfpnhV4Iq4ORa/QLeJlvrHY
	 gkOAFcnYCsoH/hPEmAwwRVcFmLCtpOeP3f4r93F2faU/r+0YOK41sESQt7IIt74eet
	 zn0Dtot5BhoZDnaTwANDDnTAuq5awt5aV41Km0sLJ0K4Q4FgyZKeeR2sDsc8YVkqTN
	 YlOYgYvJdmyoop5+FijncqYibMuXcd4zadOeqymCj8b789e8B5ppCgtgqJS4o8EMFY
	 xCiX42i8UETm724S1c+2ut5F7kdswn1ZsZZd1QY2yKftofnBP+8qQ00Wqb1bP94tjs
	 ijbgbTTV0R2yQ==
Date: Mon, 27 Apr 2026 20:05:28 +0100
From: Conor Dooley <conor@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
	horms@kernel.org
Subject: Re: [PATCH net-next v7 3/4] dt-bindings: mfd: syscon: add ESWIN
 EIC7700 compatible
Message-ID: <20260427-skewed-thigh-40baec89fbaf@spud>
References: <20260427072353.1114-1-lizhi2@eswincomputing.com>
 <20260427072541.1174-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="El0eEiK729PJ8197"
Content-Disposition: inline
In-Reply-To: <20260427072541.1174-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_120536_735503_BA150EFE 
X-CRM114-Status: UNSURE (   6.80  )
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


--El0eEiK729PJ8197
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 03:25:41PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
>=20
> Document ESWIN EIC7700 SoC compatible for syscon registers.
>=20
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--El0eEiK729PJ8197
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+zeAAKCRB4tDGHoIJi
0mlTAP9T1H4VVCoPrBVkVi5B+2V2Nkk0PL+jONjju6Vk9eFLiQEAtsSo/+ncqagi
Rjbg6nd17U+wXLIrzq8nY1sOlp9TkQk=
=nVjP
-----END PGP SIGNATURE-----

--El0eEiK729PJ8197--

