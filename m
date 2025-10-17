Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D85CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nB/bTyp49Nap72JujOJtUfZ+5tI4J6RsgjyYLx9LXUQ=; b=oYABueWWsZqgRCX1VZdBVEvUo9
	17FGyztPDACVRiz6tPZaASht/ToY8HwHgKMcawzk3zlqZqvgbtdveXaMvCRX4BPNRidL9mjfEFJ8I
	BKRapU6A2Q90H3+aoHo5MZHKTpQ1j/OBzz1Bb/NYW/NPg9713bNEbyWQiuKDdl0OKt5iJVzcd2bWf
	Qp8+rP9uabR9kzX/0UjUh/3oafLT3kYirfJLmgtgR9EoSQ90EtsqE6ElebxI2i9j1aLntLZ3KoHUG
	wht6vHD/YJvu8697pGXvxFJsBkmQndDjMaVgsPEbkBhVxo4G6oewxEmYd/Lay9Vu4HRcF0arLzjER
	EsCqGnAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ngP-00000008VjT-2Sc7;
	Fri, 17 Oct 2025 16:52:01 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nfs-00000008VBk-3oTX;
	Fri, 17 Oct 2025 16:51:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 2307340C82;
	Fri, 17 Oct 2025 18:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1760719886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nB/bTyp49Nap72JujOJtUfZ+5tI4J6RsgjyYLx9LXUQ=;
	b=Wzl0nzCcLl/z4P0GOjFDpmbHR+6G+aVH0OHnBGhUbSkbjshfXgHfQ2IJjlIInaYLToXIMh
	m+59hBOgcFHl/K2XPn4JI4zAitywpCUlBYrIBNBvyKXPervqpM2iT9uVWuybNxrEFBuLfn
	c4KmV7iNkFd084C/gubL4FOT22AmJzrX+Uh5ttoY7d4ArowN+H18sj8m4PSMSso5+4r9fL
	RxnUAfoL9Q8tggxb4KghWSl8ZB+UEvC646hlSbKyvDa9hOW36CYClHoPnx5xBDL059DOEQ
	2G0st35FIsM/gGeNEn4o7dUhQSw5WpZ8y5af90/eSyB7BFAAsr/lIFH7rciKIA==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <601cd8dc-afb5-4a67-af63-567814d755a4@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
 <d9d14ce2-2e65-422e-95fb-eb30b128ad90@gmail.com>
 <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org> <601cd8dc-afb5-4a67-af63-567814d755a4@gmail.com>
Date: Fri, 17 Oct 2025 18:51:24 +0200
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Grzegorz Sterniczuk" <grzegorz@sternicz.uk>, "Jonas Karlman" <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Tianling Shen" <cnsztl@gmail.com>
MIME-Version: 1.0
Message-ID: <22a424de-4963-0505-51ed-99bca47da619@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= fix eMMC corruption on NanoPC-T6 with A3A444 chips
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_095129_353463_E84252A4 
X-CRM114-Status: GOOD (  27.76  )
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

On Friday, October 17, 2025 18:34 CEST, Tianling Shen <cnsztl@gmail.com=
> wrote:
> On 2025/10/17 23:15, Dragan Simic wrote:
> > On Friday, October 17, 2025 14:08 CEST, Tianling Shen <cnsztl@gmail=
.com> wrote:
> >> On 2025/10/17 18:25, Dragan Simic wrote:
> >>> On Friday, October 17, 2025 09:39 CEST, Tianling Shen <cnsztl@gma=
il.com> wrote:
> >>>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> >>>>
> >>>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O erro=
rs and
> >>>> corruption when using HS400 mode. Downgrade to HS200 mode to ens=
ure
> >>>> stable operation.
> >>>
> >>> Could you, please, provide more details about the troublesome eMM=
C
> >>> chip that gets identified as A3A444, i.e. what's the actual brand
> >>> and model?  Maybe you could send a picture of it?  It might also
> >>> help if you'd send the contents of "/sys/class/block/mmcblkX/devi=
ce
> >>> /manfid" from your board (where "X" should equal two).
> >>
> >> Unfortunately I don't have this board nor this eMMC chip.
> >> I got the chip model from my friend, it's FORESEE FEMDNN256G-A3A44=
,
> >> manfid is 0x0000d6.
> >=20
> > Thanks for responding and providing the details so quickly!
> >=20
> >>> I'm asking for that because I'd like to research it a bit further=
,
> >>> if possible, because some other eMMC chips that are also found on
> >>> the NanoPc-T6 seem to work fine in HS400 mode. [1]  It may be tha=
t
> >>> the A3A444 chip has some issues with the HS400 mode on its own,
> >>> i.e. the observed issues may not be caused by the board.
> >>
> >> Yes, it should be caused by this eMMC chip.
> >=20
> > I'd suggest that we move forward by "quirking off" the HS400 mode
> > for the FEMDNN256G-A3A44 eMMC chip in the MMC drivers, instead of
> > downgrading the speed of the sdhci interface on the NanoPC-T6.
> >=20
> > That way, the other similar Foresee eMMC chip that's also found
> > on NanoPC-T6 boards, FEMDNN256G-A3A564, will continue to work in
> > the faster HS400 mode, while the troublesome A3A44 variant will
> > be downgraded to the HS200 globally for everyone's benefit.  It's
> > quite unlikely that the A3A44 variant fails to work reliable in
> > HS400 mode on the NanoPC-T6 only, so quirking it off in the MMC
> > drivers should be a sane and safe choice.
> >=20
> > If you agree with dropping this patch, I'll be more than happy
> > to implement this HS200 quirk in the MMC drivers.
>=20
> Yes for sure, thank you ;)
> The full cid is d6010341334134343411f63ea7208700.

Great, thanks!  I'll start working on the proposed MMC quirk patch
tomorrow or so, and I'll feel free to ask for some more observable
A3A44 chip variant data, if needed.

> > As a note, FEMDNN256G-A3A44 is found in the Rockchip Qualified
> > eMMC Support List v1.84, [2] but the evidence says the opposite,
> > so we should react appropriately by adding this quirk.
> >=20
> > [1] https://github.com/openwrt/openwrt/issues/18844
> > [2] https://dl.radxa.com/rock5/hw/RKeMMCSupportList%20Ver1.84=5F202=
40815.pdf
> >=20
> >>>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> >>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> >>>> ---
> >>>>    arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
> >>>>    1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi =
b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >>>> index fafeabe9adf9..5f63f38f7326 100644
> >>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >>>> @@ -717,8 +717,7 @@ &sdhci {
> >>>>    	no-sd;
> >>>>    	non-removable;
> >>>>    	max-frequency =3D <200000000>;
> >>>> -	mmc-hs400-1=5F8v;
> >>>> -	mmc-hs400-enhanced-strobe;
> >>>> +	mmc-hs200-1=5F8v;
> >>>>    	status =3D "okay";
> >>>>    };


