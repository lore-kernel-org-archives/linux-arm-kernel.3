Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61AEFF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqy2ZQ2K4gQV5vy8fXRZ04Ksn+hbGqCwiDElTb+KLWM=; b=C100KVxaiKEQeJ0fW23S18smi/
	Y1Yu3h7l7A4RJrCy1pMwW5FQlw/+IN1dneSfdFCT7l2OTDhWTKcpHw4JUuBAQTh8ZBj84sVmgyCnO
	Pn9ck1lCO2eQ7fW4QvrR9xnYcgT3/e1S28aAvf/a1PP24m0g3qd6rDn+DuFxb154SHzbFvyU4KppD
	LIJJXPCk9OMxxpPaJ9DJFjeHu3SiRnVdSbCzVfrV7fKSIwDcFLojYb408GsPkSAeS6JVWz9h6EfFF
	vcjbl27Nd8xm1bFfGu8eMEDoELD9lUjqiDOACeV73wIKy81m8R98Qsk/94l0HHyN9mMnFb4jQA79Q
	7/CcfMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tc6-0000000CVIB-2n9j;
	Tue, 31 Mar 2026 07:34:14 +0000
Received: from mx5.sberdevices.ru ([95.181.183.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tc3-0000000CVH4-01Ji;
	Tue, 31 Mar 2026 07:34:13 +0000
Received: from p-antispam-ksmg-gc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx5.sberdevices.ru (Postfix) with ESMTP id 2EBE9240009;
	Tue, 31 Mar 2026 10:33:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx5.sberdevices.ru 2EBE9240009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1774942439;
	bh=pqy2ZQ2K4gQV5vy8fXRZ04Ksn+hbGqCwiDElTb+KLWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Vqbye4/gxEkN5y6SkrGeFFYraxQHst5BP5gymx/wE6420SwJHr3YNYA2U1nz+y/kG
	 LNbOv6RIwAvd0hJg/1DnZbvjH1qVZlhvtykhSQMmbXgDtSUwr6SzTgJbK8VuIBluia
	 ly3rPuZJW/xaBVtrLBWmsR6qCcI/pZ63sWIO5jXhNrBcfbiIa1tC+7cPv/RnqqnZXc
	 3F6qwy7WlwbvEAXsDQuKdL4bwwFG/1gXYyofGINJ6uknXgzTSEromqeImnrk7QXmrE
	 8zfZzParopCAq48OKIv7NCK5AikhalzdwH1IkT4OJa1FRsU9WfigWgQxqSd3Z83B/w
	 mH3hVWsaC4+Gw==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (not verified))
	by mx5.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 31 Mar 2026 10:33:58 +0300 (MSK)
Message-ID: <4a9c726a-d580-4b0b-9530-228b58389c80@salutedevices.com>
Date: Tue, 31 Mar 2026 10:33:57 +0300
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
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <70a637b1-a76a-470c-9a97-0b4599a40a1c@amlogic.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.28.2.68]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected, bases: 2026/03/31 06:48:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 95 0.3.95 0e4b6d4f1992c354ebd6a5cc3c5624a3b0aa8cbc, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lists.infradead.org:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 201803 [Mar 31 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.22
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/03/30 22:26:00 #28356219
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected, bases: 2026/03/31 06:48:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_003411_562939_3D9B4028 
X-CRM114-Status: GOOD (  20.31  )
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

Hello Martin, Xianwei


On 3/31/26 10:10, Xianwei Zhao wrote:
> Hi Martin,
>      I confirmed with Junyi Zhao that the current implementation counts 
> from zero, so this submission is correct.
> We agree this should be fixed and will address it in a follow-up patch.
> Thanks for pointing it out.
> 
> On 2026/3/31 05:54, Martin Blumenstingl wrote:
>> Hi Xianwei Zhao,
>>
>> thanks for your contribution!
>>
>> On Thu, Mar 26, 2026 at 7:35 AM Xianwei Zhao via B4 Relay
>> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
>>> Add bindings and driver support Amlogic S7/S7D/S6 SoCs.
>> There is an old report that got lost, stating that the current

Xianwei Zhao thanks for the confirmation.
I am the author of the old report and the corresponding patch and it's 
not lost. So if the patch is correct I'll be glad to add relevant 
tested-by tags.

>> pwm-meson driver has an off-by-one error with the hi and lo fields:
>> [0]
>> Since you are working on bringing up a new platform: is this something
>> you can verify in your lab?
>> To be clear: I'm not expecting you to work on this ad-hoc or bring a
>> patch into this series. However, it would be great if you could verify
>> if the findings from [0] are correct and send an updated patch in
>> future.
>>
>> Thank you and best regards
>> Martin
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Best regards
George

