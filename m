Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DCFC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zVIHbiJYGOefo5LjvyO1/q53DhAvedWNN5OK/79x6s=; b=RV6bJP3kzegWEtlBsDv4bHyENQ
	t3Lo9EjZdPcG9keErYSs7WXMu4exVf/h8AlMOywFgVjgIlEqyUUznrsiLX5hEN42BxA22l1395sm+
	pyWOHkBy6J+D/HwG2UhZsZuEzU2EcPuU2lPNCij60qya60ob7gXykYVqWhUrgHHgKcZEm5xUE1sgp
	xfkZ3ZOmtSzepyh18Jc+VoPqWMDqFSWfSRcHGrxjzHeUt1cZpmmHKaS3kWqjnYH/48aLEaf7m+E70
	7M9kridVakNy2QS3pOeafHP7MNLOKwEpTKHxceN2X2Nwx6wjp7TMJskaVS3lAGGMoM+VoDraT7zCP
	iYxHKNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mmB-00000009e1F-2WdW;
	Thu, 10 Apr 2025 07:56:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m9R-00000009VaP-3BIv;
	Thu, 10 Apr 2025 07:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D5B95C4A15;
	Thu, 10 Apr 2025 07:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B00AC4CEDD;
	Thu, 10 Apr 2025 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744269400;
	bh=m6s8SJ1hYayKV7qLClv8Iavh8Zvv3LC6jgfJaiRLauE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wyf/xc9C4YwqJzO2eIeXu8d//gsVeWCr8NmsGVxPywQvV+lNM9iS9kxKFUsU9miHa
	 vuTwmsmecM3KeK8l4UL9nfWrVNCZy0rS/UkFXH8Y9mBSTFS/2JCSpeG2IUqFKLIgNh
	 rahYuAvf6cEWHFm7nX7uqlx7rx/TAwVFGRymWuFqBf2jRSRcKRQtH5DEQ7hPtnfv1Y
	 BkpxQz0KZzeOue22niXVLNNd5Yzvn5axbIMbSTSLYpUulevGXkKmnQjGTFAnrbAH3c
	 +0J4/bTrLc/mKNeZ22UhEN4w69NXuV+pdjwcJbiFr8k92CXz618EmChpTtqgZ+R28Z
	 O2Ug/HbTptx2A==
Date: Thu, 10 Apr 2025 09:16:37 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v2] net: airoha: Add matchall filter offload
 support
Message-ID: <Z_dwVVEWJp_VFBB4@lore-desk>
References: <20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org>
 <20250409163737.2b6c13e3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vr9WzxqUsueq2Hu9"
Content-Disposition: inline
In-Reply-To: <20250409163737.2b6c13e3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_001641_855925_FC18242C 
X-CRM114-Status: UNSURE (   8.58  )
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


--vr9WzxqUsueq2Hu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 09 Apr 2025 01:15:32 +0200 Lorenzo Bianconi wrote:
> > +	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(0),
> > +		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM1) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM1) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM1) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM1) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM1) |
>=20
> Coccicheck spotted that the previous line is duplicated..
>=20
> > +		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM1) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM1) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM1) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM1));
> > +	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(1),
> > +		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM2) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM2) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM2) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM2) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM2) |
>=20
> .. and here.
>=20
> > +		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM2) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM2) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM2) |
> > +		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM2));
> --=20
> pw-bot: cr

ack, I will fix them in v3.

Regards,
Lorenzo

--vr9WzxqUsueq2Hu9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/dwVQAKCRA6cBh0uS2t
rJJ3AQDcVrSpTTdSIus3bj+lu3WIoqb3wBPZz2xLxzFleoFWVgD/cu8WjRUgCIom
wA3SRQG3EzL/ROFBeSPAzg7pV0UZRgY=
=fX2L
-----END PGP SIGNATURE-----

--vr9WzxqUsueq2Hu9--

