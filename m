Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B90C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:Subject:To:From:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Mime-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nd5Wisd7VaAC+Xg6JSBMMfxj6RtVYNalnMmvfTDoKxs=; b=HK8w8b17vgZfTDHSXLhn/7oF/y
	mjZUW2379sUCiFaNLjupNy+OT57ap+Ciy6xlKXaxyDPgRa+tko30tP0cR/0PpQQ7HhG2p3xWIgmdE
	qEGNZ1eXoNZCKSPWNQD0XGQr8IzSJRnB8fd7obsDeSce/74KEoEe7fhAIcCDiEc2bKeXgRK6cVl2S
	duKbd++uR06w7BxDmPmgUN28k8bRsxCRP8yWQpwiwd1DccaWyQLaA6/GD1nGDm2g+fzDb3drUMuMy
	teCMgIuFSH3BkA9RS2hHY9elFsCmTrGIr7yJHSTIFdaYkU7mJnmx7Z8qBtku90qKE7C3sJ6+6jlFE
	LiDvD0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7qa-0000000AXQX-00UU;
	Thu, 06 Mar 2025 09:48:56 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6lT-0000000AMX9-1FND;
	Thu, 06 Mar 2025 08:39:36 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F3E21287;
	Thu,  6 Mar 2025 09:39:31 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 09:39:31 +0100
Message-Id: <D891QPQIT13L.1S55ZM1J286PE@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 <Manikandan.M@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
X-Mailer: aerc 0.16.0
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
 <D889CRJC6W19.2LDQCDVG7BLNG@kernel.org>
 <6fee6e71-106f-474b-9a0c-5df5fb0caa00@microchip.com>
 <87eczawo9q.fsf@bootlin.com>
In-Reply-To: <87eczawo9q.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_003935_473925_869FCDFC 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, richard@nod.at, claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Varshini.Rajendran@microchip.com, krzk+dt@kernel.org, pratyush@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> >>> +static int sst26vf_nor_post_sfdp(struct spi_nor *nor)
> >>> +{
> >>> +     struct nvmem_device *nvmem;
> >>> +
> >>> +     sst26vf_sfdp_nvmem_config.dev =3D nor->dev;
> >>> +     sst26vf_sfdp_nvmem_config.size =3D nor->sfdp->num_dwords * size=
of(*nor->sfdp->dwords);
> >>> +     sst26vf_sfdp_nvmem_config.priv =3D nor;
> >>> +     sst26vf_sfdp_nvmem_config.reg_read =3D sst26vf_sfdp_mac_addr_re=
ad;
> >>> +
> >>> +     nvmem =3D devm_nvmem_register(nor->dev, &sst26vf_sfdp_nvmem_con=
fig);
> >>> +     if (IS_ERR(nvmem)) {
> >>> +             dev_err(nor->dev, "failed to register NVMEM device: %ld=
\n", PTR_ERR(nvmem));
> >>> +             return PTR_ERR(nvmem);
> >>=20
> >> I don't think it makes sense to have this one-off in a particular
> >> driver. If at all, this should be handled in the core. Sorry, but
> >> this really looks like an ugly hack.
> >>=20
> >
> > Because the EUI identifier within the SFDP is unique to the=20
> > SST26VF064BEUI flash, I opted to handle it here rather than in the core=
.
> >
> > Also here the MAC address data resides within the 0x260-0x26F range, I=
=20
> > will resize the nvmem_config.size to 0x10 instead of registering the=20
> > full SFDP region as NVMEM.
>
> Open question to all parties in this thread: how do we give an offset in
> the device tree that is relative to the sfdp region and not the data
> region? I believe we care not to mix these areas while describing.

You don't do it, because there is not even a relative offset that is
fixed. There should be a pointer to the vendor table inside the SFDP
structure. Thus, you need to properly parse it.

Regarding how to reference it within the device tree, I'd assume
something along 'compatible =3D "jedec,sfdp-vendor-table-NNN";' or
similar. But no static/relative offsets.

-michael

