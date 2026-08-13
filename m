Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8E9C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkf6vS4aGzqlZUODBqAiya0+zZLWqU0oIUrwtnAoY8o=; b=xAAiun7NyOjRbr3WPXExNtFmaj
	1R8TTUnoiKhZlYHL+idwBjp2vXCXeYa9VstwKcSHI+oRc2oXhRFLDPizHdrKlX1nwCMD+ZUKiGq0H
	ZZAKc1dZ0tRfP9S1cy7gwAwDTsyEUcnaMgwoVcoYi1+GKjG/xYaHao3ecYiRAc1G1cJe4zhmIIpwT
	Utpb0ZlANebeOnRftOwhSZuRFARXTcdiRsGda745yzZ2MCBxU8/uZwImmtB8mY5NU3hpJWRg10bsp
	6rrDLoSZrUPfxxi8mG7UuzkRW5OvydUC7xcOVrPdjw0Y+nYib7yaw/NbNQ+aQVP95rDsJnsXVuBNU
	5NHZYNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR1Z-00000000C6E-1AdW;
	Thu, 13 Aug 2026 08:42:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR1X-00000000C5T-140l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:42:52 +0000
Received: from francesco-nb (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 6BDF31FBAF;
	Thu, 13 Aug 2026 10:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786610569;
	bh=Lkf6vS4aGzqlZUODBqAiya0+zZLWqU0oIUrwtnAoY8o=; h=From:To:Subject;
	b=WzaA9CB1f1rdBB6zHwxQfYbE3BVc4L291yfI6Ei4Cvfh8IEjM6qVnt3sypNjBo6Rj
	 UoeO+a4/Qs/zWpq7DB5QAHES9fhvx4Ynqo8oVYi5bLd0usYphhegcpIZPsluEZUnmX
	 8aBWi2VnuJtLwycLIEjtsVkMqeiD+iKPi719rLh6rLRu3QTH4xcoLLDq9DHDOzR7Ts
	 qQWicHyEQoct6wshUAawnAwE67C3JrnYeUmyx0WXpEV3IW4av3C3uTCewv7sK4FNVm
	 zOmTjLmv/JKPUWTsvjus0oHzqUk/iYkm2gZZFy5ykMEaqxIu1++PDyW61dTyvn7imV
	 x1EhJGtHxfNSA==
Date: Thu, 13 Aug 2026 10:42:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mehmet Fide <mehmet.fide@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Message-ID: <20260813084246.GC19687@francesco-nb>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-5-mehmet.fide@gmail.com>
 <20260813-comical-elastic-beluga-abcb1d@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-comical-elastic-beluga-abcb1d@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_014251_454069_99F84DB5 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, Aug 13, 2026 at 10:22:04AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 10, 2026 at 04:20:47PM +0200, Mehmet Fide wrote:
> > diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
> > index 0a4a7f9..47be8bc 100644
> > --- a/arch/arm/boot/dts/nxp/vf/Makefile
> > +++ b/arch/arm/boot/dts/nxp/vf/Makefile
> > @@ -1,8 +1,10 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  dtb-$(CONFIG_SOC_VF610) += \
> >  	vf500-colibri-eval-v3.dtb \
> > +	vf500-colibri-iris.dtb \
> >  	vf610-bk4.dtb \
> >  	vf610-colibri-eval-v3.dtb \
> > +	vf610-colibri-iris.dtb \
> >  	vf610m4-colibri.dtb \
> >  	vf610-cosmic.dtb \
> >  	vf610m4-cosmic.dtb \
> > diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> > new file mode 100644
> > index 0000000..d0fa107
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> > @@ -0,0 +1,125 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> 
> Odd license ("or later"), but I guess this is a derived work of existing
> code.

Not related to this patch set, but related to this comment. As Toradex,
for some reason I am now aware of, we traditionally use

GPL-2.0-or-later OR MIT for DT files.

Should we consider moving to GPL-2.0-only OR MIT for our future
submission? Any additional info on the topic?

Francesco


