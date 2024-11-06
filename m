Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2434D44D53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8FgUJIVPnDpXU0UCJKNG07n1qA7azNbt7tpYPJJ9xQ=; b=272UHYpYSIY+VR5ytKGWqbmNVu
	DoPkAtw9dXlOkmoUiRSTi+CHgEcx8ZOrapDxzC+zzK5Gya2MvevN1m2tazmCQpM/JI/nh5hW0jj8Z
	45cBXSZNnSEJbwHbzrf8ydSr6PBDejwcTE4IPpGdlRD/sYm6GvJmRALaQmx9gxKCblaVq8jHclKtQ
	6EjUMQnlABFNJMnbSTGgPmMtkXfO3DBFjGr74AlRX31pyvPOJe40gWqS7vFrPTLyqqliMij7D+onV
	Cb5YifvUJLN+t3jUcIRgRyRlfNdvtJJF7gNXSs91Aq2ke2HAqNWNeabbOyeUMeLiEjkmQZJl3Hirl
	uut3eeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eO1-00000002xBB-2tYz;
	Wed, 06 Nov 2024 11:39:45 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dXA-00000002nCF-1zbe;
	Wed, 06 Nov 2024 10:45:10 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730889906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8FgUJIVPnDpXU0UCJKNG07n1qA7azNbt7tpYPJJ9xQ=;
	b=xsyXRFSjJuvIbSEjNJMRsLDbna6IqWYVKDqByUClVhHGywFD1sM/9Xjpu9MNIU80TEZukh
	7HdK2aHO5PoYyj7SA04iVGh6LkXj2OK7QGdKwrJE31puGhujKR0ut9nCaJDQEqimpS1609
	Qkhasy/4DzuL8PPbL3kUiZy23y6ZzmNlz61pTuYSYaF3G45ORvEvJ+aCquHi284ZpCN0d3
	YQXZneHi7OP0ShfNFZfhCCuoYAMkz57Tl9eceq21x1HX4rduuCp6GVy2qHGBZZkmkb82xd
	FqhoUyAJFDTD2Wez0IsXX6uWOceKqSHbqV0m/sktblx46vPe/+4AGGBNKnh6qw==
Date: Wed, 06 Nov 2024 11:45:06 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Quentin Schulz
 <quentin.schulz@cherry.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alchark@gmail.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add OPP voltage ranges to RK3399
 OP1 SoC dtsi
In-Reply-To: <3252308.5fSG56mABF@diego>
References: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
 <f6bb3387-4396-45d4-9cb4-594d58095510@cherry.de> <3252308.5fSG56mABF@diego>
Message-ID: <77bc2898bbbd2633d6713b4935bd5ee3@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_024508_825932_5F8A294F 
X-CRM114-Status: GOOD (  21.62  )
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

On 2024-11-06 10:41, Heiko Stübner wrote:
> Am Mittwoch, 6. November 2024, 10:32:06 CET schrieb Quentin Schulz:
>> On 11/6/24 9:33 AM, Dragan Simic wrote:
>> > Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in the
>> > SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This may be
>> > useful if there are any OP1-based boards whose associated voltage regulators
>> > are unable to deliver the exact voltages; otherwise, it causes no functional
>> > changes to the resulting OPP voltages at runtime.
>> >
>> > These changes cannot cause stability issues or any kind of damage, because
>> > it's perfectly safe to use the highest voltage from an OPP group for each OPP
>> > in the same group.  The only possible negative effect of using higher voltages
>> > is wasted energy in form of some additionally generated heat.
>> >
>> > Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
>> 
>> Well, I merely highlighted that the voltage was different on OP1
>> compared to RK3399 for the 600MHz OPP :)
>> 
>> So... If there's ONE SoC I'm pretty sure is working as expected it's 
>> the
>> OP1 fitted on the Gru Chromebooks with the ChromiumOS kernel fork
>> (though yes, I believe all Gru CB are EoL since August 2023). In the 
>> 6.1
>> kernel fork, there's also no range:
>> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-6.1/arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi
> 
> yeah, this somehow goes quite a bit into the "stuff that doesn't need 
> to
> change" area. On the one hand it does make "some" sense to unify things
> if we're using ranges everywhere else.

I agree that it might be unneeded, but there's no possible harm, and
unifying the things may be seen as beneficial.

> On the other hand, as Quentin noted below, all existing OP1 devices 
> seem
> to run just fine, and there won't be any more entering the kernel.

Hmm, why can't we add more OP1-based devices?  As I mentioned in my
earlier response to Quentin, my plan is to implement the board dts
for OP1-based TinkerBoard 2S, so I'd like to know is there something
that might prevent that board dts from becoming merged?

> So what do we realisitically gain here, except hiding existing 
> git-history
> under another layer?

Sorry, I'm not sure what would become hidden by this patch?

>> So not sure we need to handle theoretical cases here. Will let
>> maintainers decide on that one. FWIW, there are two other OP1 devices,
>> the RockPi4A+ and RockPi4B+ which do not change the OPP either.

