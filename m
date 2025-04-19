Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0A5C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpvR0IMuxPw5kJWlGO1BLJ0osU8LqFro9Urc9PQGvVg=; b=yJ7j9KaBnz1E3Uubu9R61lHlhu
	oE2jxiM/MfH+JJyY8rXv/zHXt763JvrtPAcnuVTkiEetVx1IcY1/K/Ht4am8qkxPK/YB3ffCZ1qhU
	fJvOkO8dNQPXHhG7Cf9jxgMwlX+aJsPf4Blwa9jmt4uiD3d5NNIdE15PlHSOqxLB/0nuLEb7zHYQ0
	1HKuyKbqnDvHIHXc3QD9TCoDhjQctGKilDRih/UCdmTWUYFeCf9VgkyOg0aNpFQMtXBkZchqtI5st
	Wm1tNw7Hcc4vgwWrUFfoogwTTqF1yvjtL7Y+DTgEmXzSptvsi6t6lV6+AsxEuLA84EELxVb77xRur
	TbIJmGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69iy-00000001RVS-2sdY;
	Sat, 19 Apr 2025 15:03:20 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69gV-00000001RCF-17AE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 15:00:48 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JF0hPB513772
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 10:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745074843;
	bh=PpvR0IMuxPw5kJWlGO1BLJ0osU8LqFro9Urc9PQGvVg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EAQRyIKSsaMabiLJCmwqQnB8iDfG6UitSt5j0jXC88IPe13DYlDKECLEZN0UoSJuJ
	 ycfDo/3Ykl8qJVW1d+VP3JYgq2X07kslg0Gt2wHtQFDCGT/DKKKECOnHkouuUKSCVJ
	 IezQfQR6gKiOm/tvb63kcwYU8g4sgeuPV/dM/5Gs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JF0hWU013292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 10:00:43 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 10:00:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 10:00:43 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JF0dG0012676;
	Sat, 19 Apr 2025 10:00:40 -0500
Message-ID: <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
Date: Sat, 19 Apr 2025 20:30:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417233040.3658761-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_080047_394328_A920CCF5 
X-CRM114-Status: GOOD (  12.72  )
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


On 4/18/2025 5:00 AM, Judith Mendez wrote:
> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
> for eMMC. This change is necessary since DM is not implementing the
> correct procedure to switch PLL clock source for eMMC and we have a
> non-glich-free mux. To remove any potential issues, lets switch back to
> the defaults.

IMO, we need to fix DM  if not then documentation [0] .

Then only this patch is ok because as per document [0]

removed clock by this patch is valid parent for eMMC.

[0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html

Thanks

Udit

>
> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral nodes")
> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 instance")
> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>   3 files changed, 6 deletions(-)
>
> [..]

