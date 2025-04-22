Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E1BC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27xdO0DT0mwqDlF3mCzFGj4edgP9JK4Qnj9eFTCStTg=; b=Pr0grlahDUjZnYzu2MqwOX6OdD
	xo4mZY+tiD2QQv75d7ygq2JTsR//LdoQdTr81b4UkIa8mrWDXDCG42OorAygDEZH8IpiOyje40ohK
	AuhSDu5mkQlV8LvWGaCVLFZ2Wge9h36+SEQ9yTs7UpYZSvUKQygJSXar56noYLMPCkQkPIbRcCpi9
	/WgQnxO/H6Nacm4IdwCzsTceiW5669Uh9aMGGmWiUi5O2rv0RKkV5DIHjP9MhiIc3IKmiDFaFNZtx
	4hULKKTXSxpYVfldcwa2bGSdMpAMQQRzVDwlY9PHKCBeW6fIIy5o/KsRM73I7kwHgtwzrAHBB7meX
	YhFW/PwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FM0-00000007ftf-0zEg;
	Tue, 22 Apr 2025 15:16:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EGZ-00000007QV4-3Rdl;
	Tue, 22 Apr 2025 14:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 415E261162;
	Tue, 22 Apr 2025 14:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B234C4CEEA;
	Tue, 22 Apr 2025 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745330786;
	bh=CtaCG5SyvKvnVAPK00rPM/KJJLyNDvl8auFq2J3k/uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIAfQZL9fQgIfVIGb0L9ht0MjiVsLAwWs9upaZ8fPknu9hkZ/Fpw39X1DIHFrns2N
	 ton2sut5F9fVzE0DRdGq7Ttg9SlsZvctgTjhkrYO0fYxa+16zux23IRSSWHahBRSTM
	 jS4jnzjWixltEPMyjFfl5KWaKEP8GCN5XK/8wDUsdsTlcI9kxwofJgkkvrGC0UXezq
	 ui2dUhoX4QuT9ZTKPb6N9p5vdOhIOaZ4/IHpLgDDuQewy6B8Lw+J90LvcAn7mFUjy7
	 CiG6ENvTtRZK2eto871T7K3Hq7i2qVJCspWKQPaS+0fpl0QOeykexE0Ff5ohp16a/9
	 dC0K1Kdh4ghhA==
Date: Tue, 22 Apr 2025 16:06:24 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2] net: airoha: Add missing filed to
 ppe_mbox_data struct
Message-ID: <aAeiYFIIOyTVvMhw@lore-desk>
References: <20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org>
 <20250421183610.7bad877c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YKyKny5ZTTWVilj9"
Content-Disposition: inline
In-Reply-To: <20250421183610.7bad877c@kernel.org>
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


--YKyKny5ZTTWVilj9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 17 Apr 2025 11:30:47 +0200 Lorenzo Bianconi wrote:
> > The official Airoha EN7581 firmware requires adding max_packet filed in
> > ppe_mbox_data struct while the unofficial one used to develop the Airoha
> > EN7581 flowtable support does not require this field.
> > This patch does not introduce any real backwards compatible issue since
> > EN7581 fw is not publicly available in linux-firmware or other
> > repositories (e.g. OpenWrt) yet and the official fw version will use th=
is
> > new layout. For this reason this change needs to be backported.
> >=20
> > Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
>=20
> I'm not sure I agree with this fixes tag. The fixes tag should point=20
> to the earliest commit where any problem may be visible. IIUC you're
> targeting net-next because the structure is not used in net. So the
> Fixes tag should also point to some commit in net-next...
> If we leave it as is after the merge window stable bot will pull this
> commit into 6.15 for no good reason.

Hi Jakub,

actually the commit below is even present in the net tree. Since this is
required to work with the official airoha firmware, I guess I should repost
targeting net with the same Fixes tag. Agree?

Regards,
Lorenzo

commit 23290c7bc190def4e1ca61610992d9b7c32e33f3
Author: Lorenzo Bianconi <lorenzo@kernel.org>
Date:   Fri Feb 28 11:54:20 2025 +0100

    net: airoha: Introduce Airoha NPU support

    Packet Processor Engine (PPE) module available on EN7581 SoC populates
    the PPE table with 5-tuples flower rules learned from traffic forwarded
    between the GDM ports connected to the Packet Switch Engine (PSE) modul=
e.
    The airoha_eth driver can enable hw acceleration of learned 5-tuples
    rules if the user configure them in netfilter flowtable (netfilter
    flowtable support will be added with subsequent patches).
    airoha_eth driver configures and collects data from the PPE module via a
    Network Processor Unit (NPU) RISC-V module available on the EN7581 SoC.
    Introduce basic support for Airoha NPU module.
   =20
    Tested-by: Sayantan Nandy <sayantan.nandy@airoha.com>
    Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
    Signed-off-by: Paolo Abeni <pabeni@redhat.com>

> --=20
> pw-bot: cr

--YKyKny5ZTTWVilj9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaAeiYAAKCRA6cBh0uS2t
rN+8AP9R7ZHRbO9irHC1fwakaSHs5lzuYIjCukAlC/qJVgOUjQD+KJmJnJP+PiRc
SoY+YA56aAOCed+gPMr7Tp3/vOmWlA4=
=wyH7
-----END PGP SIGNATURE-----

--YKyKny5ZTTWVilj9--

