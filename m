Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA1AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUQnO4ez7esgr9cZ1pZ2DYqYoTJgtaWVk2k59yNUhiw=; b=0A2JBPDCTYFn9HCAwDVHJeUjoa
	OMp8zGcSPBAa82a7E+sH4EzWf1EKBomu25TmatvrWHnyoamgcDxRJruSE+itb3iGFtFafh8f+Cfy2
	gHTMJK8iLWuAO+mCpXnF5Yoc9tLc3/DA6RgOitHpZ4BBHZlrLTWxCvi33AHcvw1b6VqOcylNOKfjv
	zCLLdjBe88JWqzAQijVLsTg2tj6MWGYQkJJom5ITTNm/dHPMyTSpUw9LXPs+y3VZ8lAcWhpn+LT/Y
	UNux/oxI5Qn/fpBfLjwlkEC8xRySvyVfGj2wgAbvVfnDnYZD9/1GS1gsh9gTuXhZvgV6rvghGtAb2
	z0Tv/NpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOZI-0000000DK9M-0eVJ;
	Tue, 06 May 2025 20:07:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKvy-0000000CdcZ-2wVi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:14:20 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546GED2D545964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 11:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746548053;
	bh=vUQnO4ez7esgr9cZ1pZ2DYqYoTJgtaWVk2k59yNUhiw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ifHw/brkuXzBNwEKSwgb2Su7whGELtX6EQp1SQl72QstWGcMn/YHFpxr/0qJTy75k
	 7sKmqrOyOYyV8UXl/ipogXBj1kijlar5VUtNcfFfUUHCYevXzBGLsiVF2ZW0U8J0+A
	 spdfc9ONmpiKUnDoJVmNFLn144xfnjZxXfTKUK3A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546GEDwV116531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 11:14:13 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 11:14:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 11:14:12 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546GECH7051184;
	Tue, 6 May 2025 11:14:12 -0500
Message-ID: <4a7e7f19-68ee-4ec6-aa9c-832238be040d@ti.com>
Date: Tue, 6 May 2025 11:14:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv device
 nodes
To: Daniel Schultz <d.schultz@phytec.de>, <nm@ti.com>
CC: <upstream@lists.phytec.de>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250506115502.3515599-1-d.schultz@phytec.de>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250506115502.3515599-1-d.schultz@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_091418_907755_D8A472DC 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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

Hello Daniel,

On 5/6/25 6:54 AM, Daniel Schultz wrote:
> This patch series is based on [1] and adds these R5F and C7xv device nodes
> to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
> as well as main_rti4 for the C7 DSP firmware.
> 
> 1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t
> 

For the series,

Reviewed-by: Judith Mendez <jm@ti.com>


