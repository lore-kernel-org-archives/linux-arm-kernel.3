Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14422C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2s1EfWhxZp+wUTpU6Av5sVxwB2ULwd+lJ/meBWs9Yxw=; b=LRIopTTmkgLHY4w9GDvEV56h3j
	0NiQ3r5OPR/ETD/XEA/oBkNLtdW/uncJ0k9eivwHxtrAUyw0bRBTSEsPgHwtKRa8//mbVtlIzNFje
	0L0u7OVe6TnMFo7tPrXf/3I3dr+92K6jdPeANLYQ72X8G7WZRaKBBOUd2vPz7avsYFPdSfUM3Tj9v
	SqBPZW4ByrKvUMhcx9p69RqB5Z+hqgl8v7eLqQKg8qaX8qIOFsIGkme/8+i+gWSV3qCWkoKcpilh8
	gMvLghn0+5g09Ye4jQxg4CvTUPcsN3sSuAtYHvMaxdgMld1irL6tu8DjWG+h93VfNbPtveEPF5pPW
	stHDRcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYXD-0000000FHVy-3qeT;
	Fri, 20 Jun 2025 09:59:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXM9-0000000F6QL-49J5;
	Fri, 20 Jun 2025 08:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2s1EfWhxZp+wUTpU6Av5sVxwB2ULwd+lJ/meBWs9Yxw=; b=kAG2XmNtW0d1LmL2rKWT6Lc/QX
	SOz6rnT0Lf4mLMiWEdu+MrXH2fAX12ZY4taDEwh3skekpPZaMOtfzgTWyUfwLAp1H3Y+U3ZQzHMj6
	r3dU5uIdxxv1pk2lk6bG5ADNU4W1XP0eA2O4VDOqTIBXnSxEoe4b1hsbdOAd+2VN+GbYQJk2SbFRT
	2gJFf/sXWDj53EnwotPMjuB20DX+VaDNAUvGbGO/BZCom166KZVRBQgiqAw/DX9tIfHH43d2QBsUG
	5G1P8jwrqMj3gP/BDb79MEdnrK2Dpd+tqftocvtzcPDkaeEmG2zDEU+NoO3bBS/SyoyYypq2tiy2D
	EjHMgqZA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSXM7-0007ky-L9; Fri, 20 Jun 2025 10:44:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: rockchip: enable further peripherals on ArmSoM
 Sige5
Date: Fri, 20 Jun 2025 10:44:14 +0200
Message-ID: <5004008.8F6SAcFxjW@phil>
In-Reply-To: <CABjd4Yzz9mh0G5BhpPOGAoadD-A5eX4kdsF8rGrWk82hAE-MYQ@mail.gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
 <175036770856.1520003.17823147228060153634.b4-ty@sntech.de>
 <CABjd4Yzz9mh0G5BhpPOGAoadD-A5eX4kdsF8rGrWk82hAE-MYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_014418_049297_955AAF0D 
X-CRM114-Status: GOOD (  18.34  )
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

Am Freitag, 20. Juni 2025, 10:40:49 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Alexey Charkov:
> On Fri, Jun 20, 2025 at 1:17=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> =
wrote:
> >
> >
> > On Sat, 14 Jun 2025 22:14:32 +0400, Alexey Charkov wrote:
> > > Link up the CPU regulators for DVFS, enable WiFi and Bluetooth.
> > >
> > > Different board versions use different incompatible WiFi/Bluetooth mo=
dules
> > > so split the version-specific bits out into an overlay. Basic WiFi
> > > functionality works even without an overlay, but OOB interrupts and
> > > all Bluetooth stuff requires one.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
> >       commit: c76bcc7d1f24e90a2d7b98d1e523d7524269fc56
> > [2/4] arm64: dts: rockchip: add SDIO controller on RK3576
> >       commit: e490f854b46369b096f3d09c0c6a00f340425136
> > [3/4] arm64: dts: rockchip: add version-independent WiFi/BT nodes on Si=
ge5
> >       commit: 358ccc1d8b242b8c659e5e177caef174624e8cb6
> > [4/4] arm64: dts: rockchip: add overlay for the WiFi/BT module on Sige5=
 v1.2
> >       commit: a8cdcbe6a9f64f56ee24c9e8325fb89cf41a5d63
> >
> > Patch 1 as fix for v6.16
> >
> > I've also fixed the wifi@1 node in the overlay - which was using
> > spaces instead of tabs.
>=20
> Thanks Heiko! It's annoying that YAML doesn't like tabs, so copying
> from binding examples is not a universally good idea :)
>=20
> By the way, is there any tool that helps catch those?

checkpatch.pl would be the tool to do that, but I'm not sure it handles
this at this time.

I also only saw things when I looked at the patch in "mcedit", because
it nicely distinguishes between tabs and spaces :-) .





