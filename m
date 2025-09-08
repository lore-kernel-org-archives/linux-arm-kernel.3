Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD620CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a/tGsO7tFJN56qqkawWAWzxQN/3WsgosHJOsz5q2PM=; b=G5YFW2Qh6k8GP+OseKyqEsVdxX
	SAIFfuTwajyuE64RdHYIXmJsO53DKZ8zfweynTFoYxs4BrT4PYl27qDW1p0WkTrzl7nzj1swDrt+0
	3ro76OJGVpszRY4lORSqJ43xpHLPqRMCrceQRwGosyUhXax8C7+91Jepoa20TMV6J6a9vGDPR+/4A
	EH6lvCvKdpWz0nZMHXG7ZxDCxJLIjE0u7d0d/u0m/8b1B1pVjXnqqhsZCgP5FEqrR6LszmklOgFHp
	gYdF6hahg4+WmByxgKcbUmuhGs7opVZTCqr2G3QNgPjd3xM994N+nj3Bk7DGiswV7oLc9oceXJ35w
	IQU8JPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTvJ-0000000EbFg-3Tpp;
	Mon, 08 Sep 2025 04:56:13 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTr3-0000000Ea5V-23Ar
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:51:50 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5884pT5N3710709;
	Sun, 7 Sep 2025 23:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757307089;
	bh=5a/tGsO7tFJN56qqkawWAWzxQN/3WsgosHJOsz5q2PM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=naUTLXkZe/CZdVUridvOapJu4TpntdbrzUzH/XFYKLMHE6jyJwpnPkgICNskXnjwJ
	 7woVuoLBtauHi82duCpihCFMiesygGVypuxdP+jOoEVeu/2q/frE07QczCSc/F4yI7
	 r9e3MDcCXRqkpBhgEVQXue7hoWGpOwIvlMrYG8Rk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5884pT302702270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 7 Sep 2025 23:51:29 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 7
 Sep 2025 23:51:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 7 Sep 2025 23:51:28 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5884pNxr283181;
	Sun, 7 Sep 2025 23:51:24 -0500
Message-ID: <a562a287-20ed-4bc7-a6f1-fca60eae0713@ti.com>
Date: Mon, 8 Sep 2025 10:21:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-j721e-main: Update DSS EDP
 integration configuration register
To: Beleswar Prasad Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-ravikumar@ti.com>, <m-chawdhry@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <aradhya.bhatia@linux.dev>,
        <devarsht@ti.com>, <s-jain1@ti.com>
References: <20250907182806.1031544-1-h-shenoy@ti.com>
 <20250907182806.1031544-2-h-shenoy@ti.com>
 <9769c59d-dd5e-495e-8056-0f513a78e1b3@ti.com>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <9769c59d-dd5e-495e-8056-0f513a78e1b3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_215149_625419_E2FA127E 
X-CRM114-Status: GOOD (  11.87  )
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


On 9/8/25 10:04, Beleswar Prasad Padhi wrote:
> On 07/09/25 23:58, Harikrishna Shenoy wrote:
>> Fix size of DSS_EDP0_INT_CFG_VP to 256B as stated in
>> TRM Table 2-1 MAIN Domain Memory Map.
>> Link: https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM
>
> Gives a 404 on the above link?

https://www.ti.com/lit/zip/spruil1 this downalods the zip, refer SPRUIL_DRA829_TDA4VM file.

>
> Thanks,
> Beleswar
>
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

