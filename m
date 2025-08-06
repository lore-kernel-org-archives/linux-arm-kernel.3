Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E958C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0RLpH07Ee+0r2Wbo7lTsuBuWM+B3z1D1H42m5UQNHM=; b=NDnizSlXUiJiWwwHgqe3wDeQB/
	teMP+iyQMWF8slQOO7RecUIrvHFcHoq2EXkSXieSsb4K6wX5bvMLYTQM0O4+THjBaKjianImmEW19
	M4oDpry/Crz8mOYaWv0xy5idvIQiPHA+vLu18aFQdqUmagAcK2BK+4nkkgQNFfmJCl0YpPboURU5Y
	wuGgeaF7gCGJMiVYe513yVY7Rjzy4XGsoOxEMXsGvKyRdWRwC93bcvRi0pbc/ntWVMOHKujCVa3AW
	tMt51z1pbIIdtxDspdNQrfDC/+b3NgCetJcn/yh7RZFf2i2eMOkqysWDa0BZByoLNBmOWVoRLj7DY
	+Yn9NDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeDR-0000000FIuU-0Fbm;
	Wed, 06 Aug 2025 13:30:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeAt-0000000FIeO-2ATb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 13:27:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1ujeAY-0007wq-Ev; Wed, 06 Aug 2025 15:27:02 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ujeAX-00CDWu-2f;
	Wed, 06 Aug 2025 15:27:01 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1ujeAX-00CH9C-2J;
	Wed, 06 Aug 2025 15:27:01 +0200
Date: Wed, 6 Aug 2025 15:27:01 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v18 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Message-ID: <20250806132701.fouikyuqtzdsxqwh@pengutronix.de>
References: <20250619-imx-se-if-v18-3-c98391ba446d@nxp.com>
 <20250625105546.pxuatcnfpe7mssgs@pengutronix.de>
 <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
 <b02055bb-0995-4fd8-99f3-4ca5146eedd4@kontron.de>
 <20250630121722.wviidlggt7hguyt7@pengutronix.de>
 <087b8689-7443-4720-a94c-160edd31a5da@kontron.de>
 <AM9PR04MB8604C05882605EDB4913DA089549A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250714094124.e6fnkrocnqagbm22@pengutronix.de>
 <AM9PR04MB8604EFCC5400DEBB7DF0CF49952DA@AM9PR04MB8604.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604EFCC5400DEBB7DF0CF49952DA@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_062723_709563_3F6476AF 
X-CRM114-Status: GOOD (  56.72  )
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

On 25-08-06, Pankaj Gupta wrote:
> > On 25-07-09, Pankaj Gupta wrote:
> > > > Am 30.06.25 um 14:17 schrieb Marco Felsch:

...

> > Lockdown: For a verified boot setup you need to burn an eFuse at some
> point,
> > to tell the bootROM to boot only correct verified firmware images.
> > 
> > After this lockdown it's no longer possible to burn eFuses from the REE
> albeit
> > the production line setup still requires the support.
> > 
> Understood. ELE access from both secure and non-secure world is fixed in Q3
> release.
> User can be able to modify eFuses via OPTEE.

Splitting the read and write between two drivers is even worse.

Can you please point out why you can't just move the driver parts into
the tee? I do see many advantages if only op-tee is used:

 + Minimize the maintainer effort, because only one driver
   implementation is used.
 + TEE code could be reused by other OSes
 + You could already start adding the support for it to OP-TEE because
   no ELE-FW update is required.
 + TEE is used anyway for new projects due to CRA and friends
 + Concurrent access handling is done by the TEE core

The only downside of this approach is the integration effort for the
TEE, but this shouldn't be an excuse. Mostly all well known buildsystems
like: Yocto/OE, buildroot, ptxdist do have mainline support for OP-TEE.

> > > >>  - With new regulations like the EU CRA I think we need some sort of
> > > >>    secure-enclave anyway.
> > >
> > > > Probably some sort of, yes. But not necessarily in the form of TEE
> > > > or TrustZone, I guess.
> > > To use ELE features through Linux, there is no dependency on OPTEE-OS.
> > 
> > Once again, still no fix available and if your system requires a TEE
> you're forced
> > to move the ELE communication into the TEE (at least until now).
> > 
> > Also the eFuse R/W access is not possible from the REE/Linux after doing
> the
> > device lockdown.
> > 
> ELE access from both secure and non-secure world will be fixed in Q3
> release.
> User can be able to modify eFuses via OPTEE.

NACK, please see my comment above.

> > > >>  - Making it optional cause more paths of potential errors e.g. by
> not
> > > >>    including the correct "secure.dtsi". Multiple paths also require
> more
> > > >>    maintain- and testing effort. IMHO I do think that one of the
> paths
> > > >>    get unmaintened at some point but we would need to keep it for
> > > >>    backward compatibility.
> > > >>
> > > >>    Having one implementation eliminates this since.
> > > >>
> > > >>  - All above points assume that the ELE-FW and -HW is capable of
> talking
> > > >>    to both world, which is not the case. As we learned NXP doesn't
> have
> > > >>    a fix for the 2-MUs ELE yet and even more important there are 1-MU
> > > >>    ELE-IPs.
> > >
> > > For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> > > world - Linux(one or more) and OPTEE-OS (one or more), that needs to
> > > be shared between them.
> > 
> > Please mention this within your commit message.
> Accepted & mentioned.
> 
> > 
> > > As mentioned earlier, there is an issue of using MUs simultaneously,
> > > from both worlds. Fix is in progress.
> > 
> > So until now no fix available and i.MX93 based products which do use a TEE
> > are forced to move the communication into OP-TEE.
> > 
> > > >> I do see the (minimal) drawback of having +1 FW but I think this is
> > > >> more an integration problem.
> > > >> Speaking of FW files, for the new i.MX9* you already have plenty fo
> > > >> them: bootloader, TF-A, ele-fw, scu-fw (i.MX95). So your integation
> > > >> needs to handle multiple firmware files already.
> > >
> > > > Sure, but I really like to keep the complexity and therefore the
> > > > number of FW files as low as possible. I'm not sure what has more
> > > > weight in terms of
> > > > security: shipping an additional firmware and therefore increasing
> > > > the attack surface or maintaining an additional code-path.
> > >
> > > There is no +1 firmware in case of i.MX93.
> > >
> > > >>
> > > >>> Anyway, I see your point of having a single implementation for the
> > > >>> ELE API in the "right" place. But as far as I know other platforms
> > > >>> like
> > > >>> STM32MP1 also implement both ways for the HWRNG, secure access via
> > > >>> OPTEE and non-secure access via kernel directly.
> > > >>
> > > >> I'm not a STM32MP1 expert but here you have this setup with the
> > > >> *-scmi.dtsi. So you have two code paths which needs to be
> > > >> maintained and tested. Also if one customer of yours want to use
> > > >> OP-TEE you need the integration anyway, so you (Kontron) needs to
> > > >> maintain multiple configuration as well. I don't see the added value.
> > > >>
> > > >> I think for STM32MP1 the *-scmi.dtsi support was added later
> > > >> because it required a lot effort to support it. This is not the
> > > >> case for the
> > > >> i.MX9* series.
> > >
> > > > Anyway, thanks for elaborating. Your points are all valid and
> > > > basically I
> > > agree. I'm fine with either way. But I'm afraid that implementing the
> > > ELE API in OP-TEE only will cause another tremendous delay for having
> > > ELE access in the kernel, especially seeing how slow NXP seems to be
> > > working on these topics right now.
> > >
> > > To use ELE features through Linux, there is no dependency on OPTEE-OS.
> > 
> > How exactly do you provide the eFuse write access after the device was
> locked
> > down?
> As mentioned above by you. It will be done via OPTEE-OS (or may be via TFA).

Why TF-A? Please see my comments above.

At the moment I don't see why the ELE must be a Linux driver. You could
start adding a TEE driver now, because there is no need to wait 3 months
for a ELE-FW fix.

IMHO having a dedicated normal-world driver makes only sense for
bootlaoders which don't have support for the TEE communication but need
access to the ELE. This is not the case for the kernel.

Regards,
  Marco

