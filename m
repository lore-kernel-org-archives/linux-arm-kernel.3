Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5CAD778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZ1FOsHm/vGJer214zga1vzlRDmrTUC/1ttgjjuK9w4=; b=g5werBpLhF3X7GASueYAr/bnIs
	FeWC8iGJK2v91PlhT8VXsU0JYFeYkOsK+nS0Nrs6/zOrHzcx1PErZfWotANlfoRR3C1P+PPnx6Ihh
	x1IY0TbNENTWFoPuXPlbehpPSdBuSB0lRHxTBz0uV7S649nEDAj0CokPHZ4BooGktzar0hhEuhs/+
	gQRfHcvyyG6jPV71MZ+auM7oQ2RM5P/Oj9UjTeGEGXynK/y+HyFs0/LG6hvtCigPYinHH5j6SGeIm
	Xoe/a0QsBICTIrZirwM6bupPn5K1N9svPtfDzjUFT70VPntlMwxaHxsu0HaDCAmbH54tkhbwX8sK6
	udaKDhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNMW-00000009SZH-2iVc;
	Fri, 23 Jan 2026 20:02:32 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNMS-00000009SYu-2ewK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 20:02:30 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1769198542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZ1FOsHm/vGJer214zga1vzlRDmrTUC/1ttgjjuK9w4=;
	b=dlboqydsKNghsrFWuPNRagiwi1t7kf6ZpeRDUYxpBOt5Bgm7i7dDMVbYEEIX5+Qjbu4zCY
	Q3IcOju9We+KxQMeUxju3nidaGOXnZaCxjudffnb9viEsM4n5SMUxSpSmF9jhl/O7UzMrq
	iO0N5qPRjJ0CUov460DoNxN9VPe7gerLszUgtU9fQ7ZcbAiPggSE0p+ws73LzRm3/9UFWP
	vgpdRko+lhzXbFBi4D1At7e3AzWszyAjJ19GF+h90twaJh9MVqV3U6D1LmlNkinlPuFk+z
	S5XJWTt3pdUBIn1eRSlcI0sXiQX7MFhhKhS6/ad4C3w85Y0Udd67CxOpp4LhEQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 21:02:19 +0100
Message-Id: <DFW8JGOI41QK.2AFPP8SSK8TH1@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Robin Murphy" <robin.murphy@arm.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus
 Walleij" <linusw@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Marek Szyprowski" <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus>
 <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
 <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
In-Reply-To: <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_120229_393841_8E10DABA 
X-CRM114-Status: GOOD (  22.09  )
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

On Fri Jan 23, 2026 at 2:27 PM CET, Robin Murphy wrote:
> On 2026-01-12 9:08 am, Bartosz Golaszewski wrote:
>> On Sat, Jan 10, 2026 at 12:55=E2=80=AFAM Sebastian Reichel
>> <sebastian.reichel@collabora.com> wrote:
>>> On Tue, Jan 06, 2026 at 10:00:11AM +0100, Bartosz Golaszewski wrote:
>>>> The GPIO controller is configured as non-sleeping but it uses generic
>>>> pinctrl helpers which use a mutex for synchronization.
>>>>
>>>> This can cause the following lockdep splat with shared GPIOs enabled o=
n
>>>> boards which have multiple devices using the same GPIO:
>>>>
>>=20
>> [snip]
>>=20
>>>>
>>>> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
>>>> Cc: stable@vger.kernel.org
>>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540b=
c6@samsung.com/
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>>>> ---
>>>>   drivers/gpio/gpio-rockchip.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip=
.c
>>>> index 47174eb3ba76..bae2061f15fc 100644
>>>> --- a/drivers/gpio/gpio-rockchip.c
>>>> +++ b/drivers/gpio/gpio-rockchip.c
>>>> @@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockch=
ip_pin_bank *bank)
>>>>        gc->ngpio =3D bank->nr_pins;
>>>>        gc->label =3D bank->name;
>>>>        gc->parent =3D bank->dev;
>>>> +     gc->can_sleep =3D true;
>>>
>>> This means all operations are marked as can_sleep, even though
>>> pinctrl operations are only used for the direction setting.
>>> I.e. the common get/set operations always worked in atomic mode,
>>> but now complain. See for example:
>>>
>>> https://lore.kernel.org/all/20260108-media-synopsys-hdmirx-fix-gpio-can=
sleep-v1-1-3570518d8bab@kernel.org/
>>>
>>> It's not a big issue for the hdmirx driver specifically, but I wonder
>>> how many more (less often tested) rockchip drivers use GPIOs from their
>>> IRQ handler.
>
> Yeah, seems this finally reached my distro kernel and now the kernel log=
=20
> on one of my boards is totally flooded from gpio_ir_recv_irq()=20
> (legitimately) calling gpio_get_value()... that's not really OK :/

Yeah, I'm getting it too on several of my boards, like on Rock64:
https://paste.sr.ht/~diederik/154c5023a3a50d77f1da2195e7bb9a96f6a88555
(that's just a fraction as dmesg ran out of its buffer ...)
Also mentioned here:
https://lore.kernel.org/all/DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com/

Diederik

>
> Thanks,
> Robin.
>
>>> Considering setting or getting the GPIO from atomic context is much
>>> more common than changing the direction - is there some way to
>>> describe the sleep behavior in a more specific way in the GPIO
>>> controller?
>>>
>>=20
>> No, there's no such switch at the moment. This is because there are
>> paths that we can take, where we *do* end up setting direction from
>> gpiod_set_value(). For instance:
>>=20
>> gpiod_set_value()
>>    gpiod_set_value_nocheck()
>>      gpio_set_open_drain_value_commit()
>>        gpiochip_direction_output()
>>=20
>> I'm afraid, for correctness, it has to be either sleeping, or not. I
>> would love - at some point - to make pinctrl mostly lockless with
>> SRCU, like we did with GPIO. That would solve this issue correctly.
>> But until then, I'm afraid we need to keep a chip-global switch for
>> sleeping.
>>=20
>> Bartosz
>>=20
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


