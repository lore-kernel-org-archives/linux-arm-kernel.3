Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B036C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 04:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCimBujHJQrKhwUSEA/OCXaC4BwwJPUOT3BLppQHNzw=; b=XlhtY8qSWTv1x6dB6zkyKsT0p8
	Wmu7gTY0Lk6fdL+LMfApEiJ1w5W1dBAdOPyioKjzly/O20ooFSL9suYbiNm3lgpVA/fZnyzzj46Yv
	B/NdCufL6jgqp+juz2Oka6IWq/nwAWbSgBqmqu4XMAKAV4CeUrTEymaRpAwrZRd34oDLo9WTw8/Y/
	mnIJp3ZdGt0gstqi6lK+kd1XMYn2sSR3jd3olcKP2MNfRlONkFTY7JLoBhwpIKs/cyVQ+AWNhQFAR
	dFSmAKdtZLrKBE97W1x6REQwF/Eby7B56LPjSsdW3JDwx8IRK5KLhgG15wxjcurIshWeUZlY5GUoo
	vopyxsSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdyt-0000000AZpM-3z25;
	Thu, 26 Jun 2025 04:12:59 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdwb-0000000AZiA-0skR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 04:10:38 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q4AXAO2344653;
	Wed, 25 Jun 2025 23:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750911033;
	bh=UCimBujHJQrKhwUSEA/OCXaC4BwwJPUOT3BLppQHNzw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yoBW9BSuJVEKVc18rrAGHqZCci3vgMjDNl+uJ1iqgNwpOeUiLUD634vahEQ/DV5mK
	 0BHOaai5leUj+7uMjjHgHWXJlTjHnuXA1JUk2ruiLJvG/H84OLO+12HH3ZZr53N7HC
	 eB2reJyW8FbUyzxX5ycixFoULzPBUNIIb1359Y/s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q4AXYs3228081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 23:10:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 23:10:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 23:10:33 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q4ATdY343785;
	Wed, 25 Jun 2025 23:10:30 -0500
Message-ID: <2e397dbf-ac5c-49d3-8176-2022450bf0e2@ti.com>
Date: Thu, 26 Jun 2025 09:40:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add support for K3 BIST
To: Neha Malcom Francis <n-francis@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250605063506.2005637-1-n-francis@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250605063506.2005637-1-n-francis@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_211037_348944_88898EB5 
X-CRM114-Status: GOOD (  15.63  )
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



On 05/06/25 12:05, Neha Malcom Francis wrote:
> BIST (Built-In Self Test) is an IP responsible for triggering hardware
> circuitry tests on both logic as well as memory blocks. This driver is
> currently being upstreamed in U-Boot [1] (on hold till the dt-binding
> is approved here) and triggers these tests on cores. This patch series
> adds the dt-binding as well as a node for BIST on J784S4 and J742S2.
> 
> Changes since v3:
> https://lore.kernel.org/all/20250514072056.639346-1-n-francis@ti.com/
> - Udit
> 	- add support for J742S2
> 
> Changes since v2:
> https://lore.kernel.org/all/20250328111439.374748-1-n-francis@ti.com/
> - Krzysztof
> 	- use existing common definition (ti,sci-dev-id) for grabbing
> 	  the device ID instead of redefining properties
> 
> Changes since v1:
> https://lore.kernel.org/all/20241128140825.263216-1-n-francis@ti.com/
> - Krzysztof
> 	- move from misc/ to soc/ti/
> 	- minor property changes
> 	- drop ti,bist-instance and instead opt for ti,bist-under-test
> 	- correct example dt
> 
> [1] https://lore.kernel.org/all/20250204123147.939917-1-n-francis@ti.com/
> 
> Neha Malcom Francis (2):
>   dt-bindings: soc: ti: bist: Add BIST for K3 devices
>   arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node
> 
>  .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
>  .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 11 ++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml
> 


Nishanth,

Ok to take the dt-bindings via ti-k3-dts-next branch? Or would you
prefer to queue bindings and DT changes separately?

-- 
Regards
Vignesh
https://ti.com/opensource


