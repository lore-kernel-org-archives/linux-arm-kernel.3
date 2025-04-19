Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F74C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha4P1R9eT1HsEdVkTcuCB9B3AC12wmvj0FU1PqsZXek=; b=BWszO9wY/uvR1uIvV3TqcEufIB
	82avonjY6C5f2FcSCPPI91r3bb9S20usSeDomeAKgK1rdwAANEKnq/Vl/WSi6KsKWQleNlYxqKuMV
	3iyCmjb71sOT3cEDvv+IoeOS3PUPc0xLUYtNq8FgiWlXO54hOmWYXQuilNPRdJMmarCLRqicaG2PM
	HObzxxFHv+Ij2O8Le5SA0LmHPiYM3MqNgW+p/ZXOcCOn73kNhDxsOInFI4NNYqBcpF/UaXorLTy5K
	buoEbdDnHkaUgLfalR3RNMNXriR5PA5FMr4CXEKIhwTS2k0CZnepxy4oxDaHKar8v5E5EX1ekOyK5
	9LKJNrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69IP-00000001PAQ-1rJB;
	Sat, 19 Apr 2025 14:35:53 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69GY-00000001Ow4-0cy4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 14:33:59 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEXsRE509844
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745073234;
	bh=Ha4P1R9eT1HsEdVkTcuCB9B3AC12wmvj0FU1PqsZXek=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GmVx0L6A9wMPfMRLsHxEdrj4BsdwDis1J0+LSNf49rjXAtic9fR5A7CdRrZJaeVPg
	 ZBK4/fq5381a/A2+xY7C4onoR7xYDUhkAQP79SAv/7T0cezlk0r0qwV2/ESiSdUej4
	 d6uRBhgXP0sJU6E41U/HLVi0/vsWZLwijK2m52rU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEXsOZ028388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:33:54 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:33:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:33:54 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JEXo1e115318;
	Sat, 19 Apr 2025 09:33:50 -0500
Message-ID: <a64ebeae-c05b-4228-9714-308d655ca383@ti.com>
Date: Sat, 19 Apr 2025 20:03:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Enable ACSPCIE output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250411121307.793646-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411121307.793646-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_073358_236174_85307966 
X-CRM114-Status: GOOD (  12.77  )
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


On 4/11/2025 5:43 PM, Siddharth Vadapalli wrote:
> The PCIe reference clock required by the PCIe Endpoints connected to the
> PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
> and J742S2-EVM is driven by the ACSPCIE module. Add the device-tree support
> for enabling the same.

Please check once if you want to enable PCIe ref clock on AM69 as well.

unlike EVM, this clock is terminated on test point.

Thanks

Udit

> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on linux-next tagged next-20250411.
> The v2 patch is at:
> https://lore.kernel.org/r/20241209085157.1203168-1-s-vadapalli@ti.com/
> No changes since v2. The dtbs_check warnings are no longer seen with
> next-20250411 and no changes were required to the patch itself to fix
> the warnings. Hence the patch has been marked with a RESEND tag.
>
> Regards,
> Siddharth.
> [..]

