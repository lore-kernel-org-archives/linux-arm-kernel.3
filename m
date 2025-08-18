Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43D7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsNJNYwSRERp/zfvYhN+k0xbmJcEwBRFSdertRgYGjA=; b=lWMK3m8+6tn+8N0kawVPssDo1r
	syykVWSTejQf31D06nqJ9irJBPwPM1X2rfpL/QRBBelzureeaBf/Wl6kpK6DU0NpzvKhXH5VMx/Gg
	S+xi9vcsciiMOHdQe+lk6qOLwLnm+PHUCeutQ6B+fSnNGe0MH/Up4spJTfbhzoIp0CgoJAtBcupR6
	H2n+94hifldcI9u98ueaT95IWnIrWCe87ucme25Nnoky1YKLdA13ra05aANoaI0DfBfMDeW535i/Z
	VdOTBj5sz0kikp34D/BED1Jwe4WPzAojhKLc/Aqo6Uta6zqTdbZhscaFQiLfm5e+bRv1vIyWR3Aa9
	TXqTchEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueG-00000006pHi-3PWq;
	Mon, 18 Aug 2025 07:51:20 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untjB-00000006ind-2CMI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:52:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c53Gv1BhBz2Dc38;
	Mon, 18 Aug 2025 14:49:27 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 205661400CB;
	Mon, 18 Aug 2025 14:52:13 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 14:52:12 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 14:52:12 +0800
CC: <yangyicong@hisilicon.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v6 3/3] MAINTAINERS: Remove myself from HiSilicon PMU
 maintainers
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250814091622.23269-1-yangyicong@huawei.com>
 <20250814091622.23269-4-yangyicong@huawei.com>
 <20250815095606.0000606e@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b51c2ce9-d93c-29a2-65d4-915226af8c16@huawei.com>
Date: Mon, 18 Aug 2025 14:52:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250815095606.0000606e@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_235221_752359_23FF2F18 
X-CRM114-Status: GOOD (  11.53  )
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

On 2025/8/15 16:56, Jonathan Cameron wrote:
> On Thu, 14 Aug 2025 17:16:22 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Remove myself as I'm leaving HiSilicon and not suitable for maintaining
>> this. Thanks for the journey.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> Thanks Yicong, it's been a pleasure working with you.
> Best wishes for whatever you do next.

my pleasure too. thanks a lot for the generous help provided along the way.

> 
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
>> ---
>>  MAINTAINERS | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe168477caa4..22999fccfbd7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11059,7 +11059,6 @@ F:	Documentation/devicetree/bindings/net/hisilicon*.txt
>>  F:	drivers/net/ethernet/hisilicon/
>>  
>>  HISILICON PMU DRIVER
>> -M:	Yicong Yang <yangyicong@hisilicon.com>
>>  M:	Jonathan Cameron <jonathan.cameron@huawei.com>
>>  S:	Supported
>>  W:	http://www.hisilicon.com
> 
> .
> 

