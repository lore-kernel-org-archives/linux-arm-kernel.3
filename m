Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198D7C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4GT+n1uuxHxqty8I1q9rOGynTOl5bdMsMvwdxKRerc=; b=KBinUVbyjVPp+19mD/h36wfzwz
	QuSROi8CxpW7Qc576aNSlVggwQ17Ubhe2MZjrzCOQtIOR+UFg9hF/T0+UIdC9Bw2eFgqVNOi534aL
	dr2lsm+qN/U2FxZMLN7xqAfCT66gjjyx08TEDgHZ60/zm4h7E13AT8F0D3YqkcNhJG2y3MIxt7XCx
	IKDhFsjt0E7NU9ByRBwcGViXCe8r6y3vOe0xfpkhDT6mADhG0a5risFphlIsC9Cqx0+yEwVUynZWI
	lszwa+vdaQY/Sm5Xcgmlu4oDEFfVgLX50nXl5e36PIxuVo2pVrs9QG9nuhFtKBiZYqFb3XmEmOcDH
	PJ6nzWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6lf-00000008z2d-3wfS;
	Tue, 21 Jul 2026 09:28:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6lf-00000008z2D-0Fyq;
	Tue, 21 Jul 2026 09:28:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7504142DFA;
	Tue, 21 Jul 2026 09:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC571F00A3A;
	Tue, 21 Jul 2026 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784626082;
	bh=w4GT+n1uuxHxqty8I1q9rOGynTOl5bdMsMvwdxKRerc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P4xgrchA4VxqcHMNVVWdER/w7lafPUN1dZRus8GKSVRFmB0amwjMqa2qxwW3fInZv
	 m8FQx2lpY1YvLxHoJmiys59247TqttMzk+W+/ORaXtHtn1I9oondRGYT17c0LZdNPc
	 pjEywDoMXg/A1IWua4TNn7v8QBBbbO8avLJZUIWkqsRitVa54yAAgYVnzcJb7CIYOw
	 MiQrHCbW5E0P+FHLzOlbl/lPuhiPq5jMb9S7Ow5msAaavVe2HpZpIgb/CFGZIxAcdl
	 sMSupRSfmKVJKF7s+W5Oez4PTlhOajn/Ag3PUaRTWSjBiOGtyd6QcS3g68zXvfi6MM
	 zrjrqR0Huz8qA==
Date: Tue, 21 Jul 2026 11:28:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v9 3/3] net: airoha: defer GDM3/GDM4 WAN mode
 and GDM2 loopback to QoS offload
Message-ID: <al87oKiC1y88_Ncr@lore-desk>
References: <20260721-airoha-ethtool-priv_flags-v9-0-9c15d8b71a56@kernel.org>
 <20260721-airoha-ethtool-priv_flags-v9-3-9c15d8b71a56@kernel.org>
 <5e0444bf-b258-4a6b-a1dc-fecc3419ebad@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xSYfztsw1Jux22Uk"
Content-Disposition: inline
In-Reply-To: <5e0444bf-b258-4a6b-a1dc-fecc3419ebad@intel.com>
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

--xSYfztsw1Jux22Uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 7/20/2026 3:03 PM, Lorenzo Bianconi wrote:
> > GDM3 and GDM4 ports require GDM2 loopback to be enabled for hardware
> > QoS offload to function. Without it, HTB and ETS offload on these ports
> > do not work.
> > Previously, GDM3/GDM4 ports were automatically configured as WAN with
> > GDM2 loopback enabled during ndo_init(). Add the capability to configure
> > GDM3/GDM4 as WAN/LAN on demand when QoS offload is created or destroyed.
> > Hook airoha_enable_qos_for_gdm34() into TC_HTB_CREATE so that requesting
> > HTB offload on a GDM3/GDM4 LAN port switches it to WAN mode and enables
> > GDM2 loopback, with proper rollback on failure. Introduce the
> > AIROHA_DEV_F_QOS flag to track whether a device has an active HTB
> > qdisc; clear it on TC_HTB_DESTROY. The device keeps its WAN role after
> > qdisc teardown so that its configuration is preserved until another
> > device explicitly needs the WAN role for QoS offload.
> > If another GDM3/GDM4 device already holds the WAN role without an active
> > QoS qdisc, demote it to LAN before promoting the requesting device. Skip
> > the demotion when the requesting device is itself already the WAN devic=
e.
> > Since airoha_dev_set_qdma() can now be called on a running device to
> > migrate between QDMA blocks, make dev->qdma an RCU pointer so the TX
> > path can safely dereference it without holding RTNL.
> > Hold flow_offload_mutex in airoha_enable_qos_for_gdm34() and
> > airoha_disable_qos_for_gdm34() around the dev->flags update,
> > airoha_dev_set_qdma() and GDM2 loopback configuration, serializing
> > against concurrent airoha_ppe_hw_init() in the TC_SETUP_CLSFLOWER
> > offload path.
> > Introduce airoha_qdma_deref() helper that wraps rcu_dereference_protect=
ed()
> > with a lockdep condition accepting either rtnl_lock or flow_offload_mut=
ex,
> > and use it across all control-path dereferences of the RCU-protected
> > dev->qdma pointer.
> > Add airoha_disable_gdm2_loopback() to disable GDM2 hw loopback.
> >=20
>=20
> A minor nit which may just be my personal preference/style:
> I had trouble following this commit message since it goes through a lot
> of detail about various problems with dereferencing and other changes
> related to allowing the defered configuration of WAN mode.
>=20
> I do appreciate this detail as it helps understand the changes and
> motivations. However.. It might benefit from some additional line breaks
> for spacing to help readability.

Sure, I can rework the commit log if I need to repost.

Regards,
Lorenzo

--xSYfztsw1Jux22Uk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCal87oAAKCRA6cBh0uS2t
rEVKAPwIcLrCEAa3lrXGbk+Gos4q3HQHdOKbOzp+RRDjU1q54gEAyCE+g/lit//W
cCyYD5/Z/NsHLoCWZv4DilW7uBExHg4=
=WQtn
-----END PGP SIGNATURE-----

--xSYfztsw1Jux22Uk--

