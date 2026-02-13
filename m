Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EAEEDF150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvdxfPMq3ENALtKqXmHnW0FdBU4wQRCJOdA+xd6oOJc=; b=YrBFv90IHqtNV3M1GsSIvcoto6
	iLRa2zzVr7u48XGzupHcS7Pb9sEP6utdtHsJnNtNe+vMcSVJDUkOhVF2Bw49WNcREQm4GkGuoDj4z
	eqgidz8n2SzBeEFcPXH92KW9UnN5NcYDJd5ZhDbBacUkYLrIK36bDIv0xuPoaG/A7yj83xI7mD8GX
	GzrWPVWCwB3b3D5A1+Aw73SJPi4fSqL7bT9JAK1hab6v5cihvwf0aLr565kEDanROvDxqDIhlP5wN
	AUu3zKeHqdcxIQuN0Uoqus4IINNWAukZ41w9q8NoCLn6pvFCwYKgn6nFML32ZIuooJeUVz7srG/3x
	+6T9mmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqup-00000003M6m-1gZ3;
	Fri, 13 Feb 2026 11:00:51 +0000
Received: from mx4.sberdevices.ru ([152.89.196.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqum-00000003M5Q-29u1;
	Fri, 13 Feb 2026 11:00:50 +0000
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 2EF7E40009;
	Fri, 13 Feb 2026 14:00:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 2EF7E40009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1770980440;
	bh=OvdxfPMq3ENALtKqXmHnW0FdBU4wQRCJOdA+xd6oOJc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
	b=dLLLg44w+OAQ/ccLAlyfl/P7XUStUPbA9n3K82PnBeAGM6dDr6V53BW7wlGxLcQTo
	 59myc5PEimyglNz0111X3fZ5twPDqWbapNALFNCttwm/QbILl4vsXI10C412ktHNaw
	 UEn13emDFv/s6MZKZiDR2s5i+M/9BG2V9zah2Z92EgC7dsaqU4fnlqek+yEib42hbj
	 Ze1Mhbw8DD5YMdGuYyljFwsJ+dLPNyALERFCQeAU0vnNkznx5U5vKMeGMgv1hlVfRp
	 t5XWnwvkIQAQkx42BO4hTLkXfMUwHJeVlGjd0sEXQOqYai/kp83tHDAMOxjH4btww3
	 dcvc78z1j4ZbA==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 13 Feb 2026 14:00:39 +0300 (MSK)
Message-ID: <c1ec5f03-2fc5-4c63-91df-747f0bfd86c2@salutedevices.com>
Date: Fri, 13 Feb 2026 14:00:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: George Stark <gnstark@salutedevices.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW0RNQVJDIGVycm9yXSBbUEFUQ0ggdjMgMy8zXSBh?=
 =?UTF-8?Q?rm64=3A_dts=3A_meson-s4-s905y4-khadas-vim1s=3A_add_initial_device?=
 =?UTF-8?Q?_tree?=
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Nick Xie <nick@khadas.com>, "robh@kernel.org" <robh@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "xianwei.zhao@amlogic.com" <xianwei.zhao@amlogic.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260115030015.1334517-1-nick@khadas.com>
 <20260115030015.1334517-4-nick@khadas.com>
 <09df45e1-90b5-4618-9197-c724142bd83a@salutedevices.com>
 <PS1PPF62EEA9B1D287E26DFE619BB840508AE93A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
 <88a0395b-1ab3-4ef0-96c4-440b3a5c96f4@salutedevices.com>
 <CAFBinCDcDy4M79+mM+axsqXLfoQ56Ucd1C-OHkGLxwNkpfZ-zQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFBinCDcDy4M79+mM+axsqXLfoQ56Ucd1C-OHkGLxwNkpfZ-zQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.28.2.68]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected, bases: 2026/02/13 10:48:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 87 0.3.87 7430d8ffafccd8879e1d8370e5b501352446c2ba, {Tracking_uf_ne_domains}, {Tracking_bl_eng_cat}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;elixir.bootlin.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lkml.iu.edu:7.1.1, {Track_Chinese_Simplified}, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 200473 [Feb 13 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/02/13 08:57:00 #28203847
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected, bases: 2026/02/13 10:48:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030049_062120_053CC36A 
X-CRM114-Status: GOOD (  20.55  )
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



On 2/10/26 01:31, Martin Blumenstingl wrote:
> Hi George,
> 
> sorry for the late reply.
> 
> On Thu, Jan 29, 2026 at 3:48 PM George Stark <gnstark@salutedevices.com> wrote:

Hello Martin. It's great to hear from you again.
>>
>>
>> On 1/26/26 12:35, Nick Xie wrote:
>>>> Thanks for the patch. Since you have khadas mail I'm pretty sure you've
>>>> had the possibility to test it on the real vim board and I just don't
>>>> get it how it works with the voltage table above. The problem is that
>>>> pwm is calculated incorrectly in the upstream pwm-meson driver. That
>>>> voltage table appeared to be used in early amlogic bl loader and
>>>> appropriate pwm is initialized from a table's record. Duty cycle value
>>>> is translated to pwm regs correctly. Later when kernel start running
>>>> pwm-regulator driver is probed. It reads the pwm regs, calculates back
>>>> duty-cyle and search it in the table. Since calculation algos are not
>>>> match and the table doesn't contain full range of 0-100% values
>>>> regulator driver doesn't find current voltage. In such case regulator
>>>> core sets the minimum voltage from the table [1] and the SoC may hang
>>>> (depending on board) due to minimum voltage may be too low for the
>>>> current frequency SoC uses.
> Nick likely didn't spot any issues on S4 since CPU frequency scaling
> is not upstreamed yet (as there's no way to control the CPU clock
> yet).
> The lack of a OPP table means: the PWM and CPU clock will just stay at
> whatever the bootloader provides

It makes sense. I should experiment on the latest kernel.

>>>> Or I'm missing something?
>>>
>>>
>>>> There's not-yet-reviewed patch that fixes pwm algo [2]. There's
>>>> calculation example in the cover letter.
>>>> [1] https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/regulator/core.c#L1227
>>>> [2] https://lkml.iu.edu/2412.3/00826.html
>>>
>>> What's the status of such patches?
>>
>> the patch is ready for review. It's seems like nobody is interested
> I'm sorry to see that the patch had it's first anniversary.
> I'll need to bring out my logic analyzer and test your patch (I hope
> it's precise enough to show the impact of your changes).
> Are your plans then to re-send the patches or have you moved on and
> need someone else to take care of it?

It's a major step anyway if you confirm the issue yourself with an 
analyzer. In that case discussion won't be delayed for one more year
I think. Thanks.

Sure I'm ready to discuss/fix/resend this patch.

-- 
Best regards
George

