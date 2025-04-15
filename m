Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EE6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PC46Vdcr0OAu09saI7OHeFXNfj9AflC88OcdjsUm3o=; b=G5wb62Qko5AStaliNrKj9d1vT+
	bZo2Q+1geE6jkMkM6P/YXQoRVuFRun4tlc5CsGnwPw3KFY1NnUTeZDd+McDOlEdLJ79kjED2obSaq
	NiDQUTYhIee7prbqdBEi4eBNVlRNYWMsaFmnXN8MrOtC01CY87CSnGPe5B5pcZGdAcBTbAPJ0+X4G
	vpcA7W7Jp3rxC9ldVAmlWRUia28sIA6agmTmskxS3oM/Z5W2YMBWnwQzHVIEn7GkTCARcSfkjc4pM
	WB8WqTJY4UTRlBNKKRHxI9Rpejqt1xJJ2/Uz68IoaLopp8adX/XkBO6urx54g2zdms3Urg8wvqZxV
	AkI9CxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aXJ-00000004lxC-3hK4;
	Tue, 15 Apr 2025 07:16:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aHD-00000004jTo-2nPC;
	Tue, 15 Apr 2025 07:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A92BB6115D;
	Tue, 15 Apr 2025 06:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BDBC4CEEB;
	Tue, 15 Apr 2025 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744700410;
	bh=1PC46Vdcr0OAu09saI7OHeFXNfj9AflC88OcdjsUm3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujKc618B/ou2TpHkW7e+oQiY27wxFzaiQjx+lwRDensTqOTfq4N7VDbmIMEqKiejR
	 769+lRehSFbFy0y0M9kldrsy4Dg/QTA+9QLxd2x9JHQu/wr5K+I3MfjW2ezrQWkwG3
	 Qm2mMIU7gPKiPo135WIWgKbuBiMg7Z7n3/ZbyXQVXd3qE2akxRtY0Qt37o9TUMoSZk
	 9N61Vl8amMwp/9q+dYB3lddXUmt0vzo97QlraaSQUTTUEA82Qnq5Qk/qX46DKAuY4V
	 Ktw7Q7vDtm6Zc3gw8oBaZBQ9paqos1H9kHOXp0kaQyQZnc1WOavMdxHtsWTyfKaj0n
	 cQBlh2nKmUvBQ==
Date: Tue, 15 Apr 2025 09:00:07 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v3] net: airoha: Add matchall filter offload
 support
Message-ID: <Z_4D9_MHlMvJWAsh@lore-desk>
References: <20250410-airoha-hw-rx-ratelimit-v3-1-5ec2a244925e@kernel.org>
 <20250414172825.028f019f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IzGoBAwR0rgqHKm6"
Content-Disposition: inline
In-Reply-To: <20250414172825.028f019f@kernel.org>
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


--IzGoBAwR0rgqHKm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 10 Apr 2025 17:25:37 +0200 Lorenzo Bianconi wrote:
> > Introduce tc matchall filter offload support in airoha_eth driver.
> > Matchall hw filter is used to implement hw rate policing via tc action
> > police:
>=20
> Does not apply, probably due to net merge..

ack, I will rebase and repost.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--IzGoBAwR0rgqHKm6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/4D9wAKCRA6cBh0uS2t
rI+VAP0XQCJqirBFPpwt+Ssdi8rQU29HxigMxhCSrFTXOtOFvAEA2EOI0nZRSEtW
an8ErWCayNqv+ZD3UEhdJG1bOhugoQ4=
=6SM4
-----END PGP SIGNATURE-----

--IzGoBAwR0rgqHKm6--

