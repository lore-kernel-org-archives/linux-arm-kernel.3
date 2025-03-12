Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0F6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FK77bkIxkuIQ2RaZVUX+w+kEVUOJvqyQlYfCNDo4oio=; b=wtL5yeRPqC5BQURKadmiNs4jp4
	O97NjmLeK+Fr3qR+E0Imnx34E269geUxc8/DSwIteb3YLbIHRBtguscRTpLfM/CPspymSIfzy0OLc
	i+7uM/KUG+1+HYFZ0OPjrNykGq4/GFvMoTiedwzDVSfW1GdYLw2UTzk53qvOzVFvXg3Cu3YPx13b8
	XS2xUueoRHtzQTLi0s5ksewNjykiGACXs+ANQEh+vpIBMcIEYokMVc/Dt7UQ0tTx0BXDsEvYPQ2hF
	QQH4KMMozebczczaf6r0m9UQMxDmAzT/HNJqUmlk882/e8jgBUdgJpURLl7QOEGMXqD0zmqO9lBP1
	xLlpj51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMff-00000008e6o-118k;
	Wed, 12 Mar 2025 14:02:55 +0000
Received: from smtp.forwardemail.net ([2a02:6ea0:d71e::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMdy-00000008dv1-0enk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 14:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741788066;
 bh=FK77bkIxkuIQ2RaZVUX+w+kEVUOJvqyQlYfCNDo4oio=;
 b=apy/J+F53lEE6ZXXi5L1hKUb/Udt8pKv5i8UuLcH/PMdmUhnOM6LARCufHgSXLgkzbm7X3pFi
 wIvu7uKIwB3fi8Q+Zae2QMFP+f+mxxm1g/LdjI/fGf+P11lT/7ASIoBLJoTbH1uDyXugegVDhmG
 S3nT+lzQnRhS0zetkuh5bEgTjj3NjPggK+XlGihDpCqcOmKkzVr69+mqYtwn/77Hwq31o/ftsfX
 W8oFh+K58PeuwIxL3bJT2dIAiFBCZ7qCZNwDxVmsc596rGzPKKmOnjOSO+gvS3fznoZApRdd64r
 t7UIxO/wQzBCUJ4MnzY6efxI8ZVl/yRSN2R8a/AFIPFg==
X-Forward-Email-ID: 67d1939ea3842b4a6f18c3e1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a5ec9062-ca57-4748-8c0f-fb5b9c75fa28@kwiboo.se>
Date: Wed, 12 Mar 2025 15:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for
 RK3528
To: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Yao Zi <ziyao@disroot.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
 <174176555637.249409.2785731072183565436.b4-ty@sntech.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <174176555637.249409.2785731072183565436.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_070110_551155_25636AA3 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Heiko,

On 2025-03-12 08:45, Heiko Stuebner wrote:
> 
> On Fri, 07 Mar 2025 20:00:02 +0800, Chukun Pan wrote:
>> Add pwm nodes for RK3528. Most rk3528 boards use pwm-regulator to
>> supply to CPU, add node to enable them. The PWM core on RK3528 is
>> the same as RK3328, but the driver doesn't support interrupts yet.
>>
>> Unlike other SoCs, pinctrl-names need to be in "active" state,
>> I'm not sure about this, but otherwise the pwm-regulator will
>> not work properly.
>>
>> [...]
> 
> Applied, thanks!

The pinctrl-names should be changed to "default" and not "active",
something you can fixup or do you want a patch?

In commit 96d8d3253246 ("arm64: dts: rockchip: Fix PWM pinctrl names")
similar issue was corrected for current rockchip boards.

Regards,
Jonas

> 
> [2/2] arm64: dts: rockchip: Add pwm nodes for RK3528
>       commit: 2973d077aedfc114affab96c3b2c7286163cc8c9
> 
> Best regards,


