Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8DBCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHbxk4G3dD2LMx2NeIsopF4l2D9Ue6grU65JJ7uOsM8=; b=OWfJ3kjaMqY707bVM4yFUbLh7V
	PJjmBdrw8YikjC80Ooq12GvZvq3nKl/wohdRW+BF70xJgDmPVCfclhiM8g8SpHUISBomTKGkFOR8t
	Qz61EAM86NVPcqbk9DGRxIx1+Ohz5jg/pf8JGtQMzZGm7THAfpYp89TnO9ggxiDkYDXg9gqKD+eUV
	OcE8iUhioL7fKbvhVLd2LUPUPXYBHGhjhmHNjDtuRsJmq/iTwTWgXPg3FdMSOAuAB+Tz/g1UX2QRL
	Xb3y0mqAaG1/FhdwLQf26XtHD2y+XEOz6YzFVxPVI2nxa8ly+yOk7uS9PtEOx+gwDjhodGKWEwpi3
	uTai5KsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTsZ-0000000Eajh-3cE4;
	Mon, 08 Sep 2025 04:53:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTpm-0000000EZkU-3Jgq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:50:32 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5884oMbF3783000;
	Sun, 7 Sep 2025 23:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757307022;
	bh=UHbxk4G3dD2LMx2NeIsopF4l2D9Ue6grU65JJ7uOsM8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=PwOSnvJZFjq6g7KO6sslNnZFLIe0mH7cZ11iFSgTYkwmm0kEW8D3RNJym1/aL6j8P
	 tc8VvYoGqd6pACv0GzhkyQsdI0TeDQyW2TPOTqIOzLc+i/dFTJlknJIDYf2bBzBle4
	 yXDun2ZdZ10qE0o0lWqSbyQk4/juJzJRvO0B/iMU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5884oM9x3506260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 7 Sep 2025 23:50:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 7
 Sep 2025 23:50:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 7 Sep 2025 23:50:21 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5884oGt04185829;
	Sun, 7 Sep 2025 23:50:17 -0500
Message-ID: <d7031274-efac-4837-a8c2-9efef094d71c@ti.com>
Date: Mon, 8 Sep 2025 10:20:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Update DSS EDP integration configuration register
To: Beleswar Prasad Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-ravikumar@ti.com>, <m-chawdhry@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <aradhya.bhatia@linux.dev>,
        <devarsht@ti.com>, <s-jain1@ti.com>
References: <20250907182806.1031544-1-h-shenoy@ti.com>
 <20250907182806.1031544-3-h-shenoy@ti.com>
 <7cf605e3-e1be-43e4-ba14-c1310b4f5869@ti.com>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <7cf605e3-e1be-43e4-ba14-c1310b4f5869@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_215030_926308_A0FA26AE 
X-CRM114-Status: GOOD (  13.08  )
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


On 9/8/25 10:07, Beleswar Prasad Padhi wrote:
> On 07/09/25 23:58, Harikrishna Shenoy wrote:
>> Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
>> TRM Table 2-1 MAIN Domain Memory Map.
>> Link:https://www.ti.com/lit/zip/spruj52/SPRUJ52-J84S4 AM69A TRM
>
> Broken link

https://www.ti.com/lit/zip/spruj52 , this link will download the zip and refer the SPRUJ52-J84S4 AM69A TRM.

>
>> Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
>
> Above commit only refactored the changes and carried the bug.
> The commit that introduced this bug should be:
>
> 603669b16701 arm64: dts: ti: k3-j784s4-main: Add DSS and DP-bridge node
>
> Thanks,
> Beleswar
Noted
>> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> index fbbe768e7a30..f0cda14c2530 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> @@ -2573,7 +2573,7 @@ port@1 {
>>   	mhdp: bridge@a000000 {
>>   		compatible = "ti,j721e-mhdp8546";
>>   		reg = <0x0 0xa000000 0x0 0x30a00>,
>> -		      <0x0 0x4f40000 0x0 0x20>;
>> +		      <0x0 0x4f40000 0x0 0x100>;
>>   		reg-names = "mhdptx", "j721e-intg";
>>   		clocks = <&k3_clks 217 11>;
>>   		interrupt-parent = <&gic500>;

