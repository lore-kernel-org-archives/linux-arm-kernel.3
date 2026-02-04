Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED746E83EF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxOlQodzm6R/baEVz+4rB5Qqmmbl46tAihAFv68RzaQ=; b=hwvpq5TMFA5tJyIOp1X+g8S8W6
	NM+Ju8ChzPRXARvOHVD+DbcFa7El1Xyr+vZVo+4Wv9QPKD9ctobNX/651JlC9Uk0y8xARHiLSW++t
	5GO9/2mDfliel9sJBZgfZvay5RGi9p106mJO77eGnzVW14II5tVEGXSeZGoggb87+VwNRjpPtK8XD
	YbCc6naEL2EdlQG4WFIeQ9i2pl53bWalA4yVDx+2jQT6V18SmlJrI/vum4IGhVEJiJ5J3m5WqSKAS
	xkyeNDT3ieB2yPitCNKdLpQkznbMUwBaiUs+Pb6LC4WygDJ5CH+1nYeViwT7GTNrBBpVwzTRaDNuA
	E7QM4oAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZ8T-00000008Cvv-3oDR;
	Wed, 04 Feb 2026 09:25:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZ8S-00000008Cvh-0r3K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 09:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RxOlQodzm6R/baEVz+4rB5Qqmmbl46tAihAFv68RzaQ=; b=jmQYQ3rl6CNTne5nlZkBo+AW9w
	173bTF19qgmiS7MSFiyAMmLJELXDTwDyoCY+hT8XxROuek9N5QQiCUUCFf85JuLhxNXHBYDVyTras
	6D6Xdnyv5v8+ffX8iO3xHDAFvFkdkAkd6tO7ZeEcOumiaG4fui5QOLn85IeRCP4VBPSW5T5XJXsU/
	8Go7BsknjV8PRkj6ebzdc7z6vtmz61oDRNOwupIhOEKO43kYzZPryZOsybTPN6eWo27aDphKeRecE
	LPhJhc0/UPLH2gi2tbh4SJapwGS08oJ5xxC7IuyjAJv4g39h6mO/dPGzb4Obs06kjIeW3GbUZNzKc
	69j2w0tw==;
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZ8P-00000000DBj-1JAC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:25:19 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f5Zgx6QSkz9vDh;
	Wed,  4 Feb 2026 10:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770197101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxOlQodzm6R/baEVz+4rB5Qqmmbl46tAihAFv68RzaQ=;
	b=HYMbVBcXXbeEQ4H++CWAHqOs5ataMLQ2PTg3Bvi+vNroVt18LkGQWRAqhNmZMEC+krl4J3
	U0RMxaPMVa3AE39/jfcM0Ei6W4MGVDm8vxdVosxYjahgWXGjR+ucKapetnuAhMcjZvbhzJ
	NBQ26z9ZTnAc8T90PLs0jkcUrGVB5nMfnaRS4c2pDA98Eiw2YtY0gmHUIf+oNl/nSIsnXx
	RfNcWTfwfHhjCgHw2ZQYcCtSR7oejxTE/rKd4PmPMHrh0Xu47rdqn0w0myyCvEr49G4k16
	h1xsGhgjY5b1mRpFyAlLM1yLncdvx1dBpZ9w6t07QD4ZOpLCOkggJoR4flaTow==
Date: Wed, 4 Feb 2026 10:24:52 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew@lunn.ch, shawnguo@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, netdev@vger.kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 conor+dt@kernel.org, horms@kernel.org, richardcochran@gmail.com,
 robh@kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, wahrenst@gmx.net, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [net-next,v22,2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20260204102452.180eb416@wsk>
In-Reply-To: <20260203174714.79388301@kernel.org>
References: <20260131233459.1625279-3-lukasz.majewski@mailbox.org>
	<20260203013909.822898-2-kuba@kernel.org>
	<20260203211955.23ef4355@wsk>
	<20260203174714.79388301@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-ID: a37455c1274356fa2fd
X-MBO-RS-META: 9srgwun7amh3ixsdai6ym39433cis3wc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_092517_478323_06881171 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Jakub,

> On Tue, 3 Feb 2026 21:19:55 +0100 =C5=81ukasz Majewski wrote:
> > > > +static void mtip_write_atable(struct switch_enet_private *fep,
> > > > int index,
> > > > +			      u32 write_lo, u32 write_hi)
> > > > +{
> > > > +	struct addr_table64b_entry __iomem *atable_base =3D
> > > > +		fep->hwentry->mtip_table64b_entry;
> > > > +
> > > > +	writel(write_lo, &atable_base[index].lo);
> > > > +	writel(write_hi, &atable_base[index].hi);
> > > > +}     =20
> > >=20
> > > Can these functions race with concurrent access? Looking at the
> > > callers, mtip_write_atable is called from two different paths:
> > >=20
> > > 1. Static entry updates: mtip_config_switch ->
> > > esw_mac_addr_static -> mtip_update_atable_static ->
> > > mtip_write_atable (no lock held)
> > >=20
> > > 2. Dynamic entry updates: timer callback -> mtip_mgnt_timer ->
> > >    mtip_atable_dynamicms_learn_migration ->
> > > mtip_update_atable_dynamic1 -> mtip_write_atable (learn_lock held)
> > >=20
> > > The learn_lock only protects the dynamic entry path. The static
> > > entry path runs during link changes (mtip_switch_restart called
> > > from mtip_adjust_link) without lock protection.
> > >=20
> > > Both paths can access the same hash block in the address table
> > > (determined by GET_BLOCK_PTR(hash)). If the timer fires during a
> > > link change callback, both can concurrently access the table,
> > > potentially causing torn reads (reading .lo from one entry
> > > version and .hi from another) or torn writes (the entry is in an
> > > inconsistent state between the two writel calls).
> > >=20
> > > Would extending learn_lock to protect all address table access
> > > work, or is a separate hw_lock needed for hardware register
> > > access?=20
> >=20
> > This is handled in another way:
> >=20
> > 1. Partial write is not possible as this IP block handles it in
> > order (with some kind of 'latch' registers):
> >=20
> > "VFxxx Controller Reference Manual, Rev. 0, 10/2016"
> > 11.5.4 MAC address lookup table
> >=20
> > "Each entry must be written or read with the low address accessed
> > first followed by the high address"
> >=20
> > 2. The code for dynamic IP writing will not "touch" the entries for
> > "static" MAC addresses - Figure 11-70 - bit 49 is "Record Type":
> > 	1 - static entry
> > 	0 - dynamic entry
> >=20
> > IMHO, we are "safe" here. =20
>=20
> My reading of the AI's comment was that there is no lock in SW so two
> SW threads can write:
>=20
>    Thread A   Thread B
>    write_lo
>               write_lo
>               write_hi
>    write_hi

Ok. Then I can add "atable_access" spin lock to prevent from this
situation.

--=20
Best regards,

=C5=81ukasz Majewski

