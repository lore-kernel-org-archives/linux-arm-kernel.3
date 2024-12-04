Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61B0E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvLdxoCg2whNqusOckWdCk+BimF7TYRi9/jur9YYrOk=; b=b6eVNm76w7cSdkpdBeGJEEbZnl
	iy8na7ynwHp888KZFFeZFuMbZ+Fm0dB+iqp30eu51V0eLVsKhHlf9ajB0vwZ0OuUANyOhR4WU84ai
	TkkamEh+2iotWUW++EGD1R8FFVm0x5n25MxGtBuehSPymATkgITj0UzcyKbzH56JnNRTlE5Qlj6v1
	ElPfiffHsjhWmE/0d0A+1TSYRduM8QpdCQkzQw4faDN5cX+buzKeVWyoLUY4KDugb1kWLmprmOyIC
	36T6/S5cd+38HJpaQVyjmGJRGwHyYHYogivaf+4+Uh8JciljlGkbk12cOv81dkjk3AZKrRd6TrvU+
	3sQDGCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkC8-0000000BnNj-0mZk;
	Wed, 04 Dec 2024 07:53:12 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkB7-0000000BnFQ-3e4H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 07:52:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B47q32M1757814
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 01:52:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733298723;
	bh=qvLdxoCg2whNqusOckWdCk+BimF7TYRi9/jur9YYrOk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JfPDQiraJHbcleiFqbXaEJfok7m5INVrjh5UfBgZ3uhz5Dw/Yo5U953pAlOcNf5Uy
	 QgTQ0lWT4j3IdaKEn+8t0TXiqgpLY1YDFR2wJTWwKZAVEWWvaME2ADQuIPVFPwR73/
	 kNP6U8NrWaBg59gXw9AC2MrSqzKMzHdb3loJnO/Q=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B47q3b9012229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 01:52:03 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 01:52:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 01:52:03 -0600
Received: from [10.24.69.37] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B47q0QJ114667;
	Wed, 4 Dec 2024 01:52:00 -0600
Message-ID: <e280d338-d05d-4910-8017-bc121eb2b94b@ti.com>
Date: Wed, 4 Dec 2024 13:21:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] arm64: dts: ti: k3-j7*: Add missing ESM and
To: <robh@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kristo@kernel.org>, <u-kumar1@ti.com>
References: <20240425211233.2006233-1-n-francis@ti.com>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <20240425211233.2006233-1-n-francis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_235209_997745_203B5284 
X-CRM114-Status: GOOD (  14.69  )
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

Hi Vignesh,

Pinging on the below old patch series, applies cleanly with 3-way merge on the 
latest tip as well, so should be okay to pick up if all looks fine.

On 26/04/24 02:42, Neha Malcom Francis wrote:
> Add missing ESM and watchdog nodes for the sake of devicetree completion
> of hardware description w.r.t Linux and ESM and WDT enablement on
> U-Boot. This patch series adds the missing nodes for J721E and J7200.
> 
> Boot logs (updated for v3):
> https://gist.github.com/nehamalcom/5dc94ab60f57df5d515d0a6d0da6e0d1
> 
> Changes since v3:
> - added patch (6/6) for adding bootph-pre-ram in main_esm nodes (Udit)
> - no change to boot logs
> 
> Changes since v2:
> https://lore.kernel.org/all/20240412042537.666137-1-n-francis@ti.com/
> - corrected register size for MCU watchdog instance in J7200 (Udit)
> - added Reviewed-by tag (Udit)
> 
> Changes since v1:
> https://lore.kernel.org/all/20240326122723.2329402-1-n-francis@ti.com/
> - modified node name numbering to be in sync with TRM (Udit)
> - disabled wkup_esm node in J721E (Udit)
> - added patch (5/5) for MCU domain watchdog instances in J7200 (Udit)
> Neha Malcom Francis (6):
> 
> arm64: dts: ti: k3-j721e-mcu: Add the WKUP ESM instance
>    arm64: dts: ti: k3-j721e-mcu: Add the MCU domain watchdog instances
>    arm64: dts: ti: k3-j721e-main: Add the MAIN domain watchdog instances
>    arm64: dts: ti: k3-j7200-main: Add the MAIN domain watchdog instances
>    arm64: dts: ti: k3-j7200-mcu: Add the MCU domain watchdog instances
>    arm64: dts: ti: k3-j7*-main: Add bootph-pre-ram to main_esm
> 
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi     | 28 ++++++
>   .../boot/dts/ti/k3-j7200-mcu-wakeup.dtsi      | 26 +++++
>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 94 +++++++++++++++++++
>   .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      | 32 +++++++
>   4 files changed, 180 insertions(+)
> 

-- 
Thanking You
Neha Malcom Francis

