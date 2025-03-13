Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AE5C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6TtqnWRHap1+zGPihePGn3UrV1PoskvkH+xAMooAk4=; b=luKUSsgW1oj9j254GXzBx1bcHe
	QAYouwVsBSwWtR71gTvE1bv7yWf+IXswl3Wf6pH0ZWC6k29CMj8PzM7JvfdHvuAjY62sg7oGgJJkm
	Er/qyLXGD4KagAIw5Xh+8QFT/aHnhIWB0+cfkhhbtq0ByczF5ftuTSM8QxL6POlr3tBig+JN6u9Ej
	HyV3IkONkTcusCNKYM9f41McgwRSmBD9e1WbAxiibFEt6iSfp6NX2qhKsm9VVJQI0RLsIFvFEAoUK
	QxS434croZUXZoZjf8et2rEqDIBQCu5oXX14pi2g45V1ZGD3umKFCj7GneIlmKYO3nNvvF+N6X24S
	0FT0QhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdrI-0000000AXJh-1wuM;
	Thu, 13 Mar 2025 08:24:04 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdpb-0000000AX5n-2SMQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741854136;
 bh=+6TtqnWRHap1+zGPihePGn3UrV1PoskvkH+xAMooAk4=;
 b=jHKclm54nareliKFW22AKZ8TtNtKH39oimuTwJR+P+hmrkIEFKrlbGH2O9MjiKb8L+FSJse1Z
 H+ho1w0Y94adLjcZ+oie8BRn7sXYgMKQ6OXw/P7BMpA0cINNSja7oDkVplgZe3vJg6Of8B/IirG
 GEfe7cHPuPEJU3H7dvDBFbxD5SG+2GoaJ4kkCq4I8en0BDZLims8A6fpZlO48lYgrkAgVDmvUbl
 vHMpZWQBwicUoHi6pJ+aIBp6lnvSgJ3OeouPYWpa+x7EPAJC1OwTvLCabPnLSIJGYpD2CvtjEYC
 BFzbnFOJlTSkU0Xi27AfTztYkvDOhUAZz+D1gViZK8rA==
X-Forward-Email-ID: 67d295b469c9ba463efbea93
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <60065c0b-4597-4976-b74b-172556c4e156@kwiboo.se>
Date: Thu, 13 Mar 2025 09:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: heiko@sntech.de, Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <7779050.EvYhyI6sBW@phil>
 <20250313071031.1840032-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250313071031.1840032-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_012220_080351_1F49D78A 
X-CRM114-Status: GOOD (  12.95  )
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

On 2025-03-13 08:10, Chukun Pan wrote:
> Hi,
> 
>> so yes of course the pinctrl needs to be default - simply because
>> that's the only pinctrl state mainline supports.
> 
>> But judging by the fact that you're discussing working vs. non-working
>> below, can you please check if we should drop the patch for 6.15 till
>> that is solved?
> 
> I suggest dropping this patch first, I will send v2
> when this issue is solved.

I noticed that the pwm nodes and saradc node ended up in wrong mmio
address order, so yes please drop the patch (or reorder nodes) ;-)

Chukun, please get back with more details about the issue you are having.
E.g. a stack trace, what board, DT and U-Boot you are using etc.

I have not seen any issue with PWM using the merged patch having
pinctrl-names=default.

Please see my Linux tree [1] and U-Boot tree [2], those are little ahead
of what has been posted on ML, e.g. it has working USB2.0 host, CPU opp,
Hantro VPU, GPU + opp, arm and logic pwm regulators for E20C, ROCK 2A/2F
and Sige1.

Will try to post USB2.0 host and Hantro VPU patches later today.
CPU opp and GPU + opp depend on PWM and I was planning to post that
together with initial thermal support.

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250311-rk3528/
[2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528

Regards,
Jonas

> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


