Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D925C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aXK0mDrYkJOBL3Ge0JtxXwmv+mTN/3CdT138OZQc88=; b=MzaNLJv20U+K7owgNEHdxgZDLF
	RqDeCZ8bnLJwqt468Fsc2Au2rWDHbBXV8jKjnu8SwIK8doyR0KDWHs4kK92xrXa3d+prgYZ37jZIU
	DoJOx0/fbEQoxi/mJI3FFF0PRQLgQTbLhxnNKZxq5HxrKaQC21q8rcB7o3/DneFDna8kRudM104T5
	MtUwlqkpdHp4Yr+hZUQQ6GuS9rZ0C0UP3Wj3n2SHeqWfQdRDcr+tlPBn1GL/O7NVxkkYwhL1ZJjz4
	mE5CjjMhaEfEwta8hd1vvKSnF9HGrMjXUzNBvZmkjRYGetG/FPZ+JTWSb6Q7OmBX4b69t04FRzB9Z
	Xw9gPJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4H94-00000001Ypg-2DXL;
	Mon, 14 Apr 2025 10:34:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gqa-00000001Sso-0oTs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:15:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41DBB1007;
	Mon, 14 Apr 2025 03:15:22 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E12813F694;
	Mon, 14 Apr 2025 03:15:20 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:15:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "Rob Herring" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Message-ID: <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_031524_274048_A89377F8 
X-CRM114-Status: GOOD (  23.55  )
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

On Mon, Apr 14, 2025 at 09:57:43AM +0000, Peng Fan wrote:
> Hi Sudeep,
> 
> > Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM
> > driver
> > 
> > On Tue, Apr 08, 2025 at 04:44:29PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The i.MX95 System manager exports SCMI LMM protocol for linux to
> > > manage Logical Machines. The driver is to use the LMM Protocol
> > > interface to boot, shutdown a LM.
> > >
> > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
> > >  drivers/firmware/imx/Kconfig                  | 11 ++++
> > >  drivers/firmware/imx/Makefile                 |  1 +
> > >  drivers/firmware/imx/sm-lmm.c                 | 91
> > +++++++++++++++++++++++++++
> > >  include/linux/firmware/imx/sm.h               | 14 +++++
> > >  5 files changed, 119 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > index
> > >
> > b5f13d0e40155e485f4d1696e9550645d888ef44..4c24e17425f83081
> > 0f8ba376ece9
> > > db93c8cded6d 100644
> > > --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > > @@ -26,7 +26,8 @@ config IMX_SCMI_CPU_EXT  config
> > IMX_SCMI_LMM_EXT
> > >  	tristate "i.MX SCMI LMM EXTENSION"
> > >  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > > -	default y if ARCH_MXC
> > > +	depends on IMX_SCMI_LMM_DRV
> > > +	default y if ARCH_MXC && ARM64
> > 
> > I can't understand the ARM64 dependency on this and next patch.
> 
> ARCH_MXC both supports ARM32 and ARM64.
> 
> To i.MX ARM32 platform, there is no plan to enable SCMI, so only
> set y for ARCH_MXC ARM64 platforms.
> 

OK but why is it different for IMX_SCMI_MISC_DRV. I really don't see
any dependency. If it is not supported today fine, but do you need any
issue to use it or compile it for arm32 ?

-- 
Regards,
Sudeep

