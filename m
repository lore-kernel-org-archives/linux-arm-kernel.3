Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8383EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHiAWliwlYMMYJzF/p+i3JygK75ijJmhUfA6PxHfmuw=; b=ndOxZyQdCHRHOnkdJPQ94J/phq
	SNUlJxZCGLqXNpY9ccULCnasy9i+ajuNRs93NrOq81IfPSeRSFYMAE/cMK0QwvyBWf3rFW3x/5g4l
	n+jcWoVd4E31jG73mUCd2NsqSr8RwoKMx+m+8q7Z0TZ0UzTDagR6EggGZG42l+ZFPyNn+wlAaGFRo
	5SYG2y8G3+PoeuJXidNCnQzc7noQK3Wb3PRdODCSJpV6XxnmPVQ4Of9J//de+7Up2RlqzAxeTNs30
	95AC3fxSGovZ08Uxo+DZivJwBl8jtygyG08EO4hJI6Rlmn9rwljliOacY5K5IoThSE7OsBs4QMR/x
	Ns0Uffjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcEK-00000002nWP-3ZPc;
	Wed, 05 Feb 2025 10:02:00 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcBG-00000002mxg-0gOM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:58:51 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C6C4CA0397;
	Wed,  5 Feb 2025 10:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=oHiAWliwlYMMYJzF/p+i
	3JygK75ijJmhUfA6PxHfmuw=; b=bDsV/kSUooCJDi7x0+tzEr1+x5Prt7w9wBB7
	oxqawTSx7ETk4wisyrF6lG8UdUYipBl2l2RiEr1+NoZvkOdGZbMeTNK6ojK2CfeT
	Fir34+J6ihhekb4aOjZRlVuUPCLi0JKCMm05O8kQXAWXeb712De9AtXjRRBOq/mV
	mX8nZBlNIdQoqB/zvry7WkIBuXQM81wmz86LlVsVn+Wc7guPeUi3ilF2ThsgwT07
	zTXd0RU/PiFftsBL2+g6tW9vTgeD69peTpPsEjiqLgdWpJ3I4rYIIFK6b6f3DdkI
	IDTxpPRq23+/yysFc86/3YXxlLCLevIvZ/qJQWuUKfRWcZSqiRGaDZ1SPcXrtXAe
	c9eRvRQWRc8SbC5uUoMTpe3eSxPGkrHt5CiCSy5Tq563ioA1jjZxy0BwT9lT+/xr
	dcGEkSj1RnE+Vg5HNHjX4hUyI329+E4W2mQEybFelNiuOgMlrdxkjVDQEpn48LBw
	dLz/j20fE0ZbRwLTOKUnm9i1b0MjGu9Vhh1/lFIMpI9pjrHDnyvkfnNKXN2nNqyh
	Q18gYC+isS6tOdfKwyU3Qy/FTvN9sCd+Ih1kPxZJV79rXwwj/GO0sNHgl84SjOEz
	sQ6mTYLrxgAEp5+88+KJ66oHPxDdYZrdY9HHwHDrAtqG+Qf1byG9RgVmIyEpFaMc
	6dFa2oY=
Message-ID: <c68777f2-b053-4320-aabe-f95a9796b016@prolan.hu>
Date: Wed, 5 Feb 2025 10:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] Frequency & duty cycle measurement?
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
To: William Breathitt Gray <wbg@kernel.org>
CC: <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<timestamp@lists.linux.dev>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Dipen Patel <dipenp@nvidia.com>,
	<dlechner@baylibre.com>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
 <Z5efcokgHix-k3lW@ishi> <dffc0f18-799a-4fc7-a6b5-2fa270e1fc58@prolan.hu>
 <Z6KkusvLFPcNvEfl@ishi> <0c74dd96-2978-46ab-a399-9c94c9529b2e@prolan.hu>
Content-Language: en-US
In-Reply-To: <0c74dd96-2978-46ab-a399-9c94c9529b2e@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_015850_663226_F095A2AE 
X-CRM114-Status: GOOD (  14.13  )
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

On 2025. 02. 05. 10:30, Csókás Bence wrote:
> Hi,
> 
> On 2025. 02. 05. 0:37, William Breathitt Gray wrote:
>> The first step is to decide which event we'll monitor and on which
>> channel: we want to monitor Capture events so that's
>> COUNTER_EVENT_CAPTURE, and we want event channel 0 (n.b. 0 because
>> that's the channel parameter value passed to counter_push_event() in the
>> driver).

Ah, I push 0 and 1 for the two interrupts... So that's why `channel` has 
to be 0 and 1 as well. Does it make sense to do it this way, or should I 
push on event channel 0 always?

> I had no success using `channel = 0`, only data from `capture0` comes 
> back. If I set both `channel` AND `component.id` to X, then I start to 
> see similar values than what I get from reading sysfs. (For now I 
> hard-coded all values; I agree that the correct way would be to read 
> component IDs from sysfs, but this is still a PoC...)
> 
> Did I do something wrong in implementing the driver maybe? (See the 
> submitted patches.) And any idea as to why I might be seeing the slowdown?

The slowdown is still a mystery though...

Bence


