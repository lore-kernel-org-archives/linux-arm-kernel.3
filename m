Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F84DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZYV7FBqCSQGBRIWdWq+9FzQYdNtCwm09qcoVj4sE4w=; b=F8WK5RGTZ2mSBMySnheytHDuNO
	HeA6hDneBQvWYkkoAzzEMLHyOzll0i6rAIgPUW2EO5E+rgEGa878QAhsFWXaY3yjGe5poA3rlvOxR
	OSWyAJjflih5mQva6d05c84aVVjYDopbFeK82uSWaTvFPu8eMkOikJsRzGq9m9TgVzs6iM+18PXcP
	ZK+0FqJbKDMdX0HROB/J6wPjFOJhWnBzoMvpQLcfYsq+wmC4HAxP2hhGzWZR7+eEu7TobG6YbTq0f
	V7AYo7u0w1QPwdwAMmosVRzT3QuZY1Dqv0GROG/jk9HkGvv9gJS83DAKAwqZ1eC9xQM0GzUT3AGIy
	u+e8Epaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsGj-00000004vkf-0U24;
	Tue, 09 Sep 2025 06:55:57 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvnZ2-00000003Yq5-3ZHe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 01:54:34 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5891sCsJ179853;
	Mon, 8 Sep 2025 20:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757382852;
	bh=IZYV7FBqCSQGBRIWdWq+9FzQYdNtCwm09qcoVj4sE4w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uTJo+bCmoQlczta3U1lJEeTCcIiIB2ydxkKLdA/UXdomDK+Y2CpSCz5SH0p5ccBIX
	 WKtMGh1+l5EW0SgXRvnRS58+tyZ7uwnFcEHCZMnmMv+Qq5OcWBaCsfQRFWqffAh7J8
	 vitKwZbNM6aK5yiBCh+Z4uwbTn/dJ/4jZiVWzvqc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5891sCxb3372482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 20:54:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 20:54:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 20:54:11 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5891s5qp1527183;
	Mon, 8 Sep 2025 20:54:06 -0500
Message-ID: <25c1bfe7-0970-4738-b0f5-6778e3111d8f@ti.com>
Date: Tue, 9 Sep 2025 07:24:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-j721e-main: Update DSS EDP
 integration configuration register
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Harikrishna Shenoy
	<h-shenoy@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <r-ravikumar@ti.com>,
        <m-chawdhry@ti.com>, <b-padhi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <aradhya.bhatia@linux.dev>,
        <devarsht@ti.com>, <s-jain1@ti.com>, <u-kumar1@ti.com>
References: <20250907182806.1031544-1-h-shenoy@ti.com>
 <20250907182806.1031544-2-h-shenoy@ti.com>
 <ffcc5d3f-bf3f-47a5-a034-a20c59f93ff1@ideasonboard.com>
 <ab3b7c55-842e-47fe-b7c2-d076da08c3c0@ti.com>
 <cd58cfed-8ec8-4844-aed3-627c3c400a01@ideasonboard.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <cd58cfed-8ec8-4844-aed3-627c3c400a01@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_185433_018474_90639DEB 
X-CRM114-Status: GOOD (  18.63  )
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


On 9/8/2025 11:58 AM, Tomi Valkeinen wrote:
> On 08/09/2025 09:20, Harikrishna Shenoy wrote:
>> On 9/8/25 11:46, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 07/09/2025 21:28, Harikrishna Shenoy wrote:
>>>> Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
>>>> TRM Table 2-1 MAIN Domain Memory Map.
>>>> Link: https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM
>>> What issues does this cause?
>>>
>>>    Tomi
>> Hi Tomi,
>>
>> No issues seen in driver functionality yet, but it might when we enable
>> HDCP,MST which driver supports but not enabled yet.
>>
>> so thought it is better to align as per TRM, hence aligning the size as
>> per TRM.
> You need to explain this in the patch message. What is the current
> behavior/issue, how does this fix it, what are the effects, etc...
>
> Also, here I think it's good to consider what this means for the future
> HDCP, MST work you refer to. Is HDCP/MST just adding driver code, no new
> DT properties or such needed? If so, what happens when a user runs the
> new code with the old dtb, which contains a too small register range?


we can keep to 256 bytes for completeness, but i don't think registers 
are defined beyond 0x20.


>
>   Tomi
>
>>>> Fixes: 92c996f4ceab ("arm64: dts: ti: k3-j721e-*: add DP & DP PHY")
>>>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>>>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>>>> ---
>>>>    arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/
>>>> boot/dts/ti/k3-j721e-main.dtsi
>>>> index ab3666ff4297..3fa7537d5414 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>>>> @@ -1863,7 +1863,7 @@ mhdp: dp-bridge@a000000 {
>>>>             * the PHY driver.
>>>>             */
>>>>            reg = <0x00 0x0a000000 0x00 0x030a00>, /*
>>>> DSS_EDP0_V2A_CORE_VP_REGS_APB */
>>>> -              <0x00 0x04f40000 0x00 0x20>;    /*
>>>> DSS_EDP0_INTG_CFG_VP */
>>>> +              <0x00 0x04f40000 0x00 0x100>;    /*
>>>> DSS_EDP0_INTG_CFG_VP */
>>>>            reg-names = "mhdptx", "j721e-intg";
>>>>              clocks = <&k3_clks 151 36>;

