Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37D8FB5173
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 01:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4uBYqWYsVWqxFeqRin7PtAzbavFo39gPsOS0lVPF/c=; b=ePjeNWXZOzQU4hQsoZvoz8NSnX
	afVkjPG+FlHHHTnmomZg9W5WdV3CYYs8063HEyzVY6XSeS5rMcUjo+iKlNCRMn+Qp8TwaqWsbdjbB
	IOCYwEUVIzMSfOoQUKK4tpM85YLXCytPns3wU1/vOaoAiPM4TQ0qXOrER93czLx7yGgWNF+qRLzaY
	zQ/ISIP+hUQGE8Ib2ga+L5qt6J+19qQDQ4qXTt1dZHqmp4GXJSwNcsFXdCh7Sy9s3i/jK+wAe/rtO
	qmfbvgeuitxI7QfwR5KHp0/6uf62hZJFviIkND2ll17XSWs1kHWa7xPDE64eY2jOrazdDZprauC1n
	3Dbdtb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uqJ-00000005g9u-1jpZ;
	Tue, 07 Apr 2026 01:02:59 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9uqG-00000005g9L-1xWg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 01:02:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=t4uBYqWYsVWqxFeqRin7PtAzbavFo39gPsOS0lVPF/c=;
	b=OSZX0oJLKUIwC9RcfhF2uv2vy6AMPk42aQIsPZ6LdvAHav4fIw4WQtPCheqqvnVAT+t8JnScd
	UJe/fFf8IFM+8ccRkjukjq22UgXnrPh5wkunIBq1VdUCZJtRLfpViHnbfSUIbC2wkZ0gMHNBC7r
	vT/81Q5xtlxRDCADJ29/BNc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fqSSW6hgHz1prQX;
	Tue,  7 Apr 2026 08:56:27 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 043B340571;
	Tue,  7 Apr 2026 09:02:44 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Apr 2026 09:02:43 +0800
Subject: Re: [PATCH v2] ACPI: AGDI: fix missing newline in error message
To: Haoyu Lu <hechushiguitu666@gmail.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
CC: Len Brown <lenb@kernel.org>, Ilkka Koskinen
	<ilkka@os.amperecomputing.com>, Russell King <rmk+kernel@armlinux.org.uk>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260401022957.611-1-hechushiguitu666@gmail.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <620cd553-e1bb-77c1-7d35-504d9b1db0a3@huawei.com>
Date: Tue, 7 Apr 2026 09:02:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20260401022957.611-1-hechushiguitu666@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_180256_984600_B51E93A6 
X-CRM114-Status: GOOD (  17.53  )
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

On 2026/4/1 10:29, Haoyu Lu wrote:
> Add the missing trailing newline to the dev_err() message
> printed when SDEI event registration fails.
> 
> This keeps the error output as a properly terminated log line.
> 

...

> Changes in v2:
> - Change subject prefix from "acpi: arm64: agdi:" to "ACPI: AGDI:"

Updates between versions don't need to add in commit log, for a single
patch, the change log needs to be placed below...

> 
> Fixes: a2a591fb76e6f5461dfd04715b69c317e50c43a5 ("ACPI: AGDI: Add driver for Arm Generic Diagnostic Dump and Reset device")
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
> ---

...which is here.

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

Thanks
Hanjun

