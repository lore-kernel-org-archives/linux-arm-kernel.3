Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240FAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyFDOAJVNrvBIfRJIJW+BVdBfeFkP4zy0JFDJEjFdMQ=; b=Xx+VydbZb/e+WNdqbC/UtUAvmw
	NeJqXoPhTIpBTLq+Yui60uXgBq6Ib6o1ahrWk0wwB5OpaYcMpRmC8AHTFE0zvcrjdKuPF6Nk0CJMh
	uE+Kbp52GSGnDItfovmEqS8RkuIisjJmKdESZHQKcTKAnbMkOeG0qPmwl7ewwPazzXoM/NZ5AgmVX
	9BS9AOH4O9/KSEG+Z1Jur5q8sIEGQO8nZF74IRUeTWTj51xg39RczvneS6ngUTDIPT3dZp18VU75X
	Xf5o41EJ0oWIVdZQgeyViJKNdMFLnbw5cUNFLXU2vjRvLOx60FFKPq8/JuYndhhv2S1M9wQY8AXOi
	Ejlmjgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2lK-0000000C20Y-3Xbm;
	Tue, 10 Dec 2024 16:07:02 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2kG-0000000C1jj-40Tn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1733846731;
 bh=PyFDOAJVNrvBIfRJIJW+BVdBfeFkP4zy0JFDJEjFdMQ=;
 b=Bi8vYp15V5c6DrK4kJEoLAlz6GFQchHBV0HK1B6WT1UufcqheYHZKJ8Wmrpwo+xy2ljBDeDPI
 NUOxblhdG2BHD+f8ZOGeIU7+9YBcPu2EfX3X9rB4Jn6Cxm/C4w1dbJ3+mTp6rPQtFXQWv1kTlYl
 dKelZbYFAiPAQFRFYfvhl5grfExg3y/L5ZnHwt/bwb5jzQQhY2szBBX2PETvs1yzSLSyRWQ8E4/
 CbWzA8G6SEJ9DdhOymW2GMOWYakEjlJz4eT4oQlVG/Sv6T6D8RzVinPszojapGiZcF3eKVpb3Wp
 LPJZVy31yxaSILrpzMYFL2EP7y9h1c4s/4jJ8cRaUAHA==
Message-ID: <f16b3688-91e1-4760-ac2b-ce53db98ed68@kwiboo.se>
Date: Tue, 10 Dec 2024 17:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: add hevc power domain clock to
 rk3328
To: Peter Geis <pgwipeout@gmail.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Alex Bee <knaerzche@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liang Chen <cl@rock-chips.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, shironeko <shironeko@tesaguri.club>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-5-pgwipeout@gmail.com>
 <e32fa593abfa6d08202b4f929e0b4bdb@manjaro.org>
 <CAMdYzYp+MQVYr1tOMEOn62vXZGVEYrtd1p9vn6YQzXdrJgSdyA@mail.gmail.com>
 <CAMdYzYquvGBzfWqvUOku7m1sM9qxmBHAL95cANDViUCT1oEEhQ@mail.gmail.com>
 <8c604ada27457698ad6d33d22a39b45a@manjaro.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <8c604ada27457698ad6d33d22a39b45a@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 675866c8ce9f514b1380cc1f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_080557_329619_1A38BDA5 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Peter,

On 2024-12-10 14:53, Dragan Simic wrote:
> Hello Peter,
> 
> On 2024-12-10 14:23, Peter Geis wrote:
>> On Tue, Dec 10, 2024 at 8:13 AM Peter Geis <pgwipeout@gmail.com> wrote:
>>> On Tue, Dec 10, 2024 at 5:04 AM Dragan Simic <dsimic@manjaro.org> 
>>> wrote:
>>>> On 2024-12-10 02:30, Peter Geis wrote:
>>>>> There is a race condition at startup between disabling power domains
>>>>> not
>>>>> used and disabling clocks not used on the rk3328. When the clocks are
>>>>> disabled first, the hevc power domain fails to shut off leading to a
>>>>> splat of failures. Add the hevc core clock to the rk3328 power domain
>>>>> node to prevent this condition.
>>>>>
>>>>> rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 3-....
>>>>> }
>>>>> 1087 jiffies s: 89 root: 0x8/.
>>>>> rcu: blocking rcu_node structures (internal RCU debug):
>>>>> Sending NMI from CPU 0 to CPUs 3:
>>>>> NMI backtrace for cpu 3
>>>>> CPU: 3 UID: 0 PID: 86 Comm: kworker/3:3 Not tainted 6.12.0-rc5+ #53
>>>>> Hardware name: Firefly ROC-RK3328-CC (DT)
>>>>> Workqueue: pm genpd_power_off_work_fn
>>>>> pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>> pc : regmap_unlock_spinlock+0x18/0x30
>>>>> lr : regmap_read+0x60/0x88
>>>>> sp : ffff800081123c00
>>>>> x29: ffff800081123c00 x28: ffff2fa4c62cad80 x27: 0000000000000000
>>>>> x26: ffffd74e6e660eb8 x25: ffff2fa4c62cae00 x24: 0000000000000040
>>>>> x23: ffffd74e6d2f3ab8 x22: 0000000000000001 x21: ffff800081123c74
>>>>> x20: 0000000000000000 x19: ffff2fa4c0412000 x18: 0000000000000000
>>>>> x17: 77202c31203d2065 x16: 6c6469203a72656c x15: 6c6f72746e6f632d
>>>>> x14: 7265776f703a6e6f x13: 2063766568206e69 x12: 616d6f64202c3431
>>>>> x11: 347830206f742030 x10: 3430303034783020 x9 : ffffd74e6c7369e0
>>>>> x8 : 3030316666206e69 x7 : 205d383738353733 x6 : 332e31202020205b
>>>>> x5 : ffffd74e6c73fc88 x4 : ffffd74e6c73fcd4 x3 : ffffd74e6c740b40
>>>>> x2 : ffff800080015484 x1 : 0000000000000000 x0 : ffff2fa4c0412000
>>>>> Call trace:
>>>>> regmap_unlock_spinlock+0x18/0x30
>>>>> rockchip_pmu_set_idle_request+0xac/0x2c0
>>>>> rockchip_pd_power+0x144/0x5f8
>>>>> rockchip_pd_power_off+0x1c/0x30
>>>>> _genpd_power_off+0x9c/0x180
>>>>> genpd_power_off.part.0.isra.0+0x130/0x2a8
>>>>> genpd_power_off_work_fn+0x6c/0x98
>>>>> process_one_work+0x170/0x3f0
>>>>> worker_thread+0x290/0x4a8
>>>>> kthread+0xec/0xf8
>>>>> ret_from_fork+0x10/0x20
>>>>> rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack
>>>>> on
>>>>> domain 'hevc', val=0x88220
>>>>>
>>>>> Fixes: 52e02d377a72 ("arm64: dts: rockchip: add core dtsi file for
>>>>> RK3328 SoCs")
>>>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>>>
>>>> While I was unable to formally verify this clock assignment,
>>>> i.e. by using the RK3328 TRM or the downstream kernel source
>>>> from Rockchip, it makes perfect sense to me.  Thanks for the
>>>> patch, and please feel free to include:
>>>>
>>>> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>>>
>>> It is unfortunate the TRM doesn't include the clock maps, because they
>>> are extremely helpful when one can acquire them. It also doesn't help
>>> that the TRM register definition only referred to this as "pll". I was
>>> sent specifically the usb3 phy clock map for my work on the driver,
>>> which had the location of each switch and divider along with the
>>> register and bit that controlled it. That combined with the TRM
>>> register map allowed me to find this error.
>>
>> Apologies, that's the wrong response for this one.
> 
> No worries.
> 
>> This patch was the result of educated guess combined with testing. I
>> grabbed all of the clocks that looked like they could affect things,
>> then tested them one at a time until I isolated them to this clock. It
>> lives alone with cpll as the parent and has no children according to
>> the clock summary. (Though the writeup i mistakenly included above
>> proves the clock map isn't always accurate).
> 
> I see, thanks for all your work on this patch!  It surely took quite
> a lot of time to perform all the testing.
> 
>>>>> ---
>>>>>
>>>>>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>>>>> b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>>>>> index 0597de415fe0..7d992c3c01ce 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>>>>> @@ -333,6 +333,7 @@ power: power-controller {
>>>>>
>>>>>                       power-domain@RK3328_PD_HEVC {
>>>>>                               reg = <RK3328_PD_HEVC>;
>>>>> +                             clocks = <&cru SCLK_VENC_CORE>;

Do we also need to include one or all of the following clocks?

According to Fig. 3-6 RK3228H Clock Architecture Diagram 5 following
clocks point to the H265 block:

S51_6 (4PLL) / G6_3 / S51_0 (DivFree 1~32) / D4 ---- aclk_h265
                                                 \-- pclk_h265
S51_14 (4PLL) / G6_4 / S51_8 (DivFree 1~32) / D4 - clk_venc_core
S52_14 (4PLL) / G6_7 / S52_8 (DivFree 1~32) / D4 - clk_venc_dsp

Regards,
Jonas

>>>>>                               #power-domain-cells = <0>;
>>>>>                       };
>>>>>                       power-domain@RK3328_PD_VIDEO {


