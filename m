Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282BCD39415
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS4xrv2sD/iCCx4NjkrxG3qRMXJ6P8C3NNJ6hNqyLu8=; b=XIo5Ea6bZROmq1LZJoykN3Ig+/
	QosOkXT/Tuf6H1ZHZBv6lIjdPST2eLpzsynza1UsiyB+Pxeha/LCZz1MkPhFQU5l6o5F4WEB5NWBB
	5IYYcx052A3x1XVmcBtYYrpDL7fIoc1puS9nclO1oUSm7DllJKuevh0XJg89o9a+5lKNuSf7RmWaC
	aiDLwVfj9gSlNTbphS2t23kIe2oUFI6AoNWx5QtkuahE1rSgwCapX//LuPo4sylqjrLozXqs/uXb/
	4VCiWxKU8/cFrZY2WnSdhGEYTEu37xU3pU1yOtddirLnPmcsF7lrxmc4EuHpSyKLiZr8WGEolLUwQ
	3Mrgp6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GVq-0000000HXln-0hNc;
	Thu, 02 Apr 2026 11:47:02 +0000
Received: from mx5.sberdevices.ru ([95.181.183.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GVl-0000000HXkQ-4489;
	Thu, 02 Apr 2026 11:46:59 +0000
Received: from p-antispam-ksmg-gc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx5.sberdevices.ru (Postfix) with ESMTP id 05B9A240005;
	Thu,  2 Apr 2026 14:46:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx5.sberdevices.ru 05B9A240005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1775130402;
	bh=LS4xrv2sD/iCCx4NjkrxG3qRMXJ6P8C3NNJ6hNqyLu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=N+YMWDi2qhINcmzCHNSXhp6ERUeAKq0p2KdXHod7x7aVtTbW/R2sG6vjo9+SsWIbZ
	 +SnIEKHalDH9insT3IKFn0q3um+WvBs1BIOBKgrf/74KweMlOZJiwd3jMQKCTdCAVu
	 Yt6B8OfNaXdDzH/6PxXFTFdHOIZyQjv7m6GshOjzuprKb4+MEHiOI0an8KSrDh3KsU
	 dmSqbyp6pjRjkcXYclMWN1Gig69RoIZt5jZwjNd2Hh5OHqeNtCMOPtfA/7et9dAzYf
	 +ZkVcpDBQDt7oZJG8SuFp7UUVJU9YcnnHGFtm0sklPjSiLJyDYiWIe01oIpU/qXOkh
	 /AGFJPh0taGDw==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (not verified))
	by mx5.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  2 Apr 2026 14:46:41 +0300 (MSK)
Message-ID: <6fd5f5a8-dd60-48ad-be29-d263578e6b0a@salutedevices.com>
Date: Thu, 2 Apr 2026 14:46:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error]Re: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, <linux-pwm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Junyi Zhao <junyi.zhao@amlogic.com>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
 <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
 <70a637b1-a76a-470c-9a97-0b4599a40a1c@amlogic.com>
 <4a9c726a-d580-4b0b-9530-228b58389c80@salutedevices.com>
 <78e05060-6f25-4d78-8b0d-35b8fca0cecb@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <78e05060-6f25-4d78-8b0d-35b8fca0cecb@amlogic.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.28.2.68]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 96 0.3.96 f0df504111d78c4fb91ce829559989c2d1ddd192, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 201900 [Apr 02 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.22
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/04/02 09:00:00 #28364014
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_044658_518757_9EFBF6FA 
X-CRM114-Status: GOOD (  17.45  )
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

Hello Xianwei Zhao

On 3/31/26 10:59, Xianwei Zhao wrote:
> Hi George,
> 
> On 2026/3/31 15:33, George Stark wrote:
>> Hello Martin, Xianwei
>>
>>
>> On 3/31/26 10:10, Xianwei Zhao wrote:
>>> Hi Martin,
>>>      I confirmed with Junyi Zhao that the current implementation counts
>>> from zero, so this submission is correct.
>>> We agree this should be fixed and will address it in a follow-up patch.
>>> Thanks for pointing it out.
>>>
>>> On 2026/3/31 05:54, Martin Blumenstingl wrote:
>>>> Hi Xianwei Zhao,
>>>>
>>>> thanks for your contribution!
>>>>
>>>> On Thu, Mar 26, 2026 at 7:35 AM Xianwei Zhao via B4 Relay
>>>> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
>>>>> Add bindings and driver support Amlogic S7/S7D/S6 SoCs.
>>>> There is an old report that got lost, stating that the current
>>
>> Xianwei Zhao thanks for the confirmation.
>> I am the author of the old report and the corresponding patch and it's
>> not lost. So if the patch is correct I'll be glad to add relevant
>> tested-by tags.
>>
> 
> I will use your patch and won't send a separate one.
> Do you mean I should add a Tested-by tag to your patch?

Yes since you've confirmed the problem exists then your tested-by tag 
would be appropriate. And I'm ok if you resend the patch. Thanks.

>>>> pwm-meson driver has an off-by-one error with the hi and lo fields:
>>>> [0]
>>>> Since you are working on bringing up a new platform: is this something
>>>> you can verify in your lab?
>>>> To be clear: I'm not expecting you to work on this ad-hoc or bring a
>>>> patch into this series. However, it would be great if you could verify
>>>> if the findings from [0] are correct and send an updated patch in
>>>> future.
>>>>
>>>> Thank you and best regards
>>>> Martin 

-- 
Best regards
George

