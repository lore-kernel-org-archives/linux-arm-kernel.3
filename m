Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711B3C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZx2NZXuKQJ5MZ9Menod0GULsbjcKgAMbN3yCF9Zij0=; b=D9tl/y81ejigKu//i2etae3e4a
	j+2okt8T6K3wZ6HNnmEJfeRn/LgxAJ2Gbc1ZgQoORY9+II1vqgRqXZoPfbH83VY3AAUx1LTceuF9U
	wOaa6EWeq+gtnGLzGYVnAmltvXo4SUFrxFXM/URUH/EFLQcpqvMcDeyOGPKOyc4iRZB2ZVzk8Q3vH
	QlOVlxoAdP5sWJ/dWh48JQO+j9GOoHiDLU8mGKn6Cm/+3vQU7ybJmSnbzwcbkM3QYGaSgWIvkmpvn
	EEJ23kZK337//h5dAAMGdMMNVBiokfDWgOr2T3vT/oXZF8BVcxuMRaDWh4mpawhpdCHE8G433zMZU
	pxRuZ3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uacBa-0000000GlXo-1Anh;
	Sat, 12 Jul 2025 15:30:46 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uac9A-0000000GlSi-3uly
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 15:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1752334093;
 bh=lZx2NZXuKQJ5MZ9Menod0GULsbjcKgAMbN3yCF9Zij0=;
 b=uQ8haAeCDZvZPeMmV/lOzU4dUUFRUPwhGYxhVn0NeCPSU5s00bgrBV1N0r6wbYK6FmQkXEYoI
 4J7SD9WMkw6FIwaQckg59iMYdiCJBeBwxpet/8C6PCLRv46l+91rYWVxKyKpZzxQdOxEgIAEEeO
 Xzepq7v4X1ykFgY8BExwV22VdKrbNJWdNRn+/+qflCc98OCy64fJEl6W3+ROcHzySwJ0jMa/lnm
 1i0PSmcCtCx7mFlSLcBOgluhFpuAT2eKZC7h/qdqeDgorK1B2tktCLPk9tphuTjFlMAJOUqPPXR
 i4C8NORCZEgFBl2SCd/8ttmS1IhyhEwnAoID6kyPJbUA==
X-Forward-Email-ID: 68727c4bd7dd91652d167c59
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d4bc7bf4-bc56-4fd8-9121-379ac974b236@kwiboo.se>
Date: Sat, 12 Jul 2025 17:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 ziyao@disroot.org
References: <acbbf570-7a56-4d88-a631-32acd13d29c7@kwiboo.se>
 <20250712040019.165440-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250712040019.165440-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_082817_091317_0332AEEF 
X-CRM114-Status: GOOD (  15.34  )
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

On 7/12/2025 6:00 AM, Chukun Pan wrote:
> Hi,
> 
>>> Should this label be named as led-0/led-1?
> 
>> The nodes must include 'led' anywhere in their name according to schema:
>>
>> """
>> patternProperties:
>>   # The first form is preferred, but fall back to just 'led' anywhere in the
>>   # node name to at least catch some child nodes.
>>   "(^led-[0-9a-f]$|led)":
>> """
>>
>> Using the color name similar to the the pin labels in schematics made
>> most sense to me.
>>
>> Do you want me to change these to conform to the more restricted
>> ^led-[0-9a-f]$ pattern?
> 
> This will be better.

Will change the node names of the leds in a v3.

> 
>> I only try to enable controllers for devices that are properly described,
>> so I ignored the pwm-fan and its required pwm6 controller. Mostly
>> because it make more sense to describe the fan once thermal support is
>> completed, work [1] currently being blocked by a rk356x otp series [2]
>> and that depends on a rk3576 thermal series [3].
> 
> Ok, I got it. Is usb2.0 also stuck?

USB2.0 is mostly stuck due to my limited time and possible power-domain,
will try to send the USB2.0 patches to mailing list tomorrow.

Regards,
Jonas

> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


