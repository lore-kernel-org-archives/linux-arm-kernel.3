Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D89C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6fnSSy58jOAFukWndBiel7ol37QH7BTey2iymzdWF8=; b=B6+4+qmwkBv4+nJNlg3oW9Jxwm
	WREYyEvR1/H6nMIcpIzEKFiCz1STfm35xbf04Uoy4UJ7kwXd1tdjopqVXfdR4yRTqPX+zzJIfhfH2
	6h5Wu4Bik3Xf80zHCnOti2UqtWb1zgrb2Mo3XY7ec+W2Y6O+vkngIdKMOtYVrcw6tLIq7TtZx49vU
	C83fp+WPzFEN5ZnMRINvIY607PjCtv/xT9EQz7DyTkCY/zyPKpnYipn1INC9mSRFO2YfdLFpTt1EV
	GkFuL9wR70UNqXWjXemMars1yt32w2+UOwm6WemhtE3skOwNU8UVQQrxN34lkf2lGmVxUKwa0ADPZ
	V8e/tcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0U9-00000000d7R-1SzX;
	Thu, 08 May 2025 12:36:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0SC-00000000cvU-1u7T
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 12:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F6fnSSy58jOAFukWndBiel7ol37QH7BTey2iymzdWF8=; b=kf13EbWY6nH4CTEek+1j5W9LPU
	Ii1asVxCwHGQqQ6tnUmLzPxmhOh6b5yvgiY/u5L5dDBB5zvF/1Bs0+Rls4tfUpmO4uXfjQjpfup9n
	Gz0nwYNg75iicrSK1tEhosqnimOiDivw6M5n6NOTotHrQU959Dwfvdg18UCz1SF0LxvMDU4oVopX4
	3mOJAcY605tC9kW1oXugSTH9hMEI7dRI6V6murdEau0C+iCuxRQaud6fw5YMiXPBPCHbNtXFodXuA
	wSRrT/p7iJPAKbdpJ2zEqZSa5LBnERRRkqfCxJbLKHLeb5HrBsXrZRzjRo4ykWEaGEwxaYJsn8DOT
	GLyJS6KQ==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD0S8-0000000G2Pt-3UrG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:34:19 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548CXx4r1861770
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 07:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746707639;
	bh=F6fnSSy58jOAFukWndBiel7ol37QH7BTey2iymzdWF8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aTp1UTED+pWJfvS+7BSiGkIivvMcMQWkiuK0Kl5Jp9gYgzAZPNjmnqYX1qHFxQQqi
	 qq7F2x12jl4TZCIbxL5oJnAj4IGVvhlB0teEt41gBXTLQX8TF20X+piNubcEfDm421
	 XGi1G04H4cNdWx2KHbAW+ind4Fb3NapywNq9A3LM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548CXxuG034750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 07:33:59 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 07:33:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 07:33:59 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548CXx0T075359;
	Thu, 8 May 2025 07:33:59 -0500
Date: Thu, 8 May 2025 07:33:59 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bryan Brattlof <bb@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250508123359.k72q4u45wzms7uaw@handpick>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
 <20250508-illegal-caracara-from-hyperborea-b77eda@kuoka>
 <bd33bfa6-9d31-457d-a1bf-66151e92900b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bd33bfa6-9d31-457d-a1bf-66151e92900b@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_133417_319249_6B36BEE3 
X-CRM114-Status: GOOD (  16.79  )
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

On 08:56-20250508, Krzysztof Kozlowski wrote:
> On 08/05/2025 08:52, Krzysztof Kozlowski wrote:
> > On Wed, May 07, 2025 at 10:09:20PM GMT, Bryan Brattlof wrote:
> >> +
> >> +	uart6: serial@2860000 {
> >> +		compatible = "ti,am64-uart", "ti,am654-uart";
> >> +		reg = <0x00 0x02860000 0x00 0x100>;
> >> +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> >> +		power-domains = <&scmi_pds 82>;
> >> +		clocks = <&scmi_clk 322>;
> >> +		clock-names = "fclk";
> >> +		status = "disabled";
> >> +	};
> >> +
> >> +	conf: syscon@9000000 {
> >> +		compatible = "syscon", "simple-mfd";
> > 
> > Not much improved here. You cannot have such compatibles alone and the
> > bindings test this.
> > 
> > Are you sure you tested this?
> I now tested it and I am 100% sure you did not.
> 
> Use tools and computers instead of humans for finding trivial issues.
> This is not really acceptable.

Agree.

Bryan,
In addition to bisect fails in this series, I see the following
dtbs_check errors:

arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: serial@0: clock-names:0: 'fclk' was expected
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: spi@fc40000: '#address-cells' is a dependency of '#size-cells'
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@9000000: 'reg' is a required property

I suggest doing a revisit of this for the next window.

PS: https://github.com/nmenon/kernel_patch_verify is a tool I use and
maintain which might help alleviate some of the easy checklist items -
but this is probably not an authoritative tool and making sure, but if
it helps you, please do use it - it is containerized for easy env setup
(you could run kpv -V -C -L -3 for example on this series and get this:
https://gist.github.com/nmenon/83f7e6924539d1c7e2eb6c5a4ee82706 )

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

