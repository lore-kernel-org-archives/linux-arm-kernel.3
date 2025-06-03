Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA27C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lYSal3GcLPOQfw4qEh69xNQYPJhEpOr8ui06S4slnE=; b=vjMoYC2cSIf/6g81k8iz1mS0JL
	VIgbqnyRGfn+nA/Trkfk7HQpnbSgM5FeSyPvEnlPv8IR26bUle7OOE4472MV3iXWZUUsidT0NyBPM
	RO+PtN1W1lwOhNAjXaTGypiC71ZWO5CoV0UuQdeDzrHV9zQJwVXpMtm/FRUq8qbtI34kwZcQBf4u3
	5XFzwwKmq1D9KNw1d636Z+ReO4jlD2Ap/yZKoHih7UtXpSa1/LUfISRNzuy9soL4gEAOpj0Ywj+zL
	PawD/KMvDvTGsdvPUYJnDw5Rj1VXvyCFnIntPkksud61vvQZfI6rXkWPMtNS+YDKzfxNqBjpUjMtr
	100lYr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMU7U-0000000BMk9-3uRu;
	Tue, 03 Jun 2025 16:04:08 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMU5H-0000000BMVH-2eUv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 16:01:52 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553G1mhQ510791;
	Tue, 3 Jun 2025 11:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748966508;
	bh=0lYSal3GcLPOQfw4qEh69xNQYPJhEpOr8ui06S4slnE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Avd+XDHTrY0/zOX1CeCoQt0XfNmtcLHzvHkPTR3CxII5xG4AJeVtqAP1az0K8c6wn
	 ZwTjjluDv03dLCE069CMIGGnFF3VfIzr10swomSSwvbJW1twfeuuYDjwtaOIsV40qN
	 ktLowLSeipC8ausfTp9cDy9na4xHaNjknVO1RXz8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553G1mh73862105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 11:01:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 11:01:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 11:01:47 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553G1l0L667428;
	Tue, 3 Jun 2025 11:01:47 -0500
Date: Tue, 3 Jun 2025 11:01:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Udit Kumar <u-kumar1@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
Message-ID: <20250603160147.47orn74obh2lz3qm@rethink>
References: <20250603042448.783956-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603042448.783956-1-u-kumar1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_090151_764369_7E86785F 
X-CRM114-Status: GOOD (  17.99  )
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

On 09:54-20250603, Udit Kumar wrote:
> From: Bhavya Kapoor <b-kapoor@ti.com>
> 
> This commit adds the assigned-clocks and assigned-clock-parents
> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
> property is set to reference the clock identified by
> "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
> correct clock source.
> 
> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
> as the parent clock. This configuration is critical for establishing
> the proper clocking hierarchy, enabling the UART device to function
> reliably across different baud rates.

Please fix the commit message - not clear what specifically in the clock
hierarchy does permit the multiple baud rates.

> 
> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>

You need to add your SoB.
> ---
> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/

Also as Baleswar stated, the $subject needs to be fixed.
> 
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> index 52e2965a3bf5..1146bc5990ea 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> @@ -310,6 +310,8 @@ wkup_uart0: serial@42300000 {
>  		interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&k3_clks 397 0>;
>  		clock-names = "fclk";
> +		assigned-clocks = <&k3_clks 397 0>;
> +		assigned-clock-parents = <&k3_clks 397 1>;
>  		power-domains = <&k3_pds 397 TI_SCI_PD_EXCLUSIVE>;
>  		status = "disabled";
>  	};
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

