Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361E3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8/Ht4vLH47yQgnyA3aHoKEjFyY3IKH+TxDUhnG4Pis=; b=agNUZQDa/ZUf4X8qDji+z9ZbHV
	44IQhdodsVijzzFo/m/6RRyPenUZEIEKM2hjzQwpE2hqn7u0hQJaRBedqRf4OVw1BnQwsqVLAQkI8
	4R2ORe0K2XyYAJ+QE+PgjI3zI/VwxHpCENBOjwy32WH/JzcnnwChCpVRuWuYFnRjNq3W6jYS4x4td
	vS0IO+bRy0L5WYfbNBEc5OjkL7rk9oWBByFY/ks6SrCfoVUUssm8SRP9N47AkE1hDXo3bpuVBd03c
	uwEDA63l/0qa305b0rtBuX/IPSMpkS6ZUL8uT4tOLIeLxLRozeGY9DILQ/2TtfhdfFfATXVSwX6XN
	Pkcie48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERBe-00000009Ea6-41fM;
	Mon, 12 May 2025 11:19:11 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQsN-00000009BQx-2sv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 10:59:18 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747047550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/Ht4vLH47yQgnyA3aHoKEjFyY3IKH+TxDUhnG4Pis=;
	b=ShP2Q1lh0QUy9ERDnw/XyUESNdFmosr43cn7zNMQgNobgnz3j/jedkv9j5CKVBYNm+8vDn
	N0gyToplqVDXrQrVDcUo6cyt5E4+/YT8KJ5L9dFRdOWn2PZXu6NEvup8tYnORw9ZAUZpov
	VBU9NUrFQ69gEAFU4nxCCclW/gFw4YVNjlPQD19mamiA/0ygoD4YmyVflSybIMuGtxGRbb
	Gc17pDEGSpSW9spEv7cHsnlo+Uy1UYeDbt4WgEBK4KiHyKOTaeX1RbQkohfqK/VXiiRBOx
	vhvHoPWtq25Yuek/wANmqPZYLaLtTNlXPQF/SbXXdC9/fLBBJNlNr1jTIdOMhA==
Content-Type: multipart/signed;
 boundary=f5128d620a41dad2d3ab473cb7c3567b2921ffecd91198bee2646459e69b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 12 May 2025 12:58:51 +0200
Message-Id: <D9U4NW0TLBIE.2WTOIETA78EVQ@cknow.org>
Subject: Re: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use
 GIC ITS
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <linux-pci@vger.kernel.org>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <dsimic@manjaro.org>, <heiko@sntech.de>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
References: <D9RSA5K547DD.1LYPIZZM4XALS@cknow.org>
 <20250512070009.336989-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250512070009.336989-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_035916_125670_D83E9F34 
X-CRM114-Status: GOOD (  18.94  )
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

--f5128d620a41dad2d3ab473cb7c3567b2921ffecd91198bee2646459e69b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

Added linux-pci ML to "To".

On Mon May 12, 2025 at 9:00 AM CEST, Chukun Pan wrote:
>> > With this patch I get the following kernel warnings:
>> >
>> > pci 0001:10:00.0: Primary bus is hard wired to 0
>> > pci 0002:20:00.0: Primary bus is hard wired to 0
>> >
>> > If I 'unapply' this patch, I don't see those warnings.
>
>> I was pretty sure I had seen those messages before, but couldn't find
>> them before. But now I have: on my rk3588-rock-5b.
>
> Thanks for the reminder, I didn't notice this before.
> The BSP kernel also has this warning.
>
> Before this patch:
> [    2.997725] pci_bus 0001:01: busn_res: can not insert [bus 01-ff] unde=
r [bus 00-0f] (conflicts with (null) [bus 00-0f])
> [    3.009990] pci 0001:00:00.0: BAR 6: assigned [mem 0xf2200000-0xf220ff=
ff pref]
> [    3.018100] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
> ...
> [    3.401416] pci_bus 0002:01: busn_res: can not insert [bus 01-ff] unde=
r [bus 00-0f] (conflicts with (null) [bus 00-0f])
> ...
> [    3.545459] pci 0002:00:00.0: PCI bridge to [bus 01-ff]
>
> After this patch:
> [    3.037779] pci 0001:10:00.0: Primary bus is hard wired to 0
> [    3.044120] pci 0001:10:00.0: bridge configuration invalid ([bus 01-ff=
]), reconfiguring
> [    3.053362] pci_bus 0001:11: busn_res: [bus 11-1f] end is updated to 1=
1
> [    3.068920] pci 0001:10:00.0: PCI bridge to [bus 11]
> ...
> [    3.451429] pci 0002:20:00.0: Primary bus is hard wired to 0
> [    3.457793] pci 0002:20:00.0: bridge configuration invalid ([bus 01-ff=
]), reconfiguring
> ...
> [    3.535794] pci_bus 0002:21: busn_res: [bus 21-2f] end is updated to 2=
1
> ...
> [    3.612893] pci 0002:20:00.0: PCI bridge to [bus 21]
>
> Looks like a harmless warning.

I see various messages which look odd or suboptimal to me:
- (conflicts with (null) [bus 00-0f])
- bridge configuration invalid ([bus 01-ff]), reconfiguring

But those are informational messages, so I guess that is considered
normal. Looking a bit further and it does look that the severities in
``drivers/pci/probe.c`` are chosen deliberately. So even though my NVMe
drives seem to work, I'm not ready yet to ignore a WARNING.

In my view, a warning is something that should be fixed or if it's
indeed harmless, then its severity should be downgraded.

So I looked where that warning came from and found commit
71f6bd4a2313 ("PCI: workaround hard-wired bus number V2")

And its commit message does not make it clear to *me* if it's valid:

    Fixes PCI device detection on IBM xSeries IBM 3850 M2 / x3950 M2
    when using ACPI resources (_CRS).
    This is default, a manual workaround (without this patch)
    would be pci=3Dnocrs boot param.

    V2: Add dev_warn if the workaround is hit. This should reveal
    how common such setups are (via google) and point to possible
    problems if things are still not working as expected.

This could be interpreted as "let's make it a warning so people will put
it in a search engine (and not just ignore it) and then we can find out
via that, if it's a common issue".

It would be helpful if the people (way) more familiar with the PCI
subsystem then me to tell me/us whether the severity is appropriate (and
thus should be fixed?) or if this should be an info or dbg level message
instead.

Cheers,
  Diederik

--f5128d620a41dad2d3ab473cb7c3567b2921ffecd91198bee2646459e69b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCHUdwAKCRDXblvOeH7b
brPcAQDFLvLOr4MVv6bPcn//tl4F4G7GpE+qkYliDw8IQiSYpAEAmxHUXv878qId
zZdpqj/69uyB2oVZDR5clQaoGkkD7wU=
=2NDu
-----END PGP SIGNATURE-----

--f5128d620a41dad2d3ab473cb7c3567b2921ffecd91198bee2646459e69b--

