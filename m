Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A5606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Yy3CAEg;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=geMMPvYn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZoLJuTtQKLg7le3DcIFYtP5fGVhQZQLGkovX+brljM=; b=0Yy3CAEg7OmHoSQq8U8u3aQksP
	oH8WHVeNUcnxcVcSEpS1Q4RWGh4c2Oi2UGfRVjGmVbnLkCypkud+xB49bHpXXksxRV5ED/QVLhHiw
	RtRe/1izJXV8wwACiRkDWVmwC6ftB+s2AkN4m+NK+q7Ytssy2iUZtGPNuHehrXbF/uW+iHybX8hwT
	9ldXi3YVe3SbLBigLvyAhW9zhlbeaR+7at+KvnqR1jXcBvrBKvcn1U+XHAchnaJpmoS9EpI5q6QqN
	SwhwvSFky5D3noXhcJQfzqt+ggtN6QBsmTvTumPNtSzNxUUmpZ8c5c8Tz1+PHlS5xxj42LWbzSY0L
	q+OqhYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbBg-0000000CfBT-2TYa;
	Wed, 21 Oct 2026 18:37:20 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbBb-0000000CfB0-3Uat
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:37:18 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 53DB71F8D1;
	Wed, 21 Oct 2026 20:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792607828;
	bh=vZoLJuTtQKLg7le3DcIFYtP5fGVhQZQLGkovX+brljM=; h=From:To:Subject;
	b=geMMPvYngn0H4t28uKQQEecN1/bxf/dEtIJlow+C9lQm8GCeyim4/IfbzBP+hpQ89
	 noFQLdGDpaJmieI9uLkXIDit3R04DVO0Fm/2vp8hGaOvThka/Quph19vyqJwNc7rvi
	 dTV6h2n5uercGurux+uTywbRlkWjg6utsUQUdewxUtuKHni/7vVaUgQjYfO4o471uI
	 U+ihLq60RIGZk3Uix3woeN5D0kqGdTa5L5A3WofQCbRe90DF2Zfgc8q2LwZJpY5GMF
	 Jri72b7y0wZVJOWqPG6/Q4DtzbklPbMip9+mN+BUYUxXkX3iyVZLcr+OJN3ZYblZDq
	 Eb3doXU8uNgHg==
Date: Wed, 21 Oct 2026 20:37:04 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@nabladev.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Message-ID: <20261021183704.GA1116319@francesco-nb>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_113716_939717_D583DDF8 
X-CRM114-Status: GOOD (  21.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:
> > On the maveo box, the SPI pins are connected to connector X10,
> > but no device is connected. The device "dhcom-board" was used
> > only to test the hardware, but was not removed afterward. So
> > remove this device to accurately represent the current hardware
> > configuration here.
> > 
> > Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> > Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > ---
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Marek Vasut <marex@nabladev.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: kernel@dh-electronics.com
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
> >   1 file changed, 8 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > index 047f7b2d8526..eb0b91040110 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> > @@ -60,14 +60,6 @@ &ecspi4 {
> >   	pinctrl-0 = <&pinctrl_ecspi4>;
> >   	pinctrl-names = "default";
> >   	status = "okay";
> 
> Drop "status = "okay"" too , since this controller will be unused ?

you can instantiate a new device on the SPI bus from userspace. up to
you, but if I was a user I would appreciate to have it enabled.

Francesco


