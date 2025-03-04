Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27CDC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYxtgv8gS6hl5AADrQ7TWMvqyjIg876+xo08kj/pVYI=; b=rNoOk36bjosTrsktAZ1SWUC8YE
	+F35iuuu9rE3FY1pCMAhEJG8ugWDRbWHyHv/lXfKWHVUsCdo0MiC2qxxHi5rIYLfC+KdevpQrYjTo
	Xm0UTNDygIExIiDK6Gl6Z/wUJHHJFveJQrRF9xy9TrVEN6ysXyHY0KBf8a6WDTjIWsBkL5tU64mRL
	1iYiMJEDh7PhQ9b59HHk/qW8kK6UewXLbKIopYy1XlMV2OB1tSo8nI7W9Ct7a//gzHbA9u3J8ibTG
	1TjSWxBKcCNBJas4A4zyFTN3wst2jQIMW1IF6AZ4fp5uEKeryJM3vCmgPFY9zdyLFi0TQTXW6NZ7J
	nCPAPiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKqt-000000038Xv-40xh;
	Tue, 04 Mar 2025 05:29:59 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKli-0000000382V-2r5m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:24:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5245OORw3546015
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 23:24:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741065864;
	bh=tYxtgv8gS6hl5AADrQ7TWMvqyjIg876+xo08kj/pVYI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oOURtejDCG/0LjzIexNsHfj+4iZ3G/wMSmKYwXccmeK4UB748Go8qSk1Na9K3Nc55
	 9MldjxHdCZvIIo1DOo7Pc/5NzW/ZqdMBiRln9PB5GDzrP07Sc8GLI2kKbIAYMMOHW9
	 ZcRLrI2pULKlLfxGv+C6kJzlH0r3mUkk20w8dpTA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5245OOs3027128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Mar 2025 23:24:24 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 23:24:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 23:24:23 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5245OJj3042162;
	Mon, 3 Mar 2025 23:24:20 -0600
Message-ID: <ed8ce158-89dd-4a81-aa70-679559d6f5b3@ti.com>
Date: Tue, 4 Mar 2025 10:54:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add J722S CSI support
To: Vaishnav Achath <vaishnav.a@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <jai.luthra@linux.dev>
References: <20250218185452.600797-1-vaishnav.a@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250218185452.600797-1-vaishnav.a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_212438_808742_F7B242B4 
X-CRM114-Status: GOOD (  10.92  )
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


On 19/02/25 00:24, Vaishnav Achath wrote:
> This series adds support for CSI2RX capture on J722S EVM
> and enables IMX219 and OV5640 overlays to enables
> 4 sensors on EVM, this provides a reference for a user to
> enable a different sensor on any of the ports.
> 
> Test logs:
> IMX219: https://gist.github.com/vaishnavachath/60cc2ef257601f27f28a315f8cf669c4
> OV5640: https://gist.github.com/vaishnavachath/648202286d4d34d4d25f7c8c9db8b8bd
> 
> Vaishnav Achath (5):
>    arm64: dts: ti: k3-j722s-main: Add BCDMA CSI overrides
>    arm64: dts: ti: k3-j722s-main: Add CSI2RX nodes
>    arm64: dts: ti: k3-j722s-evm: Add camera peripherals
>    arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
>    arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
> 

For the series:
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

>   arch/arm64/boot/dts/ti/Makefile               |   9 +
>   ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 304 +++++++++++++++++
>   .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 319 ++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts       |  28 ++
>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 193 +++++++++++
>   5 files changed, 853 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> 

