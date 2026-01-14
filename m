Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B9D31A2B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2s8rj3WQKK0Eyy/rTMncU90DPVXIB7qfpGd53yk0wec=; b=PHfRbbeaVUEUjxFaEPtIqA8iR5
	oEi8p5AKPJmWk9Ev/7b30sHSKzqeAJy0/PgQytRMuBY8tYiBOsU/AEthtfdogFmgT7vwdBn7tpgAO
	2oM+wNknDK4ern37Zk+kTJ+hq0PVrZOldDX+8rnSSkbYidVZ6D0q/f2fnCAQ6wbZ68GCCpgQPqpKQ
	5AYJAW1b6DqRUclvW5s+z6+6+L49Btws0Npq/FB8fc9xiFx5qYV7hLVoBPqHZm57eCm02hGmTbtW3
	qC3AjBQtR7BzSa/UBZ02C8f5WjPhD5Faq+nKFH1iyjDV9887/y+b6zbgtnmWrSdtkRAYV9dHRf79w
	3QLiSJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwki-00000008Rps-0OYy;
	Wed, 14 Jan 2026 09:01:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwke-00000008Rok-1T1C;
	Wed, 14 Jan 2026 09:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2289440A9D;
	Wed, 14 Jan 2026 09:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8111EC4CEF7;
	Wed, 14 Jan 2026 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768381275;
	bh=VC3Dyy9rRZ0VzDKLm0/8sTI7TgiSnm3oReBYKX7dvy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqZV4UYoIrRR8OPjBi9jP1ZFUFpxC/VFAkyQFMKS1HufwAX7yzxDvnfX59j4kwxRC
	 FSqJJwk+fOakasNtFUktQkbBGkVu/9r7j/PJtK5c0KAhuu603PAtbRXlZJIZ2fst+C
	 JjSg0WnFcjP0dg99OP6tQUP7w754s7Ch/KVDcy2FXV0RYNft7Wvkx6tG1xHlKzdZl7
	 hPT9F8dEmCeK50mjXZdfhjogeh7XePQcLN7hOzR79blIHLT1fRLz2kzlGM7aBeU3hE
	 TNsQOBvXkur8ZZoeBoRc+AhNsv9BaWYDoMPiuD9xSrUmIiqAr8Xm0iBkBZIIW0OZRz
	 GYydL0IPLJY9g==
Date: Wed, 14 Jan 2026 10:01:12 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
Message-ID: <aWdbWN6HS0fRqeDk@lore-desk>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Bo5O693e36+5lb1"
Content-Disposition: inline
In-Reply-To: <20260114-heretic-optimal-seahorse-bb094d@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_010116_428521_6AC36BC7 
X-CRM114-Status: GOOD (  20.70  )
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


--8Bo5O693e36+5lb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Jan 13, 2026 at 09:20:27AM +0100, Lorenzo Bianconi wrote:
> > Introduce en7581-npu-7996 compatible string in order to enable MT76 NPU
> > offloading for MT7996 (Eagle) chipset since it requires different
> > binaries with respect to the ones used for MT7992 on the EN7581 SoC.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754885c=
1362b9603349a6353 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      enum:
> >        - airoha,en7581-npu
> > +      - airoha,en7581-npu-7996
>=20
> This does not warrant new compatible. There is some misunderstanding and
> previous discussion asked you to use proper compatible, not invent fake
> one for non-existing hardware.  Either you have en7996-npu or
> en7581-npu. Not some mixture.

Hi Krzysztof,

We need to specify which fw binaries the airoha NPU module should load
according to the MT76 WiFi chipset is running on the board (since the NPU
firmware images are not the same for all the different WiFi chipsets).
We have two possible combinations:
- EN7581 NPU + MT7996 (Eagle)
- EN7581 NPU + MT7992 (Kite)

Please note the airoha NPU module is always the same (this is why is just
added the -7996 suffix in the compatible string). IIUC you are suggesting
to use the 'airoha,en7996-npu' compatible string, right?

Regards,
Lorenzo

>=20
>=20
> Best regards,
> Krzysztof
>=20

--8Bo5O693e36+5lb1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWdbWAAKCRA6cBh0uS2t
rGmHAP95f/tsbA2Rhzx7wbJr9rMQoWI5S7e4n6hZj3izqRbdZAD+PvEnl+omt91+
XqShavZHMb0vQr5jAsI2MD5uobYNcA4=
=Z9AG
-----END PGP SIGNATURE-----

--8Bo5O693e36+5lb1--

