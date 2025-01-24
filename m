Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E4BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqaazN5MwSV5jN25f6JI+L5jWF8z9mV2n9cXiYMfDyg=; b=ci1KGyM70PbtXG7ieP8CHNIAha
	m676o338DApcZpjg1I37QJc0cy5hYfnAC4BOiN/li50ofac4/+/gE4wuv+2MqESuuA+ikKytbpJQB
	/tJNGA/20Ebe3u8ip39JU8lyYx+3ylB7uqARMZzyZgQ7qVo3PDnMqRAaYN5TSwFom4AyCMgE+pUqZ
	7Rp+ZoVCZdDDbQmd5HvLPjdel2EKvNMnZapdGtTs7i3GDqvFnz2qi0cL5k9q6sp/OKPcpuVU2i+rx
	41cSXGURiH66pfuhYYpJggdlcnctnkUX6Apvt91xUTdYVHIyllECA/ZwgNnx+QyHiRQJaall2p48Z
	+cOUwD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHJB-0000000EV7E-1leq;
	Fri, 24 Jan 2025 10:53:05 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHGu-0000000EUqQ-2DnS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 10:50:46 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8D9AEA0578;
	Fri, 24 Jan 2025 11:50:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=RqaazN5MwSV5jN25f6JI+L5jWF8z9
	mV2n9cXiYMfDyg=; b=H/wj1Sz/BGB+zfpRkapo+9C2+kyX2krx7FMfXb6t9GeCE
	3fDHRHuKpMAcmk5n8U0nXsZm7Xa1jIsyEGE9A4X1A8+tYPV1IIkeS3erAmC01oQc
	po8Bc24hJqJ2qUixyL9P7ilY6H3jUbLmznvoACWspEnm7GgO4b0aNwBEB8+lJiHV
	QjUfVkB6WUWm3752qf5dpHzfvBPUA6vlGaG5ZMzdZbWiQEigvlXXo17yEmKzE0Qo
	3hSuLpgtEYcFpPBSW64xtDAKP1bNupCefVDvpiziUzFj5v2kVYeLFpD9CDpUj0p2
	aIgQaWV64IPhvrqv19cMjTbFotCX8tWW9beHWOXEJzsW37db9OEb1urg0ddPN9JN
	qZlL8zFdnzfNV2c/39BhUG+ozClPw5g36fN5DK0GJUfUUun/HNRjkzUyHZO0M1M7
	+5b4O/r3VQmbOyETpG9S6lqCQIuprUmrWZvcgE7Du9iAHbT6SCd9ECCyQlA6l5Su
	gY4rEY0b2mcWMONpqw9gXp6kLCJzDzuO7ym0qOpdzQpt/yPCV8EPN8ivmEmQr0cu
	qBfSWl1+/lJpEGJTNvSXtXYYT+gHzBetpx8QIt8qtf9JtY3OUxdIBf/mP7SThdTt
	rUmD4bUMzAIInJHoD/0Ig09IXhvltr1qaAEvkcTt6rZvMcx+HXiM5anHKuz6jM=
Message-ID: <51d368a3-fcfd-4f0f-9475-877739f19fb2@prolan.hu>
Date: Fri, 24 Jan 2025 11:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add more devm_ functions to simplify probe path in
 drivers/spi/atmel-quadspi.c
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek
	<pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, Varshini Rajendran
	<varshini.rajendran@microchip.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
 <20250124-stumble-unpeeled-165f2211dcfb@thorsis.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250124-stumble-unpeeled-165f2211dcfb@thorsis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852677063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_025045_036992_BDE2F5F0 
X-CRM114-Status: UNSURE (   9.45  )
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

On 2025. 01. 24. 10:08, Alexander Dahl wrote:
> You can pass '--base master' or '--base=auto' to `git format-patch`
> which adds a machine readable line to your patch or cover letter like
> this:
> 
> base-commit: bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17
> 
> This way tools can find out which commit your series was based on.
> See for reasoning:
> 
> https://people.kernel.org/monsieuricon/all-patches-must-include-base-commit-info

Thanks for the tip!

> I'll look into your patch series in February, after my holidays.

Hmm, if my calculations are correct, 6.14-rc1 comes out on 2nd Feb, so 
does that mean that this series will be pushed to -rc2? Then -rc1 will 
have the mismatched PM calls...

Bence


