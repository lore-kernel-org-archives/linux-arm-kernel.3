Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52213C35FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZAbj6+NmXSfWd9Y3ZYRj3CY/kM/CunfChIIkSXsoRg=; b=AoGXtxUYZZD+/7DrqTN2JT63Cb
	TyldKUIbjKxw/pMyodztyZ1F9taafO1kwUSw4Yz01QDeKiHPMet6uRAoSgzm0NSF3Hrf3n22HziIA
	u9g0zl+ETa+O3DVp7eE1w8/L8e4f8bUnCKweQN+4riITQhGXsX9jN+dHuom1iRFKWFt8b/u/NQ9Ne
	Q9UhQ8gblhV9qiv+8casIxhcFAjSzEgHyNDhyMtZ0CR7nDJODmbRzO9CuSKbIK5CwAvGYicCKKqxh
	TzmJCqJ6TRdXOw/XXVfG9CqMnlaLZ4i+JBt+BVoudetBTJ7D5BH5392swUlShtTNc97U4/b/VmL3Y
	mn7qXqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjQe-0000000BVbo-0J1W;
	Thu, 13 Mar 2025 14:20:56 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshHR-0000000BAmL-0vIq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 12:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741867395;
 bh=bZAbj6+NmXSfWd9Y3ZYRj3CY/kM/CunfChIIkSXsoRg=;
 b=WXhI08Ri9lDTvDvTxXk10z/PQmpx4CFCzFX1E09ysK2eQFROdDYHh/SEPwzh9R1xnQSBZInyj
 Z0EQOJIWhq2ylVx63sLb0jOAzvIJx3MT9Da912lTIRGgn3CuXrysQoySOvnME0Z89YgMasi4M/s
 gMbyvNDiG7r0YWQzsVG62UzDBLb8Or4RFPVpXRqggV0cJSWLbUtwgEOHA8ZmJoyxWok/deFSvyu
 Br3GqFpYQOMn2r3sd9E/Y7GkrbBg7C2VsNCjt+HVN+9SG6XlliFyKpph2jxYtqi4OouMITbdO0q
 nXZJyQrjYpQls7eWMwEECtN6YTim4dhHTel400MFa1Xg==
X-Forward-Email-ID: 67d2c97dc524b8270342b1d9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <22d849c3-8a0d-4704-b69c-8019c7f70ca7@kwiboo.se>
Date: Thu, 13 Mar 2025 13:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <60065c0b-4597-4976-b74b-172556c4e156@kwiboo.se>
 <20250313090109.1910997-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250313090109.1910997-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_050317_621539_048E3AB9 
X-CRM114-Status: GOOD (  16.12  )
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

On 2025-03-13 10:01, Chukun Pan wrote:
> Hi,
> 
>> I have not seen any issue with PWM using the merged patch having
>> pinctrl-names=default.
>>
>> Please see my Linux tree [1] and U-Boot tree [2], those are little ahead
>> of what has been posted on ML, e.g. it has working USB2.0 host, CPU opp,
>> Hantro VPU, GPU + opp, arm and logic pwm regulators for E20C, ROCK 2A/2F
>> and Sige1.
>>
>> Please see my Linux tree [1] and U-Boot tree [2], those are little ahead
>> of what has been posted on ML, e.g. it has working USB2.0 host, CPU opp,
>> Hantro VPU, GPU + opp, arm and logic pwm regulators for E20C, ROCK 2A/2F
>> and Sige1.
>> ...
>> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20250311-rk3528/
>> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> 
> I tested your kernel device tree on E20C earlier today and still have
> the same issue. But if I replace u-boot with the link [2] you provided,
> it will work fine. For reference, I was using v2025.01 plus this series
> of patches [3]. So it looks like u-boot does something and kernel doesn't?

Interesting, good that it works with the updated U-Boot. Main change
compared to v1 is that it now use clock/reset id and DT closer to what
has been merged in mainline Linux. It also has DT params to help
initialize the two pwm regulators used by these boards.

I will try with the old v1 U-Boot series and see if I can replicated
your issue.

Regards,
Jonas

> 
> [3] https://lore.kernel.org/u-boot/20250123224844.3104592-1-jonas@kwiboo.se/
> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


