Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3087EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWmzUqKrcVoL1as9gAY2jOX82Zk8BVied/NoOb4adzo=; b=cV6VDn72KbJjKQ7jtmfeATk5xI
	iuw0I+b71iyeh5/T1Pe5kyrSAELjpbKyfyt2ABMUJbB1ANjYtpAjiZplF9cgDsc3R+X4i8z3aDMaV
	ivRUFgNpNOBLHACbFdpjwZsMYkcqmefYSl4q0+7FQXl8PB4Xp/ZeH6fehJMvGYBXWByVWaVxcX/Jc
	77SHtjRI6ZPS272Dgo1GwhWrSuB8NkoV3No37dyApjz5JZPH9IOK4MLU7PxZAcAc59R+ljpQH3LBd
	CudS2K0DRgwMjYQcxFHfVOgywPvzr4f/InhA5h6ylfLPKRDSYjYAjZP/Yk+7EYz9rMwoq+d1ougsM
	d7WwHg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNqK-00000007dze-02Nr;
	Wed, 09 Jul 2025 05:59:44 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNiU-00000007dC9-1v1F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 05:51:40 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5695pXLN722034;
	Wed, 9 Jul 2025 00:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752040293;
	bh=uWmzUqKrcVoL1as9gAY2jOX82Zk8BVied/NoOb4adzo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qgicJCkSmjf1noVZyhgFoetrqIx45c6Z1Hf1tz7wp4n7oy9i9CQLda4UccZE3vB6/
	 YMuFVB4rXejjQW81g5nkbl5fg1zyUKpoklnb7u9lckfig7C7WOjlEyLkdeCeUbSYh3
	 F8DKtRUM8206IqKplwUDGsHbsUHqqxQBtt2ZTWdo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5695pWvu2168926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 00:51:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 00:51:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 00:51:32 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5695pRhx3408594;
	Wed, 9 Jul 2025 00:51:28 -0500
Message-ID: <a8e83bd1-89bf-4288-8953-15cdfd9549b5@ti.com>
Date: Wed, 9 Jul 2025 11:21:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] arm64: dts: ti: Add pinctrl entries for AM62D2
 family of SoCs
To: Rob Herring <robh@kernel.org>, Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
References: <20250708085839.1498505-1-p-bhagat@ti.com>
 <20250708085839.1498505-4-p-bhagat@ti.com>
 <20250708202259.GA904737-robh@kernel.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250708202259.GA904737-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_225138_658895_8AB94ED2 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Rob,

On 09/07/25 01:52, Rob Herring wrote:
> On Tue, Jul 08, 2025 at 02:28:38PM +0530, Paresh Bhagat wrote:
>> Update k3-pinctrl file to include pin definitions for AM62D2 family of
>> SoCs.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> index cac7cccc1112..0cf57179c974 100644
>> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> @@ -63,6 +63,9 @@
>>  #define AM62AX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>>  #define AM62AX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>>  
>> +#define AM62DX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>> +#define AM62DX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>> +
>>  #define AM62PX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>>  #define AM62PX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
> 
> Why is the same expression just repeated over and over? Looks like this 
> needs some refactoring.
> 

Is the comment wrt having another common macro (for better code reuse)
for the right hand side here?

Or is the comment wrt having differently named macros for each SoCs?
Having per SoC macro is intentional so to avoid backward compatibility
issues when these SoC macros deviate in future


-- 
Regards
Vignesh
https://ti.com/opensource


