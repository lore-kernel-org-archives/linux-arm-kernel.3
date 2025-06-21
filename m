Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3B6C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8Cm6OZTP4F2j2Q9XkN9rRSITxGowWMls2fh3eRV5qw=; b=uAhhwRgZgMs/0xMVC0UWSyi7S4
	N02q0I8SJ57bn9svAtNpQ1gjrqFJvIYtTIqL4TIFSwPxpkYxignag2Xgvz7nGT+QFBccwTMNNqiaj
	8pioEo3hVlHbhuEFVYcQjY53cnTVwmhWiwUEgvfuytePc2dcRIuxdnGVupXwW2+gA1rnRP3P1qaT5
	rr4mJSH7D6uYlNrHYgsf7kX9D2JWAVFZHNofQYwIGJJArqPncA/BUUe4qAkQZZsjM2PUn68oSFZoO
	RIeQKuwWqet7ec7UdsPVhVQen0GhhBMAtRVpu1P6Ze71zHjBTUz1K4Ijh9fl2fOLizNRy7/gu4cF0
	3w5Dxi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT2un-000000008eJ-1Mz0;
	Sat, 21 Jun 2025 18:26:09 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT2sW-000000008U5-3voq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 18:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1750530228;
 bh=c8Cm6OZTP4F2j2Q9XkN9rRSITxGowWMls2fh3eRV5qw=;
 b=tVFzfdowNMrcre6s4svam/1WKaf+ktOSFpiE/d/y2P+fA5hjDjg2kueIel5CJn5axJGxUPtDL
 6lDiAtGEJN85UucUOhpa3t4IeUDC5V0crk7T8zVIaehZQ7NDEh5qa8YVEsvOxoZweKcQSodQjVo
 1NKzJdfhPLkFwL3VpMI2yYayR1tUJFIWtQE8tyYdRRoOLKWpKc+tNYp58DnwcCCvqYTEMoAwXak
 DrXwY13GrFFdj5+WjM06PB5Pa2dfRPUAXzATOSdxN0o1XkNFZU/ZgRnYvrGa1yIjWaVbDY+6B22
 xD39aj9Z0s12gxH/fIgiSukpWACZt+V8VUqjhB7VCy0w==
X-Forward-Email-ID: 6856f8a805da1d979e438ca6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <40a8e390-64bc-4822-ab53-8f2b65c0b1fb@kwiboo.se>
Date: Sat, 21 Jun 2025 20:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] dt-bindings: gpio: rockchip: Allow use of a
 power-domain
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-7-jonas@kwiboo.se>
 <20250527193439.GA1101149-robh@kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250527193439.GA1101149-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_112349_328333_ABDCCBEB 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Rob,

On 2025-05-27 21:34, Rob Herring wrote:
> On Sun, May 18, 2025 at 10:06:53PM +0000, Jonas Karlman wrote:
>> The GPIO controllers in most Rockchip SoCs are part or power domains
>> that are always powered on, i.e. PD_BUS or PD_PMU.
> 
> Are these described in DT, so this is valid to add for all SoCs?

PD_BUS and PD_PMU for prior generation Rockchip SoCs has typically not
been fully described in device tree. Probably because they always needs
to be powered on or missing documentation.

> 
>> On RK3528 the GPIO controllers are spread out among the PD_RKVENC, PD_VO
>> and PD_VPU power domains.
> 
> So should be required for RK3528?

One of the five GPIO controllers on RK3528 is part of a power domain not
being described in the device tree. And without having access to any TRM
or other documentation it probably wont be. So requiring for RK3528 is
not fully possible, and for GPIO controllers in other Rockchip SoCs the
power-domain could theoretically be described in device tree.

Regards,
Jonas

> 
>>
>> Add support to describe power-domains for the GPIO controllers.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
>> index d76987ce8e50..bdd83f42615c 100644
>> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
>> @@ -41,6 +41,9 @@ properties:
>>    "#interrupt-cells":
>>      const: 2
>>  
>> +  power-domains:
>> +    maxItems: 1
>> +
>>  patternProperties:
>>    "^.+-hog(-[0-9]+)?$":
>>      type: object
>> -- 
>> 2.49.0
>>


