Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7424FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+dyrRE+P/HVPL+mD5kMclNeCojAU/XWM9mGFrbrBfI=; b=Skr96R+cGkwLP/4dZA9wuwrXXw
	am8n5K6CuG+/NCs8OnuvkIjBFAMCcosS08o6yTKZLXvQqXSLZduWA2hzRHIgR/sfOw64N376C8h++
	039cLYNbTZSI+u1XBCpA223pputqVzc3dgwmDu+iSUP3mUdKKOqN6KTiIOBxvmyjvFrmajk4tFvGZ
	YLcO3tW5CrH1Vzmn0VQ5sL07ZiMRoJAShYqg6DETYq+Ehf4CcKAztJF3+AX3zY2FT2fe07koul1/E
	72KmO68Fj7xp91XsxtChs6U2AXNrMV5cIdX0veCfT6Z+JdG1a48N8Yb1N5gjzXyK1Lnc9bqoMNQ7w
	tFa2h/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDxo-0000000G5tK-2aiy;
	Thu, 05 Jun 2025 17:01:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDtw-0000000G5Wg-28Is;
	Thu, 05 Jun 2025 16:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EBE8A629E6;
	Thu,  5 Jun 2025 16:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C677C4CEE7;
	Thu,  5 Jun 2025 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749142631;
	bh=uWq41XjmaBPeNaNo0Twmva32kiVlfQyvpWdJh2HxoW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEW/DkBw2lWryrvdZAxurWAqS5vJ3gpkNuBoRSWCh/SwHFmTJzYQh6yBsfbk5Uqtq
	 MzCBTKkwIYhEtvhJ21OOUTeYVMWiU75SuyilBVymrJP533mpXdDoflSafA6cBYtVvz
	 Tbh+q09my85GQzBiotHxEy3y22UpjYEfsp2Ebi06likhlL3VjNeiMBQQB+xiCwkKWZ
	 pDa6WhtU7Jid9nAdR6eLD1jrhhm8QmKMmWm/W9URrPnZLis9IEIc2i2yvEU1uPLA5t
	 eoS8P9F9PuhCeWZAzLQVAmnrnbGOc8Umd4HL3SU40NwQRaJ8MO8jj1UnG34SIw+Vfb
	 OT1UTMdT3+aKQ==
Date: Thu, 5 Jun 2025 18:57:09 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ben Greear <greearb@candelatech.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH mt76 5/5] wifi: mt76: Remove RCU section in
 mt7996_mac_sta_rc_work()
Message-ID: <aEHMZe0_vuml8eI9@lore-desk>
References: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
 <20250605-mt7996-sleep-while-atomic-v1-5-d46d15f9203c@kernel.org>
 <909d2ca8-8409-997a-768f-8e9be4c5168e@candelatech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X71w9KW41lasa3QR"
Content-Disposition: inline
In-Reply-To: <909d2ca8-8409-997a-768f-8e9be4c5168e@candelatech.com>
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


--X71w9KW41lasa3QR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 6/5/25 04:14, Lorenzo Bianconi wrote:
> > Since mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field() can't
> > run in atomic context, move RCU critical section in
> > mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field(). This patch
> > fixes a 'sleep while atomic' issue in mt7996_mac_sta_rc_work().
> >=20
> > Fixes: 0762bdd30279 ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work=
 to support MLO")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Thanks for the quick fix on this, it appears to solve the problems we
> saw related to this.

ack, thx. Can you please add your 'tested-by' tag in this case?

Regards,
Lorenzo

>=20
> Thanks,
> Ben
>=20
> --=20
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>=20
>=20

--X71w9KW41lasa3QR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaEHMZAAKCRA6cBh0uS2t
rPSwAQC/WKz8QxMEL+41maplaE+rUaOHZFrptyyd5B5oIoW7JAEA0M1Ih8nwvA2X
H0mMs8QIq+Oq5TX55w8vnReI92NFQQw=
=h9y9
-----END PGP SIGNATURE-----

--X71w9KW41lasa3QR--

