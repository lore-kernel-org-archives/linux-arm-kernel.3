Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FC1D29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY64bCPpVbXy9hxdShMRYV6mVpN8/Beip6P+YTYfKuA=; b=4OLV3t66cMlnulPBOqPYIFP9WI
	IJLHhsZvOuANOl/iDkZY8clyl/5wTUXzMY32Fx1m87Dp5/5DxtS2mgPUs86Fc0uzS+RUIOA3Xj1o0
	TfVOQ4/TZnSVlew7qrNNw7xDY5gx0+ibV/IJ2J7RIy3kGhN5gPFE6rFIEgs+Tym567NqKEOcwIdrM
	Z0EdfhbK2uluFU+0crfA7iZzLtIrjSw/MpGiBgY4iR3+BPkyt7HmMYBLII5GG+3R5h5d1JFBS5C2o
	0GX7NJ+QTNKzuHXJeXJqjSCnzBnm9xW8b6t5GYOUsRbPt53IE1ZF4Ad1M4MyoyhgfUr5uAitiP30B
	Gug2Qz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8b6O-00000002E3M-3doK;
	Wed, 06 Nov 2024 08:09:20 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8b4f-00000002DpW-0CLP;
	Wed, 06 Nov 2024 08:07:34 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730880450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UY64bCPpVbXy9hxdShMRYV6mVpN8/Beip6P+YTYfKuA=;
	b=goFnjRWR3MqEbxOAmz+OSD92aBLglKZ0Ww1FInqUvpn5uN7G9WRufX0YLGVMOUmhUilxy3
	bnfMIXIPaAIC8Oh2qZw0yU9D1W1mcciebQDmbmMKFk8ia3JRzH0rmYzVNOaNZgQa6qDFIH
	xdcSIHo665/5pnkjQA4x3vxU3rbGJXPd1YKwQJpUq/SYx/B+QJBnQNfF1QTxlm6qjLo93g
	/1eLfhn74Q6SlPeeBWgreGaNQHRCCl49/W2piBwbwF5I1HaedFBWADVlVpYoX2eDLM5jAg
	VaTlcQKWyTrOqk/j5Hl4mSHvfMi+fxx8ySA67sPOrFp5s0FH/DhQRTJrfC17DA==
Date: Wed, 06 Nov 2024 09:07:30 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add OPP voltage ranges to RK3399
 OP1 SoC dtsi
In-Reply-To: <CABjd4Yyt6WiY5E5DbyjnboFvsTpp33dydkGMF7AwMB9m7bfX6A@mail.gmail.com>
References: <806d5e2a07ae0c81d9907bbe8bec4e3e1138b392.1730838347.git.dsimic@manjaro.org>
 <CABjd4Yyt6WiY5E5DbyjnboFvsTpp33dydkGMF7AwMB9m7bfX6A@mail.gmail.com>
Message-ID: <0c237c49fae03bdad99be04053285ea2@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_000733_413286_BD3C18B0 
X-CRM114-Status: GOOD (  19.44  )
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

Hello Alexey,

On 2024-11-06 08:55, Alexey Charkov wrote:
> On Wed, Nov 6, 2024 at 11:50 AM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> 
>> Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in 
>> the
>> SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This 
>> may be
>> useful if there are any OP1-based boards whose associated voltage 
>> regulators
>> are unable to deliver the exact voltages; otherwise, it causes no 
>> functional
>> changes to the resulting OPP voltages at runtime.
>> 
>> These changes cannot cause stability issues or any kind of damage, 
>> because
>> it's perfectly safe to use the highest voltage from an OPP group for 
>> each OPP
>> in the same group.  The only possible negative effect of using higher 
>> voltages
>> is wasted energy in form of some additionally generated heat.
>> 
>> Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi | 52 
>> ++++++++++----------
>>  1 file changed, 26 insertions(+), 26 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
>> index b24bff511513..aa79219471d3 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
>> @@ -12,125 +12,125 @@ cluster0_opp: opp-table-0 {
>> 
>>                 opp00 {
>>                         opp-hz = /bits/ 64 <408000000>;
>> -                       opp-microvolt = <800000>;
>> +                       opp-microvolt = <800000 800000 1150000>;
>>                         clock-latency-ns = <40000>;
>>                 };
>>                 opp01 {
>>                         opp-hz = /bits/ 64 <600000000>;
>> -                       opp-microvolt = <825000>;
>> +                       opp-microvolt = <825000 825000 1150000>;
>>                 };
>>                 opp02 {
>>                         opp-hz = /bits/ 64 <816000000>;
>> -                       opp-microvolt = <850000>;
>> +                       opp-microvolt = <850000 850000 1150000>;
>>                 };
>>                 opp03 {
>>                         opp-hz = /bits/ 64 <1008000000>;
>> -                       opp-microvolt = <900000>;
>> +                       opp-microvolt = <900000 900000 1150000>;
>>                 };
>>                 opp04 {
>>                         opp-hz = /bits/ 64 <1200000000>;
>> -                       opp-microvolt = <975000>;
>> +                       opp-microvolt = <975000 975000 1150000>;
>>                 };
>>                 opp05 {
>>                         opp-hz = /bits/ 64 <1416000000>;
>> -                       opp-microvolt = <1100000>;
>> +                       opp-microvolt = <1100000 1100000 1150000>;
>>                 };
>>                 opp06 {
>>                         opp-hz = /bits/ 64 <1512000000>;
>> -                       opp-microvolt = <1150000>;
>> +                       opp-microvolt = <1150000 1150000 1150000>;
>>                 };
>>         };
>> 
>>         cluster1_opp: opp-table-1 {
>>                 compatible = "operating-points-v2";
>>                 opp-shared;
>> 
>>                 opp00 {
>>                         opp-hz = /bits/ 64 <408000000>;
>>                         opp-microvolt = <800000>;
>> -                       clock-latency-ns = <40000>;
>> +                       clock-latency-ns = <40000 40000 1250000>;
> 
> Did you mean to update opp-microvolt instead?

Oops, look at that! :/  Thanks for the correction, I'll send the v2
with the fix.  I created some macro in vim that produced the voltage
range additions, and as you can see, I applied that macro more than
a few times, and sometimes a bit carelessly. :/

> Speaking of which, this single opp having clock-latency-ns while none
> of the others do (except the first one in cluster0) looks weird.

Yes, I also noticed that.  Though, the way the OPP driver works, only
one of the OPPs need to have clock-latency-ns defined for everything
to work as expected.

I did "sprinkle" the missing clock-latency-ns values in one of my
other patches, [*] using the values from the vendor kernel source,
but in this case no such values are available from the vendor, so
we cannot go with "inventing" them somehow, and we need to keep
relying on the above-described OPP driver's behavior.

[*] 
https://lore.kernel.org/linux-rockchip/2e1e100284b1edb470d6e7fde021a0f1779336c8.1728752527.git.dsimic@manjaro.org/

