Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D42D75BDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhybviENqL1dG5XMA90Z+SaGGqKp5SKzHp6k+08G8Ss=; b=G1MICjc/1qLSqqzIPqK5ZQV52n
	25aZYeHcB4tGrWo6hD/xo7G28aHCXPpQGG2P2YsaSXjOSW36rcZmWcnmq78RYcCPBIrmuVLC5VGaU
	ZIA5HGVh57BjAEAVoRnrysuRpF8sMR63T9QXiYblbtTf1/W0Eg500SMYhBQ2kw5WBvA3Chmtm3US1
	bbVsqOP4Q9IwwkUkrmHeRo73KNA/A6TBVWPuAiHcqtSPIZsba1pftvZkVykKhvAwNJqKkHUxslxPB
	Y3JILLmgyN+PhfkYlZpWRxxUL5NuQjcO/6RRwkCI8Qdo8kxZjw0WIerktWjZBkEnYCMNHs18ZeQcE
	HK43vOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3Mm-0000000HEBy-0mM8;
	Thu, 21 Nov 2024 09:20:48 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3Lo-0000000HE4I-1FMh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 09:19:50 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee7673efb29da5-5ddc2;
	Thu, 21 Nov 2024 17:19:38 +0800 (CST)
X-RM-TRANSID: 2ee7673efb29da5-5ddc2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.230.59] (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee5673efb2983a-cbd8c;
	Thu, 21 Nov 2024 17:19:38 +0800 (CST)
X-RM-TRANSID: 2ee5673efb2983a-cbd8c
Message-ID: <bee10978-ce12-4813-957d-2d1288f49815@cmss.chinamobile.com>
Date: Thu, 21 Nov 2024 17:19:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firewall: remove misplaced semicolon
 fromstm32_firewall_get_firewall
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, mcoquelin.stm32@gmail.com
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
 <cfb1caed-9402-4148-831d-57c50bdf6a27@foss.st.com>
 <1179b3a6-e430-4d9a-8f86-470e8cbe5738@foss.st.com>
From: guanjing <guanjing@cmss.chinamobile.com>
In-Reply-To: <1179b3a6-e430-4d9a-8f86-470e8cbe5738@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_011948_879459_D5F2FB44 
X-CRM114-Status: GOOD (  13.02  )
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

Thanks for your advice. I apologize for the omission. :)


On 2024/11/12 17:40, Gatien CHEVALLIER wrote:
> On 11/12/24 10:25, Alexandre TORGUE wrote:
>> Hi
>>
>> On 11/9/24 06:50, guanjing wrote:
>>> Remove misplaced colon in stm32_firewall_get_firewall()
>>> which results in a syntax error when the code is compiled
>>> without CONFIG_STM32_FIREWALL.
>>>
>>> Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
>>> Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
>>> ---
>>>   include/linux/bus/stm32_firewall_device.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/bus/stm32_firewall_device.h 
>>> b/include/linux/bus/stm32_firewall_device.h
>>> index 18e0a2fc3816..5178b72bc920 100644
>>> --- a/include/linux/bus/stm32_firewall_device.h
>>> +++ b/include/linux/bus/stm32_firewall_device.h
>>> @@ -115,7 +115,7 @@ void stm32_firewall_release_access_by_id(struct 
>>> stm32_firewall *firewall, u32 su
>>>   #else /* CONFIG_STM32_FIREWALL */
>>>   int stm32_firewall_get_firewall(struct device_node *np, struct 
>>> stm32_firewall *firewall,
>>> -                unsigned int nb_firewall);
>>> +                unsigned int nb_firewall)
>>>   {
>>>       return -ENODEV;
>>>   }
>>
>> Acked-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
>> Thanks
>> Alex
>
> Hi, please use get_maintainers.pl script next time so that
> adequate people are put in To/CC.
> Nevertheless, thanks for the patch!
>
> Reviewed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>



