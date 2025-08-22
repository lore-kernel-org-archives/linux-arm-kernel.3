Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE128CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Fj9r/Zm0xyqqdsNz16UlMlaMkF6VK/HziHE5keunsE=; b=KI5NTFvY2KonsjtKlmkUYG0O/R
	1SIaiiPta502R+BS9R/dBqWUMPtS/2SW0MO6xOBqX29XuyXvWMkpmvnI2l9oEKvWHm82YqGn90j3l
	UQxEW2AOydKYETJsxy4rqBiYU+OI78ncjQxg+hlyAoY3rG542rc4oPxZr0k4kLwDuXHZ8eSaSPn43
	DJNvH3t//G5c1G+/3qrU/Alj2E6k5IZzT3gucjhtaAXI/ZNT6HybIRlpiMIoqY1gj+IhNtZtpuySH
	96bKNsoQ2TeJN4kI+7U1zC9ydkb02dAvQOTlCmUcYWz5Azn+TuoJBwv/YoDT1VW1m9+UpWJWzf3RG
	FSF7rtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphn3-000000040sw-0pVq;
	Sat, 23 Aug 2025 06:31:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSiZ-00000002p4O-0l1c;
	Fri, 22 Aug 2025 14:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 834BBA586EA;
	Fri, 22 Aug 2025 14:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0A1C113CF;
	Fri, 22 Aug 2025 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872770;
	bh=WSF2R7E4Mb2/hL4j6g0FeimKbh0L3weVkjdBGHjZ/88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKYiqPK7OLe2vlUs8QaWsL9uZ17hNWV3VpK1Dz+4uMqooYDmgqakRouxbyZ0NDdcn
	 ymEPZ1K4L/2FgFj3XapO7ZBwbphFXhaa3q7Q6WBMrKwTh8Shf4gEYxZQiTGm5poCro
	 mBMSkX/JfXnrqH+0Zsl83jLLbKndT9DAxSxxDuftsEl155MOIcxsAGhbmdnfVyfvEA
	 fPxh6VV0yn2S0D/llpfhk0Bjkayu/Ywi09DSwAuIxiAhf9GQ/wBPXXTjJG3OwLfc6x
	 mSg5eQg0duAwyHupXZnrfSAzE+qRtvaqFr5nQpMdw1Ajv12glzCSRA8PlL9xTTp7BY
	 fNI3MCwLRvKdg==
Date: Fri, 22 Aug 2025 16:26:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
Message-ID: <aKh9_g7mgvFxMdAz@lore-rh-laptop>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
 <20250819-airoha-en7581-wlan-rx-offload-v1-2-71a097e0e2a1@kernel.org>
 <20250821183453.4136c5d3@kernel.org>
 <aKgVEYMftYgdynxw@lore-rh-laptop>
 <20250822070440.71bdd804@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FXbdwn9GJNlxMjEH"
Content-Disposition: inline
In-Reply-To: <20250822070440.71bdd804@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_072611_279663_81D46C6F 
X-CRM114-Status: GOOD (  16.64  )
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


--FXbdwn9GJNlxMjEH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 22, Jakub Kicinski wrote:
> On Fri, 22 Aug 2025 08:58:25 +0200 Lorenzo Bianconi wrote:
> > > On Tue, 19 Aug 2025 14:21:07 +0200 Lorenzo Bianconi wrote: =20
> > > > +	pdev =3D of_find_device_by_node(np);
> > > > + =20
> > >=20
> > > did you mean to put the of_node_put() here?
> > >  =20
> > > > +	if (!pdev) {
> > > > +		dev_err(dev, "cannot find device node %s\n", np->name);
> > > > +		of_node_put(np);
> > > > +		return ERR_PTR(-ENODEV);
> > > > +	}
> > > > +	of_node_put(np); =20
> >=20
> > I moved the of_node_put() here (and in the if branch) in order to fix a=
 similar
> > issue fixed by Alok for airoha_npu.
>=20
> Ah, didn't notice it in the print..
> maybe remove the empty line between the of_find_device.. and the null
> check on pdev then?

I am fine with it. I did it this way just to be consistent with NPU code:
https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/airoha/a=
iroha_npu.c#L403
Do you want me to post v3?

Regards,
Lorenzo

--FXbdwn9GJNlxMjEH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKh9+wAKCRA6cBh0uS2t
rCjXAQD/CFY6FZBfBcRt+bN2UykwgbP/5hNbqWoPrdltuQ8VKwD/VlSEjpbCiIVN
JTzElzSc2kYY+9A/Of88HRuL0KmM2Q8=
=/jOx
-----END PGP SIGNATURE-----

--FXbdwn9GJNlxMjEH--

