Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06CCC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OmRnB5M5S6dx+wb2qMyKou5/KtA9SYAkAHphHGaljI=; b=pHxgA9vD7Qsrc4YSKZSTs6zTGS
	QCNPlXNbWS2E+0UypZFBjUDw/M7DpngFBYzy1Jze4kqDyusTSGjpSAacabBKIVxUdDAPcVzPqop6o
	KJ39S5eDW2mcuZLKr9BgxAirjnsaqtFKFArNazde3dpBVvLfZaEIiRC3jQm3Sdon1hQakoHY3iy2n
	k0vigt6ioH6k0xyB8SPO1to1NtR28LdJClsvy8gexeS/hjK1aogz+f6nHALDMc8wI/JJA4hAeSCjT
	AmwYieRXbnd/rGJoI/DcEsJfM9+EBjMOEK1f9bvzbkCNYFfustI3+ZFwzRihtqE0lt/MLTcM0OLam
	ae708Kew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYWU-000000069NN-0WLq;
	Tue, 04 Mar 2025 20:05:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYTY-000000068yf-2V5h;
	Tue, 04 Mar 2025 20:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6OmRnB5M5S6dx+wb2qMyKou5/KtA9SYAkAHphHGaljI=; b=Gf6oHUZr94DYlA6dKjxhYJh6F2
	BHB5lOa/AEu2198ueeJ4904kMSo/8BMfjPTC+/4k/pGNvRBOLBeXXIdUN9Lo6I0L/phxRJpIn2wfH
	ab/54hjnUK1zbR+pdkVgiWvsCQZng0+o+Lh4/8oakjw9aJZ0lxiZBb0eOtJ/dUgPj/ZUaRObZT1ea
	rKdFCXJZPmPE7P69FKuWbCpey3M8wEAONHjgQGHqqI/XR8F13Mei9SShN3r4c+HOlYzmFFWaOUZeF
	QrvhhtC0Ud6riV3SDZhvvPQA+/iqGc3tOAMeB1AheIdCX9YAbBJYf0e48nUDSkCfU+Ct1TBuwI25q
	T3pf1juw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYTV-00000000Ck1-0jtk;
	Tue, 04 Mar 2025 20:02:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F022C25C7A;
	Tue,  4 Mar 2025 21:02:38 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsbyoN1SgCEm; Tue,  4 Mar 2025 21:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741118554; bh=UePoE7L+f7kPyHfkYoHOYaJpHOxR5rYnvPUWwiwyiDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ax6vpksmBD+CYVeLZO+qbuQqOz2F8d/OHrJiYEXf1cqJe9I39YUqdyU6VbDhsPhg4
	 x+9AtlWcGvxnP5kgm596OqXJ1UMLJ1pyh22g4Qw/WavCbiTwP//6MpzLSyokW3w5ie
	 BR8mIqqeqdywjNKaS//tqsQ5hf7Qkjx2uVkn4/nheuYbd1udjK2yupqFjIRmr2h+h6
	 8pUWyA23Kj0cX4mdTlPQmLeV9qIcAE2kD6Gd8YVKfGHZS6ULe778dkoS6HSLgB8/2P
	 k+rhVLTu6sFAfL1CJ8ZAEYVygWCcBdoYNgFGi/1knwkFOJPIfHZht/zvet292xVYB2
	 ichjAKH9MPMnA==
Date: Tue, 4 Mar 2025 20:02:14 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com, devicetree@vger.kernel.org,
	frank.wang@rock-chips.com, heiko@sntech.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
Message-ID: <Z8dcRjPcbKqEyKdT@pie.lan>
References: <20250301104835.36439-1-ziyao@disroot.org>
 <20250304121036.1453284-1-amadeus@jmu.edu.cn>
 <Z8dZWYpABghRHHge@pie.lan>
 <5c429552-bdbb-43d9-8e07-bacda57c0fcf@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c429552-bdbb-43d9-8e07-bacda57c0fcf@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_200245_827019_B0DF7DBE 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, Mar 04, 2025 at 08:55:36PM +0100, Jonas Karlman wrote:
> Hi Yao Zi,
> 
> On 2025-03-04 20:49, Yao Zi wrote:
> > On Tue, Mar 04, 2025 at 08:10:36PM +0800, Chukun Pan wrote:
> >> Hi,
> >>
> >>> +	aliases {
> >>> +		mmc0 = &sdmmc;
> >>
> >> s/mmc0/mmc1
> > 
> > Will take it and add the missing pinctrl, as Jonas already pointed out.
> > 
> >>> +&sdmmc {
> >>> +	bus-width = <4>;
> >>> +	cap-mmc-highspeed;
> >>> +	cap-sd-highspeed;
> >>
> >> I think for sdcard, only cap-sd-highspeed
> >> is needed, not cap-mmc-highspeed?
> > 
> > This makes sense, will remove it in the next version.
> 
> Please do not remove the cap-mmc-highspeed prop, I tested the controller
> with a microSD to eMMC adapter and MMC HS speed is supported:
> 
>   mmc1: card 59b4 removed
>   mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
>   mmc_host mmc1: Bus speed (slot 0) = 49800000Hz (slot req 52000000Hz, actual 49800000HZ div = 0)
>   mmc1: new high speed MMC card at address 0001
>   mmcblk1: mmc1:0001 DG4008 7.28 GiB
>    mmcblk1: p1 p2
>   mmcblk1boot0: mmc1:0001 DG4008 4.00 MiB
>   mmcblk1boot1: mmc1:0001 DG4008 4.00 MiB
>   mmcblk1rpmb: mmc1:0001 DG4008 4.00 MiB, chardev (499:0)
> 
>   ~ # cat /sys/kernel/debug/mmc1/ios
>   clock:          52000000 Hz
>   vdd:            21 (3.3 ~ 3.4 V)
>   bus mode:       2 (push-pull)
>   chip select:    0 (don't care)
>   power mode:     2 (on)
>   bus width:      2 (4 bits)
>   timing spec:    1 (mmc high-speed)
>   signal voltage: 0 (3.30 V)
>   driver type:    0 (driver type B)

Oops, indeed, I didn't expect the adapted usecase and thought only
sdcards could be connected through the interface.

> Regards,
> Jonas

Thanks for the correction,
Yao Zi

