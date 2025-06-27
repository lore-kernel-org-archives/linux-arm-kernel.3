Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19042C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYY4zMFgh6P+NnchPez8cuqLoMV6YOtOfIsytlbBgik=; b=IEVPF+b+ljjQ5x15yMX53HnnrB
	JIUuKUAfBnj139z8PhJth59rDqX6UOiNQRkjBQzsOv0FF6p6pk0w+k7rJg1RzTu95itneyk1RtQ3g
	rAaSjN2LKayCM44Ro1Hdf/fGfEdipF8cCfZGJ0/Yk3up4OLGc1Y9CKtfNnfVWqtRnWsIK770m9hNn
	+1MJrxyFudOgDSVDeBIiUGUDZHPRx81cKBdkLhZ0WPwwHSE8OC3nM3SX1hQj4EPYcGMkoxR8kRYs7
	vPnsjioA+ttza/ZeqJBIou2EqGvZ55R9mJvDO55BbXEiJVz8AqsMvr7HBvVrwXQHq5NalhyNI3dkJ
	6D7AqxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4mE-0000000E04n-3OzO;
	Fri, 27 Jun 2025 08:49:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4ju-0000000Dzta-2yB8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 08:47:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uV4ja-0003zL-Vq; Fri, 27 Jun 2025 10:46:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uV4jW-005aNg-0W;
	Fri, 27 Jun 2025 10:46:54 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uV4jW-003X1G-02;
	Fri, 27 Jun 2025 10:46:54 +0200
Date: Fri, 27 Jun 2025 10:46:53 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
 <20250619-imx-se-if-v18-3-c98391ba446d@nxp.com>
 <20250625105546.pxuatcnfpe7mssgs@pengutronix.de>
 <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_014718_751973_AEE60D6B 
X-CRM114-Status: GOOD (  30.23  )
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

Hi,

your e-mail configuration mixed my e-mail with your answer, which makes
it hard to read. Can you please check the quoting next time :)

On 25-06-27, Pankaj Gupta wrote:
> >> Add driver for enabling MU based communication interface to
> secure-enclave.
> >>
> >> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are 
> >> embedded in the SoC to support the features like HSM, SHE & V2X, using 
> >> message based communication interface.
> >>
> >> The secure enclave FW communicates with Linux over single or multiple 
> >> dedicated messaging unit(MU) based interface(s).
> >> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> 
> > You write single or multiple MUs are possible. I'm aware that the i.MX93
> > has two MUs one for the secure and one for the non-secure world. But I'm
> > really concerned about the fact that both MUs can't be used at the same time
> > from both world:
>
> Yes, you are correct.
> 
> Fix is still work in progress.

So after ~6 months no fix is available :(

> > Also how is the secure and non-secure world talking to the ELE if there is
> > only one MU as you have written?
> 
> Till the fix is WIP, either Linux or OPTEE can use the ELE, at one point in
> time.

That has nothing to do with the fix. The fix is for platforms/SoCs which
do have 2-MUs, but you also have written that there are platforms with
only 1-MU.

This MU can't be shared between secure and non-secure world.

> > IMHO it makes much more sense to put the complete ELE communication into
> > (OP-)TEE and let the secure OS taking care of it. All non-secure world
> > requests are passed via (OP-)TEE to the ELE. This involves:
> > - eFuse access (done via OP-TEE i.MX specific PTA)
> > - ELE 23h59m ping (kernel SMC WDG driver, requires OP-TEE watchdog driver)
> > - HW-RNG (kernel OP-TEE HWRNG driver + OP-TEE HWRNG PTA)
> 
> There is a dedicated MU "trusted-MU" for OPTEE-OS. The idea to converge to a

Yes for systems with 2-MUs there is a "trusted-MU" and a
"non-trusted-MU". As of now, there is no fix available for using both
MUs at the same time. Furhtermore there are platforms/SoCs with only
1-MU, as you have written in your commit message. This 1-MU system can
have the MU either trusted or non-trusted.

> single path via OPTEE-OS, is good. But it will impact the performance of the
> features at Linux side.

Performance? We are talking about a ping every 23h59m (I still don't
know if this is a feature or bug), eFuse write/read, and the HW-RNG
which can seed the Linux PRNG.

> Since the fix is still WIP. Let's wait till then.

The fix is for the 2-MUs SoCs but not the 1-MU case.

I would like to have a system design which doesn't differ too much
between SoCs which are equipped with the ELE engine.

Regards,
  Marco

