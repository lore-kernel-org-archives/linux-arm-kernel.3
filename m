Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D5DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQSmxTgznD7fBftxLNyz/NpOSvMAV8k8SXtAo+OpQ4o=; b=fwupYoDRhVQwt7E1UAo5UVfVuT
	80LnMiKP34BBGUnMNvS/u1BpbsA8s8XYD2E+JMBZwGA5uXPYsKmZSIa/Q9qvRfTOh27bw+kOeBG0y
	iuG+9ajvT2DfcufkbjquuZgBwqQ2aPWj+mHrD+JndeonA1vHGWoTlOd1/46l7JYZOYUvGF5MSMEKY
	IeCqJTp1KRUOAeqtRW91YoBPruqOy81DrbsBJ/3//KtSt2aJ2nogAj3zeQdqjGHx4Aa1PHpUoLcXO
	YIzvFVw64p6aKLeIad8+ar0+KKWijv+V6PbZGm3OpZBgPFQfbm7/OkyIHvEx3wzfu5BRdPE7Pj5T+
	msUTdCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6VXK-00000002eQo-2YLh;
	Sun, 20 Apr 2025 14:20:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6VVP-00000002eDu-1XzC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 14:18:48 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53KEIZ4P685387
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 09:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745158715;
	bh=OQSmxTgznD7fBftxLNyz/NpOSvMAV8k8SXtAo+OpQ4o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lt7IIMt8woG9dokS+lXlHEauYwhYocx+x2XukV36DAzBXoylmmirOq0NasR5A5LxB
	 Eu1lxPqJmrcZ6MYQyXcigLibSMOFzKr92seJHLBJ1zUI5QCIKKAIfTKktO6mf8MeNo
	 RvhBkff9i/72yGh4R+gNC6xLawOfUEp30rG+ThFA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53KEIZqf001952
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 20 Apr 2025 09:18:35 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 20
 Apr 2025 09:18:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 20 Apr 2025 09:18:35 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53KEIYM7064785;
	Sun, 20 Apr 2025 09:18:34 -0500
Date: Sun, 20 Apr 2025 19:48:33 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j7200-main: switch to 64-bit
 address space for PCIe1
Message-ID: <8d43fdc6-760d-49cd-b4f5-95d13a52220b@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
 <20250417120407.2646929-3-s-vadapalli@ti.com>
 <8b707fbc-9d82-48d0-a227-366d4e83e8a7@ti.com>
 <231e009e-0dc2-4876-b052-d11b64ee5a0a@ti.com>
 <d517b2bb-2bf2-44ec-8509-6281c5566972@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d517b2bb-2bf2-44ec-8509-6281c5566972@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_071847_552226_5B0719D3 
X-CRM114-Status: GOOD (  27.71  )
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

On Sun, Apr 20, 2025 at 10:17:46AM +0530, Kumar, Udit wrote:
> Hello Siddharth
> 
> On 4/20/2025 8:33 AM, Siddharth Vadapalli wrote:
> > On Sat, Apr 19, 2025 at 11:35:50PM +0530, Kumar, Udit wrote:
> > 
> > Hello Udit,
> > 
> > > On 4/17/2025 5:34 PM, Siddharth Vadapalli wrote:
> > > > The PCIe0 instance of PCIe in J7200 SoC supports:
> > > > 1. 128 MB address region in the 32-bit address space
> > > > 2. 4 GB address region in the 64-bit address space
> > > > 
> > > > The default configuration is that of a 128 MB address region in the
> > > > 32-bit address space. While this might be sufficient for most use-cases,
> > > > it is insufficient for supporting use-cases which require larger address
> > > > spaces. Therefore, switch to using the 64-bit address space with a 4 GB
> > > > address region.
> > > > 
> > > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > > ---
> > > >    arch/arm64/boot/dts/ti/k3-j7200-main.dtsi | 7 ++++---
> > > >    1 file changed, 4 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > > > index 5ab510a0605f..e898dffdebbe 100644
> > > > --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > > > +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> > > > @@ -759,7 +759,7 @@ pcie1_rc: pcie@2910000 {
> > > >    		reg = <0x00 0x02910000 0x00 0x1000>,
> > > >    		      <0x00 0x02917000 0x00 0x400>,
> > > >    		      <0x00 0x0d800000 0x00 0x00800000>,
> > > > -		      <0x00 0x18000000 0x00 0x00001000>;
> > > > +		      <0x41 0x00000000 0x00 0x00001000>;
> > > >    		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
> > > >    		interrupt-names = "link_state";
> > > >    		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
> > > > @@ -778,8 +778,9 @@ pcie1_rc: pcie@2910000 {
> > > >    		device-id = <0xb00f>;
> > > >    		msi-map = <0x0 &gic_its 0x0 0x10000>;
> > > >    		dma-coherent;
> > > > -		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
> > > > -			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
> > > > +		ranges = <0x01000000 0x00 0x00001000 0x41 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
> > > > +			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0x08000000>, /* 32-bit Non-Prefetchable MEM (128 MB) */
> > > > +			 <0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>; /* 64-bit Prefetchable MEM (4 GB - (129 MB + 4 KB)) */
> > > Sorry for novice question,
> > > 
> > > with this change,  How do you see  old EP working which supports 32 bit
> > > addressing,
> > > 
> > > or some translation is possible ?
> > > 
> > > 0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>
> > > 
> > > to
> > > 
> > > 0x63000000 0x00 0x08101000 0x41 0x08101000 0x00 0xf7eff000>
> > I didn't understand the question completely, but I shall try to explain
> > the changes being made which might possibly answer your question.
> 
> If I understood well then what you are doing here
> 
> 0x43000000 0x41 0x08101000 0x41 0x08101000 0x00 0xf7eff000>
> 
> PCIe address
> 0x43000000 0x41 0x08101000 -->
> Property 0x43
> 0x43 as npt000ss ->relocatable, prefetch and 64 Bit memory space PCIe Bus address  0x41 0x08101000
> CPU address space 0x41 0x08101000
> This will work fine, if EP supports 64 bit addressing scheme.
> 
> In case, we want to work with EP of 32 Bit, Then do you see , we need to relocate PCIe (lower 32 bits) to CPU address (64 bits)

A total of 3 Address Regions have been defined:
1. 1 MB IO in the 32-bit PCIe Bus Address Space
2. 128 MB Non-Prefetchable MEM in the 32-bit PCIe Bus Address Space
3. (4 GB - 129 MB - 4 KB) Prefetchable MEM in the 64-bit PCIe Bus
Address Space

'1' and '2' above provide backward compatibility with Endpoint Devices
that can only support 32-bit PCIe Bus Addressing. The __newly__ added
'3' enables Endpoint Devices that support 64-bit PCIe Bus Addressing to
claim larger Memory Address Space on top of what is supported by '1' and
'2'.

Regards,
Siddharth.

