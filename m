Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566F2C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 18:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qsE47EvROMF63oVGnhuZrejS0P7zQNL6G32ikfomhQ=; b=RzhHuflQi3THPBuYmTBPFm0f7Q
	oVsvTt2suhtz7qaNdYBvXmLH9YF7Y9gJ2d4e+IgUH0bSCD9AmW9XFaZvNzxkamP3NN7GQodm7Gog5
	pse+D7XPl39Z8OF7nPlab7JrjFN6CA7IzLPJops6gVKOBlAAu+nLdXLyfBiuWOteOTw+zKS21Amx7
	dAR4ZaolFARVzr5V2L3tYZdJfhyUcw6WpYHG7ffiXHo7KxKKCG4/RTr/pukJYTC/rrrMJYLi6mLtr
	FSzSZNIBPXh7b+xQpFAVqz3CasBerkNrAxzBG35hhzFbARPI9W/LWWPJYZT1qZi0GHd3vSAMfGIWO
	ji85Miiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyp6-00000007fvB-0MY8;
	Sun, 12 Jul 2026 18:22:40 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyp2-00000007fuH-3rtH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 18:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783880554;
 bh=+qsE47EvROMF63oVGnhuZrejS0P7zQNL6G32ikfomhQ=;
 b=vI2ZSrDQ9kC5heg+T4BSmN0f9LtZabFF5qjR4YSd1h9CBlcTpixHkCfvqEckHT7eHXw1Ph6DJ
 F+SKoxxSfSrlP3tVDjEC3blNhYc8JzBY0JyAezHVfJsczbyh4/xHJTyFbCfAqI1d5FcJowlZ7HA
 MSBNWdpRPmoDAnrmGEW4w1kgomQkMbnaFEayavSsV/4SKs+vjp5CrW995vKpG6KGhLQVOX8Vl9d
 AdRM+bN8xkjngsPNhJslGCKVXBAJqowgd5lYcjs5qgto4H/hOcYHiLjh74wTjZTfGE5bDQA6qic
 FmiVPRBKpApIktDBobSdg0CiSbuFD4VZmN5N5g4BpueQ==
X-Forward-Email-ID: 6a53db6abaf216d73a5035fc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <50a8a36a-e7dc-43ec-80ce-904e6e7fbd3f@kwiboo.se>
Date: Sun, 12 Jul 2026 20:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
 <b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz>
 <CAPSPb=t=jZke2pEinPvJ4mbxKMF3hSqMfx3GMjEUT6N2FEyygg@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAPSPb=t=jZke2pEinPvJ4mbxKMF3hSqMfx3GMjEUT6N2FEyygg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_112237_062504_E4577116 
X-CRM114-Status: GOOD (  20.78  )
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

On 7/12/2026 8:00 PM, Joachim Eastwood wrote:
> Hi Jonas,
> 
> On Sat, 11 Jul 2026 at 01:24, Jonas Karlman <jonas@kwiboo.xyz> wrote:
>>
>> Hi Joachim,
>>
>> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
>>> From: Joachim Eastwood <joachim.eastwood@gmail.com>
>>>
>>> Since the NPU is hooked up on these the always-on isn't needed anymore.
>>>
>>> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>>> index bcb2f5d63a61..463cfeddf270 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>>> @@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
>>>               regulator-max-microvolt = <950000>;
>>>               regulator-ramp-delay = <2300>;
>>>               regulator-boot-on;
>>
>> Why is boot-on kept?, NPU is likely not needed until OS has started.
> 
> I am not really sure.
> Looking at the other rk3588(s) boards, they also kept the boot-on parameter
> when the always-on was removed.

Ahh, those board should likely also drop the boot-on prop. There should
really not be any need to force the PMIC to enable this regulator from
firmware. If it was left intentionally for other boards, maybe there is
a bug in software that need to be fixed.

> 
>> With PD domain-supply the regulator should be enabled automatically, or
>> is there some other issue that requires boot firmware to enable this
>> regulator before OS is started?
> 
> Maybe some Rockchip people can enlighten us?
> 
> I haven't had the time to actually test the NPU. I'll try to test it next week.
> So this patch is based on similar changes done to other RK3588 boards.

Yes, please drop the boot-on prop and test :-)

Regards,
Jonas

> 
> 
> best regards,
> Joachim Eastwood


