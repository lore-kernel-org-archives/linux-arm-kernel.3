Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39161CEFCF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9FdgrVyF+ltzH5J8V9yVqvYq81tGjbEns+yQFUcek8=; b=M+PMvT5xENd9swhPfGSjhYJmdB
	a+37oFLKNNtow9p7qm5pUsB+TUgg+WcOeYI0oSJzN0/mw81CRaTts1sUuJiqSrBvA6f/5tb7UqHNr
	iX6xXCv3zhA529pCTeRlECaF/Z9UonKyXjckqnzrSDWDdO3cr/TB2MY7EiprTzHe1MlF7sTxfnwgg
	Tesoozz5wPJsC1kCBQFFzVftBGa+68XtFw1sifw9VEHUOLgvIlbeov6sjxwLxppt6d0SfiRLMZCwk
	dR9YcGwx561uudPNtAT3DmG+TZFfwshA8vCNJIlSabCfKeU2/IiBsCLLira64JdWHOT6b49fistzR
	ziDJjClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC5i-0000000DiVx-13rq;
	Tue, 06 Jan 2026 18:47:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC5f-0000000DiVO-101y;
	Tue, 06 Jan 2026 18:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=P9FdgrVyF+ltzH5J8V9yVqvYq81tGjbEns+yQFUcek8=; b=ExHSgkXp+eGbtuOCRautigGMhZ
	903f7A5W7kymSzuJcFPWVSrqaAmiBfO8K1feB2nbOxcwKNo2bHmy+T1+JSUTvEdo9UmVguWgaUxbS
	22+43FS7v0h8io5HN6RA4FeCK/JQs+86itDMaO52JDSl1NlDPqvin/L0o3xqq/T6pj4/siyRE8/rZ
	QQEG28Kvn/dmuQDqt3umW0xYLTbwgSeaRMIa2zaDFrH/W1mYFba4tJB3et2dT3Ab+NDO2su2dKUUl
	fryfb/5DW8NOZ6AJD/xpNENOZXoehWv5g9g2vi3OLjb8VRpZoiIPpVQieAXdFMWdCSMl2K+NuWNi+
	QOlLLg4A==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdC5b-001HlT-V4; Tue, 06 Jan 2026 19:47:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, John Clark <inindev@gmail.com>,
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: rockchip: Sound fixes and additions on RK3576
 boards
Date: Tue, 06 Jan 2026 19:47:31 +0100
Message-ID: <4068253.BddDVKsqQX@phil>
In-Reply-To: <176772487188.3029798.5459621815338520362.b4-ty@sntech.de>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
 <176772487188.3029798.5459621815338520362.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104735_275485_0326E68B 
X-CRM114-Status: GOOD (  15.85  )
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

Am Dienstag, 6. Januar 2026, 19:41:55 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Heiko Stuebner:
>=20
> On Mon, 29 Dec 2025 14:11:57 +0400, Alexey Charkov wrote:
> > Here are some device tree updates to improve sound output on RK3576
> > boards.
> >=20
> > The first two patches fix analog audio output on FriendlyElec NanoPi M5,
> > as it doesn't work with the current device tree.
> >=20
> > The third one is purely cosmetic, to present a more user-friendly sound
> > card name to the userspace on NanoPi M5.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/7] arm64: dts: rockchip: Fix headphones widget name on NanoPi M5
>       commit: 5ab3dd9d0a63af66377f58633fec9dad650e6827
> [2/7] arm64: dts: rockchip: Configure MCLK for analog sound on NanoPi M5
>       commit: 3e4a81881c0929b21a0577bc6e69514c09da5c3f
> [3/7] arm64: dts: rockchip: Use a readable audio card name on NanoPi M5
>       commit: 309598fca339abd4e8eef0efe0d630714ca79ac9
> [4/7] arm64: dts: rockchip: Enable HDMI sound on FriendlyElec NanoPi M5
>       commit: bde555926b61740c6256a38a9cf5a4833be345cc
> [5/7] arm64: dts: rockchip: Enable HDMI sound on Luckfox Core3576
>       commit: 87af7643234a2b4cb49a97dfe7fb455633b3185d
> [6/7] arm64: dts: rockchip: Enable HDMI sound on RK3576 EVB1
>       commit: f5c9549964adbac931e163693bd17db872976679
> [7/7] arm64: dts: rockchip: Enable analog sound on RK3576 EVB1
>       commit: d8872b9dd9208c493f1f3811d42997fb968de064

=46orgot to add, thankfully the fixes + enablement don't depend on each
other, so I've applied patches 1+2 to my fixes branch for 6.19
and the rest for 6.20.


Heiko



