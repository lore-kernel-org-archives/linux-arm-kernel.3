Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81491C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKkPX8SSsZZubXRSv3O7mjjd5d5lK8W3Iit7i4K0x3U=; b=VmoW0a9HQGCmac0vFPHj+vVAJU
	lIaU18q1KzF/C/IM9FpLkgycVGnFlwo/IFtGImbq3Fml70PPS14J0bKzmbVX2xW7Odv2S8skMHn2W
	29G9enslGlcBS6UtKRWmOObzW1LWJcaeWp6LTehgcipRmJhRvm89VKxpOdrbHhUZoCn1GBkMw9lz7
	6HoKP2Mf+jvNCm1vDgi4H1gMwghyxpmhK0YF4AaxmDii6/GYAfCwy99oNfdDrF3yR3wEIwVKTN3lm
	ubuqndrRu7YSjO7zUZb0+FZ5mjy6Sjv2hif1Cd07kXKi8C8N2K6TxU1DcbsAtbgj8px2jCARg4atk
	eBEfwxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykh-00000004Aom-2v3s;
	Mon, 17 Feb 2025 10:53:27 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjy6V-000000044J3-24bb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FKkPX8SSsZZubXRSv3O7mjjd5d5lK8W3Iit7i4K0x3U=;
	b=qCELh/cvx9nCT6quI4lzHZYumKBpmnKj2xFQCw9dSGHy9efbOzhPpiAbQHnUqx
	Xp1/oOA20xiMTDk6COOjQNUMgfDUx+54jnB7YCT4qZWi7VbVfvryrk4m1KOqhmHK
	1fvAzsweWtsOzRMKtaFZmUO4YUXy8qQWYrpUn1j47Z7lk=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXW7BcC7NnpRIUCQ--.16375S3;
	Mon, 17 Feb 2025 18:11:42 +0800 (CST)
Date: Mon, 17 Feb 2025 18:11:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Picej <andrej.picej@norik.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 13/15] arm64: dts: imx8mm-phycore-som: Add overlay for
 rproc
Message-ID: <Z7MLXJkmcTuq3ZHn@dragon>
References: <20241202072052.2195283-1-andrej.picej@norik.com>
 <20241202072052.2195283-14-andrej.picej@norik.com>
 <Z3Ie8GO/GtoSkIr3@dragon>
 <221c8216-ce71-4ba2-9981-8612ff33ec2a@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <221c8216-ce71-4ba2-9981-8612ff33ec2a@norik.com>
X-CM-TRANSID: M88vCgCXW7BcC7NnpRIUCQ--.16375S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryDKw4xZF43ZrWDZry5urg_yoW8uw48pr
	y7uayUKrs2gF4xCrZIqw4DWryqy3W3XF43u34DZr1vgr4avF9FyF409ryfuryjqF4kZw4F
	vF4fZFZF9wn8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFdgAUUUUU=
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwL2ZWey6E2ehQAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021155_840183_69ADB287 
X-CRM114-Status: GOOD (  20.81  )
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

On Tue, Dec 31, 2024 at 08:34:32AM +0100, Andrej Picej wrote:
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
> > > new file mode 100644
> > > index 000000000000..0c61946f0cf8
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
> > > @@ -0,0 +1,55 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2024 PHYTEC Messtechnik GmbH
> > > + * Author: Dominik Haller <d.haller@phytec.de>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +#include <dt-bindings/clock/imx8mm-clock.h>
> > > +
> > > +&{/} {
> > > +	reserved-memory {
> > > +		#address-cells = <2>;
> > > +		#size-cells = <2>;
> > > +		ranges;
> > 
> > I'm getting this:
> > 
> > arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:16.3-10: Warning (ranges_format): /fragment@0/__overlay__/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /fragment@0/__overlay__ (1)
> > arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #address-cells value
> > arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:13.18-43.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #size-cells value
> > 
> 
> I see, missed this before, sorry. But I have some problems fixing it.
> I think the problem is that this is overlay, the same node put in the
> imx8mm-phycore-som.dtsi doesn't trigger a warning.
> The only solution that I found is that I specify the default address-cells
> and size-cells in root node:
> 
> 
> &{/} {
> 	#address-cells = <2>;
> 	#size-cells = <2>;
> 
> 	reserved-memory {
> 		#address-cells = <2>;
> 		#size-cells = <2>;
> 		ranges;
> 	...
> 	};
> };
> 
> The same values are used in imx8mm.dtsi, but the checker fails to find these
> default values.
> Not sure if this is the right solution, though. Your input would be helpful,
> thanks.

Unless DT folks have better suggestion, I'm fine with this.

Shawn


