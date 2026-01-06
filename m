Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D81ECEFCF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYO5p75UGgbGYm00blLvxwY4qfzPbnXHml3ls2BGkb0=; b=yQg97nuZpF7wr6rsqDvD9PLhbk
	PhBHx8d1WqjabEbXL485sVCUGVb6XvSAK1I5hWh35S8xi8oDzJihbN3PipD+/HiErf3DhL2VN8p7s
	4UmTbqotLTRxK4VNBIoKMf5OTmN24Jt2Z2utJ0cOdye73ZxtnzT63OMVf1mUo2Xe04J+uA9A6E9Pl
	33Evq+EvNaiIVDh6XlkaHG66Lb9MxNkAoIJVdkI6WL8cQwKMaRd4iiRXkVHIqQmhV4Ag5bqRmjAjw
	9s58cHhg6qYq6OhsvWBB1jteD5YSaNq/xoEvjj0f7etRMFDFGviIG17J06YWP8tYFvNHWFva5D0Ry
	dnJG1Mtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCAv-0000000Diox-3Nx9;
	Tue, 06 Jan 2026 18:53:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCAs-0000000DioV-3QoI;
	Tue, 06 Jan 2026 18:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oYO5p75UGgbGYm00blLvxwY4qfzPbnXHml3ls2BGkb0=; b=Eps9U6h0eO3F9Yk1f/nHDeanUD
	j+4USqm9bCRG/fAm+n39Sa3TQtaF/7vCKAtxQ9YXzkIP5tZeuxJTzq/y0eY2gRPlWP6mWVeRSu1js
	l8d37K5Q2zKK98KdZ087U1NdgvnO2Z7YpxLCgqUg5aR9ruRPGcGEkwED+sFO9baxR4OI1uNCN/+tJ
	GwaXrlxbw9ytJilp79JSRhN0Bkw4g+yHIilWUT0VQBGXZtEf0vB+ooTgzoYsXrMt84R0igoAYpLgP
	epz5yrl5uP2PMtS92d1ih+JDAhHjUhDyEEBSGIw2kMyXdPvJL6izYs9iTheV90yW+FXrfQo2GYHfM
	jGUF7DCQ==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdCAq-001Hmr-6q; Tue, 06 Jan 2026 19:52:56 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: enable NPU on rk3588-tiger
Date: Tue, 06 Jan 2026 19:52:56 +0100
Message-ID: <4495583.CbtlEUcBR6@phil>
In-Reply-To: <de401340-be1c-4354-b6c8-c86d6f724c73@cherry.de>
References: <20250812085213.1071106-1-heiko@sntech.de>
 <de401340-be1c-4354-b6c8-c86d6f724c73@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_105258_876920_EE922013 
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

Am Freitag, 28. November 2025, 11:32:17 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Quentin Schulz:
> Hi Heiko,
>=20
> On 8/12/25 10:52 AM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Enable the NPU cores and their mmus and wire up the supply-regulator.
> > The regulator itself was already defined, but it does not need to be
> > always on - the npu can control it.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> I still have the same remark about regulator-boot-on but this isn't a=20
> blocker per-se.
>=20
> The Oops I alluded to in my answer to the Jaguar patch is triggered by=20
> making DRM_ACCEL_ROCKET driver built-in instead of as a module. I'm not=20
> sure how much I will debug this on my side, I'll prolly just report this=
=20
> on the ML in a few hours.

Just for people stumbling over this, the cause is the pm-domains
being on on boot and the iommu after probing disabling the domain.

See discussion in
https://lore.kernel.org/linux-rockchip/20251216055247.13150-1-rmxpzlb@gmail=
=2Ecom/



