Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07FBCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbLWe+luJ8UQUm6A8CsVavRbpzIlHzez8O5PKJ7kgHw=; b=gc1AR4VqZtVjZc5YKbOAnoxu8q
	rC5xdzguRotWEkqRM+kGTxJny7eDfbJkvSEfuytxx2hzMCAo0w5L/e/frsNejrRtcdumBMPvDooVL
	VyLitYG3XF/X8rbkavpjd4KqxDSskpB4SXh30CFTLwEBpldRFcORys2iEKPgwaQHT1KPUypc8H4fq
	piO9OufsdUDu9SRImevQjsF7541V6OHm/i0hZQRJNB4ew/xdAevm7hecZ/rAqZ0kcfu8y7xtCOO5J
	ZmPMTruP32/nKKxmOL7LoZkZt4UFUC94iIoul81vxOUvNhYZP6w7wtNTxsLFLlCETh8IJlk7+s45N
	Ytzrj6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXm-00000005Vr6-39wS;
	Sat, 06 Sep 2025 00:12:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubse-000000042eh-1kKZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 19:13:53 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585JDnsp3818914;
	Fri, 5 Sep 2025 14:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757099629;
	bh=QbLWe+luJ8UQUm6A8CsVavRbpzIlHzez8O5PKJ7kgHw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XgOSuTMrVHuAOmWF9avWPW01ZpMo1MXttiJrjLD3IUeRFKW9j8vWsj9uAxyOgLWgQ
	 zuGX+fSG2U1FL4ITPsc+15lcb7ukcfHniGHqPweM7dm5PaBZanwqhYTtgONbul5prV
	 N6q6Yjuj9qmEEfHBErjSiUBGU3LICwY5mAx/aOow=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585JDnGo567808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 14:13:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 14:13:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 14:13:49 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585JDluN901359;
	Fri, 5 Sep 2025 14:13:48 -0500
Date: Sat, 6 Sep 2025 00:43:47 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 10/33] arm64: dts: ti: k3-am62: Enable Mailbox nodes
 at the board level
Message-ID: <20250905191347.miywnqwn2jqgyptw@lcpd911>
References: <20250905051846.1189612-1-b-padhi@ti.com>
 <20250905051846.1189612-11-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051846.1189612-11-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_121352_552889_564185D4 
X-CRM114-Status: GOOD (  19.21  )
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

On Sep 05, 2025 at 10:48:23 +0530, Beleswar Padhi wrote:
> Mailbox nodes defined in the top-level AM62x SoC dtsi files are
> incomplete and may not be functional unless they are extended with a
> chosen interrupt and connection to a remote processor.
> 
> As the remote processors depend on memory nodes which are only known at
> the board integration level, these nodes should only be enabled when
> provided with the above information.
> 
> Disable the Mailbox nodes in the dtsi files and only enable the ones
> that are actually used on a given board.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
> ---
> v3: Changelog:
> 1. Carried A/B tag.
> 
> Link to v2:
> https://lore.kernel.org/all/20250823160901.2177841-11-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Re-ordered patch from [PATCH 20/33] to [PATCH v2 10/33].
> 2. Added new-line before sub-nodes in mailboxes.
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-21-b-padhi@ti.com/
> 
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi         | 1 +
>  arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts | 2 ++
>  arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi       | 2 ++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 029380dc1a35..40fb3c9e674c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -808,6 +808,7 @@ mailbox0_cluster0: mailbox@29000000 {
>  		#mbox-cells = <1>;
>  		ti,mbox-num-users = <4>;
>  		ti,mbox-num-fifos = <16>;
> +		status = "disabled";
>  	};
>  
>  	ecap0: pwm@23100000 {
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> index 2e4cf65ee323..2eee5f638e0f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> @@ -293,6 +293,8 @@ &epwm2 {
>  };
>  
>  &mailbox0_cluster0 {
> +	status = "okay";
> +
>  	mbox_m4_0: mbox-m4-0 {
>  		ti,mbox-rx = <0 0 0>;
>  		ti,mbox-tx = <1 0 0>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> index bc2289d74774..bbf2d630b305 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> @@ -1317,6 +1317,8 @@ &main_i2c3 {
>  };
>  
>  &mailbox0_cluster0 {
> +	status = "okay";
> +

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

