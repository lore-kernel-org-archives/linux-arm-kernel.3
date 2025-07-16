Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ECAC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96YPy9Cz6b75Fg+10gBa9dQ34i3KQ+E5Y0QaJuwByK8=; b=2rP7aM2EsnDI8fM0nC9MqipO6Z
	sxd+06H7VlsOMmuiuSTRv4rzt2jX+PNx6O3R+4jbCKdiDQybasb2UsHvyI52TU+VSyCwFEtjM7wUS
	LKESoVD/Ty3297XZeurmg0XmGemrrkoYr39Qf0+69BszIZK/H7rqsR3ErLoOYISK8EZ42/DosZFL9
	eueLNjCVaDqfx7uNLYqMD1Kr7SegPVu9nkIfWNyAmP/ypJyqN6Bu5OM0TwNyPu7+BVpSmlkL3M6kp
	wKhiX82jelFmyFZQ9RSl8Ui48zbRFHO8SEvzC0m3vITrtPWTPqjquslkqFcmViCQ4mLHuHcm+G5mr
	jjv6YoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvEB-00000006q2M-4ByJ;
	Wed, 16 Jul 2025 06:02:52 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuuU-00000006oXt-3nIF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 05:42:32 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56G5gQGj174361;
	Wed, 16 Jul 2025 00:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752644546;
	bh=96YPy9Cz6b75Fg+10gBa9dQ34i3KQ+E5Y0QaJuwByK8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fBE8WM2XgpbwjDoy0MQj5IeJs5KeYID1aIIMUpgQU0OkXTbUbgATZIvQgDoeUy5TF
	 i9VsF0mFsfUf8T992le0BkXXxcLEubtxAtxA9C9t32GAY7shLzJv3UgJr2G36Xa3c0
	 Tm+ihGzns0jPICW2pa6ovGPeIvrHoCUh8HjOnaDw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56G5gQM31782819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 00:42:26 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 00:42:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 00:42:26 -0500
Received: from [172.24.227.166] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56G5gMBn3807419;
	Wed, 16 Jul 2025 00:42:23 -0500
Message-ID: <710b546f-f898-4b20-8302-db0de69a3d80@ti.com>
Date: Wed, 16 Jul 2025 11:12:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-j721s2-common-proc-board:
 Enable DisplayPort-1
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-7-j-choudhary@ti.com>
 <b37efc4e-0959-47a0-8fae-6cb35899752e@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <b37efc4e-0959-47a0-8fae-6cb35899752e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_224231_107915_DEFE38FB 
X-CRM114-Status: GOOD (  14.20  )
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

Hello Udit,

On 26/06/25 16:04, Kumar, Udit wrote:
> 
> On 6/24/2025 1:56 PM, Jayesh Choudhary wrote:
>> Enable DSI display for J721S2 EVM.
>>
>> Add the endpoint nodes to describe connection from:
>> DSS => DSI Bridge => DSI to eDP bridge => DisplayPort-1
>>
>> Set status for all required nodes for DisplayPort-1 as 'okay'.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 89 +++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts 
>> b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> index 793d50344fad..efe857a50bb1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> @@ -93,6 +93,29 @@ vdd_sd_dv: gpio-regulator-TLV71033 {
>>                <3300000 0x1>;
>>       };
>> +    dp1_pwr_3v3: regulator-dp1-prw {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "dp1-pwr";
>> +        regulator-min-microvolt = <3300000>;
>> +        regulator-max-microvolt = <3300000>;
>> +        gpio = <&exp4 1 GPIO_ACTIVE_HIGH>; /* P1 - DP1_PWR_SW_EN */
>> +        enable-active-high;
>> +        regulator-always-on;
> 
> Please check once, if this regulator falls under regulator-always-on case,
> 
> I can imagine a case, where DP1 is not used and still regulator is kept on

Yes it is not required.
I will remove this property from j721s2-common-proc-board and am68-sk
board dts.

Thanks,
Jayesh

> 
> 
>> +    };
>> +
>> +    dp1: connector-dp1 {
>> +        compatible = "dp-connector";

[...]

