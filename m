Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2DCFB519E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOMRFVxkkjIdBVHHRMg1i4CxlVw1ZlggtUcOT1JfmRY=; b=TX06ozPSm+nza9SrAdPcUsvj+5
	qMKxu5kQ/BKQcEpuSn7csJVRTPGZj3VQ/L6ZasZjcUu8Cnp1wlobkHJPbYxjFpclp54P9kvPM+tni
	K0owLowpZ5Nb5Pc1gNhSKWWw1zHCJiwu/VXOCxYQ2r2gDiVm4JE+AZXgdg0GFdrK6sed6D27a2bOi
	Ps1DAvGTmR5otva1x3wth3lai1xQpVT7OHLLsZGy1xeIfs5yyeRnwTAr7WlhpsllQu2ACSe838XDT
	CGuP7evhQmy9EKgP37IRB//Pkq0lvm+hFbCMBvIcfKt176p4qhPU1JUa/diSsC6hfG8GyyIIBwA43
	vi9ZSC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA03R-0000000609j-3IVx;
	Tue, 07 Apr 2026 06:36:53 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA03O-0000000608Z-1Kn1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 06:36:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sOMRFVxkkjIdBVHHRMg1i4CxlVw1ZlggtUcOT1JfmRY=;
	b=KodDnzDXynX43R1YNENTD4eOOJlfHbew+wKDbQKhYzADoR5O2bpFYRP20JGABtq6R3nfrFW4H
	ii1VLlpyAPpp9MzAsO8YCJTCrAmH9rQGtkeoVJu4+VCwB71WTLYj7A6fH5qrayDHBiZYPKIfRZr
	izV54KdG6Y1+h3jeQGUK/rQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fqbtL06yhz1T4G8;
	Tue,  7 Apr 2026 14:30:50 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 381A040576;
	Tue,  7 Apr 2026 14:36:39 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Apr 2026 14:36:38 +0800
Subject: Re: [PATCH v3] ACPI: AGDI: fix missing newline in error message
To: Haoyu Lu <hechushiguitu666@gmail.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
CC: Len Brown <lenb@kernel.org>, Ilkka Koskinen
	<ilkka@os.amperecomputing.com>, Russell King <rmk+kernel@armlinux.org.uk>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260407033117.100-1-hechushiguitu666@gmail.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <714472c7-ec8b-9f6b-928a-3de62f14b4f2@huawei.com>
Date: Tue, 7 Apr 2026 14:36:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20260407033117.100-1-hechushiguitu666@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_233650_842974_02C89DF2 
X-CRM114-Status: GOOD (  16.00  )
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

On 2026/4/7 11:31, Haoyu Lu wrote:
> Add the missing trailing newline to the dev_err() message
> printed when SDEI event registration fails.
> 
> This keeps the error output as a properly terminated log line.
> 
> Fixes: a2a591fb76e6f5461dfd04715b69c317e50c43a5 ("ACPI: AGDI: Add driver for Arm Generic Diagnostic Dump and Reset device")
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
> ---
> Changes in v2:
> - Change subject prefix from "acpi: arm64: agdi:" to "ACPI: AGDI:"
> 
> Changes in v3:
> - Move version history below the "---" separator as per review feedback
> 
>   drivers/acpi/arm64/agdi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
> index feb4b2cb4618..0c2d9d6c160b 100644
> --- a/drivers/acpi/arm64/agdi.c
> +++ b/drivers/acpi/arm64/agdi.c
> @@ -36,7 +36,7 @@ static int agdi_sdei_probe(struct platform_device *pdev,
> 
>   	err = sdei_event_register(adata->sdei_event, agdi_sdei_handler, pdev);
>   	if (err) {
> -		dev_err(&pdev->dev, "Failed to register for SDEI event %d",
> +		dev_err(&pdev->dev, "Failed to register for SDEI event %d\n",
>   			adata->sdei_event);
>   		return err;
>   	}

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

