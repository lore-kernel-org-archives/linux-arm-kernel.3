Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00902CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vfqg3s+qknOSc6/C39ZyYTX19WA7gCC0eH96CcelZNU=; b=zmxGY2nZ7TrGjslUiJi45n2CHL
	/xRk0H6KJUqii26YyDX93oLH1HTeAgVUyoEJSUockurSOX5hdFVMfXDl41mhElwMoR1D10bLGfn8e
	1wySdPwHx53mqJMgwwTebf7BKL9JQEtkVXoQwQkXWvGqC6weksq1LMBD5cP4gjjjwri9RgX9cIOYX
	71SYPIVJy+GDoJSKYuuN54dGc4UgN4Qt2L1A0mI+Rqzd9g8Xm/icnydfWcBcjkDQ1B3CDO2oR8E5q
	0rdqu6HQXbv8sh74NpdoHBTa9NqVNaUT5e+7NvqsgkDjgOsn+DuVgDazo4GfOswf928XfOpZdwUG/
	k3WQIKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3w-0000000G2xs-3gMp;
	Fri, 05 Sep 2025 02:20:28 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHKy-0000000EWPg-1aI4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:17:45 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584LHeEM3167273;
	Thu, 4 Sep 2025 16:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757020660;
	bh=Vfqg3s+qknOSc6/C39ZyYTX19WA7gCC0eH96CcelZNU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NX4oG8XpVzlja3OjRwFb6/2sD4Z/nNm+0ubQNupv+nVYWdTN1vNFQdWu5aAx4ohhd
	 Kr/bYO0h0iXLcA+51m67EDYeLpBDBJDNk9UeeEhZhwMjKCsF/tB6uCICpCnBS3Zrdm
	 fufrQxFO4r5tSF82qYE7jGh7tAW2cd4hBvMfNJGI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584LHe1W1150501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 16:17:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 16:17:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 16:17:40 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584LHehq3602213;
	Thu, 4 Sep 2025 16:17:40 -0500
Message-ID: <83bdbff9-57d5-4391-8ec7-661b1ba012cd@ti.com>
Date: Thu, 4 Sep 2025 16:17:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64: dts: ti: Add bootph-all tag to USB PHY
 controller
To: Hrushikesh Salunke <h-salunke@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <danishanwar@ti.com>
References: <20250902053009.1732607-1-h-salunke@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250902053009.1732607-1-h-salunke@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_141744_466823_014A6B8F 
X-CRM114-Status: GOOD (  10.80  )
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

Hi Hrushikesh,

On 9/2/25 12:30 AM, Hrushikesh Salunke wrote:
> This patch series adds the bootph-all property to USB0 PHY controller
> nodes across multiple TI SoCs (AM62, AM62A, AM62P, J722S).
> 
> The bootph-all tag ensures that these USB PHY controller nodes are
> available during all boot phases, which is required for USB DFU
> (Device Firmware Upgrade) boot functionality.
> 
> Changes sice v1:
> Updated patch series to add "bootph-all" tag to board specific file
> instead of SoC file.
> Rebased on current next.
> 
> This series is based on commit:
> 33bcf93b9a6b Add linux-next specific files for 20250901
> 

Thanks for the patches.

Reviewed-by: Judith Mendez <jm@ti.com>

