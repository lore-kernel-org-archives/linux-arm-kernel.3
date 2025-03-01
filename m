Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6ACC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWrJQQO1z1ieS3LPSgSxBoRM/rUdNEDOVIFkMVgWCtA=; b=XZanPOrtMw5jeYbnGitKqHLrzM
	056foJnhrWOJGmJZbFHSNb2OKppAW+u1WiT4353/Dyqv5BiQ1oump+TVaonQvbkMPYdlk+D8//oom
	1JLWuBF8dLL5Je3t8HvDCSWB0dXacaYf4uT20xsX2/tGn8Exg2UNF9KNhxyc2K8aABnIkcKXFaB/h
	T+LCGeVm7v/OGtgpu5v+9ko0r0zXmjEpCbRszpf9G5W5nZCH87G1qf3B6E5J9ekFznzcWgLa25uQR
	5v42p2McE0lPBME/BvWMHwq5x1gdSdP2daLCugpii1bF53R/Lmx/nJUJ2EpV60+57DVh0z8fNrnQe
	xPmzx5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKn6-0000000Dovj-40vn;
	Sat, 01 Mar 2025 11:13:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKk2-0000000Do8Y-4C4v;
	Sat, 01 Mar 2025 11:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fWrJQQO1z1ieS3LPSgSxBoRM/rUdNEDOVIFkMVgWCtA=; b=wq4SDf5NC6U4ynKABYC9ryyTbN
	xJ1TZTOPFknUkOJCCp+5enVb0+D31fKn5kOzz8/Elu6o9vDPbfvO3+3cLwwzk3jOQ7ZSx7YHWuly2
	iHiimmw+uBVLHBBrmHNDmbbuh78IVrJZqDdish4Uf0b4/Ri/vZcZc9AAWb2ceOKwK8jELhCUhFESp
	oNYA0HUWaTeIlt0PEycO/raBRgEapwLpXwHHRKDty8mIqqrvto1ts68XD/UGebFfYUXxS/Gv2sehx
	z5m0uCobN+pU4a49FUINcfy+8553v7aNAGEg/hB4TPu/6E7iRWPVpyexbd0WLt6Ho+wkwPY3/MXG1
	Xj4iojuA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1toKjy-0007sS-JM; Sat, 01 Mar 2025 12:10:42 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Patrick Wildt <patrick@blueri.se>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: add MNT Reform 2
Date: Sat, 01 Mar 2025 12:10:41 +0100
Message-ID: <3309912.5fSG56mABF@diego>
In-Reply-To: <Z8LiJgNkurF3xt3k@windev.fritz.box>
References: <Z7OaTzIpeJ-IACrl@windev.fritz.box> <2700899.tdWV9SEqCh@phil>
 <Z8LiJgNkurF3xt3k@windev.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_031047_059223_5076978C 
X-CRM114-Status: GOOD (  22.67  )
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

Am Samstag, 1. M=C3=A4rz 2025, 11:32:06 MEZ schrieb Patrick Wildt:
> On Sun, Feb 23, 2025 at 12:38:40AM +0100, Heiko Stuebner wrote:
> > Hi Patrick,
> >=20
> > Am Montag, 17. Februar 2025, 21:22:28 MEZ schrieb Patrick Wildt:
> > > MNT Reform 2 is an open source laptop with replaceable CPU modules,
> > > including a version with the RK3588-based MNT RCORE[1], which is based
> > > on Firefly's iCore-3588Q SoM:
> > >=20
> > > - Rockchip RK3588
> > > - Quad A76 and Quad A55 CPU
> > > - 6 TOPS NPU
> > > - up to 32GB LPDDR4x RAM
> > > - SD Card slot
> > > - Gigabit ethernet port
> > > - HDMI port
> > > - 2x mPCIe ports for WiFi or NVMe
> > > - 3x USB 3.0 Type-A HOST port
> > >=20
> > > [1] https://shop.mntre.com/products/mnt-reform
> > >=20
> > > Signed-off-by: Lukas F. Hartmann <lukas@mntre.com>
> > > Signed-off-by: Patrick Wildt <patrick@blueri.se>
> >=20
> > bureaucracy question, what is Lukas' relationship with the patch?
> > Two options:
> > (1) Lukas initially developed the patch, then the "From:" should be
> >     set accordingly
> > (2) Both of you developed it together, then we should have a
> >     Co-Developed-by: Lukas F. Hartmann <lukas@mntre.com>
> >     up there
> >=20
>=20
> Thanks, will send a v5 with Co-developed-by tag added! :)
>=20
> >=20
> > Some more style things below...
> >=20
>=20
> Are there further execptions to the alphabetical rule? For regulators
> I often see min before max, which I think makes sense to understand
> the range but isn't technically alphabetical. The same for pinctrl-0
> and pinctrl-names.

The "preferred" rules are in [0], and in recent times I've come to
appreciate not needing to explain exceptions ;-) .

But I do see them as guidelines, especially in a leaf-dt (for a device)
concessions are possible.

So yes, I can definitly see min before max as beneficial and if you want
to sort that way, that is fine by me


Heiko

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/dts-coding-style.rst#n112



