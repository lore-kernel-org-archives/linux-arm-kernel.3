Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1E3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msobTxzBgqYW9/NT2WyZP6UC2CPRig/feHhK0bioZm8=; b=3Snign6AdwxwafRrtsGVWZIXmM
	c9jqLx6XWLIRyTNlCt/qM7JYIhklKbdibKCViUFNuvKunDZ6cJ5YsydlpqhRebsKOJhtpNvqYtd1j
	7De8IsSqc4nxVisBpzZWrdRa/7bC6RMt6Lj5Q+Clr3pyTEMkI4pB7FT3XliYWpTliLF7V8TjEWqCI
	Zg24caqbaMfsPmw530byn2nG7pKut0wQZtJuvGhvVeymWgjMn3IwWimaImO7T5z12T4B/V0zFwdYM
	blRprwyHfArdEDAvtFxo0unJN+8h6AiztZepcOXYBgYXwlgGIAMl/cKn56Yd3r6eQ5UqmuJW9spKA
	2/FMjq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgJS-00000001gs8-3b6W;
	Mon, 07 Jul 2025 07:30:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgDL-00000001fym-1wLf;
	Mon, 07 Jul 2025 07:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CD045C593C;
	Mon,  7 Jul 2025 07:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09D7C4CEE3;
	Mon,  7 Jul 2025 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751873074;
	bh=vAfI9Wzfd2UxcyYtb1q0p59LDd0HpdCjyQmUuTb6HKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYI6CPV2hkyw7EsU1mgnmwJKkZ/4uzpTCwsqqMswAmUP8Pi3GSQcPS9e/tFukS7t5
	 dWi5olzbrTVSFCJv19R70GmujJn2hWuV1mpEj97fGLxnWjtGWeSRUvcRsEumMaDuwD
	 w2mgAPuCjJj9cFaMEygQFVWmlaujA8sNK/4B/X/WcIhgmOADjvRnuLXuHFhPtN1F9X
	 alWebXnGWNspziW3KTMpSPdgrCmWKMV1qGA60b8wBVuZuOfd92Wx4YZU+YTDsjWFJ7
	 XIiNlksTPFD/JJAYbFZlEDqMO68R39OJGQiC60BPe8XrEVyLIFScxIdCmix9JvHKnH
	 A5o136EeHBztA==
Date: Mon, 7 Jul 2025 09:24:31 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next v2 2/7] net: airoha: npu: Add NPU wlan memory
 initialization commands
Message-ID: <aGt2L1e3xbWVoqOO@lore-desk>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
 <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W0USTkeDKBVNDBPv"
Content-Disposition: inline
In-Reply-To: <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_002435_536452_591731F4 
X-CRM114-Status: GOOD (  15.91  )
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


--W0USTkeDKBVNDBPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Jul 05, 2025 at 11:09:46PM +0200, Lorenzo Bianconi wrote:
> > +
> >  struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stat=
s_addr)
> >  {
> >  	struct platform_device *pdev;
> > @@ -493,6 +573,7 @@ static int airoha_npu_probe(struct platform_device =
*pdev)
> >  	npu->ops.ppe_deinit =3D airoha_npu_ppe_deinit;
> >  	npu->ops.ppe_flush_sram_entries =3D airoha_npu_ppe_flush_sram_entries;
> >  	npu->ops.ppe_foe_commit_entry =3D airoha_npu_foe_commit_entry;
> > +	npu->ops.wlan_init_reserved_memory =3D airoha_npu_wlan_init_memory;
>=20
> I cannot find in your code single place calling this (later you add a
> wrapper... which is not called either).
>=20
> All this looks like dead code...

As pointed out in the commit log, these callbacks will be used by MT76 driv=
er
to initialize the NPU reserved memory and registers during driver probe in
order to initialize the WiFi offloading. Since MT76 patches are going via
the wireless tree, I needed to add these callbacks first.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--W0USTkeDKBVNDBPv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaGt2LwAKCRA6cBh0uS2t
rEqNAPwMOyfRSkdrks1eKCEqkTbnlkMiO4b/hvkixAvW+Qz7VAD/X8vv31rQ27pa
HzOWU62kGM7ToyWSw8D1Zvnc1cEe2ww=
=Y9hx
-----END PGP SIGNATURE-----

--W0USTkeDKBVNDBPv--

