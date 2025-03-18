Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03249C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exq48y4UDS4CNhrlQI3l6HQBS5ES5ynXCCbVCpH1UyY=; b=ZBN4whlWl0RLFMwWUL6mSob88Y
	o0hyep+tOeLz9yRPzwj8Qz+JeCWFyNPYrnRPQQumLpZT1qs8oj+DN02b7koV0km8cLJPJPBQDGVjP
	jXPbmy+ApqhqZywGjrDHG2dhNOYmjVNn5K4G5hqvrcYC4mc9vJIPr3g9h+eTudNDi73vqbRS9z8HB
	VO7EZE1HEoHB4WAEZ9klRx8unnQeWGZLu2Ty1sfVuPU8vgZ176GlB+CjTEuep0lpBAxnqIttih/yk
	HLpT8nYhEpjjsI2A+CpNWno9PsV8pMDpLegCZtcIcVWQJXJzyRRuQ+Jv16embDClbRaTNFBtLW/oL
	S999bUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXT1-000000066Lz-03TO;
	Tue, 18 Mar 2025 13:58:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXOK-000000065X6-0n2C;
	Tue, 18 Mar 2025 13:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A41EA474B8;
	Tue, 18 Mar 2025 13:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806C0C4CEDD;
	Tue, 18 Mar 2025 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742306038;
	bh=exq48y4UDS4CNhrlQI3l6HQBS5ES5ynXCCbVCpH1UyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwCpccxayKhI6ckfPXN6x2rcwonxpo92h9X4bC4cvlC35rhylaDyY4NQHQiaLxKN3
	 yFzyP0lKkKbhofrJk7A4HkI4snl8WCIrvztZozLJs+rbxe1jIyjBPgA3ochiQIuBvp
	 Y7groGmsKyrQt3EyPm5FigdyxV7AAeEgXM9Hs7lZYXaMwZDRMTa6W80+rylxldEWXw
	 ZArzQIr2MOYq7t6fhMSJG2UoGYsBCDqvi5ZRBybbY/B99Mgad37tDwolPLmco7OCKP
	 TAWNxQXCizYbiLoTzG5qp7F63by/HcmOpTXt2NJ2IMwrPCejd+xAfXOSvdotAkZ8OY
	 7CJzAUJqrsSQg==
Date: Tue, 18 Mar 2025 14:53:56 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 20/21] wifi: mt76: mt7996: rework mt7996_ampdu_action to
 support MLO
Message-ID: <Z9l69EeSm3ZemucG@lore-desk>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
 <20250312-b4-mt7996-mlo-p2-v1-20-015b3d6fd928@kernel.org>
 <38ab11261debaf7e0884080031412808396eea5b.camel@mediatek.com>
 <d584cae48470cf08b1029e0fef1383f92444970b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QC7bqY7jvMPKDwHq"
Content-Disposition: inline
In-Reply-To: <d584cae48470cf08b1029e0fef1383f92444970b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_065400_294536_40784E95 
X-CRM114-Status: GOOD (  11.81  )
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


--QC7bqY7jvMPKDwHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> Sorry, please ignore the previous mail.
> I just aware that the deflink is now used as the primary/assoc link, so
> it should work.
>=20
> Regards,
> Shayne
>=20
> On Tue, 2025-03-18 at 14:28 +0800, Shayne Chen wrote:
> > Hi Lorenzo,
> >=20
> > On Wed, 2025-03-12 at 12:14 +0100, Lorenzo Bianconi wrote:
> > >=20
> >=20
> > Regards,
> > Shayne
>=20

ack, no worries.

Regards,
Lorenzo

--QC7bqY7jvMPKDwHq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9l69AAKCRA6cBh0uS2t
rLYuAQDn1Wm9sdM1JI8LKfHpJi4eZ8Zos8g9Ky74NpQinqvEpAD+I9Fm1rnMWZ4Q
MzfC7A+Fb6MjgxEprXxdEli05QGIbwg=
=E1zp
-----END PGP SIGNATURE-----

--QC7bqY7jvMPKDwHq--

