Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F1D2B923
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAWzS0LPoX0leakY4JsHrMBVnGBVUcCyJRfz777KU5w=; b=gHf4iHnE6dJTYOIjRCOcLawotL
	gDIkXxq0hvry9FjfKEGpX2yIeYhWjoBAZPcFAD4CJOpkSRvv+pGHKvvDOCicXs281D9b4P+b+PYN2
	nGVAmppMPKssShtwI+zby7u67n1DEMYTgnE0wcGcRksH1Qlye6NfYFw8E1eRO7L7ArI5WD6vjJUYx
	yjLnnvLWktS/fF/4UosVgSYpMlm+z+mkScUKdwuT5AysB/5SUlc1t/OFyONAIejUbQPLH+0ZPezBk
	eXDrPO9h1iSdvefTmTg32MxLpDeAWimPuM5N913U+iSSg5IdmSykENlpidwtvZhmEAcPYCfXdpUdo
	NpTO5wlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JLg-0000000H5Jb-2f3g;
	Tue, 05 Nov 2024 13:11:56 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JJx-0000000H4ua-15Xd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:10:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CD9A240003;
	Tue,  5 Nov 2024 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730812203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dAWzS0LPoX0leakY4JsHrMBVnGBVUcCyJRfz777KU5w=;
	b=Xu8Fuyz0zX6v2NsrBoblzmLGLziQHwMLe3FP2p1gjdIVo7K7W8wrWqkOB3ZLOboaOGoLh3
	XBhkexYXuR3m/er1JWdULmDIL8fzKIEZ6WywmjqOflhoW80/yShDYHsYXgv8ZQXTB/Mo4w
	M4czZ11xb/2drdo7DWg4/NHNfVx+LLDgAMzlzOrUWnZZscHbkT+zBj6E6OCiVieIiuO0DB
	JK0WSZ2A1BUnMwnyYxiEyfiwRbbAE+8wZGUE9NrDWVRF1VdaAcKauMYh5b/tvuAZQGXBFs
	0MR+1/lWBljod9wSHgXLHFza5Rc9t4w0ynzwzuAKBuTnsX81UlHBDnhX0oNCtA==
Message-ID: <94726cb7-7cd5-48cf-b158-a66e6b279058@bootlin.com>
Date: Tue, 5 Nov 2024 14:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Typo: Fix typo in atmel_serial.c
To: Hari.PrasathGE@microchip.com, cvam0000@gmail.com
Cc: alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 claudiu.beznea@tuxon.dev, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241024172300.968015-1-cvam0000@gmail.com>
 <5933bb3c-3b1e-4579-88c6-b9bbbed93a4f@microchip.com>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <5933bb3c-3b1e-4579-88c6-b9bbbed93a4f@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_051009_599416_6B508CAD 
X-CRM114-Status: GOOD (  18.93  )
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

Le 05/11/2024 à 13:18, Hari.PrasathGE@microchip.com a écrit :
> Hi,
> 
> On 10/24/24 10:53 PM, Shivam Chaudhary wrote:
>> [You don't often get email from cvam0000@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Corrected minor typo in atmel_serial.c
>> - Fixed "retreives" to "retrieves"
>>
> 
> Pls fix the subject line. Refer to the previous commits from the git log
> of the same file. Also,the commit message should be in imperative mood.
> Send a v2 with the above comments addressed. Some useful links below:
> 
> https://kernelnewbies.org/FirstKernelPatch
> https://kernelnewbies.org/PatchPhilosophy

And for this kind of patches, I think it should go through the 
kernel-janitors ML.

Regards,
Richard
> 
> Regards,
> Hari
> 
>> Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
>> ---
>>    drivers/tty/serial/atmel_serial.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
>> index 09b246c9e389..bb1978db6939 100644
>> --- a/drivers/tty/serial/atmel_serial.c
>> +++ b/drivers/tty/serial/atmel_serial.c
>> @@ -1166,7 +1166,7 @@ static void atmel_rx_from_dma(struct uart_port *port)
>>                   port->icount.rx += count;
>>           }
>>
>> -       /* USART retreives ownership of RX DMA buffer */
>> +       /* USART retrieves ownership of RX DMA buffer */
>>           dma_sync_single_for_device(port->dev, atmel_port->rx_phys,
>>                                      ATMEL_SERIAL_RX_SIZE, DMA_FROM_DEVICE);
>>
>> --
>> 2.34.1
>>
>>


