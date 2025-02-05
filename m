Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED74AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZmcIW5wOrNb8xct7xRfme9B6Vb+WCUzLGVoJLibljY=; b=Rr1kRZQiuVI89n9ACAVVnxMk2n
	/VSX7z8fo2H8p1VB4WU/wnXhgg+hcEo7uj860RbL2YJ1esL7pSBbkZJzfKkN5a8zYiqf3q38A6oVu
	ttGdFRQCZV/uQCtxkifRQE1BVVFhJUGRg5bXnsajG7MU36JHdIv/GVaWaNAVAwVM8bFEVrfKC8VsS
	yov4iGOtTFvdFi8NqxX+2pyxdrSTBbK+vdbgLyrkepspchX2JqreEiUD88mQfditqdJFkQ1rVBWZa
	MJS16YrByEUgD/magZJPsZv3tOUnELBN2s4fHod/AB9o5sh51SNvN4tLP3CWBR3ZELaearoFBK6+4
	lEiIHfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfblD-00000002htR-32wB;
	Wed, 05 Feb 2025 09:31:55 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbjp-00000002hg3-3JAN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:30:31 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 24CD3A079A;
	Wed,  5 Feb 2025 10:30:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=oZmcIW5wOrNb8xct7xRf
	me9B6Vb+WCUzLGVoJLibljY=; b=EhFjjncCvOyxRr8VieGK1+kFktivOwz8u+3q
	+FlGiNfj+SU8TbQS8e5aRgqwmoR0Nj6iKvYlAXDYnAySvxYK+Q/Y/HTVdpiaE47H
	ZRT4AGBaLWXqVeAEgVPqHooEbc8feSQJiO1RNDXs3e2JyvdVxw5FNOet4giM7gM+
	PcxADs4jI3JNGaSdKcQW96oDSOiVcKnnWmdUXKoSUYZAdjsO7zYM96aYBTOeufyA
	EiGlh5vbvE6+O6TujJne2lqg4uqiBh7rdofFgubgOeIXCgEJzN0oWCDimvpVHAQN
	/VFBVBNWLrAhUBCPEkDdb0d2jeZoZu6+fZrkPENuwfLSSNCAfQY2eE/TPrFCyZuz
	djJZflYO0r45jae56N/llfuXU6btwzGMvHBAH3aPi9a6aFK7LpWQzgNESstcV7FX
	fDZ3gw+wMW3oCi7BF6hMRGFSHW0VQ2O2RDPToUbYdDDC4BhwSlPqCFTv/w0LFUbF
	K7SSeQwHQRZt+xWBOaMQ9GGiamSH8nqRTB05unapxxjvYwiM2PbZ6jAYWTk1uyZD
	Zg1bRnM8RafdjIOuuRrfuGWqDWvoqNU4CMt75teS4FLPrUJgJ9c+UVvYcf960jdd
	eSTzoBgV1JxD+l9EOtChY/oTjUnxw/PuTBBF7gb7wBSUOuEGVeGOLNJVM4Jq0fH+
	ztqSwOI=
Message-ID: <0c74dd96-2978-46ab-a399-9c94c9529b2e@prolan.hu>
Date: Wed, 5 Feb 2025 10:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] Frequency & duty cycle measurement?
To: William Breathitt Gray <wbg@kernel.org>
CC: <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<timestamp@lists.linux.dev>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Dipen Patel <dipenp@nvidia.com>,
	<dlechner@baylibre.com>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
 <Z5efcokgHix-k3lW@ishi> <dffc0f18-799a-4fc7-a6b5-2fa270e1fc58@prolan.hu>
 <Z6KkusvLFPcNvEfl@ishi>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z6KkusvLFPcNvEfl@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_013029_996337_8872C969 
X-CRM114-Status: GOOD (  22.22  )
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

On 2025. 02. 05. 0:37, William Breathitt Gray wrote:
> Are you still having trouble with this? Is "X" the
> capture{0,1}_component_id value?

X is 0/1 from `/sys/bus/counter/devices/counter0/count0/capture{0,1}`, 
which is also equal to the respective `capture{0,1}_component_id`, since 
I don't have any other counters. I checked that beforehand.

> I apologize, the Generic Counter character device interface is
> underdocumented so it can be a bit confusing at first; I'll submit a
> patch improving the documentation later this cycle when I get a chance.
> For now, let's walk through how to create an appropriate Counter watch
> for the capture extension components you have.

After much tinkering and reading of the `counter-chrdev.c` code, I now 
see *something*, although it's much slower to make a measurement than 
the sysfs `reopen()` hack.

> The first step is to decide which event we'll monitor and on which
> channel: we want to monitor Capture events so that's
> COUNTER_EVENT_CAPTURE, and we want event channel 0 (n.b. 0 because
> that's the channel parameter value passed to counter_push_event() in the
> driver).
> 
> The next step is to choose the components you wish to watch: Count 0's
> capture0 and capture1 extensions. So type is COUNTER_COMPONENT_EXTENSION
> because we want to watch extensions, scope is COUNTER_SCOPE_COUNT
> because we want Count extensions, and parent is 0 because we want
> Count 0's Count extensions.
> 
> Finally, we need to set the component id for each extension. You get a
> particular component's id by reading the respective *_component_id sysfs
> attribute: so for capture{0,1} you would read capture{0,1}_component_id
> respectively. These component id values potentially can change with
> future driver updates, so for robustness your userspace application
> should read the respective *_component_id sysfs attribute itself rather
> than hardcoding the component id in the Counter watch.
> 
> However, for the sake of simplicity in this example, I'll assume the
> component ids are 42 and 43 respectively for capture0 and capture1. That
> gives us the following two watches:
> 
>          {
>                  .component.type = COUNTER_COMPONENT_EXTENSION,
>                  .component.scope = COUNTER_SCOPE_COUNT,
>                  .component.parent = 0,
>                  .component.id = 42,
>                  .event = COUNTER_EVENT_CAPTURE,
>                  .channel = 0,
>          },
>          {
>                  .component.type = COUNTER_COMPONENT_EXTENSION,
>                  .component.scope = COUNTER_SCOPE_COUNT,
>                  .component.parent = 0,
>                  .component.id = 43,
>                  .event = COUNTER_EVENT_CAPTURE,
>                  .channel = 0,
>          },
> 
> Does this resolve your chardev read issue? If you're still having
> troubling, just let me know and we can troubleshoot further to figure
> out what's going on.

I had no success using `channel = 0`, only data from `capture0` comes 
back. If I set both `channel` AND `component.id` to X, then I start to 
see similar values than what I get from reading sysfs. (For now I 
hard-coded all values; I agree that the correct way would be to read 
component IDs from sysfs, but this is still a PoC...)

Did I do something wrong in implementing the driver maybe? (See the 
submitted patches.) And any idea as to why I might be seeing the slowdown?

Bence


