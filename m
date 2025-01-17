Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69212C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEr1Xvs22RlddhDsHQA3msHd0/qV9WQzcPROpxvZXpg=; b=cqyr+he6cVDhz4T61TBt8O2egS
	tlv7OhhmwErHTqgxx7IanngUQxRzfrpMKj2cN+vCK1+xkSSM5oTqC1O4KSb09n2rNUeUKKj3Mu2YT
	lM7SfLZRGktjxpEeu6G3HzRoG7X4UgGSXMVr8VLV4kOR5ioNtv4xlOVl1EIGdJYwlxezzl9JCV9zg
	ko77MTdcMztW5D8a30moSiB3UNYcZhsVcXA5vv+8uTJGOupyNKII9ev2FonOBIiK7ExnG9Afzv4ly
	ks3W1pv/sWKQgd2S26UDMUfwUnvr87keF+vvV4sL4E5NoaXuH8tbi6OdMV3AVfuRIK4R64+JTz18w
	m/jN5aYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoUq-00000000eNi-2xQq;
	Fri, 17 Jan 2025 15:42:56 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo0u-00000000ZXv-0d7c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:12:02 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HFBlFr215662
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 09:11:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737126707;
	bh=pEr1Xvs22RlddhDsHQA3msHd0/qV9WQzcPROpxvZXpg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WUg4+z2/nk/gpXgsskTFGneUyFN+wXG7BauEHiIJMiAuo6BLBF8F3F2sTJoiStvti
	 5+pVjC0DOzxPMYKUEXVB2h0xIDK3nUn33DcH2p0k+aWqUWbm6kE+ohKg/T0A6gW3Dh
	 KfKzJ9XY9OymR7DfJbEeGTE3dZsC5Qp3PakzpwA8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HFBlte024293
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 09:11:47 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 09:11:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 09:11:47 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HFBlEC031669;
	Fri, 17 Jan 2025 09:11:47 -0600
Message-ID: <e7c34c5f-b039-4ead-bb50-13a98efdb0c4@ti.com>
Date: Fri, 17 Jan 2025 09:11:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Misc MMC updates
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
References: <20241014194722.358444-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20241014194722.358444-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071200_315276_0B2CFEDB 
X-CRM114-Status: GOOD (  12.54  )
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

Hi all,

Is there any issue with these patches?

Thanks (:

~ Judith

On 10/14/24 2:47 PM, Judith Mendez wrote:
> In this patch series we remove/add MMC DT
> properties:
> 
> - disable-wp
> - non-removable
> - ti,itap-del-sel-legacy
> - ti,itap-del-sel-mmc-hs
> 
> for am62x, am62ax, am64x, and/or am65x family devices.
> 
> Patches 1/3 and 3/3 have only been built tested.
> Patch 2/3 has been boot tested on am64x IDK board.
> 
> Judith Mendez (3):
>    arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
>    arm64: dts: ti: k3-am65-main: Add missing itapdly to sdhci0
>    arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
> 
>   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 2 +-
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 1 -
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 2 +-
>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
>   arch/arm64/boot/dts/ti/k3-am642-evm.dts        | 1 -
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi       | 2 ++
>   arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 -
>   7 files changed, 5 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 5b035d14a508efd065895607ae7a6f913b26fef8


