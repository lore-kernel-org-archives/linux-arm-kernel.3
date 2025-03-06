Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96326C28B22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4X+FnHVpWzWW4W0hGDVyaY0sBAjRDXZg/ShUEe46pbo=; b=xLvzt2+L4nSNMA0xrndT/AtPHl
	rP+RJ7wUJzhT6J2kS9i8GwxLtzFSmzoxzDtdIcojdxO1ZKuh/Z/SYslN9XLBSoHu6oRuRTvJ8Qs8b
	AKN4VR3bHkWkeFjmWtKb6IGrNq6Rl2D+jWLaxVBLpwPcIqarb6zHrarAYo790EVbZUwSJ2LkWSXIt
	GrhocVa2oSuQHwYHy+uSMvaba89mn4SjNJy01LjDjRXE+JyaO7j1pLkCDc1uWZ39KL7XB3QIkxRUI
	+bXjqSK7aergTLgMf3Zy6WWgukdPQkSNCawSURuOtwwaTwi823KvCMMxfBK8kZmYDi1KqJfNs/mcn
	FOh5SwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7qX-0000000AXPI-451c;
	Thu, 06 Mar 2025 09:48:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6go-0000000ALw1-37Sy;
	Thu, 06 Mar 2025 08:34:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 435F744267;
	Thu,  6 Mar 2025 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741250083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4X+FnHVpWzWW4W0hGDVyaY0sBAjRDXZg/ShUEe46pbo=;
	b=mF8P6ZyAPX08OLt4l16Kpo2v7XG2grorpNpUUF2ND52CndXRHfjFV0oy/0WjBehTD5VZE7
	f+mraZVyAQQPAt4SFEev/YX24UWI4LhjvB3GTRNaQ4YNrbhNUIVGK3QsMawpwpYOW9obEh
	RsMG6stsKk68DAv6eZY+InvMQF3LSz7/wKKtC+ZkE41HylBQNUuEYyUYSSnscCKfXdnNsV
	DWqFrp872aRrtLF8IuGFzj8oqNxq61u+Kl1ye0+RDclKmW4kGejtdp8d/4RwrLRPeiOhiS
	DLrtSBWgq6iM6miU7AmQNzvXBkHjT5nT88HacGvinpbJAQMAPOlu57ikZO4d+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Manikandan.M@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
In-Reply-To: <6fee6e71-106f-474b-9a0c-5df5fb0caa00@microchip.com> (Manikandan
	M.'s message of "Thu, 6 Mar 2025 07:09:44 +0000")
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
	<D889CRJC6W19.2LDQCDVG7BLNG@kernel.org>
	<6fee6e71-106f-474b-9a0c-5df5fb0caa00@microchip.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Mar 2025 09:34:41 +0100
Message-ID: <87eczawo9q.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepofgrnhhikhgrnhgurghnrdfosehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepmhifrghllhgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopefpihgtohhlrghsrdfhvghrrhgvsehmihgtrhhotghhihhprdgto
 hhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_003446_911920_4A4087F4 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, conor+dt@kernel.org, mwalle@kernel.org, vigneshr@ti.com, devicetree@vger.kernel.org, richard@nod.at, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, Varshini.Rajendran@microchip.com, krzk+dt@kernel.org, pratyush@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


>>> +static int sst26vf_nor_post_sfdp(struct spi_nor *nor)
>>> +{
>>> +     struct nvmem_device *nvmem;
>>> +
>>> +     sst26vf_sfdp_nvmem_config.dev =3D nor->dev;
>>> +     sst26vf_sfdp_nvmem_config.size =3D nor->sfdp->num_dwords * sizeof=
(*nor->sfdp->dwords);
>>> +     sst26vf_sfdp_nvmem_config.priv =3D nor;
>>> +     sst26vf_sfdp_nvmem_config.reg_read =3D sst26vf_sfdp_mac_addr_read;
>>> +
>>> +     nvmem =3D devm_nvmem_register(nor->dev, &sst26vf_sfdp_nvmem_confi=
g);
>>> +     if (IS_ERR(nvmem)) {
>>> +             dev_err(nor->dev, "failed to register NVMEM device: %ld\n=
", PTR_ERR(nvmem));
>>> +             return PTR_ERR(nvmem);
>>=20
>> I don't think it makes sense to have this one-off in a particular
>> driver. If at all, this should be handled in the core. Sorry, but
>> this really looks like an ugly hack.
>>=20
>
> Because the EUI identifier within the SFDP is unique to the=20
> SST26VF064BEUI flash, I opted to handle it here rather than in the core.
>
> Also here the MAC address data resides within the 0x260-0x26F range, I=20
> will resize the nvmem_config.size to 0x10 instead of registering the=20
> full SFDP region as NVMEM.

Open question to all parties in this thread: how do we give an offset in
the device tree that is relative to the sfdp region and not the data
region? I believe we care not to mix these areas while describing.

Thanks,
Miqu=C3=A8l

