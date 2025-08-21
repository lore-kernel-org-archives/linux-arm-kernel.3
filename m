Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E76ACA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTodzFFWSiXr7fBk1+3Kf+pzQra2IVvODX2WGFM/XDI=; b=vAnTYhaSMseRSrb13uAPI0s6D8
	OfmZNq/1oaNDwup5OqluE+j1Azj8a0AW0KBKA7d1qsFqWYV1nRM5S27nfxJyltSxuBTUVUqUQKabT
	pcgpriljoJIFWFtD0TDgVmXCKe+yu+lw1zuVUvenMRvrFEzo02tXE9xmRy1RzNJvrqFeShhRmBRD1
	vvKrQUDDfSwzkmDhyQoV57mg80R5fwdOcZOmiWbPpXIXS0uJTLAexbuwGgivxTdTT7rxVFtyuScsD
	bBb3P2Q1saF9y76Hz6PxMuyIJuYZ/aeeQW+zlO4RRtCdyWOSKB2WSPupX1Fs+OZOXfA2aJ3kr8Wcy
	1/sBYUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozC4-0000000G18D-0ygW;
	Thu, 21 Aug 2025 06:54:40 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyqi-0000000Fxze-1dyf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:32:37 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57L6WWkr425991;
	Thu, 21 Aug 2025 01:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755757952;
	bh=PTodzFFWSiXr7fBk1+3Kf+pzQra2IVvODX2WGFM/XDI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N7o7JX11vIMBLtNwYPs4jBx8cZiyNZ3jGggWH+qCtNf7sji9AJWa8QKE4UHnQ68Dq
	 VfQVS5uAyj+p7sKuAIdgUhT4hHCnSNkOlbLO1p26jCXVPAa/M2ezCrAs+87M6IPs/b
	 LGOmF9/3Ce9Jbjr/BQyMFQP5LIRenNjbAu3pCxZQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57L6WWnZ2336994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 01:32:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 01:32:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 01:32:31 -0500
Received: from [172.24.22.46] (lt5cg1457vgj.dhcp.ti.com [172.24.22.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57L6WQp01726836;
	Thu, 21 Aug 2025 01:32:26 -0500
Message-ID: <77ed674f-8667-4c51-a2f5-0f8545bdc610@ti.com>
Date: Thu, 21 Aug 2025 12:02:25 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/4] Add cpufreq and USB support for AM62D2
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <s-vadapalli@ti.com>
References: <20250820083331.3412378-1-p-bhagat@ti.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250820083331.3412378-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_233236_523685_E1DF8DFB 
X-CRM114-Status: GOOD (  14.92  )
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



On 8/20/2025 2:03 PM, Paresh Bhagat wrote:
> This patch series introduces following changes:
> 
> * Patch 1 fixes the register length in main_pmx/padconfig for AM62D
>  and AM62A.
> 
> * Patch 2 enables USB support for AM62D2-EVM by adding pinmux and device
>  tree nodes.
> 
> * Patch 3 adds AM62D2 SoC to cpufreq-dt-platdev blacklist so that
>  cpufreq is handled by the ti-cpufreq driver instead of the
>  generic cpufreq-dt driver.
> 
> * Patch 4 extends ti-cpufreq to register AM62D2 SoC support by
>  reusing the am62a7_soc_data.

Please don't randomly mix patches into single series. Here patches 1/4
and 2/4 have no bearing on cpufreq driver changes in 3/4 and 4/4. They
even go through different trees.

> 
> Boot Logs-
> https://gist.github.com/paresh-bhagat12/e29d33c3fd92ff17580edf1441ece9f9
> 
> Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
> Schematics Link-https://www.ti.com/lit/zip/sprcal5
> 
> Paresh Bhagat (3):
>   arm64: dts: ti: k3-am62d2-evm: Enable USB support
>   cpufreq: dt-platdev: Blacklist ti,am62d2 SoC
>   cpufreq: ti: Add support for AM62D2
> 
> Vibhore Vardhan (1):
>   arm64: dts: ti: k3-am62a-main: Fix pinctrl properties
> 
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi |  2 +-
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts  | 21 +++++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c      |  1 +
>  drivers/cpufreq/ti-cpufreq.c              |  2 ++
>  4 files changed, 25 insertions(+), 1 deletion(-)
> 


