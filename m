Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D42C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFdq7UpjL9aTNtZ2OV0vOiqdMOBKJaP4cAvmEBkhieM=; b=uNo73LroysWzTMn7nxDRgdw22J
	WMs2iGpXXIHLf3ihIrvbbpevgZJIFU8WS2Fip3jtiUIehSreMqFKNHGtdlHeG+W9K2TdcZwQ5KGwN
	2t9ery7K5MltwrtdSt3Ox21BKak56oRQvCeIP8Is6kiR7HxCj0ANGae4irDqXRIE5yx2Xl3g6yeZf
	erAy+V2u84kLMi2mwoVq+m4wW63mqJxMsdRjkiLRS3kf5aLRpCp6582XUq/IFIXWsnFtvtLDqwm+H
	fxnLnWC0UihSl9H+7TxjLdwA6AMBAnoRFByGP5ITjBFhLrqrgU3oKwYmuFud2doUKC1KjBvtJgGD7
	zX83Zqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdG-00000003HON-1Utc;
	Thu, 31 Jul 2025 09:31:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPTB-00000003GDP-3IAe;
	Thu, 31 Jul 2025 09:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F16CEA52298;
	Thu, 31 Jul 2025 09:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C541C4CEEF;
	Thu, 31 Jul 2025 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753953660;
	bh=YQitdJZEqx49z+aEtgIFZrSpHymltedYz+RclMvgrQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbJLOQHDqprFeguHWI4PoV3aRzwTXcJU6XhvZc7x4IPsLrXsOMrL0wRPExZxowbHD
	 GXNz6bnZutQbK3/TCxxB9MLMC91Ty6BrQ2gWiadtfLDVTKcMRFoA4CYz80vYEwiv9L
	 V7eNWJj3DSBru/pqEwz5t2lFvzX6Bil/hG1jyWMVxnVGqjcuQwTenpv6NpkCjcnE7q
	 7Prto0sYallXr14WCC0MY5umXrDhVYP+/4Le0wPNuuv0w7JY8MOuTQ331gn5e3MVo0
	 yf08rfB8B/VZIlftPeaoEN8JBLkIDJmVXMScNO3Mc07qhkI5kbVw82LbFAwK1hq62V
	 37IRTFD5FuhlQ==
Date: Thu, 31 Jul 2025 11:20:57 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix PPE table access in
 airoha_ppe_debugfs_foe_show()
Message-ID: <aIs1eXkuez-sZtfH@lore-desk>
References: <20250728-airoha_ppe_foe_get_entry_locked-v1-1-8630ec73f3d1@kernel.org>
 <20250730181249.78dbe4f2@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iy9ceCsbIKdzJyDD"
Content-Disposition: inline
In-Reply-To: <20250730181249.78dbe4f2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_022101_889754_38CB2FF1 
X-CRM114-Status: GOOD (  13.45  )
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


--iy9ceCsbIKdzJyDD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 28 Jul 2025 13:58:08 +0200 Lorenzo Bianconi wrote:
> > +struct airoha_foe_entry *
> > +airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
>=20
> Hm, could be just me, but the way we/I used _locked in the core was=20
> the opposite. _locked means the caller's already taken the lock.
> Here you seem to be saying that the "callee is locked"..
> Can we stick to core's interpretation?

sure, that's fine.

>=20
> > +	struct airoha_foe_entry *hwe;
> > +
> > +	spin_lock_bh(&ppe_lock);
> > +	hwe =3D airoha_ppe_foe_get_entry(ppe, hash);
> > +	spin_unlock_bh(&ppe_lock);
> > +
> > +	return hwe;
>=20
> Is the lifetime of the hwe object somehow guaranteed in the debugfs
> code? Looks questionable..

PPE table entries are allocated at driver load and never freed, the hw is j=
ust
writing into this DMA area when the entry is binded.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--iy9ceCsbIKdzJyDD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaIs1eQAKCRA6cBh0uS2t
rKE+AP9acbZ1NXEFMJ8nPy6u1cFPCw8RfBLLOGACBYGpxGOffgEAwSwgpDJiqJnM
Nv8H3NbW2BL1j9z8OroubX6meSBdZwU=
=PjV9
-----END PGP SIGNATURE-----

--iy9ceCsbIKdzJyDD--

