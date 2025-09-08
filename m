Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D76CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1DCsCbvVvlHL3i6YEowOEl+lxD9y4IQf2zVVjbdl4k=; b=wsM67D3Uq6YIGiXC5VjLswX/J5
	UsyS+bEO/cctL0r51I+T0HL2RegSW7ySC8v0pJMwQ3BXFVU80tHHKy4rVUXmLOMckCVPmseSjKJSg
	oRSVbdAPXefEcliyaAayxHmpdDXe+uxz2y3BgefD1bxVs2UKBBAI6cNxdudVhvVomcXp6B0ATszJA
	iJj2bcQaXOa1opkYATkqPWtV1pirZWnhSaGamIN83cGkUPJzGsbC5b1lnR9NVhqBQg45SGB2QsyNF
	g1COC8okTuHkzTA+o6sMGLoU8vBS1wOKcMngaQZor93UhD7Niqqo7okzXxccnTSF2CtnvUCMXlU1s
	9G5jgn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsC6-00000004prm-1wIU;
	Tue, 09 Sep 2025 06:51:10 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvjIV-00000002Qxq-1U0V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 21:21:13 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588LL6p5187077;
	Mon, 8 Sep 2025 16:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757366466;
	bh=u1DCsCbvVvlHL3i6YEowOEl+lxD9y4IQf2zVVjbdl4k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dbZteMeQS7PgyjkbQWiDyX0T4wpwCyTRUp2rWhq1y0jWdHaesQyYkDWVeJjd66v5x
	 w5s62NwinNziLv96Tam22Hb3lq9o5vMWbkgktVsdNqXLEOOrbEPE5VEII2mraPZCIw
	 +i8zTmYuHdKszc7PUDAbMzoNNk190ny73xOxH0ro=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588LL5li4052299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 16:21:05 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 16:21:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 16:21:05 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588LL4XN1230396;
	Mon, 8 Sep 2025 16:21:05 -0500
Message-ID: <5f5d78e2-5aec-4412-b900-3281c391a444@ti.com>
Date: Mon, 8 Sep 2025 16:21:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: ti: k3-am62p5-sk: Remove the unused
 cfg in USB1_DRVVBUS
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250905051448.2836237-1-a-kaur@ti.com>
 <20250905051448.2836237-2-a-kaur@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250905051448.2836237-2-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_142111_530957_B0CE268B 
X-CRM114-Status: GOOD (  19.89  )
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
> After the SoC has entered the DeepSleep low power mode, USB1 can be used
> to wakeup the SoC based on USB events triggered by USB devices. This
> requires that the pin corresponding to the Type-A connector remains pulled
> up even after the SoC has entered the DeepSleep low power mode.
> For that, either DeepSleep pullup configuration can be selected or the pin
> can have the same configuration that it had when SoC was in active mode.
> But, in order for DeepSleep configuration to take effect, the DeepSleep
> control bit has to be enabled.

The last sentence wording is confusing because it sounds like a 
DeepSleep control bit still needs to be enabled which is not seen in the 
patch. If possible, drop this sentence and do the same for the other 
similar patch in this series.

> Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS pin,
> as the DeepSleep control bit is not set and the active configuration is
> sufficient to keep the pin pulled up. This simplifies the setup and removes
> redundant configuration.
> 
> This reverts commit 115290c112952db27009668aa7ae2f29920704f0.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>

Verified USB disconnect, USB connect, and USB remote wakeup on AM62P SKEVM.

Tested-by: Kendall Willis <k-willis@ti.com>

> ---
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index 899da7896563..e8f0ac2c55e2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -360,7 +360,7 @@ AM62PX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (G20) MCASP0_ACLKR.UART1_TXD */
>   
>   	main_usb1_pins_default: main-usb1-default-pins {
>   		pinctrl-single,pins = <
> -			AM62PX_IOPAD(0x0258, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (G21) USB1_DRVVBUS */
> +			AM62PX_IOPAD(0x0258, PIN_INPUT, 0) /* (G21) USB1_DRVVBUS */
>   		>;
>   	};
>   


