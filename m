Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1C9C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5FOVUCAfzhUiL5+qj1DqVRPU16eaHDjm6csdpB97ZM=; b=pqGkPt9H4jGxN/eOM9Fzb+zQaF
	cRkP2PxvnCMHmjMIbcbwZ9QVz56JcYEs64c0BhHkMGB+v6uRGzcjvCiNCtrgr8DmMXIqkM6juRW+R
	wiZZFT0Jzf6VJuryc48Wok7j70PfJdD2zrWTXDAsqPCxN28H9cYLvj1h0VRTxscNDcb3W5XyUWues
	8eSoiR38iyaBTK/bKJ9IbFcS3GVk4TAyxdnnyqWnL1sGBo5ySVBcSq9R+ByEDmd6c3FR3tu6DwI+w
	f9uk4tKB7wmInfVBgFxaF8e7F43yPZOpMogl5Klaiuj9Ot+9HBaPd/avok/feE2LQ4qvOsgsNbS/g
	uUbY7rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8RO-00000003eRT-41lw;
	Sat, 03 May 2025 08:41:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8PS-00000003eJO-18Up;
	Sat, 03 May 2025 08:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDAEF5C4213;
	Sat,  3 May 2025 08:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCCEC4CEE3;
	Sat,  3 May 2025 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746261582;
	bh=i5FOVUCAfzhUiL5+qj1DqVRPU16eaHDjm6csdpB97ZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Unjgx5MIQTxUHG418oA+jnqH3i1Zrh9fFbdSLO94GD72QW3dXL0+fMsSfKE6d98Wq
	 pzl5SKC2w0bFROpbJcud5lteK/aoDloRPxpsmUC+zE46hgkyFdA8tx/4FTtHwmccE0
	 53mena/emJYl/pysVf1HWTJJJSQzpV9b6JEkbw3YAtwSh6aQ8BnS7ItFy3rJ6ulRDd
	 20WYorocJkvvtQkCgtyu14rX+fgCHOPMdsnYmyw05dAQg/875dkq7TnptbaYOmgt1B
	 /rDsWf4MQSHP0Qghpv5uDJMLVPkeRS8dJzut2Wk5dQiR3JboRg5J5CefXpiwPjBK1S
	 ll8O7rAXaMJfA==
Date: Sat, 3 May 2025 10:39:39 +0200
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
Message-ID: <aBXWSzhXv9RDiJ5L@lore-desk>
References: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
 <20250501071518.50c92e8c@kernel.org>
 <aBPdyn580lxUMJKz@lore-desk>
 <20250501174140.6dc31b36@kernel.org>
 <aBRzQaonAK0IyAsu@lore-desk>
 <20250502181210.75b9d144@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QLwI2zKfFYdqK9h6"
Content-Disposition: inline
In-Reply-To: <20250502181210.75b9d144@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_013946_365952_88E7DD9F 
X-CRM114-Status: GOOD (  17.76  )
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


--QLwI2zKfFYdqK9h6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 02, Jakub Kicinski wrote:
> On Fri, 2 May 2025 09:24:49 +0200 Lorenzo Bianconi wrote:
> > > > What I mean here is the padding in the ppe_mbox_data struct used by=
 the fw running
> > > > on the NPU, not in the version used by the airoha_eth driver, got m=
y point?
> > > > Sorry, re-reading it, it was not so clear, I agree. =20
> > >=20
> > > You mean adding the "u8 rsv[3];" ? that is fine.
> > > I don't get why we also need to add the 3 __packed =20
> >=20
> > I agree the __packed attributes are not mandatory at the moment, we jus=
t agreed
> > with Jacob that is fine to add them. Do you prefer to get rid of them?
>=20
> Yes, they also imply the structure may not be aligned, AFAIU.
> __packed used to be one of DaveM's big no-nos back in the day.
> Especially in vendor drivers it gets sprinkled everywhere without
> thinking. So maybe it's all school of me, but yes, please remove.

ack, fine. I will get rid of them in v5.

Regards,
Lorenzo

--QLwI2zKfFYdqK9h6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBXWSwAKCRA6cBh0uS2t
rJ49AP97SkyT5VODR7TjKICm1usEvbppaoJ/fwgd0LLsaGXbLAEAkuWgcEM3KyVy
USXxT7N7DP5w+hvwEChv7l3i+tbAwAY=
=U93f
-----END PGP SIGNATURE-----

--QLwI2zKfFYdqK9h6--

