Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7485EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvjkR40XVIjKCU8fvk6ZQ5E+1Jm3hNpLQMJ9KPp2Fqg=; b=y4JkTTDsqdsVIFTWXJp596PyiL
	zAdCA0ZjUA0+AgVTwTBigl0JBiUxDKRltVJiyekYSRunnwYwwsvB5xKRCehobVZ+yZ3Qj1if/vTKO
	RVc+/LIM82PT7y0popKBUtzTpl+aZaXpSu/PeOLyQQ5Y8GSo6iRGgTdOJJ+RvLj5zX80r7Qy+yDVf
	0JhJ6tl86xhwlEI/fGoUE/S3tzBWpFz8KT3px1jqT8XIdAqPXhvOnFaIDkzcS5KyNXmKiFC1xmwQh
	Z2i8PLVf48eCO1JjWH134VgIj6+50fMMIYYIbGHWOVW6B3rOyqjNhBwfKMzPJI5roryql03i1X7nS
	9LXvCJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiygj-00000007fae-184l;
	Sun, 12 Jul 2026 18:14:01 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiygh-00000007fZv-0cX6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 18:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783880038;
 bh=JvjkR40XVIjKCU8fvk6ZQ5E+1Jm3hNpLQMJ9KPp2Fqg=;
 b=q1X+W1QBEVz2gRqliAu/2nnsdnQjeO4dXIuJGZm+zFuRVnRPSn5A/Hced0Xv6ug+6VgaqeMen
 lYxP8QdFIniqnfSb+Cyy8acDHEJczQhIKrwvrFx3E2HIdaeFfh8SD3jgeblScZFM7lvtF+ZEUGo
 3uQEnfHbrEPTH7bc7IctkG25KE0TJ56eFw/7OU4IsC/ZiJdmGSoBI9IxN7lazynO+Pyk9q/egRZ
 T1nAq3UlsJnLamf+yHDzuApX7IDuv7fB0LfFvEPidJO3hHag61fYFAgxK+12VipUL6P1NolPPJF
 KN1r9jnNkVZyznmpKyycCSZFK5ECeEPGfAHN+K9TX4lQ==
X-Forward-Email-ID: 6a53d960d1fe0afac937d1ac
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7c114e4b-b2a0-4246-b2da-5f671984a1c0@kwiboo.se>
Date: Sun, 12 Jul 2026 20:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] arm64: dts: rockchip: rk3588s-nanopi: add
 missing sdmmc cd pinctrl
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-4-422675a65402@gmail.com>
 <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
 <CAPSPb=t33bHfuEAMLWPM5=2fSyJXv5vjYD=_pSNRq6GcUz-X_w@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAPSPb=t33bHfuEAMLWPM5=2fSyJXv5vjYD=_pSNRq6GcUz-X_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_111359_191819_F869AA31 
X-CRM114-Status: GOOD (  16.12  )
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

Hi Joachim,

On 7/12/2026 7:59 PM, Joachim Eastwood wrote:
> Hi Jonas,
> 
> On Sat, 11 Jul 2026 at 01:18, Jonas Karlman <jonas@kwiboo.xyz> wrote:
>>
>> Hi Joachim,
>>
>> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
>>> From: Joachim Eastwood <joachim.eastwood@gmail.com>
>>>
>>> The cd (card detect) pin is used, but not reserved through pinctrl.
>>
>> Maybe this and some/most of the other DT changes that fixes some missing
>> bits should put first in this series and with Fixes tags?
> 
> I can of course put them first in the series. So we have the option to do so.
> 
> But what is the policy regarding "fixes"?
> I don't think they fix any critical issues, but they do make the DT
> more correct.
> So do we want to backport these to stable?
> 
> Maybe the following changes qualify:
> arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
> arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
> arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl
> 
> But I don't any others should be considered fixes.

At least the pcie and sdmmc "fixes" is likely something we may want to
pick to U-Boot dts/upstream as soon as they are available in the
devicetree-rebasing tree.

Regards,
Jonas

> 
> 
> best regards,
> Joachim Eastwood


