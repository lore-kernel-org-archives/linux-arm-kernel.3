Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1550E8B383
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qArFy9W/qh08BmAGWtzZZCsoMBSnbZbAIXbbmaAcFIo=; b=rjNsn3F/2PYcLLOlP08EdFm+ax
	NxsjLvc1mLGSBzlRDccX8Hc+sdybyYafdc5+T0eMSSK2S/5+5Fsb3mF8Om0SDlqzycdfZb0O1fCLG
	TfjGTKl1shoR8+lhRfKtiJHPSi0PYLPjCaUWsu2GUGl3fQNUOfahWZdw0+Onnj8c2bN2uOwaaLc7/
	F2My9ufDWGTbKLvqLBAMmbKgzCXqsphJww0spTKpGYhjkm2tRyNVGpgIUXiOwQ+O/Lt1dFPtuWKLi
	FLDn/AuInwPVFm4tnPS2NAr48B1UJAgZvP3t9I/gFIu3AKrKRzuzibOLvEHlxkHek9dB86ZxOxlCZ
	WrFLIptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRzE-00000007iVx-0ats;
	Wed, 04 Feb 2026 01:47:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRzC-00000007iVc-1b5l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 01:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1224E44426;
	Wed,  4 Feb 2026 01:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2907C116D0;
	Wed,  4 Feb 2026 01:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770169635;
	bh=EtMmNO0INyqsoTPYTVYPBU1hfHnKquGk52ClsNNa3xA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FupUAjoYyJSFprj0Sql3B8gqvRQF6RVKpaWm99ti+8tf64Kq4mtfH6anuNPVkDymQ
	 fGlEdN7QWSRUACrO77juDSxaqKr5zNTf7UGpYQLcg2QnS1hLISuMqjdA4+3ZHLgY77
	 CrDlVJqw0lJD5aRLJHOBYmWbBBDJ7NHkxRLNc08IKF65tAxGMmJvOVoRSUWIiWBHxA
	 6w0sEzP1pHKVb2zVpC0Abe8/gaVAj8kAX21srQol/NeFVAoIXDugUDwPR5AVMjIfuN
	 TsikZ+OnwcKCw4oq0jNGFu7OtULbQ7mfTfpSKCwxldgkOHKtNvFH+PJs6Bw2Uyv5ES
	 bq3cCzlFuaXwA==
Date: Tue, 3 Feb 2026 17:47:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
Cc: andrew@lunn.ch, shawnguo@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, netdev@vger.kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 conor+dt@kernel.org, horms@kernel.org, richardcochran@gmail.com,
 robh@kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, wahrenst@gmx.net, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [net-next,v22,2/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20260203174714.79388301@kernel.org>
In-Reply-To: <20260203211955.23ef4355@wsk>
References: <20260131233459.1625279-3-lukasz.majewski@mailbox.org>
	<20260203013909.822898-2-kuba@kernel.org>
	<20260203211955.23ef4355@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_174718_479687_03816395 
X-CRM114-Status: GOOD (  20.76  )
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

On Tue, 3 Feb 2026 21:19:55 +0100 =C5=81ukasz Majewski wrote:
> > > +static void mtip_write_atable(struct switch_enet_private *fep, int
> > > index,
> > > +			      u32 write_lo, u32 write_hi)
> > > +{
> > > +	struct addr_table64b_entry __iomem *atable_base =3D
> > > +		fep->hwentry->mtip_table64b_entry;
> > > +
> > > +	writel(write_lo, &atable_base[index].lo);
> > > +	writel(write_hi, &atable_base[index].hi);
> > > +}   =20
> >=20
> > Can these functions race with concurrent access? Looking at the
> > callers, mtip_write_atable is called from two different paths:
> >=20
> > 1. Static entry updates: mtip_config_switch -> esw_mac_addr_static ->
> >    mtip_update_atable_static -> mtip_write_atable (no lock held)
> >=20
> > 2. Dynamic entry updates: timer callback -> mtip_mgnt_timer ->
> >    mtip_atable_dynamicms_learn_migration ->
> > mtip_update_atable_dynamic1 -> mtip_write_atable (learn_lock held)
> >=20
> > The learn_lock only protects the dynamic entry path. The static entry
> > path runs during link changes (mtip_switch_restart called from
> > mtip_adjust_link) without lock protection.
> >=20
> > Both paths can access the same hash block in the address table
> > (determined by GET_BLOCK_PTR(hash)). If the timer fires during a link
> > change callback, both can concurrently access the table, potentially
> > causing torn reads (reading .lo from one entry version and .hi from
> > another) or torn writes (the entry is in an inconsistent state
> > between the two writel calls).
> >=20
> > Would extending learn_lock to protect all address table access work,
> > or is a separate hw_lock needed for hardware register access?
> >  =20
>=20
> This is handled in another way:
>=20
> 1. Partial write is not possible as this IP block handles it in order
> (with some kind of 'latch' registers):
>=20
> "VFxxx Controller Reference Manual, Rev. 0, 10/2016"
> 11.5.4 MAC address lookup table
>=20
> "Each entry must be written or read with the low address accessed first
> followed by the high address"
>=20
> 2. The code for dynamic IP writing will not "touch" the entries for
> "static" MAC addresses - Figure 11-70 - bit 49 is "Record Type":
> 	1 - static entry
> 	0 - dynamic entry
>=20
> IMHO, we are "safe" here.

My reading of the AI's comment was that there is no lock in SW so two
SW threads can write:

   Thread A   Thread B
   write_lo
              write_lo
              write_hi
   write_hi

