Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B41C9EC96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OktVfPwfLzn0wtj2b2tV+soxGi9Ga0YyfQs/LDU5obU=; b=2fekoYbAlP4G0bEE6+sExE3p2k
	VYqD2yU1NxC7PSATTOki6KRBwY3CdJ12yjAACmEAlxc8zWkFirxaYm4pK2zFhMmbmvLsy66NlUjlM
	VRhu/XxeEnImX0mtb5X8f7HX7hUQQBog6gOaHCMk73FyqfxO/u+7k5dh+g1khL7xkIdn8sMoxVPwC
	zwi3wJdTU4TVTiLPQrV5eyyXRVWWQRLZuHpYjRePzeWuUn/XtvWcheLRXBTKIQR6ppi/oyqfg5QKG
	r7VmVhKK70idLWFq1U3LZaZgc6ZCh1uCKSdaFxAK+IUBJt3CS48+QRP6r5tsR6NDSFzQl1IOpRwnO
	duvIlAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ63-00000005YL5-0Xct;
	Mon, 12 Jan 2026 14:40:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ61-00000005YKk-3mJV;
	Mon, 12 Jan 2026 14:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05C996001A;
	Mon, 12 Jan 2026 14:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCBFC19421;
	Mon, 12 Jan 2026 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768228840;
	bh=SDAL0N+qnwLvzZJAzcXSoQROGQiuK08faEFfpMLHSZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/yy/SHnqAKrjtGGfSswYMzKavZlqQqzOfGZKk7cxHJ9SwyNHu76QGX8eMuT8MKED
	 CIVV6guZOvV3zdpAHHY3JtpNpRR+VRwmiEOvRTzKPruYxyRQN8o7Z9hiOPTF6V61fx
	 5RSIwlNr0VpwquOMXhbMllbrMGjpmvd14l8kSOSPLt45xbZYUAjXPTGKNl/V3i+0MC
	 C29rSyOSZW4aX+B8al2ILOz1UwUmL+ef5ZKVQg0fUXL6raFjU7QgEZ6alXHRdpBqsc
	 sdsdg1TPTBm5wS5u7uPOqwOM/pSkCPS500YgbhGKRnCf4XBJQr2RvKn49X9ZVslzyc
	 jKMwtYbmpRP3A==
Date: Mon, 12 Jan 2026 15:40:38 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
Message-ID: <aWUH5nHR3xz-vk-a@lore-desk>
References: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
 <20260112-airoha-npu-firmware-name-v1-2-d0b148b6710f@kernel.org>
 <f57867a0-a57d-4572-b0ed-b2adb41d9689@lunn.ch>
 <aWT4vcBzG6UnaqOF@lore-desk>
 <81f98b9a-3905-4bd9-80ee-348facefeab9@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35dfMFi+mqodQRNK"
Content-Disposition: inline
In-Reply-To: <81f98b9a-3905-4bd9-80ee-348facefeab9@lunn.ch>
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


--35dfMFi+mqodQRNK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > > Why cannot this scheme be extended with another compatible?
> >=20
> > yes, that is another possibility I was thinking of but then I found
> > "firwmare-name" property was quite a common approach.
> > Something like:
>=20
> Having two different ways of doing the same thing in one driver just
> add unneeded complexity. Please just key of the compatible like all
> other devices this driver supports.
>=20
>     Andrew

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> ---
> pw-bot: cr

--35dfMFi+mqodQRNK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWUH5gAKCRA6cBh0uS2t
rD+QAQD2KKc4Cab4DOiJr5tUgFk9XtQJh21lPwcIXXyOJIv41AEAivnvtVJJ4Nyo
VQCZ8SeSJRq/fIn4RXDBDubNyNDJhAg=
=G7LN
-----END PGP SIGNATURE-----

--35dfMFi+mqodQRNK--

