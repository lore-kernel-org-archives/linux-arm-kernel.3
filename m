Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8FBC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1to1XBFVbo6aLAHuCFTWtV+b3iwevVOfk8clk90XM8=; b=P/E30sIiQT+xZn4+ghV/neIwGx
	OVXhsb2JfWrbhO3kJiSeVAVjFfS8Xg/5YyVY0Y/86bWDr60gOJliPmnpGA4gGS+lqaEq3syhsaU/e
	VI6vTzAwvQ+2iX2+S9jAgVgHbjVATaMLU/tPy0vMAguvkcNw9Fs5YF4+7OgeboHYkRngW048gNEUP
	Una7bdZmSDCALG+Q/7fbvrtCfMOe+YbUXTASNao6pitJlzNYSd0fv87S0UuM+TmkhBIIpzfCrSfGr
	59QTCmZGOhA4VQoX48/kS4u/IZZaaD6oGMKJiO6LAG/f+FE0GxwnPuMU4u1HDGtaf9Fqmhts4o/sf
	BDTJS1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxP6-00000008jer-3L6w;
	Mon, 19 May 2025 10:07:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxDq-00000008ghe-0O2E;
	Mon, 19 May 2025 09:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1885F49D9B;
	Mon, 19 May 2025 09:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA9DC4CEE4;
	Mon, 19 May 2025 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747648549;
	bh=1gyL+vrxbsBYRCwZKWk0gs+Rz8se3eZcKW+Y/YzScNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/cLnuA6AiEs68MXWG0pQ/rNAeCn7a2p9BCf2491gA4iDqmLNKlu3yxeL6yT+TW49
	 VrH3051VL3g2VmOlAc9L84pbux6/li3Xp3cfC5PMaJkP5luRYzyxyL5rB4JYh6gktq
	 2+vTxN7iY1wMRyAlm1qEt6zADj5pAPCRiCGz19rh0dJn0y67W3civrUQXJZgROdbDm
	 tJ9A9V2yedQ/IX3UM97KqQ3xrgY6Uzk9sL2Nmv9h99tEDb718vp4U5oD8ylH1in6Uy
	 vTczFZ+yBC9x56CaNY1UHB1YJDfXkUX9uFdmIM9y4KXYM555QuEBbnaO2mzpIXhAg3
	 8KhrfcTZFrcDg==
Date: Mon, 19 May 2025 11:55:46 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/3] net: airoha: Add FLOW_CLS_STATS callback
 support
Message-ID: <aCsAItPcz_9CuxaP@lore-desk>
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
 <20250516-airoha-en7581-flowstats-v2-2-06d5fbf28984@kernel.org>
 <20250519094637.GE365796@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="22rIDOGjvi50b705"
Content-Disposition: inline
In-Reply-To: <20250519094637.GE365796@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_025550_160904_5CF72D9E 
X-CRM114-Status: GOOD (  13.44  )
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


--22rIDOGjvi50b705
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 19, Simon Horman wrote:
> On Fri, May 16, 2025 at 10:00:00AM +0200, Lorenzo Bianconi wrote:
>=20
> ...
>=20
> > @@ -1027,6 +1255,15 @@ int airoha_ppe_init(struct airoha_eth *eth)
> >  	if (!ppe->foe_flow)
> >  		return -ENOMEM;
> > =20
> > +	foe_size =3D PPE_STATS_NUM_ENTRIES * sizeof(*ppe->foe_stats);
> > +	if (foe_size) {
>=20
> Hi Lorenzo,
>=20
> It's unclear to me how foe_size can be zero.

Hi Simon,

foe_size will be 0 if you disable CONFIG_NET_AIROHA_FLOW_STATS since in this
case PPE_STATS_NUM_ENTRIES will be 0.

Regards,
Lorenzo

>=20
> > +		ppe->foe_stats =3D dmam_alloc_coherent(eth->dev, foe_size,
> > +						     &ppe->foe_stats_dma,
> > +						     GFP_KERNEL);
> > +		if (!ppe->foe_stats)
> > +			return -ENOMEM;
> > +	}
> > +
> >  	err =3D rhashtable_init(&eth->flow_table, &airoha_flow_table_params);
> >  	if (err)
> >  		return err;
>=20
> ...

--22rIDOGjvi50b705
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCsAIgAKCRA6cBh0uS2t
rJHLAQC5nraKiJNubcnetLu9Dj8Wy6ZjmcTZ2WQrOWpbqVK3gwD/RIds/1GtCN6H
P9fdLBbCOVtpI90ToEihRNwIyKt1ag8=
=XYLC
-----END PGP SIGNATURE-----

--22rIDOGjvi50b705--

