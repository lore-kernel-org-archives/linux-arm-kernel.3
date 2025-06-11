Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5AFC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/cyKR2BsbAs5v8uav5PPYzVgWDC4zvIuT9U7aRUONw=; b=3mN2ZT7vmEJ8ZoOehlPm2JspVk
	YlF1AdpO7jFb+hpBtpuJtbhTSJTKhWoODyj2zJOOcae6rUwISj7f3IwHgu8qBGEL42pPJReON+l3N
	dcLHxHJKKb3GMY4FysZZys532wIz6mDN+SCHpfWlyl5VRIhmKMhP0wVJP8UJ3vpalMzpqhLyKZmDl
	qAmB91zCmPK0Lkwc6Gs+bpDQJGKHt/UXO0WPeBiDdYh8LunSzZOSwinb+Gw5HLv+eppOsh00uXKME
	eU625hzgHhzdHR9C3J/eTlFsIv9yKoRzpXKumwCG+Wm2Bb8KbEtS8xQXckN3lgRjnx6bT5mD3seQT
	zZmkvyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkd-0000000A9Kf-0dlF;
	Wed, 11 Jun 2025 14:48:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPH4E-00000009KsQ-0pze
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 08:44:19 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B8i8Ua2533730;
	Wed, 11 Jun 2025 03:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749631448;
	bh=r/cyKR2BsbAs5v8uav5PPYzVgWDC4zvIuT9U7aRUONw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=moCuXXqHLP+0D+vqVQclCh4tbsQ6iiR+bG+lhm8pX4ZJnIL/an6z/l1VSujr3cn1z
	 /HCQEYpwIMR40v9FfCK/p7CrzFreXytB4r8iwWqK7RTwG+2gVosKZgQXvWbj8bs1Yt
	 CZgMYs6cADT1VuUBIYjOebRulZ4I82SdpfkYFnSc=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B8i8Xt1593423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 03:44:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 03:44:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 03:44:07 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B8i4VB067349;
	Wed, 11 Jun 2025 03:44:05 -0500
Message-ID: <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
Date: Wed, 11 Jun 2025 14:14:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
To: Hrushikesh Salunke <h-salunke@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <danishanwar@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20250610054920.2395509-1-h-salunke@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_014418_345702_03D99E6F 
X-CRM114-Status: GOOD (  15.45  )
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



On 10/06/25 11:19, Hrushikesh Salunke wrote:
> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
> functional at all stages of PCIe boot process. Thus add the
> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
> ---
> This patch is based on commit
> 475c850a7fdd Add linux-next specific files for 20250606
> 
> Changes since v1
> As per feedback from Nishanth, changed the position of "bootph-all"
> tag, according to ordering rules for device tree properties.
> 
> v1 : https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/
> 
>  arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> index 432751774853..a7e8d4ea98ac 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> @@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
>  		max-functions = /bits/ 8 <1>;
>  		phys = <&serdes0_pcie_link>;
>  		phy-names = "pcie-phy";
> +		bootph-all;
>  		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
>  	};
>  };

Are the patches for PCIe boot support merged to U-Boot or such other
bootloader repo?

-- 
Regards
Vignesh
https://ti.com/opensource


