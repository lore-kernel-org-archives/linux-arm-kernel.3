Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8D2D29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soEcZw42vl53V92RhsKwqTsyInEv8cfstOKTkz+5raI=; b=WvteLzmQ+8VSc8Bov+K8kFjtrR
	ATtXx5oTI5qmmdgDwv3uNWo+ECQ++QBErDKyKHCCvnMov71o4bLHRepALNK+GYEQa3/tkgOeR8ceA
	151dTyYkn7Bbnh5rKsr7QIxM4r6Pmbn4WPacgILgicMM2BPZ9YG9uLT0UV5/2xts1vqvyci6oIYkc
	0yRCRVT8Bgx5Vk08fmFKKQItV9a9+B80/ymp42Kqh8zVz49mN8SaDrjN2s3pL77rIW95knznHFZO0
	L3EzZIymAfxOCg8uDSn9cIpT1ye7R6ULW1xQhYVkPDslg6Yj7OSsarId2bkKD+6410M3aAjqueynZ
	eiH1dmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bQp-00000002IOL-1yIa;
	Wed, 06 Nov 2024 08:30:27 +0000
Received: from www.linux-watchdog.org ([185.87.125.42])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bP3-00000002Hce-1S3u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:28:39 +0000
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 0AEB0409F8; Wed,  6 Nov 2024 09:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 0AEB0409F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730880077;
	bh=1ciSStcfRdIZHSbpIwhHEGxTT0wF9Oowtv8x1fEmb94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGVIyQNVE53GZ5mr6L5/ZU6VZbFLmazGh1e0WUij7oyHfxHe9agTPk45KuhcSSIpz
	 CMrr7Zro60keW3uAMqVBr55ikkycyg33vy4Tb3V/yACs4SC3zM4AXyZtkVgmmN3cLE
	 yLXsmajfkar3cMZSgq3hPzkUGOFLVYKnsysYzWew=
Date: Wed, 6 Nov 2024 09:01:16 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Rob Herring <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Frank Li <Frank.li@nxp.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <20241106080116.GA14302@www.linux-watchdog.org>
References: <20241007212434.895521-1-Frank.Li@nxp.com>
 <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
 <20241105083255.GA24194@www.linux-watchdog.org>
 <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_002837_840028_196B208B 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Frank, Rob,

> On Tue, Nov 5, 2024 at 3:00 AM Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
> >
> > Hi Frank,
> >
> > > On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> > > > From: Animesh Agarwal <animeshagarwal28@gmail.com>
> > > >
> > > > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. Only
> > > > allow big-endian property for ls1012a and ls1043a.
> > > >
> > > > Fix dtbs_check errors.
> > > > arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
> > > >     Unevaluated properties are not allowed ('big-endian' was unexpected)
> > > >
> > > > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > > > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > >
> > > Wim Van Sebroeck:
> > >
> > >       Any update this patch? Kyzy already acked.
> > >
> >
> > Acked-by: Wim Van Sebroeck <wim@linux-watchdog.org>
> >
> > Via which tree will this go upsteam?
> 
> Your tree.
> 
> DT bindings go in via $subsystem tree. I only take DT bindings if they
> don't get picked up by the subsystem maintainer.
> 
> Rob

Added.

Kind regards,
Wim.


