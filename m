Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0061EC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTJliYfCtt4bgttWS5Hp986Wh6Lp9pytD8qb3eAhJ7U=; b=mH5dUSLMYvSsY80MBmxMGXBk0/
	tx9XX9SANFgAtgHxDz+3Ldc3esopXtVjUVu+OhMUaKoh57JdETz4FlgL0if0gMmjGzQ4g6hFYwvW5
	spmyD9UCq2vmLZcR1ddDRFE0oFHD8jF4I8hnX89zTl08XF9LJ9AeZ0fiiziQS/TmBfVvg4qk1V9uu
	6sjfuarHZ2qGvPxtsoAQnJpYB4KTKLvDh8x+0N19wCEP4BcEksUMkN/IbLH7Sbh6KpCEI50+pPjpY
	d85Mvf9hijbGr3jvWOmKSN1skSwSCCFcZDGjBH4HyXU2buackrYCBy0CCrU/xxZsfBSHlRazpu6+f
	QvGblLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0lV-00000000gGD-42MQ;
	Thu, 08 May 2025 12:54:17 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0c1-00000000eKG-0rl6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:44:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548Ci7w31100803
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 07:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746708247;
	bh=sTJliYfCtt4bgttWS5Hp986Wh6Lp9pytD8qb3eAhJ7U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cIjO0GS8qFsJ4lzYHSfhrXw7Xlg90ruLfJUbYB6a3PJYp9YxR4dlX8ZRRtPiVpIZC
	 Gw9S+f3Z1W6kcV8xz+PXBufLihBYmPDVKiuok3Bm324ZnAn+oOE5hRhmk/ss7WVNeq
	 91PJNeWirnnb9RrpwEZ1qt0tqb+POjtv98j2+0SI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548Ci7i5040304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 07:44:07 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 07:44:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 07:44:06 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548Ci6lI040835;
	Thu, 8 May 2025 07:44:06 -0500
Date: Thu, 8 May 2025 07:44:06 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI
 OV5640
Message-ID: <20250508124406.tb34bqhv66gqcb7j@swizzle>
References: <20250505115700.500979-1-y-abhilashchandra@ti.com>
 <20250505115700.500979-3-y-abhilashchandra@ti.com>
 <a6329e9d-409e-4f62-b26d-c4d0e49d772c@ti.com>
 <9cb4f94e-00e8-43d5-be7a-85dc1188e856@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cb4f94e-00e8-43d5-be7a-85dc1188e856@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_054429_407501_A403CA9D 
X-CRM114-Status: GOOD (  24.14  )
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

On 17:46-20250508, Yemike Abhilash Chandra wrote:
> Hi Udit,
> Thanks for the review.
> 
> On 07/05/25 13:50, Kumar, Udit wrote:
> > Hello Vaishnav/Abhilash
> > 
> > Thanks for patch
> > 
> > On 5/5/2025 5:27 PM, Yemike Abhilash Chandra wrote:
> > > From: Vaishnav Achath <vaishnav.a@ti.com>
> > > 
> > > TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
> > > J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
> > > for quad TEVI OV5640 modules on J722S EVM.
> > > 
> > > Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> > > Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > > ---
> > >   arch/arm64/boot/dts/ti/Makefile               |   4 +
> > >   .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 358 ++++++++++++++++++
> > >   2 files changed, 362 insertions(+)
> > >   create mode 100644
> > > arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/Makefile
> > > b/arch/arm64/boot/dts/ti/Makefile
> > > index 829a3b028466..76b750e4b8a8 100644
> > > --- a/arch/arm64/boot/dts/ti/Makefile
> > > +++ b/arch/arm64/boot/dts/ti/Makefile
> > > @@ -123,6 +123,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
> > >   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
> > >   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
> > >   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> > > [..]
> > > diff --git
> > > a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> > > b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> > > new file mode 100644
> > > index 000000000000..537224ea60e3
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> > > @@ -0,0 +1,358 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > +/*
> > > + * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
> > > + *
> > > + * Copyright (C) 2024 Texas Instruments Incorporated -
> > > https://www.ti.com/
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include "k3-pinctrl.h"
> > > +
> > > +&{/} {
> > > +    clk_ov5640_fixed: clock-24000000 {
> > > +        compatible = "fixed-clock";
> > > +        #clock-cells = <0>;
> > > +        clock-frequency = <24000000>;
> > > +    };
> > > +
> > 
> > Please check once , this is clock is 25M or 24M .
> > 
> > As I see CDC6CE025000ADLXT/U28 is marked as 25M OSC
> > 
> 
> This is the crystal clock with in the sensor.

Please cross check this - the camera *module* has a BAW crystal which is the
source of clock to the sensor.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

