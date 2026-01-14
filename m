Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8815D29FE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88TWc30e4XMOW8S/YVmwh/axPQFxmpUieNlZ9jjY3+M=; b=ORNjnvkh1guCrbBtVi8tRHM4pA
	duNnCHybAyt467JWWNzd9aNu7Xhc81DpQ9dSs/UdNct8i931hy+j2l+Fr1e628zy7N2oo2hrzrrwU
	jJqm1pxUtsduyXl52e3j7lohR1+f1AVouyWQz1xi1ClqgnzHMSozh1hk99EQhe5Onp2VQ/Ar+Ewyi
	tNJkMW7AWZvUUDYq44BtL3PHqZ1EtLeiMxg/gkMuEdjVyT9xhZYbb6d//FqylYzs1yb/WHnHoL8Lu
	BjYeWYovI9oBQJiPSADwEgKaTJuA0ffA453t86NYfc1MrpcW04npP+7EuwITCfYplWJgaQN1QKHxP
	3v/jGzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyHt-00000008pQX-0lDb;
	Wed, 14 Jan 2026 10:39:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyHr-00000008pPt-0OFz;
	Wed, 14 Jan 2026 10:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47C106001D;
	Wed, 14 Jan 2026 10:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC50C4CEF7;
	Wed, 14 Jan 2026 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768387178;
	bh=PmtSOXi6c4cRmNhidQU2+wsF/W2ejrabkd2m859hO1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8pZQAuS2x+DXrlRtx6UwoyXR/7RcnDqc3NIUxC3bJJQp/I59re4L7a4VfC353p/Z
	 ANP0uWXeEAITH/OKD+02Umq+QCuxKGRd7m4UscqVRRfYAPW3OMKlhulQ3FOldAV8Y7
	 FYlizb5GwrhY8WGovPnPKLsjWO1JOSBwPK3nh+GUDhcBg7Zf5qcex+Z6+7ivQzwqy4
	 g5hWUPcLLZAEvnAeAi+OqarPuVV9enHrv42DGTE5xF/nrLN/koni2ttoGDaSoAMW+z
	 tz/rNkcurxIfq9f/7q1za4joCdHKfXWWB+DJiB/9hamV7HHrKn4T+7Zj3wXLHieD5y
	 4l/gk0KpiG0cA==
Date: Wed, 14 Jan 2026 11:39:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <aWdyZ0PAnxNCGVmn@lore-desk>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i+i1tfo+9kenP0X6"
Content-Disposition: inline
In-Reply-To: <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
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


--i+i1tfo+9kenP0X6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 14, Krzysztof Kozlowski wrote:
> On 14/01/2026 11:09, Christian Marangi wrote:
> > On Wed, Jan 14, 2026 at 10:26:33AM +0100, Krzysztof Kozlowski wrote:
> >> On 14/01/2026 10:01, Lorenzo Bianconi wrote:
> >>>> On Tue, Jan 13, 2026 at 09:20:27AM +0100, Lorenzo Bianconi wrote:
> >>>>> Introduce en7581-npu-7996 compatible string in order to enable MT76=
 NPU
> >>>>> offloading for MT7996 (Eagle) chipset since it requires different
> >>>>> binaries with respect to the ones used for MT7992 on the EN7581 SoC.
> >>>>>
> >>>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-np=
u.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>>>> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754=
885c1362b9603349a6353 100644
> >>>>> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>>>> @@ -18,6 +18,7 @@ properties:
> >>>>>    compatible:
> >>>>>      enum:
> >>>>>        - airoha,en7581-npu
> >>>>> +      - airoha,en7581-npu-7996
> >>>>
> >>>> This does not warrant new compatible. There is some misunderstanding=
 and
> >>>> previous discussion asked you to use proper compatible, not invent f=
ake
> >>>> one for non-existing hardware.  Either you have en7996-npu or
> >>>> en7581-npu. Not some mixture.
> >>>
> >>> Hi Krzysztof,
> >>>
> >>> We need to specify which fw binaries the airoha NPU module should load
> >>> according to the MT76 WiFi chipset is running on the board (since the=
 NPU
> >>> firmware images are not the same for all the different WiFi chipsets).
> >>> We have two possible combinations:
> >>> - EN7581 NPU + MT7996 (Eagle)
> >>> - EN7581 NPU + MT7992 (Kite)
> >>>
> >>> Please note the airoha NPU module is always the same (this is why is =
just
> >>> added the -7996 suffix in the compatible string). IIUC you are sugges=
ting
> >>> to use the 'airoha,en7996-npu' compatible string, right?
> >>
> >> No. I am suggesting you need to describe here the hardware. You said
> >> this EN7581 NPU, so this is the only compatible you get, unless (which
> >> is not explained anywhere here) that's part of MT799x soc, but then you
> >> miss that compatible. Really, standard compatible rules apply - so
> >> either this is SoC element/component or dedicated chip.
> >>
> >>
> >=20
> > Hi Krzysztof,
> >=20
> > just noticing this conversation and I think there is some confusion
> > here.
> >=20
> > The HW is the following:
> >=20
> > AN/EN7581 SoC that have embedded this NPU (a network coprocessor) that
> > require a dedicated firmware blob to be loaded to work.
> >=20
> > Then the SoC can have various WiFi card connected to the PCIe slot.
> >=20
> > For the WiFi card MT7996 (Eagle) and the WiFi card MT7992 (Kite) the NPU
> > can also offload the WiFi traffic.
> >=20
> > A dedicated firmware blob for the NPU is needed to support the specific
> > WiFi card.
> >=20
> > This is why v1 proposed the implementation with the firmware-names
> > property.
> >=20
> > v2 introduce the compatible but I feel that doesn't strictly describe
> > the hardware as the NPU isn't specific to the WiFi card but just the
> > firmware blob.
> >=20
> >=20
> > I still feel v1 with firmware-names should be the correct candidate to
> > handle this.
>=20
> Yes. What you plug into PCI is not a part of this hardware, so cannot be
> part of the compatible.

ack. So is it fine to use firmware-name property in this case as proposed in
v1?

Regards,
Lorenzo

>=20
> >=20
> > Hope now the HW setup is more clear.
> >=20
>=20
>=20
> Best regards,
> Krzysztof

--i+i1tfo+9kenP0X6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWdyZwAKCRA6cBh0uS2t
rNG6AP9ZgXi9DzZ/J5WNCHk+rSJoJ3WG0/Jl1sK+NvANqgO8RwEAvtrzXIcDbTBW
axwTAak1fGU7QeE8dCYpEpRPA5aQNQA=
=6lmW
-----END PGP SIGNATURE-----

--i+i1tfo+9kenP0X6--

