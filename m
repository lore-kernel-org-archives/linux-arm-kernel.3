Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9B4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDAfDvzy+acD3YqGoCYl3nzfWw0aFuZI5HDAO/z/8Ls=; b=BQMUnZ03CtRF2GVPKioKjqUz61
	Z2vhoQG+MCeaJEuKdZmu8T7K3zW4aAPq13Epkms9wYRjn2YatoxL04Lz83MJqEqUjCQQEztY7x1on
	OLdqZPX2l7KVEkwiSRKuiOnbba1EnTqyX7vMwCKy9UivLpCKdUB3HKpg+EqR7+CJPUQUMbCWKEyxR
	vzGn/Bf+iZ+dQ2ByH/zEJlrW2G5NAK7vJ/ipISxGvSrmKJReYk+OqWc08jcOPiYlw0Dqv2sRbhBJh
	BftfwKeF5kERtPmkEwQgdtzSxKF4Mnk/8+j9Z/LKcQeV2JHnOtDW+LFNk8ifZs8kGrxqGOupeKO9B
	5e46WinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webAz-0000000HSWZ-1e51;
	Tue, 30 Jun 2026 16:19:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webAx-0000000HSWI-3J94;
	Tue, 30 Jun 2026 16:19:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9594600BB;
	Tue, 30 Jun 2026 16:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225DE1F000E9;
	Tue, 30 Jun 2026 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836346;
	bh=FDAfDvzy+acD3YqGoCYl3nzfWw0aFuZI5HDAO/z/8Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dFMxDZlMqRC2l4zAdEBFqRtXe5dgSQad0ZKT667f+b5JkT936qjRqYBzNi8PGaV39
	 aga/92P65RtpH4zIWKsanhoEE3pnHuAKDbPvMUmteiE/UCNhKF59yDzSqe1/07CwgZ
	 OOUgyA6vRmD2dT+HidcZeXW5lKOQpPkLkJ8xyMjhmXNMNtFXfYu3YXwPrSt7XpHikM
	 JKggfQ8MrIQgX+OzxAjsZcP6s7CW4WswRhfWWG5U/Y99PP3o/TUrRTEagfAaU2iqwS
	 lXK/ofqL4AXYTOwQYoIsYCM+NmqXgowST3VyO4y/sOTgyefYpQDvpD9SlOWXRw2gKM
	 UvQTCTkMiQxsA==
Date: Tue, 30 Jun 2026 18:19:04 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net] net: airoha: fix max receive size configuration
Message-ID: <akPseKb8X7Q8nTg3@lore-desk>
References: <20260625-airoha-fix-rx-max-len-v1-1-45b9b827358d@kernel.org>
 <94901706-e7f3-4ff7-9b19-9965f593e228@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbI4hZHtB9TsjBtv"
Content-Disposition: inline
In-Reply-To: <94901706-e7f3-4ff7-9b19-9965f593e228@redhat.com>
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


--gbI4hZHtB9TsjBtv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 30, Paolo Abeni wrote:
> On 6/25/26 8:49 AM, Lorenzo Bianconi wrote:
> > Set the GDM maximum receive size to AIROHA_MAX_RX_SIZE unconditionally
> > during hardware initialization instead of updating it according to the
> > configured MTU. This avoids dropping incoming frames that exceed the
> > current MTU but could still be processed by the networking stack, which
> > is able to fragment the reply on the TX side (e.g. ICMP echo requests).
> > Move the per-port MTU configuration to the PPE egress path where it
> > belongs, and set the tx frame size running airoha_ppe_set_xmit_frame_si=
ze()
> > to dynamically track the maximum MTU across running interfaces sharing
> > the same PPE instance.
> > Fix the PPE MTU register addressing to pack two port entries per
> > register word and add WAN_MTU0 configuration for non-LAN GDM devices.
> >=20
> > Fixes: 54d989d58d2a ("net: airoha: Move min/max packet len configuratio=
n in airoha_dev_open()")
> > Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> PW bot is on holiday, no automated notifications for a while.

It's too hot even for the bot :)

Regards,
Lorenzo

>=20
> Applied, thanks!
>=20
> /P
>=20

--gbI4hZHtB9TsjBtv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCakPseAAKCRA6cBh0uS2t
rH1JAPoDbzhL1nA8oMVHk3V1xDwDjGNcTmfsB+ewrnQo6LhQHQD/RauHvWeHPwKj
BvwMcM9wg/++9wq6uGSMBPxT36uh1gM=
=LZi/
-----END PGP SIGNATURE-----

--gbI4hZHtB9TsjBtv--

