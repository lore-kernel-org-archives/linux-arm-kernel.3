Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C2DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRhjEBrevYYfktmYdx+YKcry9xJxHMto6KG5iP6elAE=; b=0fbiqxU0UOnxpUSfBkIV8Gyfku
	gaQbIIEUUt4cgRGhfm6cOV/lUI0HOwAYZBZfE7JLPO4gbD+FGXrx7sKIIof563WI88I2FfAFZC5sB
	4U5NShakjNhCSnW89X89NQQoSQowPsu9PovTqEu+dYIfyCW95x+/cqrDahY/RM34D11yFaKb76nIi
	tQQODn+PkCXQ0sWjWhSSoS8HQW5ohGe6yXQvpf641jCx746nO4aMYOc9+QDCSSYRZMH96rqEjRj1Q
	Sg8FtQm5FfGZjHPSaGUf3mK42xcGCBoh0W5Y2qvkrxtd6ezHqqZYsAhLLCaWw4sbiOT50saVZbSOl
	8EB/QxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWH-00000002o8N-1tF5;
	Thu, 28 Aug 2025 18:38:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbax-00000001Vw1-0IRf;
	Thu, 28 Aug 2025 12:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gRhjEBrevYYfktmYdx+YKcry9xJxHMto6KG5iP6elAE=; b=uCgKNvwHN4Qm9UCbBdv+J4UNw8
	ncy3IW3c63C2jS60Brsl3Ew8ECK6sFq1KxS0SBwam+tzQu+R11/NrUFUAbi+V6e/GSgIGWCevOFtc
	KiO4xdtiWcayAN+5IGdiO2cO9/Z5bs8JDuqn9Jycf2aWrzQlbeXyRQQvIR9MxIzlr6uqQTt+j6NH2
	EmNuI39YK4f1yfzA54Puy52LikT4a7gAaUEWyjsHIQChJCSN01GUsqAQNeclaxLJj0jMIpDFMxzAZ
	W5ea7x2H+niHckX61ns3OCw7/4sN2wxVfM3Y+oZj6M2/10UD5H9hEsIL6ykk6JnZJhmYD/ikuFDxu
	Jf4DvZoA==;
Received: from [185.205.242.134] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1urbai-0007hz-0a; Thu, 28 Aug 2025 14:18:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andy Yan <andyshrk@163.com>, hjc@rock-chips.com, naoki@radxa.com,
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Date: Thu, 28 Aug 2025 14:18:55 +0200
Message-ID: <6614832.V25eIC5XRa@phil>
In-Reply-To: <20250828-tangible-wakeful-coati-ec27d1@houat>
References: <20250822063959.692098-1-andyshrk@163.com>
 <d040da3e-501f-45d8-bcbb-95fa77e94a59@suse.de>
 <20250828-tangible-wakeful-coati-ec27d1@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051911_109403_3F3547CB 
X-CRM114-Status: GOOD (  31.97  )
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

Am Donnerstag, 28. August 2025, 10:05:28 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Maxime Ripard:
> On Thu, Aug 28, 2025 at 09:50:34AM +0200, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 28.08.25 um 00:24 schrieb Dmitry Baryshkov:
> > > On Fri, Aug 22, 2025 at 02:39:44PM +0800, Andy Yan wrote:
> > > > From: Andy Yan <andy.yan@rock-chips.com>
> > > >=20
> > > >=20
> > > > There are two DW DPTX based DisplayPort Controller on rk3588 which
> > > > are compliant with the DisplayPort Specification Version 1.4 with
> > > > the following features:
> > > >=20
> > > > * DisplayPort 1.4a
> > > > * Main Link: 1/2/4 lanes
> > > > * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> > > > * AUX channel 1Mbps
> > > > * Single Stream Transport(SST)
> > > > * Multistream Transport (MST)
> > > > * Type-C support (alternate mode)
> > > > * HDCP 2.2, HDCP 1.3
> > > > * Supports up to 8/10 bits per color component
> > > > * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> > > > * Pixel clock up to 594MHz
> > > > * I2S, SPDIF audio interface
> > > >=20
> > > > The current version of this patch series only supports basic displa=
y outputs.
> > > > I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the=
 ALT/Type-C
> > > > mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen=
 and Piotr.
> > > > HDCP and audio features remain unimplemented.
> > > > For RK3588, it's only support SST, while in the upcoming RK3576, it=
 can support
> > > > MST output.
> > > >=20
> > > [skipped changelog]
> > >=20
> > > > Andy Yan (10):
> > > >    dt-bindings: display: rockchip: Add schema for RK3588 DPTX Contr=
oller
> > > >    drm/bridge: synopsys: Add DW DPTX Controller support library
> > > >    drm/rockchip: Add RK3588 DPTX output support
> > > >    MAINTAINERS: Add entry for DW DPTX Controller bridge
> > > I tried pushing patches 1-4, but got the following error:
> > >=20
> > > dim: ERROR: 5a68dcf5837a ("MAINTAINERS: Add entry for DW DPTX Control=
ler bridge"): Mandatory Maintainer Acked-by missing., aborting
> > >=20
> > > I'm not sure how to handle MAINTAINERS changes (or whether it's fine =
for
> > > me or not), so I will probably push patches 1-3 in a few days, if nob=
ody
> > > beats me (or unless somebody points out a correct process for
> > > MAINTAINERS changes).
> >=20
> > That warning has been added recently to make sure that patches do not g=
et in
> > without sufficient review. It's overly pedantic, though.
>=20
> It's not "overly pedantic", it follows the contribution rules. I'd argue
> that, if anything, we've been overly tolerant with that kind of
> practices.
>=20
> We do have a bug with handling MAINTAINERS changes at the moment. But
> everything else shouldn't be ignored: either patch MAINTAINERS to
> reflect the actual contribution path, or get the maintainers Ack.

$ scripts/get_maintainer.pl MAINTAINERS
linux-kernel@vger.kernel.org (open list)

MAINTAINERS does not have a maintainer though, to Ack a patch changing it



