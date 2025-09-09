Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B1CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEgr5tNDDBISJ6Mfe2ROy7COOynN6nLSGh/JDvk/TmU=; b=FT+zAUvmipIlVDijp6nQrFkwj7
	VLgIgS8cQVZ5p8ng8Y66KykhkzGPbneCheGc8ejttzmYvC17tJ84K4EtWVETi9ROllse4/+1QGkbM
	oaVjL26ANNHzk9LbhMTiqp+TE4aSHgSHWILV8KS63H8cUkCwwKiDhq4EjEPZdGkuzTiiwj6z9fTFb
	T2wgMVg5BrA4Dic2F/INumlXhTjYGqKYXWu1VtH9BL48fPEpeopYf/iFuGNWocki5auewEuKE5BT1
	5w3TbKAFYVg/1b3l5gv+daPm6TpTg3sUXmIKKnYOWWmfDAj9ygw5PSH6WLmPIhtaDM9NWcZeAti/h
	BqbCTLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsH4-00000004w9Z-3eJ1;
	Tue, 09 Sep 2025 06:56:18 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo1k-00000003ftU-3QxN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 02:24:14 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5892O885186010;
	Mon, 8 Sep 2025 21:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757384648;
	bh=IEgr5tNDDBISJ6Mfe2ROy7COOynN6nLSGh/JDvk/TmU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hZaGVsCcBUdNYjAfCJY2HfHwxN0MGJbSIwXko2+HNbmYKMtBt1C+ZDFEc716/1Yby
	 M852lgbmzT6/ixQTeTT/JJp3f6qnWfRAKvtKQ4RaUBXUv/XveShvNkzr+bt9/TL/w9
	 bLgvGiym55dvTqNVzkMnZ0b6bAt6aOMz62B7WGRc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5892O8sE3387810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 21:24:08 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 21:24:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 21:24:07 -0500
Received: from [10.24.68.177] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5892O2uw1857858;
	Mon, 8 Sep 2025 21:24:03 -0500
Message-ID: <62f0c51c-3c04-4735-93c6-84766cf0e2a5@ti.com>
Date: Tue, 9 Sep 2025 07:54:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: ti: k3-am62p5-sk: Remove the unused
 cfg in USB1_DRVVBUS
To: Kendall Willis <k-willis@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250905051448.2836237-1-a-kaur@ti.com>
 <20250905051448.2836237-2-a-kaur@ti.com>
 <5f5d78e2-5aec-4412-b900-3281c391a444@ti.com>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <5f5d78e2-5aec-4412-b900-3281c391a444@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_192412_950215_89ED2F24 
X-CRM114-Status: GOOD (  18.13  )
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

Hi Kendall,

On 09/09/25 02:51, Kendall Willis wrote:
> On 9/5/25 00:14, Akashdeep Kaur wrote:
>> After the SoC has entered the DeepSleep low power mode, USB1 can be used
>> to wakeup the SoC based on USB events triggered by USB devices. This
>> requires that the pin corresponding to the Type-A connector remains 
>> pulled
>> up even after the SoC has entered the DeepSleep low power mode.
>> For that, either DeepSleep pullup configuration can be selected or the 
>> pin
>> can have the same configuration that it had when SoC was in active mode.
>> But, in order for DeepSleep configuration to take effect, the DeepSleep
>> control bit has to be enabled.
> 
> The last sentence wording is confusing because it sounds like a 
> DeepSleep control bit still needs to be enabled which is not seen in the 
> patch. If possible, drop this sentence and do the same for the other 
> similar patch in this series.

Sounds good! Removed.

Regards,
Akashdeep Kaur
> 
>> Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS 
>> pin,
>> as the DeepSleep control bit is not set and the active configuration is
>> sufficient to keep the pin pulled up. This simplifies the setup and 
>> removes
>> redundant configuration.
>>
>> This reverts commit 115290c112952db27009668aa7ae2f29920704f0.
>>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> 
> Verified USB disconnect, USB connect, and USB remote wakeup on AM62P SKEVM.
> 
> Tested-by: Kendall Willis <k-willis@ti.com>
> 
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/ 
>> boot/dts/ti/k3-am62p5-sk.dts
>> index 899da7896563..e8f0ac2c55e2 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> @@ -360,7 +360,7 @@ AM62PX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (G20) 
>> MCASP0_ACLKR.UART1_TXD */
>>       main_usb1_pins_default: main-usb1-default-pins {
>>           pinctrl-single,pins = <
>> -            AM62PX_IOPAD(0x0258, PIN_INPUT | PIN_DS_PULLUD_ENABLE | 
>> PIN_DS_PULL_UP, 0) /* (G21) USB1_DRVVBUS */
>> +            AM62PX_IOPAD(0x0258, PIN_INPUT, 0) /* (G21) USB1_DRVVBUS */
>>           >;
>>       };
> 


