Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41439C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wS+iW3PEgK6vQzywICkq9SarBtHISre1FPGbp4FqxEg=; b=FSX073NX5t8bT3N8LJF6gFrtJ/
	eV3hcWa9rxkwHeOOVEg/UGmuumKzb/7y3mFk5pW5WIPytw2wnO6vXlR1FLK7gkiIkUZn6ZrtMfLMe
	/J2LdcB2rP0hRugCgaJR83sktH6iLw9LugOr34s/PVQjHj4u9b1VrBJhOUD6kf93/F5OMSML/LtBc
	UplCyA4yNe0aFkv03I4f6kl+1lCal3X4AgpC6cZUlmq3Bxlqoe25e0Ynpx/He3NL5O3m3st+xWeKq
	vnNk7qtVIohaB++z2Ms2En11xNAUlnYwpjzb10H07tHbgDWPSKbhRYHvmxbPCJqQ5Rzi/Ym9pXpcH
	+pFXq7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNl5-00000008nvB-2K98;
	Wed, 12 Mar 2025 15:12:35 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNit-00000008nV0-2CEu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741792217;
 bh=wS+iW3PEgK6vQzywICkq9SarBtHISre1FPGbp4FqxEg=;
 b=SHBIbv/Sw5gKD/H7R4++Pa96HKDbPIAc5J1KGDA1LFK+cwPfKOituudhn+FvxRe3s/Z1F6iJi
 7mqfwNtzxHc/QydoBUYXagFc0lG3aJ4TQzEvg1Cf05IPQDb8U7EXzBvyiy0vmOrCgWa4714hhRv
 VugcqgeJRr61E35xw7cfXxyVw0IAF/z0WZWipur+Va/7CigMGQLWaVXIy0jHcbhGGxwaAG25Ad8
 SKMo/Smfgy66V/ZUc+defYELJOt3wjkd6Nc6RtOxew9Z82jdwOTDvRTPwWwfikidhjWuLO+WLLR
 6oA7uLRe6x301t+cQqdnuwUFxRva87JQJRQ0Oa2cgFKg==
X-Forward-Email-ID: 67d1a174a3842b4a6f18d3d1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b7d8d385-81ee-4947-ab8f-1da43843464b@kwiboo.se>
Date: Wed, 12 Mar 2025 16:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <a5ec9062-ca57-4748-8c0f-fb5b9c75fa28@kwiboo.se>
 <20250312143515.1225171-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250312143515.1225171-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_081019_929848_2BC976B2 
X-CRM114-Status: GOOD (  17.42  )
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

On 2025-03-12 15:35, Chukun Pan wrote:
> Hi,
> 
>> The pinctrl-names should be changed to "default" and not "active",
>> something you can fixup or do you want a patch?
> 
> Sorry I've been a bit busy this week and forgot to send the v2 patch.
> In rk3528.dtsi, the uart and upcoming i2c nodes do not have pinctrl,
> so I prefer to remove them.
> 
>>> Unlike other SoCs, pinctrl-names need to be in "active" state,
>>> I'm not sure about this, but otherwise the pwm-regulator will
>>> not work properly.
> 
> BTW, setting the pinctrl of pwm corresponding to pwm-regulator
> to "default" will cause kernel boot suspended.
> Sorry but do you know why?

Not an issue I have seen, do you have any more logs or details? E.g.
what board you use, full regulator node, do you have operating points
defined etc.

I have runtime tested a branch at [1], that use pinctrl-names = default,
have vdd_arm and vdd_logic defined, also an opp table for cpu and gpu.

For E20C there is a commit to enable the vdd_logic, however without gpu
enabled and a mali-supply the pwm-regulator is initialized to
max-microvolt by Linux. Have instead updated U-Boot to initialize the
pwm-regulator's:

```
&vdd_arm {
	regulator-init-microvolt = <953000>;
};

&vdd_logic {
	regulator-init-microvolt = <900000>;
};
```

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250311-rk3528/

Regards,
Jonas

> 
> e.g.
> ```
> vdd_arm: regulator-vdd-arm {
> 	compatible = "pwm-regulator";
> 	pwms = <&pwm1 0 5000 1>;
> 	...
> };
> 
> &pwm1 {
> 	pinctrl-0 = <&pwm1m0_pins>;
> 	pinctrl-names = "default";
> 	status = "okay";
> };
> ```
> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


