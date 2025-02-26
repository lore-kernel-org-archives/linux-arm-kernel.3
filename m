Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E97C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKO+pmLQatUCt7yegvUS1k29o1fQVlfCOBaelBDtfAU=; b=gLj+Sbr1PGV/5HBTjZAN1+50xz
	pOJDs2MRrAlEZkScuckfCWhYavfUOlxXUFGrcGhzndJgKZkQrc/vqqtQEOgRciYVnY8ILbIStbZd6
	LJnhGnAFbnJ0W6xX71CLhz1gFzybpnOEeRzy9lH5iY95Nc42cKZq4kcmMZvgzd1glhwg6v7v/3/mQ
	y7WaSIJNakmGa7RisKo0rGOfkjhRRX3dp01GxGRkHLeHfYeX5CvygWt3eZ6aA4cuuYOiFzGvRzQB0
	vgC+vjzvo9VQU6QvMAXmScnzW1G7XyzjR9kv1O52XBdngIfRnbKknyW//u/dx84dBcdWN8qfkaA+l
	8PUm4nRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHvn-00000003zTN-0qtW;
	Wed, 26 Feb 2025 13:58:35 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHuF-00000003zBj-0Lad
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 13:57:00 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7EF7CA0929;
	Wed, 26 Feb 2025 14:56:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=UKO+pmLQatUCt7yegvUS
	1k29o1fQVlfCOBaelBDtfAU=; b=OqMQfTBrW+wDeQ5v1RIKWkX4gi6XvJt5qIzp
	/W5fRINaBZoudm3hspOOtxNO7rGtCth14AilNf9ArKtaiIYCyXNuSnq75Ka46Rv9
	f/kARS1XihmTkDfZD7cgx2xIWF7Fn/C1Q87e6vt59OySvCGse8dGN70V5X4RxvQp
	DM86nU1UEo7HOfPfNlmNOMfWV0gyCzNNCOqE/lo6IbS5FAZlyS/cz28xTlLpJYtM
	4Gp1BTalEzQcypRMt72OYUPKSbRSuECENu5toki9PM7AdPCVl/UZyRiPTZOPMPnh
	GIBhCoPqQNhJavWMpEMf2aWMeoso6iF4t0FKDN5EiclTM7Ikvum05R5T8n33zq2f
	Wh3k95d6MBPa3kKH7PRaDrs6dCxxQWLliQ6EJ6F0wlSqViz5LYtogQ/Fguryr/El
	yphkFXlSvE0gHYnQsnUpOfhHmxLxEUIb5XiKoCbvVrzHnzfyKSB1TL+LzYyaTm2o
	S+kMyK3yPx+ZWGMOocX4n6P1LT7VExPOJfT1vOLEAb1Yqt0kIFkvzX13Hx6LkaG9
	M3gSQHxO2Rqc5W+3/+co7lZUVrjc4rXnY4/+s0YpLUGsf8JHPebORGBQqBkRfbBJ
	Rktty2nIIGfHMS1gXaffJ1hoA2ysgLYPjOspXmwCrtpcbXnA7x3i2ZrBOtOMAQxc
	kq9+XLc=
Message-ID: <3758bdc7-2eb3-4e42-845a-8ecb1103d4f1@prolan.hu>
Date: Wed, 26 Feb 2025 14:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] Frequency & duty cycle measurement?
To: Dipen Patel <dipenp@nvidia.com>, <linux-iio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <timestamp@lists.linux.dev>
CC: William Breathitt Gray <wbg@kernel.org>, Jonathan Cameron
	<jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
 <7b6505ca-6082-4644-be4d-6e1372c183b7@nvidia.com>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <7b6505ca-6082-4644-be4d-6e1372c183b7@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485263756A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_055659_281140_C183F497 
X-CRM114-Status: UNSURE (   9.96  )
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

Hi,

On 2025. 02. 19. 23:32, Dipen Patel wrote:
> On 1/21/25 7:19 AM, Csókás Bence wrote:
>> he hardware is capable of taking a snapshot of the timer value into another
>> dedicated register pair (RA, RB) on the rising/falling edges, and a small
>> `devmem`-based userspace utility was created as a working PoC
> I am late to the party :) Seems above statement looks lot like what HTE
> subsystem is doing. Right now, only userspace path is through the gpiolib
> due to usage that time was limited to GPIOs. However, we can extend HTE to meet
> this scenario.

Yes, I had the same impression. But since there was already a driver for 
this block in the counter subsystem, it was easier to extend that to our 
use case.

> Thanks,
> Best Regards,
> Dipen Patel
> 

Bence


