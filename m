Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7E5C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 03:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqGeZE73TwGqd4RTSmyG3nXolmwonmj7ztlZhk+6TDY=; b=Hn8zDx0/6iNyapJDIYbmFpVs8K
	SnNhAmcF+gFfWMyQ1wl24uTt769MZCIGaU4lbW696f4dwjvva03Lv1PToPU+x7Ac/fbhrgEiaTNMf
	td7p1tvF+NFZrjDs7N0YRPNVV4r9NTC0kUerul6L+c1gIhQXHhrfcyUBrCHRqLuv1VDkuC+p2hMyk
	miZEwBZZgxWiryU2oI45k0Z/TyE+HHXvknUl6HNmsOB9vk4D7jvrL7YwUz0LtGdGnnMN6Xu6M/0ds
	KRqdvQkO5k3p0IuShyaiK2wb5BtZsB8WTxqrfvm3oHTHuSzsTPGQ0gnou1+jgqhbgQ2+jol7FKBiW
	ueIxF2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Jo3-00000005738-01g9;
	Tue, 15 Sep 2026 03:26:03 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Jo0-0000000571w-1g9E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 03:26:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1422A10426F;
	Tue, 15 Sep 2026 05:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789442751;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AqGeZE73TwGqd4RTSmyG3nXolmwonmj7ztlZhk+6TDY=;
	b=XfbDylbgzwNf9RJ0sFxeK5F/WtNYYkvLKhatTkcvskX4I3c+75aBzJuxPy5ZoGQMH8R5r5
	fpgKxWYqMem2uVOZPISqmuNV+zUY8j9+zejHE1kHn6zcReZMyilN3EFl9cjSuFybkvjdPU
	kuh9T+SvW2qAF9h13tKlbTRtEiWpVQ6gojQ2NcaPDgN4muLjLQqoquuoJMlC0VFAC07XOa
	xso++3biTMy9dF1plVj+dr9AqzdH/V1hhMrq9xsaL3trcLhOa3LhZTaQb6RPURQX26HMBW
	n7gigdPQvnEQg6k3o+6fXM3QVUA/WAyz8z+BlGuOuTreYrmaw7mvNwnd296r2A==
Message-ID: <e7398227-fd42-455b-9582-73690d104fd9@nabladev.com>
Date: Mon, 14 Sep 2026 15:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
 <874ifwjff2.fsf@dell.be.48ers.dk>
 <fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
 <87wlspb50g.fsf@dell.be.48ers.dk>
 <00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com>
 <87y0d4v1nu.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <87y0d4v1nu.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_202600_671244_0B87AB85 
X-CRM114-Status: GOOD (  11.38  )
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

On 9/14/26 7:32 AM, Peter Korsgaard wrote:

Hi,

>   >> OK, but why not add all the referenced GPIOs if you fill out
>   >> gpio-line-names anyway?
> 
>   > Because the userspace depends only on this one line name. But since
>   > eeprom node contains wp-gpios DT property now and the kernel controls
>   > the nWP GPIO, I can also turn this around and drop the gpio-line-names
>   > entirely. What do you think ?
> 
> Up to you. I personally find it helpful for debugging (E.G. the debugfs
> output), but if it isn't used at all...

Lemme start with the later.

Thanks !

-- 
Best regards,
Marek Vasut

