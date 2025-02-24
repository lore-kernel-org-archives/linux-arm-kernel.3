Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC23C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5raQfcZhDMhumdfr8jxuCUsBCb/cAX6lrocettlzYYo=; b=S8pOv61aCLXQFjfsKeAUktIj+Q
	HMzs2S1urkG9jXyuNggUhtGfolIZ+GCZvA2A69ZLqFNlV5IiWLj4XMQY1HNZQj+V4CXX35euF54+X
	m2eEmcfi8eMrNH75HEdjilPiqRHZ4MGHm3squMu+MbMykdu86F+8sW68owO6MzMRxtGSqAT2t0CWK
	9nKBGyvdGbVyKYsWkzDcC4qiv/996+6UZ48QxM3TxmpOk+wO2Hk5PyQcIxTjrgAooWTr3mdlaH+DC
	ZDbixBDXPavKnpt3S9Jz+TyCxEnM0y77qzVHFHWChw6PeuFdQfgX/jgyuU3fahiJrmaBx5aHdAyjA
	m6xbqOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXLp-0000000De48-2qhN;
	Mon, 24 Feb 2025 12:14:21 +0000
Received: from [198.47.19.245] (helo=fllvem-ot03.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXBD-0000000DakJ-1x0u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:03:25 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OC3HQw884652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 06:03:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740398597;
	bh=5raQfcZhDMhumdfr8jxuCUsBCb/cAX6lrocettlzYYo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=s8B48YN6RXbPyYcRP3wjIDrfdeyLzL/aICw32+tMLtDI7d+3xRXAMeeM0d0NcdXRl
	 YhaRDfeDpYzbsne2U1IOxxWSW3qxm0IEu7HeayWBnEcNA0cPkQ6T41QKBbO2Dp8LOC
	 U5+BDYi+wNCITyJankazxTQ5wpe0W9Yyqv85X46w=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51OC3HNE006194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 06:03:17 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 06:03:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 06:03:16 -0600
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OC3BEA070806;
	Mon, 24 Feb 2025 06:03:12 -0600
Message-ID: <0d871153-e4dd-42d1-aafa-b6ed1e4e5a10@ti.com>
Date: Mon, 24 Feb 2025 17:33:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: Robert Nelson <robertcnelson@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Andrew Davis
	<afd@ti.com>, Roger Quadros <rogerq@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>,
        Andrei Aldea
	<a-aldea@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
References: <20250211181839.1575497-1-robertcnelson@gmail.com>
 <20250211181839.1575497-2-robertcnelson@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250211181839.1575497-2-robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_040323_641062_22542CCF 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

Hi

On 11/02/25 23:48, Robert Nelson wrote:
> BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> PocketBeagle.  It is based on Texas Instruments AM6232 SoC. Its dual
> A53 cores can provide higher performance than classic PocketBeagle.
> The new design comes with pre-soldered headers, a 3-pin JST-SH 1.00mm
> UART debug port, a USB-C port, Texas Instruments MSPM0L1105 Cortex-M0+
> MCU for ADC, 512MB RAM, and a LiPo Battery charger.
> 
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-
> 
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Vignesh Raghavendra <vigneshr@ti.com>
> CC: Nishanth Menon <nm@ti.com>
> CC: Andrew Davis <afd@ti.com>
> CC: Roger Quadros <rogerq@kernel.org>
> CC: Siddharth Vadapalli <s-vadapalli@ti.com>
> CC: Judith Mendez <jm@ti.com>
> CC: Andrei Aldea <a-aldea@ti.com>
> CC: Jason Kridner <jkridner@beagleboard.org>
> CC: Deepak Khatri <lorforlinux@beagleboard.org>
> CC: Ayush Singh <ayush@beagleboard.org>


Please run make dtbs_check and fix the reported issues. Eg.:


+arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts: /bus@f0000/pinctrl@f4000/main_i2c2-default-pins: Character '_' not recommended in node name

[...]

> ----- 
Regards
Vignesh
https://ti.com/opensource


