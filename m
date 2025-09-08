Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F77CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 06:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l23+Neng0o7kEBKx7yVdPxQPupNJB6iM1BraKVuSp+4=; b=IJhSrcDQUBxQVj8tMrYvoWPlJI
	Npqlkk3wSTZXGj1dvgBpYU58E2ppcv00STrNq/aPBQx6OZQ4pA/ENV7/A/BPH39WunJ2y4wV2sXHQ
	JadvjhTc9AEcmjO8egnwYMYMQOV2NLsENEhbD4cNuVY7oTZyETj10T46vgy9ApgOccMyt+76M49Ah
	fktzhZWYFuk2Hbqqoqlg7tLfRuqIMdARDAsS7zxV1FZ2YUm6NnFGY31VR91MuJsbaqBsQvfU6uU1m
	fyJz06MS2uV2dk0Pcm9ydh5/Jg0jqEaoj8gwQUi55XOxnLITcR8UbzgifgTd9S56XzkVN8DodtyVp
	fYK0IaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVIO-0000000ExG4-1GP8;
	Mon, 08 Sep 2025 06:24:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVFY-0000000EwWT-1co6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 06:21:14 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5886L0w93728659;
	Mon, 8 Sep 2025 01:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757312460;
	bh=l23+Neng0o7kEBKx7yVdPxQPupNJB6iM1BraKVuSp+4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UQoqtQN0WEc4D9yIF7VfgmLq2VeYdqTqVjN7g+X8UEYcPOqFR8KnnAq3Iw1ceXeCS
	 73j3rrmhNlA9t6JgTJm+ufHfj9j1Y3uDPb3iv0YBUltILRFa+9JcgPksy6z2GsCXZP
	 zK4yxZq2CrH9ZvcqTldp2RFeGNI3YVq7nZTcvZK4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5886L02Z2756534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 01:21:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 01:21:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 01:20:59 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5886Ks4N120654;
	Mon, 8 Sep 2025 01:20:55 -0500
Message-ID: <ab3b7c55-842e-47fe-b7c2-d076da08c3c0@ti.com>
Date: Mon, 8 Sep 2025 11:50:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-j721e-main: Update DSS EDP
 integration configuration register
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <r-ravikumar@ti.com>,
        <m-chawdhry@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <aradhya.bhatia@linux.dev>,
        <devarsht@ti.com>, <s-jain1@ti.com>
References: <20250907182806.1031544-1-h-shenoy@ti.com>
 <20250907182806.1031544-2-h-shenoy@ti.com>
 <ffcc5d3f-bf3f-47a5-a034-a20c59f93ff1@ideasonboard.com>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <ffcc5d3f-bf3f-47a5-a034-a20c59f93ff1@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_232112_520962_B8177E02 
X-CRM114-Status: GOOD (  13.45  )
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


On 9/8/25 11:46, Tomi Valkeinen wrote:
> Hi,
>
> On 07/09/2025 21:28, Harikrishna Shenoy wrote:
>> Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
>> TRM Table 2-1 MAIN Domain Memory Map.
>> Link: https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM
> What issues does this cause?
>
>   Tomi

Hi Tomi,

No issues seen in driver functionality yet, but it might when we enable 
HDCP,MST which driver supports but not enabled yet.

so thought it is better to align as per TRM, hence aligning the size as 
per TRM.

>> Fixes: 92c996f4ceab ("arm64: dts: ti: k3-j721e-*: add DP & DP PHY")
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index ab3666ff4297..3fa7537d5414 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -1863,7 +1863,7 @@ mhdp: dp-bridge@a000000 {
>>   		 * the PHY driver.
>>   		 */
>>   		reg = <0x00 0x0a000000 0x00 0x030a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
>> -		      <0x00 0x04f40000 0x00 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
>> +		      <0x00 0x04f40000 0x00 0x100>;    /* DSS_EDP0_INTG_CFG_VP */
>>   		reg-names = "mhdptx", "j721e-intg";
>>   
>>   		clocks = <&k3_clks 151 36>;

