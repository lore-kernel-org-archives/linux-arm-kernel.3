Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684ADCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vADT7opWRct2rqiVIZqiOBr/+HV23dbzmDRf/TThZaM=; b=A5fdQmL6wN/w/qym4FcHZte7QB
	Yo26bninXpUJiNgFqu/P3Hg9NzlwHhRdf2eHCm27mVBViuWPf2dsYfv+s4EOyax/ozmacfkWfwKWK
	vtPBJGhcieawPdqeYaHUl1vEbTRgjaxcBomzSdP/EUUsb5A9GgjYaXZ3QtkM7+xHGCqa/aMLRgE2h
	fFH7KjqwKFGA8fF8ydxxWGpBXkCozlIKpDepcDykcjjYD6SzdZB8USktBfBXt9FkjLQTtby9ahivB
	WHEugIP199NMiHYwU0sXzq3IpXoekkFP7wMDmrcE7eL9K+2b6CnIhHw+T2sj2zeAa9+VxoDOt4K17
	p1+IOsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurrL-00000007kKD-0uk9;
	Sat, 06 Sep 2025 12:17:35 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurkQ-00000007jq3-1e4T;
	Sat, 06 Sep 2025 12:10:27 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1757160623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vADT7opWRct2rqiVIZqiOBr/+HV23dbzmDRf/TThZaM=;
	b=I2WNNwF4OGGTvLxzCQRJVFYSr9v8AEMmTidkPl7lrNUOX9p+fRjbSL5qlvuEvadMuVGNw/
	8+qMS1iCO2Ju4h/qCAtQVAJHq8ygoMPUAfoNUwdBS/5Rh6X+saNi6xCfSka8zUXt/HQybP
	f3ZBdJoupsOKXgY1LWZtQrGnQS8lwq0Ykmu8prGC3CXyVfOsf0DifWm02nqn3C14f3WbTY
	bG7BXzqk21FEktYf42VV8m4rVGmt6zIiP7BMywYJ4brQNtCgwFGpRqJB4BgBJeHNkI8wnn
	5FoSF3/zb3Xe05M+c2Alm5YApbRXiF2IOGYNe4nkeMZXFRDbCB22BG2VTbOppw==
Date: Sat, 06 Sep 2025 14:10:22 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Make RK3588 GPU OPP table naming
 uniform
In-Reply-To: <DCLOTR9Y380M.22GZYL11XXZM2@cknow.org>
References: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
 <DCLOTR9Y380M.22GZYL11XXZM2@cknow.org>
Message-ID: <47cf50f2f497108a923815c12b1f8c9b@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_051026_814662_A84CA1FF 
X-CRM114-Status: GOOD (  19.70  )
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

Hello Diederik,

On 2025-09-06 13:40, Diederik de Haas wrote:
> On Sat Sep 6, 2025 at 12:01 PM CEST, Dragan Simic wrote:
>> Unify the naming of the existing GPU OPP table nodes found in the 
>> RK3588
>> and RK3588J SoC dtsi files with the other SoC's GPU OPP nodes, 
>> following
>> the more "modern" node naming scheme.
> 
> Like we discussed in private (without an agreement), I think it would 
> be
> beneficial if the (gpu) opp naming would be made consistent across SoC
> series as right now there are several different naming schemes applied.
> They're all valid, but inconsistent. And if consistency is improved,
> which I like, then let's go 'all the way'?

As we discussed it already in private, I fully agree about performing
the "opp-table-X => opp-table-{clusterX,gpu}" naming cleanup 
consistently
for all Rockchip SoCs, but I'm afraid it would be seen as an unnecessary
"code churn" at this point, especially because my upcoming Rockchip SoC
binning patch series is a good candidate for such a cleanup.

On top of that, I'd be a bit weary about performing at least some of the
testing associated with such a platform-wide cleanup, despite actually
performing no functional changes and being a safe change.  On the other
hand, "bundling" such a cleanup with the Rockchip SoC binning patches
would get us detailed testing for free, so to speak.

Of course, if the maintainers see this as a good opportunity to perform
a platform-wide cleanup at this point, instead of seeing it as a "code
churn", I'll still be happy to extend this small patch into a platform-
wide naming cleanup of the "opp-table-X" nodes.  On the other hand, if
this patch remains as-is, it may hit a good balance between resolving
the currently present naming ambiguity and the amount of introduced
changes.

>> Fixes: a7b2070505a2 ("arm64: dts: rockchip: Split GPU OPPs of RK3588 
>> and RK3588j")
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 2 +-
>>  arch/arm64/boot/dts/rockchip/rk3588j.dtsi    | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
>> index 0f1a77697351..b5d630d2c879 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
>> @@ -115,7 +115,7 @@ opp-2400000000 {
>>  		};
>>  	};
>> 
>> -	gpu_opp_table: opp-table {
>> +	gpu_opp_table: opp-table-gpu {
>>  		compatible = "operating-points-v2";
>> 
>>  		opp-300000000 {
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>> index 9884a5df47df..e1e0e3fc0ca7 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>> @@ -66,7 +66,7 @@ opp-1608000000 {
>>  		};
>>  	};
>> 
>> -	gpu_opp_table: opp-table {
>> +	gpu_opp_table: opp-table-gpu {
>>  		compatible = "operating-points-v2";
>> 
>>  		opp-300000000 {

