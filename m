Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A68BC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBVcTSqslDhrYoHxQhgGftWrfyvr7UPOdVSdqhSYldQ=; b=DsjCBq50HLJ06RuntMmb0M4l5S
	AGVRLlJOZgZDM9ppypu7pp+d8Pja9Z2EMnBX/keyQeU7VmucBTLCm3xLHkyCoJ9YCHjoNJg0qAoyP
	3153mf+ORSAP9s/dtCh3Wvft8dsyvbwOUEHzlbNmLFzz5i4zKG6CGgN06E7hC3mhJPQM8uKrJaY0y
	keG9BDPaKjF1v165La4X3yj8xx9wdHtwcMTlPjHuSJlIFxoouYuVpuUImPvshOCECTXR6SPCEq3os
	mUtZXECRgtRfNvCEvsuXnGWpUy/ihE2NLFTSkh4dCay+V6/iGHIzUOjS2vDA/6/A75noYfTnRTYGA
	fo9u9RpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAknN-000000015ri-3WIv;
	Fri, 02 May 2025 07:26:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAklR-000000015an-1oRN;
	Fri, 02 May 2025 07:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFCCD4A79E;
	Fri,  2 May 2025 07:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EE4C4CEE4;
	Fri,  2 May 2025 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746170692;
	bh=xBVcTSqslDhrYoHxQhgGftWrfyvr7UPOdVSdqhSYldQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAkB8YHCAzyCDzXwJKoSUPr5WZ6fEnearravg1Of1dPwt3uTGeTIOom6RrQPiD0CY
	 4Yf0xHar9Z84goeBj0zNLvwgK3Rjy4d9RbXBGylAlhap3YIwo5PkR0SeF0W3d8KaV1
	 2Id6Xisig1TJQMEwnYWo0ilFsvbRyXE8MavWucAjtntnlEDIzGRsD8vLNEzfl4LW9X
	 +GCbyZudlxvGHkep/kcrPIdE9S/gbYv4OEzWD5aGLjWFV1NRNTKekgs6yVc4CWWQgX
	 cRw+Zg4oWvAd8ge6kbNaRk5m1hjwEstQ9vNg8iC6X4oWruAFmtXBscXaI7PDGtWZQk
	 TOBWDQvhRCvOQ==
Date: Fri, 2 May 2025 09:24:49 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net v4] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <aBRzQaonAK0IyAsu@lore-desk>
References: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
 <20250501071518.50c92e8c@kernel.org>
 <aBPdyn580lxUMJKz@lore-desk>
 <20250501174140.6dc31b36@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8z+Krzeqpybywa3l"
Content-Disposition: inline
In-Reply-To: <20250501174140.6dc31b36@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_002453_488099_43362940 
X-CRM114-Status: GOOD (  16.94  )
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


--8z+Krzeqpybywa3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 1 May 2025 22:47:06 +0200 Lorenzo Bianconi wrote:
> > On May 01, Jakub Kicinski wrote:
> > > On Tue, 29 Apr 2025 16:17:41 +0200 Lorenzo Bianconi wrote: =20
> > > > Moreover, add __packed attribute to ppe_mbox_data struct definition=
 and
> > > > make the fw layout padding explicit in init_info struct. =20
> > >=20
> > > Why? everything looks naturally packed now :( =20
> >=20
> > What I mean here is the padding in the ppe_mbox_data struct used by the=
 fw running
> > on the NPU, not in the version used by the airoha_eth driver, got my po=
int?
> > Sorry, re-reading it, it was not so clear, I agree.
>=20
> You mean adding the "u8 rsv[3];" ? that is fine.
> I don't get why we also need to add the 3 __packed

I agree the __packed attributes are not mandatory at the moment, we just ag=
reed
with Jacob that is fine to add them. Do you prefer to get rid of them?

Regards,
Lorenzo

--8z+Krzeqpybywa3l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBRzQQAKCRA6cBh0uS2t
rEj4AQDe3T0L3mBOJoJrm2ODy4pvV1izGwKl5Xcprsl1zcOb5AD/TU2XoaKwtEM+
Kj3qInfF17qy9bHaZFyNa6OmGmWI8AQ=
=7uwp
-----END PGP SIGNATURE-----

--8z+Krzeqpybywa3l--

