Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDC5CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m64o20UUbg1sqOFMyrxckroncuaVuX+6bK0ps7a5P3w=; b=R5D9EZHwg+zDmTRFY1KUvqGNt0
	wSUmm/Dyd42+SPZ6KB2kLLxe/JH4UsSnV5eUY1GYBXF14NBen52Gn8CKJtZorY1+BkrjcAzX2Lf+m
	0YJYS6XmnX7jF6k0MPJMrmAvL9Jjx/Tj4ewM0aya6Q2Gf9eFMtpMas0Crm2bHLQAW7Y1TI76HmMyM
	e8vELu3a38pRrDtkvyhdCRGpbEY2aNdA7N8F32Sp7nNv4hL4pmZYP6KR6rkUSYADyMqFw7AujCgue
	Sp4Q7J2da7Nnx/WEhBMZbVbmkRrptlBKxSlaf02oxHH/gmM5wnbHzsY9o/Sdp3fVNy6QC8bVQ1IpP
	BIjv/H3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKue-00000001jg4-1kwr;
	Tue, 19 May 2026 13:55:12 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKuZ-00000001jdY-2a7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:55:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m64o20UUbg1sqOFMyrxckroncuaVuX+6bK0ps7a5P3w=;
	b=XCmu7WjORRxZBr6K8gA1UNsYlhigXejcethM7aRJ8p/qOqZGl568x6Q+gZvl+PuDCLdEpAI0C
	lMbhSMB/HW86nhU6oSSNK+44aAJeP/wv74fXpO7uPxVsM4q97ssWDT/3+tNOBcYeK94JS9ETqTT
	EEG8iotQDoSHOMFfgiIO6G0=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gKbZL3QvDzKm5y;
	Tue, 19 May 2026 21:47:06 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C91FE4055B;
	Tue, 19 May 2026 21:54:49 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 May 2026 21:54:49 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 19 May
 2026 21:54:48 +0800
Message-ID: <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
Date: Tue, 19 May 2026 21:54:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
To: Adam Young <admiyo@os.amperecomputing.com>, Sudeep Holla
	<sudeep.holla@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	<linux-acpi@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, "Guenter
 Roeck" <linux@roeck-us.net>, MyungJoo Ham <myungjoo.ham@samsung.com>,
	"Kyungmin Park" <kyungmin.park@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, <linux-arm-kernel@lists.infradead.org>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_065508_670246_942F7535 
X-CRM114-Status: GOOD (  28.33  )
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


On 5/19/2026 3:30 AM, Adam Young wrote:
> The tx_done callback function has a return code (rc) parameter
> that the tx_done callback can use to determine how to handle an error.
> However the IRQ handler was not setting that value if there is an error.
>
> The following clients are affected:
>
> drivers/acpi/cppc_acpi.c
> drivers/i2c/busses/i2c-xgene-slimpro.c
> drivers/hwmon/xgene-hwmon.c
> drivers/soc/hisilicon/kunpeng_hccs.c
> drivers/devfreq/hisi_uncore_freq.c
>
> All of these only use the error code to report, so they
> are expecting an error code to come thorugh, but they
> do not modify behavior based on this code.
>
> In the case of an error code in the IRQ, the handler was returning
> IRQ_NONE which is not correct:  the IRQ handler was matched
> to the IRQ.  This mean that multiple error codes returned from
> a PCC triggered interrupt would end up disabling the device.
>
> In addition, if the error code IRQ was coming from a Type4 Device that was
> expecting an IRQ response, that device would then be hung.
>
> Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
Not fix above commit.
mbox_chan_txdone() was added in below patch.
Fixes: 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler)
> Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
>
> ---
> ---
>   drivers/mailbox/pcc.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db7..16b9ce087b9e 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>   {
>   	struct pcc_chan_info *pchan;
>   	struct mbox_chan *chan = p;
> +	int rc;
>   
>   	pchan = chan->con_priv;
>   
> @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>   	if (!pcc_mbox_cmd_complete_check(pchan))
>   		return IRQ_NONE;
>   
> -	if (pcc_mbox_error_check_and_clear(pchan))
> -		return IRQ_NONE;
> +	rc = pcc_mbox_error_check_and_clear(pchan);

I think it is not necessary. This function just return -EIO on failure.

>   
>   	/*
>   	 * Clear this flag after updating interrupt ack register and just
> @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>   	 * required to avoid any possible race in updatation of this flag.
>   	 */
>   	pchan->chan_in_use = false;
> -	mbox_chan_received_data(chan, NULL);
> -	mbox_chan_txdone(chan, 0);
> +	if (!rc)
> +		mbox_chan_received_data(chan, NULL);
> +	mbox_chan_txdone(chan, rc);
@Sudeep, I have always had doubts about the addition of this line of 
code in the
  commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ 
handler).
The patch seems to avoid the timeouts in the mailbox core according to 
its commit log.
Regardless of whether the command succeeds or fails, each mbox client 
driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is responsible 
to call mbox_chan_txdone() to tell mailbox core.
This is done after executing mbox_chan_received_data(). So I think this 
line in this function is redundant.
Can you take a look at this agian?
>   
>   	pcc_chan_acknowledge(pchan);
>   

