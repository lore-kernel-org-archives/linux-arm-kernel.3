Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478DFCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo2EFkzOaChPuvJidrt2tQqO/I5DDfDOd/qxOfVZ3Nk=; b=0/jLUUCmJJs/KoU5+THthmeRms
	jmmDZtt8o/ObBSRVziDhV07Blw2Pds/W/TCLcUJ/bSuSpcml+TDNKM9L6c503UbNmxWdvAGvK1u5K
	Xsg8fKiBnshjlNMxrdxcWKnGA7a1wy3ACKqm8Fo5NtzwQNdtym8bvrOHN8lp8OFv0sKQdRsXU5ctk
	RtIAkSibmADWA4nojPrAOsvxflatN9VE7N8nk9UwqUQPKILAizn5+niBEYxim/rH8Jg1uLo5N5QUN
	/+voZL22PRZd4M/kJqry82++L+dcRFp4xfNSiGH3+7fJ+JcVmFSA1weJVGB7E4pk90umoncbJ/Z/U
	cjB4OPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsCc-00000004qUo-0nvb;
	Tue, 09 Sep 2025 06:51:42 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvjat-00000002XDC-0KnC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 21:40:12 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Le7wl3878309;
	Mon, 8 Sep 2025 16:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757367607;
	bh=Mo2EFkzOaChPuvJidrt2tQqO/I5DDfDOd/qxOfVZ3Nk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VG5JY9JKGvbSfigMkJ1Ng1EGEa0XjeiPKmqSGSrvSAQuPfDCTgemWX/1BmT4xwexn
	 nSTuUn7Dv6IKX+XV/QVkZK1kq3SebifpKlTK/auVS/Uy6NL7glAU4r/TszA/p2/d8H
	 QsEbhCf4DWvQrnfiBEk2dMSWO+3K9wSeFsl+0/eQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Le7L12683429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 16:40:07 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 16:40:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 16:40:06 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Le6T11545093;
	Mon, 8 Sep 2025 16:40:06 -0500
Message-ID: <aef2df4a-7266-4e81-add2-3e35a081f5b0@ti.com>
Date: Mon, 8 Sep 2025 16:40:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: ti: k3-am62x-sk-common: Remove the
 unused cfg in USB1_DRVVBUS
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250905051448.2836237-1-a-kaur@ti.com>
 <20250905051448.2836237-3-a-kaur@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250905051448.2836237-3-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_144011_211360_4880EBED 
X-CRM114-Status: GOOD (  17.56  )
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

On 9/5/25 00:14, Akashdeep Kaur wrote:
> After the SoC has entered the DeepSleep low power mode, USB1 can be
> used to wakeup the SoC based on USB events triggered by USB devices.
> This requires that the pin corresponding to the Type-A connector
> remains pulled up even after the SoC has entered the DeepSleep low power
> mode.
> For that, either DeepSleep pullup configuration can be selected or the pin
> can have the same configuration that it had when SoC was in active mode.
> But, in order for DeepSleep configuration to take effect, the DeepSleep
> control bit has to be enabled.
> Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS pin,
> as the DeepSleep control bit is not set and the active configuration is
> sufficient to keep the pin pulled up. This simplifies the setup and removes
> redundant configuration.
> 
> This reverts commit 527f884d2d94981016e181dcbd4c4b5bf597c0ad.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>

Verified USB disconnect, USB connect, and USB remote wakeup on SK-AM62B-P1.

Tested-by: Kendall Willis <k-willis@ti.com>

> ---
>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index 13e1d36123d5..d3bed23134ca 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -249,7 +249,7 @@ AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19/V15) RGMII1_TX_CTL */
>   
>   	main_usb1_pins_default: main-usb1-default-pins {
>   		pinctrl-single,pins = <
> -			AM62X_IOPAD(0x0258, PIN_OUTPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (F18/E16) USB1_DRVVBUS */
> +			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18/E16) USB1_DRVVBUS */
>   		>;
>   	};
>   


