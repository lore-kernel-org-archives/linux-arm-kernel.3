Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E75EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 04:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDGV/0Aoa/c/919LyIxFIHRXx2XoGKZSGTYaEmgasUc=; b=0guEP7LMkDc8Y+8wnhkfmbwkR9
	bA+rp2zchGwh2S2Oe1loYy4g/yqPxaehhXTk4+a9dZ9uAQ0xbjC/CZ1/amEE7LcLV5KUmsMjFCvg6
	xlSFfzhcMR9nMjOf5s4p3ajpzW2RiiqFixRXtlCpvPzZHnDSoJFwag2QdyJI6R18wwaV2beLq1/ju
	b8tvgoVNdWoJ6rYTAZ0TExfFTlhL2lPliDubxQa6BKHubwwgXSXePmeO5uG6fr0KOVtl0nYZhoKn5
	nWziWva67lHeLF9VTjTUXD/7ykyrEx/0XDIhu/xPMtNtvKXik9FA4i1MlXxYbsx2YDQbV+2RivtyB
	pvqEjN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oJc-0000000Com1-1UHo;
	Thu, 24 Apr 2025 04:36:00 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oHb-0000000CoYT-3qnx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 04:33:57 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O4Xod72389288
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 23:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745469230;
	bh=fDGV/0Aoa/c/919LyIxFIHRXx2XoGKZSGTYaEmgasUc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Z33X49QZqCjyizqqcd44hJhM86fvGd//P+OeewiO3DcSYVLjXk6+tPB2fMlstHjZh
	 f3276PZhXfAUG5iTze/MKIzJUI/rcd3yRb2M4tc6F30y8TmrgyEXfdtGATV8TDomNN
	 wKOpvzWgHT9/EJ6wZ8RZWdO6o/cSI4s03k5yVzns=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O4XoMF113833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 23:33:50 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 23:33:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 23:33:50 -0500
Received: from [172.24.22.140] (lt5cd2489kgj.dhcp.ti.com [172.24.22.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O4XkeA029382;
	Wed, 23 Apr 2025 23:33:47 -0500
Message-ID: <82bc69c3-f540-4b0c-abad-678c7730b188@ti.com>
Date: Thu, 24 Apr 2025 10:03:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: Add basic support for
 phyBOARD-Izar-AM68x
To: Dominik Haller <d.haller@phytec.de>, <robh@kernel.org>,
        <kristo@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>,
        <w.egorov@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <upstream@lists.phytec.de>
References: <20250423133635.29897-1-d.haller@phytec.de>
 <20250423133635.29897-2-d.haller@phytec.de>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250423133635.29897-2-d.haller@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_213356_054913_23223BDE 
X-CRM114-Status: GOOD (  17.05  )
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

Thanks for update Dominik

On 4/23/2025 7:06 PM, Dominik Haller wrote:
> The phyCORE-AM68x/TDA4x [1] is a SoM (System on Module) featuring TI's
> AM68x/TDA4x SoC. It can be used in combination with different carrier
> boards. This module can come with different sizes and models for DDR,
> eMMC, SPI NOR Flash and various SoCs from the AM68x/TDA4x (J721S2) family.
>
> A reference carrier board design, called phyBOARD-Izar is used for the
> phyCORE-AM68x/TDA4x development kit [2].
>
> Supported features:
> * Debug UART
> * 2x SPI NOR Flash
> * eMMC
> * 2x Ethernet
> * Micro SD card
> * I2C EEPROM
> * I2C RTC
> * 2x I2C GPIO Expander
> * LEDs
> * USB 5 Gbit/s
> * PCIe
>
> For more details see the product pages for the SoM and the
> development kit:
>
> [1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
> [2] https://www.phytec.eu/en/produkte/development-kits/phyboard-izar/
>
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> Acked-by: Moteen Shah <m-shah@ti.com>
> Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>
> Notes:
>      Bootlog:
>      https://gist.github.com/dominiknh90/644e753c752b232117e12092e3691124
>      
>      Link to v3:
>      https://lore.kernel.org/linux-arm-kernel/20250417125921.100580-1-d.haller@phytec.de/
>      
>      Link to v2:
>      https://lore.kernel.org/linux-arm-kernel/20250415130458.33714-1-d.haller@phytec.de/
>      
>      Link to v1:
>      https://lore.kernel.org/linux-arm-kernel/20250411101004.13276-1-d.haller@phytec.de/
>      
>      Changes in v4:
>      - set wkup_uart0 to reserved and dropped flow control pins
>      - dropped disable-wp from eMMC node
>      - added bootph tags to pmic regulators for ESM support
>      - picked up Reviewed-by: Wadim Egorov
>      
>      Changes in v3:
>      - added phytec,am68-phycore-som compatible
>      - picked up Acked-by: Moteen Shah
>      
>      Changes in v2:
>      - aliases reordered
>      - stdout-path set to &main_uart8
>      - fixed coding style in serdes0 node
>      - dropped whitespaces in commit message

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>   .../boot/dts/ti/k3-am68-phyboard-izar.dts     | 575 +++++++++++++++++
>   .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 601 ++++++++++++++++++
>   3 files changed, 1177 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
> [..]

