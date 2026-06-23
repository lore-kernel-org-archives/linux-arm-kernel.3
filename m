Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53916CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZjeWKb3b8+hJxS4LWG9E3xPxpm5++RRdvK7jEZmo7A=; b=EON1UUgy/rbEBWzgmL9ubi+jeT
	F87mq+gYjC9HIcrsTJoRAlmv50smQtm+5KSgnQ2/tn7l87wsWLQeWwSFYVmqWMeRWDdFOa4bVdRCG
	+iK2UiCwztPDdl28JlLTkLeOEleJu9qt8u1HGxQM9MS2LX9y3RadO2i4uNo8vvHx/4LchsMLiB+tz
	dgIPhr4DZN08XbX377cJ2kCq2VspCO1UZ/nF6y/uKdJFjJVpkvADmfIYxx4IktcMz9uJspnahdvro
	BVBxeR0pwHDBIpwZr308DaHq9Fk8HmaMSebXyl9yUWwFaoH4A/OrbNvfSgmYDTsDtG0gc5vxwMuIF
	BZ2Sp1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby69-000000064NU-0lVa;
	Tue, 23 Jun 2026 10:11:17 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby67-000000064Ly-0xlM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 10:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Cc; bh=nZjeWKb3b8+hJxS4LWG9E3xPxpm5++RRdvK7jEZmo7A=; b=sv46U1ASHpHBi/teycZX9h
	fapaPhEgVXraEfMCVqZSFtXlszfqJZIbf7UXnQR09ESsgrxdGGcQYVBNU7fZYZQU26kpvjTOyHP+u
	mmXKxu6wuXXx71oq7XYEZ6h7pHWFuYtUkXaKQqav6iSV+rEaLdXAzZxrMArlfLaNjZgEPtaEOKg28
	0lj6gZOSdv6Pepi6KczmKueQtlI9q6TJc6uUuK+uWeyGg6wcs1p2nKC0g3CTkz+9MFR4+WJXWpibz
	jLU4aAwbwnDa+f4vCTWClL/30LX/srdMg1L62UF3H51NdStuNDm014vkQEEZW5rKh9fdKhrxajgyn
	zT5fV8xBVGfA==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wby5x-006mb8-V6; Tue, 23 Jun 2026 11:11:05 +0100
Message-ID: <4cad4cde-516a-4e22-8498-e84b5221df23@codethink.co.uk>
Date: Tue, 23 Jun 2026 11:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
 <39a5d53d-2eb9-4f72-aca9-95def11edf25@pengutronix.de>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <39a5d53d-2eb9-4f72-aca9-95def11edf25@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_031115_272919_45A4C8C0 
X-CRM114-Status: GOOD (  16.48  )
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

On 23/06/2026 11:07, Ahmad Fatoum wrote:
> 
> 
> On 6/23/26 12:05 PM, Ben Dooks wrote:
>> The dwc3_imx_glue_ops is not used outside this file, and technically this
>> is the dwc3-imx8mp driver so whilst making this static to avoid the
>> following warning, rename it dwc3_imx8mp_glue_ops to distinguish it from
>> the other driver which also has dwc3_imx_glue_ops.
>>
>> Fixes:
>> drivers/usb/dwc3/dwc3-imx8mp.c:176:22: warning: symbol 'dwc3_imx_glue_ops' was not declared. Should it be static?
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   drivers/usb/dwc3/dwc3-imx8mp.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
>> index 1cf96540b66e..bc61a89b66b1 100644
>> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
>> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
>> @@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
>>   		pm_runtime_use_autosuspend(dwc->dev);
>>   }
>>   
>> -struct dwc3_glue_ops dwc3_imx_glue_ops = {
>> -	.pre_set_role   = dwc3_imx_pre_set_role,
>> +statc struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
> 
> Typo

Thanks, forgot to re-run check after this. Sent v2

> 
>> +	.pre_set_role   = dwc3_imx8mp_pre_set_role,
>>   };
>>   
>>   static int dwc3_imx8mp_probe(struct platform_device *pdev)
>> @@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>>   		goto put_dwc3;
>>   	}
>>   
>> -	dwc3->glue_ops = &dwc3_imx_glue_ops;
>> +	dwc3->glue_ops = &dwc3_imx8mp_glue_ops;
>>   
>>   	if (dwc3->dr_mode == USB_DR_MODE_HOST)
>>   		pm_runtime_dont_use_autosuspend(dwc3->dev);
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

