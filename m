Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B80DC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 04:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gfH0CvoQ7Geo0FA4RUBrH4DyaOF0f+aUMlwOVjCD6Q=; b=l6SysLTrhMhlnyMfxFBdrrOr1q
	p/qIf2DKYaJTALSDfgoU3ijN5jKH78whw+nZRbi6oJetoZmwgmC9NNSfED05j8AC3TTxsuFTHzEnt
	MBojKzNYLdiNBY8yK7RS0kTuaUVC55MrOT3yFvKtjW8vmlVCCB1ee8sDYxf/RFsHSbiE1h5ek/zAy
	0n6rFfyQKTpcrgUIp6mCIhyU9TBiY7HXL9d5oDdtHq1YFBK41anmC3riq15q3en0WNlWd1YfQ2qXA
	mqkBNUPGOTLgTaAKR55ae9UpAOmkaA1PHUzJmTx+GCSnwhFaMyPM2hoc7emwp0Unw5jyS09K3v5fO
	spwArAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RQj-00000009AQZ-1HKq;
	Wed, 23 Apr 2025 04:09:49 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ROm-00000009AKm-1SfH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 04:07:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53N47i4O1431365
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 23:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745381264;
	bh=1gfH0CvoQ7Geo0FA4RUBrH4DyaOF0f+aUMlwOVjCD6Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Wq6yq8rEK6GtFebuJ0ENZhn+v0QoUKiSuMycW1d1Vopdobge/D5R1flS/BGC1q89e
	 LirAC8x7eHLUVZWGPSjF/SsokH7RC4KlPNZ35OpubSeAVaKg2zXEESN1wteblWOXcX
	 I2SMV+MMcUeD1NjrPY/BJ8954gW8Brs36G7YXSXE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53N47ilj081943
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 23:07:44 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 23:07:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 23:07:43 -0500
Received: from [172.24.22.140] (lt5cd2489kgj.dhcp.ti.com [172.24.22.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53N47e57034287;
	Tue, 22 Apr 2025 23:07:40 -0500
Message-ID: <d987c7f7-181a-4d1a-a88c-3b6c5aac6f63@ti.com>
Date: Wed, 23 Apr 2025 09:37:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 switch to 64-bit address space for PCIe0 and PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
 <20250422120042.3746004-8-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422120042.3746004-8-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_210748_509288_18EC0FDC 
X-CRM114-Status: GOOD (  10.65  )
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


On 4/22/2025 5:30 PM, Siddharth Vadapalli wrote:
> The PCIe0 and PCIe1 instances of PCIe in J742S2 and J784S4 SoCs support:
> 1. 128 MB address region in the 32-bit address space
> 2. 4 GB address region in the 64-bit address space
>
> The default configuration is that of a 128 MB address region in the
> 32-bit address space. While this might be sufficient for most use-cases,
> it is insufficient for supporting use-cases which require larger address
> spaces. Therefore, switch to using the 64-bit address space with a 4 GB
> address region.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> [..]
> +			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0xffeff000>; /* 32-bit Non-Prefetchable MEM (4 GB - 1 MB - 4 KB) */

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
>   		status = "disabled";
>   	};

