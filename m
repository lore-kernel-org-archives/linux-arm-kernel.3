Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAA0D12D54
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 20:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fE5VOA6KuTjnNYq44e0OK4y8UXNT3ZzXaRBBD23Kw9o=; b=FIxjDVebB9QnrgxS8BS0ZHSupH
	1QIOJM5bncBoEF/fMdBjJ8GVXLh0qMatvAax1V+Pum7lduWIBJNAp5Y4p/WvNa9/v6oCOPQDTvdYd
	ctQsvczyfYlDPCLrbAmfxwWbJQ1p1beOEzbndbmGcYy/mNeb4Z+a7QvEALB9AEyGC5TnpAU2cOcuy
	NjhCx5R9LQmXEbNSegKmxX/OKymzG9NbSk1ocRzsf6kyOP42JtbE6AHSZCWqVrorqNGhoeZ4hNxhJ
	qrqzavdh5yeHV9th71qZbQiOwQzEHgk4GizvRW/y083WHQGpb7ruNuewLw7WhydWmPoj98vbGTxOx
	2EYPHqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAErr-0000000FZ5R-45r9;
	Sun, 10 Nov 2024 20:49:07 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAEq6-0000000FYwD-1p0I;
	Sun, 10 Nov 2024 20:47:20 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731271635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fE5VOA6KuTjnNYq44e0OK4y8UXNT3ZzXaRBBD23Kw9o=;
	b=fzQRJyNl79XOFtkcXecX9QesKQ+w0dR5wqTkVeTCqmTSlhjQq2YgVauWWn0PmmCpEo53Dx
	NYurR7lpapDRp4/2pTqqs0rvP7lJS4tcCpJuPInGhJCKhunal76raAuh52KK3+EvApvsgp
	0OJCdUVAIYpO5uhjMxbpXMeNaduy7xSqemW6gaKwR/xjpeevX7MrpRlYCDgbPqqqmrCniz
	J1mjfbyA0EK8x4jxEEjk4O6PhOKYEIZk+1+PMZ0UYIU9pc/y94DDInoJxJWQqet8UQSph3
	qx04O0kgmXu2gcig+EUGKo6Of+ig/g5KG7hssiSIpYKDs23emvPB4BnYMCKQmA==
Date: Sun, 10 Nov 2024 21:47:15 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdd_gpu voltage constraints on
 PinePhone Pro
In-Reply-To: <4386271.ejJDZkT8p0@diego>
References: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
 <4386271.ejJDZkT8p0@diego>
Message-ID: <fb3700f2d67c7f062c66cb8eb0f59b17@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_124718_945783_FE933AD0 
X-CRM114-Status: GOOD (  24.64  )
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

Hello Heiko,

On 2024-11-10 21:08, Heiko Stübner wrote:
> Am Sonntag, 10. November 2024, 19:44:31 CET schrieb Dragan Simic:
>> The regulator-{min,max}-microvolt values for the vdd_gpu regulator in 
>> the
>> PinePhone Pro device dts file are too restrictive, which prevents the 
>> highest
>> GPU OPP from being used, slowing the GPU down unnecessarily.  Let's 
>> fix that
>> by making the regulator-{min,max}-microvolt values less strict, using 
>> the
>> voltage range that the Silergy SYR838 chip used for the vdd_gpu 
>> regulator is
>> actually capable of producing. [1][2]
>> 
>> This also eliminates the following error messages from the kernel log:
>> 
>>   core: _opp_supported_by_regulators: OPP minuV: 1100000 maxuV: 
>> 1150000, not supported by regulator
>>   panfrost ff9a0000.gpu: _opp_add: OPP not supported by regulators 
>> (800000000)
>> 
>> These changes to the regulator-{min,max}-microvolt values make the 
>> PinePhone
>> Pro device dts consistent with the dts files for other Rockchip 
>> RK3399-based
>> boards and devices.  It's possible to be more strict here, by 
>> specifying the
>> regulator-{min,max}-microvolt values that don't go outside of what the 
>> GPU
>> actually may use, as the consumer of the vdd_gpu regulator, but those 
>> changes
>> are left for a later directory-wide regulator cleanup.
> 
> With the Pinephone Pro using some sort of special-rk3399, how much of
> "the soc variant cannot use the highest gpu opp" is in there, and just 
> the
> original implementation is wrong?

Good question, I already asked it myself.  I'm unaware of any kind of
GPU-OPP-related restrictions when it comes to the PinePhone-Pro-specific
RK3399S.  Furthermore, "the word on the street" is that the RK3399S can
work perfectly fine even at the couple of "full-fat" RK3399 CPU OPPs
that are not defined for the RK3399S, and the only result would be the
expected higher power consumption and a bit more heat generated.

This just reaffirms that no known GPU OPP restrictions exist.  Even
if they existed, enforcing them _primarily_ through the constraints of
the associated voltage regulator would be the wrong approach.  Instead,
the restrictions should be defined primarily through the per-SoC-variant
GPU OPPs, which are, to my best knowledge, not known to be existing for
the RK3399S SoC variant.

> Did you run this on actual hardware?

I rushed a bit to submit the patch before being able to test in on the
actual hardware, but there's already one person willing to test the 
patch
on their PinePhone Pro and provide their Tested-By.  I see no reasons 
why
it shouldn't work as expected, as explained above, which is why I 
decided
it's safe to submit the patch before detailed testing.

I'm very careful when it comes to changes like this one, but I'm quite
confident there should be no issues, just a nice performance boost. :)
I also checked and compared the schematics of the PinePhone Pro and
a couple of other Pine64 RK3399-based boards and devices, to make sure
there are no differences in the GPU regulators that would make the
PinePhone Pro an exception.  I saw no such differences.

>> Fixes: 78a21c7d5952 ("arm64: dts: rockchip: Add initial support for 
>> Pine64 PinePhone Pro")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts 
>> b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 1a44582a49fb..956d64f5b271 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -410,8 +410,8 @@ vdd_gpu: regulator@41 {
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&vsel2_pin>;
>>  		regulator-name = "vdd_gpu";
>> -		regulator-min-microvolt = <875000>;
>> -		regulator-max-microvolt = <975000>;
>> +		regulator-min-microvolt = <712500>;
>> +		regulator-max-microvolt = <1500000>;
>>  		regulator-ramp-delay = <1000>;
>>  		regulator-always-on;
>>  		regulator-boot-on;

