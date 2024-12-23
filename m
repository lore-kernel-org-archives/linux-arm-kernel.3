Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF73DE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOnYduIPidHN4q1NxdzXcanIW9dcGY5ZZeJ/6KuPgGo=; b=yXyquYpjPhghMxuCxuGr4QzA7q
	YpURl0bssfuJL/H4iJsNd4MdAgVQIyskFxLrvwYHte9hx4PytP1NkVFikhv+S85ycC9vDVxnhM+Sf
	L98n1DsMhly+jtmmtRaNd6aZEe4eFU/eQZilmEl2aYr99Hco1AC9LKhDNw/KJfQNFLSvECoxk3Off
	ytRTIsjXZFzx5RcAfqeXTyhIvHqAhNBS4ZXdlJFRpaUqumnnU9e2oLjD9xnUYmJK7YAg5xUbxuRS2
	yntI9jm8rW5erSi3RlG1r+P6/+wANGyfKUdW84PIcvzFPm/2phmYOUgUpBA6p72S5ZIo8rzUX9zRc
	2vYjPQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY3A-000000099CG-2Cvm;
	Mon, 23 Dec 2024 02:20:04 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPY1x-000000098rS-3eCu;
	Mon, 23 Dec 2024 02:18:51 +0000
X-QQ-mid: bizesmtpip2t1734920304tea5qv3
X-QQ-Originating-IP: ezt7iJeIOhFwRGcZt6RvbLLr7yMoO95fCZuILLkjiHk=
Received: from [IPV6:240f:10b:7440:1:5968:fbf4 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Dec 2024 10:18:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2941970314100960228
Message-ID: <4D8217DF36191C3E+be8bbb4f-ea52-4f81-8501-ff551f54621c@radxa.com>
Date: Mon, 23 Dec 2024 11:18:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on
 Radxa E25
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <6EFDC4E74A617E25+ed534e8a-fef0-4f09-a24b-a536b7f2f13b@radxa.com>
 <20241222043027.265865-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd.
In-Reply-To: <20241222043027.265865-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mc2Lb5E8Dw57IpQAYMCTMkZySUR0dtV7t7Zlbho6KTZnT/o9Naw1qD62
	jlXcihawLwY5N0XA613U/hkcov42RA4/2miqlKZ9kRssAFYHg6Al8+f6VMmqgLMk7bzhc8I
	3oh6s94hHAIQSWAhAgVw16WBOR36EC3ulcinikhwq91kKXUgTqhzv2l87Lr2p6ykUWBNhjb
	EZMiL6pcXwku0Bv65fR1aQWCAUHCXd7ED3x31IIF2oOL3zv1VPktyRm3nxFT2pNf/w4g/5I
	INd7lioXYvhdiNlm4MlQNW/IVL3BVVjtczDP9BVOB3wDPzS074CeaPlPu1t3finnGXzlRZJ
	71bI5ff0F9A+NI7+73gd2Ksy5GtTG/B/hgMqxm+TClM83u9ZpNS+atoNaass/W0LMjgA0fj
	n+90EWN5hpnoXAZmzryU6A1pCNtXF4nT06IPHGVrl9KajcDXJV67En/XGQHDO9Y+zw60tcy
	cXBn26KIZQc67pJDJ+Fxr+K1RnAzcj4/GxKpCSpPo/bQ+gt/6Ri5a2Y+PDYMUnrU5AP7ZVL
	v1z6Eesw3cuhRq1AHQBLIJGNTBQN6xMgoZB6Pzl2KVyWRZlfffuY1rKU3Z/CRQ/FN74ZnS/
	gaETeZaKIp8MpR6GLvlGY6b4jV9bQQs0WSIfkWtlAEBhPALqqp2dMrt2ry0KP/Lzo+GBV9R
	m+DqcMGlByA6lgKW6I+SYIivpHfoVlxCEsygu8vifDDCVNoVPxJqUnXXVYjF24JqQKaweG0
	Op01XyZhEkkhAhqnjx1X2sIdGSmuplHvEa5YREeSqHKG0f8jN4HBdOrGzEKk6+fHeNh0MIY
	g41on44f6c7LKs9NH6jW2tZPNCAVYOWNHDHOq77IE3hmUzWmZOyYuscUN9rTg9dfot4tfJa
	dIKnuFyxuvHJdufSCTtDU83NGwoqGRjas/hZDksQAh1jiGW9EgTwAehSmlpyalIn7uG8rL4
	/UBwBlLdGyO8NM1nh7ww4K2ZJ
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_181850_457130_504FC149 
X-CRM114-Status: GOOD (  10.93  )
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

Hi Chukun,

On 12/22/24 13:30, Chukun Pan wrote:
> Hi,
>> Could you check Product Brief P.4?
>>
>>   https://dl.radxa.com/cm3i/e25/radxa_e25_product_brief.pdf
>>
>> There is "USB3.0 OTG Switch".
>>
>> Best regards,
> 
> Oh, sorry, it was covered by the shell so I didn't notice it.
> BTW do you see any issues in the sd-uhs-sdr104 mode?

I've been using the uSD card for a long time as a bootloader only, so I 
don't know what the problem is.

Do you have any information on how to reproduce the problem?

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Thanks,
> Chukun
> 


