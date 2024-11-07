Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF97D4337D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDjHZAYMmcz4sASZBrircUICfQEv8AOPga51/98nyQI=; b=Un1DM7neUni0l4kk2II8MEl2i6
	qKLwqHj4/S5aUmiOXgPbKjMw53NF8KR5Fp3DDKn1THL7IlO5YWkbIzjMPV3lAsJ74NYT89n9l5F9M
	Z3+4VfU5FH6VMtUdnqIvLSYmcirChpl/BMUXvatjwpu1iLZo9i7K43Fg+L/JoBevMa1zwVhENIlxN
	F685kT0WdhFvcsAcSm00p+wScoBWzVOVMzu1Pu6rMSe4A0LTtNp5UVqIP6KfmG4HW18fNg09+OWlt
	Z9PxaCLtFag9p6ZVqECdA5kspneXmpZ+vxZfocMiJpJxo7lT6HnAA1K1pigzCdGSITNWpqQlVQLhy
	NTnNOo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95ig-00000007iBM-1jZS;
	Thu, 07 Nov 2024 16:50:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95GW-00000007bxl-2d0c;
	Thu, 07 Nov 2024 16:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 708505C02C1;
	Thu,  7 Nov 2024 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D53C4CECC;
	Thu,  7 Nov 2024 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730996507;
	bh=WdSOCcZ7hgr8Ov0l08oA3H3gpfSe8mQRm7rvPaPDzK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsmT28NG1BwTx4bRDzle6jmLJxgmbGfrtsKIcsOlz+6VRRF2pB3qXQR3nAkPf7K4s
	 qyV26ewJsuzUWqJX4uO1VRpN5op43k61S9tiXqPOZiYB/GCRX0rSOZIOt9AU3IKAfV
	 wj0Yjooh/AUVEr85ggT7zrwfUT3uBbnwNSK9ZWnnUMplptDiGpQ8BNhmjjMOgmuNtb
	 omIFZgYPnDzinq/yjf/PWKTpGLgR1IJDcPjeLK1ero2wEWnu4QZuu6/m7sX62UQs5J
	 Y35X2zuQTs9+Ytkql4V47B1yORciN/d58WmPjSkqceeTi6b6yZlxpIRAe7HYDsfTkY
	 wH+fYUNn6JMUg==
Date: Thu, 7 Nov 2024 17:21:45 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <ZyzpGSyAVe6bz9H2@lore-desk>
References: <Zyxuv-2SPuEXiL5R@lore-desk>
 <20241107151701.GA1614390@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sizbHdv8GL2Glr4d"
Content-Disposition: inline
In-Reply-To: <20241107151701.GA1614390@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_082148_777767_4B365409 
X-CRM114-Status: GOOD (  32.09  )
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


--sizbHdv8GL2Glr4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 07, Bjorn Helgaas wrote:
> On Thu, Nov 07, 2024 at 08:39:43AM +0100, Lorenzo Bianconi wrote:
> > > On Wed, Nov 06, 2024 at 11:40:28PM +0100, Lorenzo Bianconi wrote:
> > > > > On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> > > > > > Introduce support for Airoha EN7581 PCIe controller to mediatek=
-gen3
> > > > > > PCIe controller driver.
> > > > > > ...
>=20
> > > > > Is this where PERST# is asserted?  If so, a comment to that effect
> > > > > would be helpful.  Where is PERST# deasserted?  Where are the req=
uired
> > > > > delays before deassert done?
> > > >=20
> > > > I can add a comment in en7581_pci_enable() describing the PERST iss=
ue for
> > > > EN7581. Please note we have a 250ms delay in en7581_pci_enable() af=
ter
> > > > configuring REG_PCI_CONTROL register.
> > > >=20
> > > > https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en752=
3.c#L396
> > >=20
> > > Does that 250ms delay correspond to a PCIe mandatory delay, e.g.,
> > > something like PCIE_T_PVPERL_MS?  I think it would be nice to have the
> > > required PCI delays in this driver if possible so it's easy to verify
> > > that they are all covered.
> >=20
> > IIRC I just used the delay value used in the vendor sdk. I do not
> > have a strong opinion about it but I guess if we move it in the
> > pcie-mediatek-gen3 driver, we will need to add it in each driver
> > where this clock is used. What do you think?
>=20
> I don't know what the 250ms delay is for.  If it is for a required PCI
> delay, we should use the relevant standard #define for it, and it
> should be in the PCI controller driver.  Otherwise it's impossible to
> verify that all the drivers are doing the correct delays.

ack, fine to me. Do you prefer to keep 250ms after clk_bulk_prepare_enable()
in mtk_pcie_en7581_power_up() or just use PCIE_T_PVPERL_MS (100)?
I can check if 100ms works properly.

Regards,
Lorenzo

>=20
> I don't know what other drivers are using that clock.  Are you
> suggesting that it may be used in non-PCI situations where the
> required delay might be different?  If another user requires 250ms,
> but PCI requires only 100ms, I think it would be worth having separate
> delays in each user so PCI wouldn't have to pay that extra 150ms.
>=20
> Bjorn

--sizbHdv8GL2Glr4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyzpGQAKCRA6cBh0uS2t
rLMxAQCPfP+w6J4Kwd4N78DkOQxd0DpJ0kTcwQR8/ri2jd+7sAEAmdTAx8UAnpLy
col3r/ywsAj/LfxbDgtGoSkgIYBSzAA=
=Llow
-----END PGP SIGNATURE-----

--sizbHdv8GL2Glr4d--

