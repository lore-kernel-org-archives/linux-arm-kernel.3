Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9680BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 23:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmfA72V8Vw03Zdmlew9o49WWKH6ePWrUbPUuTBpunUg=; b=ke0jRB9OmqrBdne3juwyQ5bFT5
	u9nMj7jA+9g2skqjtOPpNKZlEvUSyKeGe/gBz6M0M6WhlFgdpwbaMZY+0ShCg6lWEPR+Oea8O9enm
	pJCLJIPk57FQYiBdN1PbCjaGGfqx4MVo7R7ThpCfXopRmV3JWWN6mZGtYnPC3f9hi/nX0uUZGGs2O
	IPJmFyOpHhoe68el1bmrR9MYzMnqeMrzMPjplP69utmjfIeu6Jq24y0DJcrGn4v6kyrn8xNCLbaWz
	f97Lx1Z1WfPqK+TpKnM3+fVKhn/kGBVliky+HwE33RB+Ks5ukq3EorSbNw5AuM3U2FSrFP03tUlJA
	/9BT3nKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ILu-00000005hDZ-07zF;
	Tue, 08 Apr 2025 23:27:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IHn-00000005gTW-1QUm;
	Tue, 08 Apr 2025 23:23:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFF9049B35;
	Tue,  8 Apr 2025 23:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF9EC4CEE5;
	Tue,  8 Apr 2025 23:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744154598;
	bh=AmfA72V8Vw03Zdmlew9o49WWKH6ePWrUbPUuTBpunUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gyst2M4AwzOVJegnnBiZF/Y4KoVPdq/VYsKbwqL86ee5PVcx4wKdLzFdI8Xubhj4M
	 /hE9Df/AwToq/vAlPZEv51QWFGmX54H9fqngPx7FvDLnhX/JDhX/6woTd0YewpdWKx
	 pRBRJKsGEZM3wVceaOOrZsBCvgRkmN8lZo00LIzMOfSYEZxwHitMW0lmezxbc5Dni2
	 l8DVyaIofT8c4VJIEte3GCxWetobkSW1OGZDQF1BuS4agwenOdeWVOmz23SgWYiWEu
	 CU0g+j3/CCsMT0+f3yVCt3WBg6+EUCmseAaKiY/2ndGxRDn+7fmoNyOeoqYrxnGgNf
	 HbyiemZYbbDsw==
Date: Wed, 9 Apr 2025 01:23:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: airoha: Add
 airoha_ppe_foe_flow_remove_entry_locked()
Message-ID: <Z_Wv458ebLOBlvHp@lore-desk>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
 <20250407-airoha-flowtable-l2b-v1-2-18777778e568@kernel.org>
 <Z/WDPBMIPSCkbg9e@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fHlcF3L1BnZPAha3"
Content-Disposition: inline
In-Reply-To: <Z/WDPBMIPSCkbg9e@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_162319_399480_425C52D6 
X-CRM114-Status: GOOD (  15.88  )
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


--fHlcF3L1BnZPAha3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Apr 07, 2025 at 04:18:31PM +0200, Lorenzo Bianconi wrote:
> > Introduce airoha_ppe_foe_flow_remove_entry_locked utility routine
> > in order to run airoha_ppe_foe_flow_remove_entry holding ppe_lock.
> > This is a preliminary patch to L2 offloading support to airoha_eth
> > driver.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Could you please explain the reason of introducing the *_remove_entry_loc=
ked
> function if "airoha_ppe_foe_flow_remove_entry()" is still never called ou=
t of
> "airoha_ppe_foe_flow_remove_entry_locked()" context (at least in this
> series)?
> I would expect that it can be useful if you have an use case when you want
> to call "airoha_ppe_foe_flow_remove_entry()" from another function that
> has already taken the lock, but I haven't found such a context.

ack, you are right. I guess we can drop
airoha_ppe_foe_flow_remove_entry_locked(). I will fix it in v2.

Regards,
Lorenzo

>=20
> Thanks,
> Michal
>=20

--fHlcF3L1BnZPAha3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/Wv4wAKCRA6cBh0uS2t
rD6jAP0VCuU67+0Hmp6FoJCYXcDJXP2tbLCdbL7J9QZsGtWOVAD+LNXbCESniFgd
w97KzvP3u3bXDzN6nfqYBcqzw9afugY=
=Tg6q
-----END PGP SIGNATURE-----

--fHlcF3L1BnZPAha3--

