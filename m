Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E1EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDMGi+M7TIrq3wma1rD/RGR00yh/72Z20qQfhyF8NH4=; b=fuayzka7RgYFnNr6LGT+GOm2ww
	cj3TJbOKYNiRtfp16OhpCmU3s5M4b+wTw+YeBtELAmTavY4rXuBt/AS0ARh68FLnIhU4toTCgq3it
	XBZNhAyg/o12GWXVEhpPKls+n+fmPrH8pCxMiEdlE3v7kY0GMI3T4Q6y2zndXE5k+Dcvm1DXFeTp7
	sWvkjNvzBPAv7gmxEX5QCJ5CbQvcchRSSVlYRoVvKgkvYFFHJkJRHiuE+5dGk0z4TtyazAZYnTj9e
	pEclm1ayr46igoGVjr8FLCVnYCt6XMbDbX8dfVDQzT8mxKlOahLejY8PmiWgr/99Ae6fvuj59NpqW
	TlZrM4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZln-0000000A8ZK-42gQ;
	Wed, 22 Jan 2025 12:23:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZkV-0000000A8Qx-41fv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5C851007;
	Wed, 22 Jan 2025 04:22:51 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522203F738;
	Wed, 22 Jan 2025 04:22:21 -0800 (PST)
Date: Wed, 22 Jan 2025 12:22:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
Message-ID: <Z5Di-uU52aejU-U8@pluto>
References: <20250121-imx-lmm-cpu-v1-0-0eab7e073e4e@nxp.com>
 <20250121-imx-lmm-cpu-v1-2-0eab7e073e4e@nxp.com>
 <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b9a7392-8ebe-4d43-a111-68bb6d2f93b6@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_042224_086749_ABE8ED94 
X-CRM114-Status: GOOD (  29.41  )
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

On Wed, Jan 22, 2025 at 11:48:52AM +0300, Dan Carpenter wrote:
> On Tue, Jan 21, 2025 at 11:08:12PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > This protocol allows an agent to start, stop a CPU or set reset vector. It
> > is used to manage auxiliary CPUs in an LM (e.g. additional cores in an AP
> > cluster).
> > 

Hi,

just a quick one down below.

> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  13 +-
> >  drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
> >  drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 283 +++++++++++++++++++++
> >  include/linux/scmi_imx_protocol.h                  |  10 +
> >  4 files changed, 306 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > index 1a936fc87d2350e2a21bccd45dfbeebfa3b90286..9070522510e4d3f3d7276a7581f8676006d20f90 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > @@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called imx-sm-bbm.
> >  
> > +config IMX_SCMI_CPU_EXT
> > +	tristate "i.MX SCMI CPU EXTENSION"
> > +	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > +	default y if ARCH_MXC
> > +	help
> > +	  This enables i.MX System CPU Protocol to manage cpu
> > +	  start, stop and etc.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called imx-sm-cpu.
> > +
> >  config IMX_SCMI_LMM_EXT
> >  	tristate "i.MX SCMI LMM EXTENSION"
> >  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > @@ -21,7 +32,7 @@ config IMX_SCMI_LMM_EXT
> >  	  manage Logical Machines boot, shutdown and etc.
> >  
> >  	  To compile this driver as a module, choose M here: the
> > -	  module will be called imx-sm-lmm.
> > +	  module will be called imx-sm-cpu.
> >  
> 
> It's supposed to be called imx-sm-lmm.
> 
> >  config IMX_SCMI_MISC_EXT
> >  	tristate "i.MX SCMI MISC EXTENSION"
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
> > index f39a99ccaf9af757475e8b112d224669444d7ddc..e3a5ea46345c89da1afae25e55698044672b7c28 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
> > +obj-$(CONFIG_IMX_SCMI_CPU_EXT) += imx-sm-cpu.o
> >  obj-$(CONFIG_IMX_SCMI_LMM_EXT) += imx-sm-lmm.o
> >  obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e3f294c2cb69a5b5a916d55984f4a63539937d02
> > --- /dev/null
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> > @@ -0,0 +1,283 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * System control and Management Interface (SCMI) NXP CPU Protocol
> > + *
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/scmi_protocol.h>
> > +#include <linux/scmi_imx_protocol.h>
> > +
> > +#include "../../protocols.h"
> > +#include "../../notify.h"
> > +
> > +#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> > +
> > +enum scmi_imx_cpu_protocol_cmd {
> > +	SCMI_IMX_CPU_ATTRIBUTES	= 0x3,
> > +	SCMI_IMX_CPU_START = 0x4,
> > +	SCMI_IMX_CPU_STOP = 0x5,
> > +	SCMI_IMX_CPU_RESET_VECTOR_SET = 0x6,
> > +	SCMI_IMX_CPU_INFO_GET = 0xC,
> > +};
> > +
> > +struct scmi_imx_cpu_info {
> > +	u32 nr_cpu;
> > +};
> > +
> > +#define SCMI_IMX_CPU_PROTO_ATTR_NUM_CPUS(x)  ((x) & 0xFFFF)
> > +struct scmi_msg_imx_cpu_protocol_attributes {
> > +	__le32 attributes;
> > +};
> > +
> > +struct scmi_msg_imx_cpu_attributes_out {
> > +	__le32 attributes;
> > +#define	CPU_MAX_NAME	16
> > +	u8 name[CPU_MAX_NAME];
> 
> char is always unsigned in the kernel these days but strings should
> still always be char.  Same thing in patch 1, there were a couple u8
> names.
> 

While it is certainly true that char is the way to go for strings and, as
such, it is used elsewhere to hold the resource names across all SCMI
protocols, in this context it is a field of structure representing
exactly the layout of message reply coming from the server, and defined
in the SCMI spec as a uint8 array, so, we have generally preferred to
used u8 to represent such fixed size array all across the SCMI stack
protocols implementation....

.... not saying that it is necessarily completelt right, but that is the
reason we are guilty :D

Thanks,
Cristian


