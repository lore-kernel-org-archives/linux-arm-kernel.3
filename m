Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A779BCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6UYJC51NYe1UdxgpY6BB6KX3ic2M6p4On67tOl2V/M=; b=SeWB2cHymJHBsqcc+0vCIYUm0J
	jkbFvViJV/kkq9D9bcX+7ZSu2ZuDJgYSuJJ4y6pZrBN59LbheJyCrzKnVLdxhbk249TwJUax6MU0k
	2iMLnAerLVaV8C+ZXHBWVPKLYuw/iHp+jIUEbaMdXR91EoqLE4/P9GHg1efPSjJmWilbMT80XGLI8
	IRTngDmy3GrermOxH9lv9aKBN04EEdNJOT70bKTKWnftAlxO6QKH8CyBus/rF1E1qZPgHUNQ5Ljgy
	hqYrb/OebttGSeYQxDMjQQ3mfHQQY7BHMtYwGm+wacEe9tj33uwIARUIFajChZo81/MxTHEvcYhHl
	/qSAucjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw223-00000008xyH-12PS;
	Tue, 09 Sep 2025 17:21:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzgb-00000007rmg-0EuF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:51:10 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589Ep5q04047902;
	Tue, 9 Sep 2025 09:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757429465;
	bh=M6UYJC51NYe1UdxgpY6BB6KX3ic2M6p4On67tOl2V/M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QBTIYhWxYSMBBv7d8KyYZZKQA5eJVVkMPfb/4aguj9UzOhzkLk9A3nOzF7LzOb27M
	 QpZYJ37hqpiS6lGCJQWZX4l42NNzZSudlyZBcuEc4JkRWNDZBh5h+wxccrqEqw/oTb
	 YdbJKQ0TQWTrS8GKXleQip/KUfFoGGmXgVpIboSk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589Ep5t73226481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 09:51:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 09:51:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 09:51:04 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589Ep4TC2499642;
	Tue, 9 Sep 2025 09:51:04 -0500
Message-ID: <13dcf814-a790-43ec-8e90-32225acb2367@ti.com>
Date: Tue, 9 Sep 2025 09:51:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Remove unused bits from dts and add support for
 remaining pinctrl macros
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250909044108.2541534-1-a-kaur@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250909044108.2541534-1-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_075109_195784_F5C6B801 
X-CRM114-Status: GOOD (  16.04  )
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

On 9/8/25 23:41, Akashdeep Kaur wrote:
> This patch series cleans up the dts files to remove the pin control
> DeepSleep configuration that does not take effect in hardware.
> This series also adds the remaining macros in the pin control file
> supported by SoC so that any configuration can be used as per requirement
> in dts files.
> 
> Link to Previous Versions:
>    -V1: https://lore.kernel.org/linux-arm-kernel/20250731115631.3263798-1-a-kaur@ti.com/
>    -V2: https://lore.kernel.org/linux-arm-kernel/20250901122835.3022850-1-a-kaur@ti.com/
>    -V3: https://lore.kernel.org/linux-arm-kernel/20250902071917.1616729-1-a-kaur@ti.com/
>    -V4: https://lore.kernel.org/linux-arm-kernel/20250904112538.529857-1-a-kaur@ti.com/
>    -V5: https://lore.kernel.org/linux-arm-kernel/20250905051448.2836237-1-a-kaur@ti.com/
> 
> Change Log:
> V1-> V2:
>    -Added the macros that were removed earlier for backward compatibility
>    -Fixed the indentation
>    -Added documentation references in commit message
> 
> V2-> V3:
>    -Updated the commit message to be more descriptive and Clear
>    -Fixed errors introduced in previous version
> 
> V3-> V4:
>    -Rearranged pinctrl macros so that all macros of same type are at same place
>    -Removed any redundant macros added in previous versions of the series
>    -Added new commit to fix the missing existing macro definition
> 
> V4-> V5:
>    -Updated documentation reference in commit message
> 
> V5-> V6:
>    -Updated commit message to add "Fixes" tag and update reference information
>    
> 
> Akashdeep Kaur (4):
>    arm64: dts: ti: k3-am62p5-sk: Remove the unused cfg in USB1_DRVVBUS
>    arm64: dts: ti: k3-am62x-sk-common: Remove the unused cfg in
>      USB1_DRVVBUS
>    arm64: dts: ti: k3-pinctrl: Add the remaining macros
>    arm64: dts: ti: k3-pinctrl: Fix the bug in existing macros
> 
>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  2 +-
>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
>   arch/arm64/boot/dts/ti/k3-pinctrl.h           | 51 +++++++++++++++++--
>   3 files changed, 50 insertions(+), 5 deletions(-)
> 

For series,

Reviewed-by: Kendall Willis <k-willis@ti.com>

