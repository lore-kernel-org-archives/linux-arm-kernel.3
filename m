Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26107C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 21:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSwBFh8ZRCZGLdsfz2d5JFpVQxBwR9usCreYMoQo9D8=; b=UKODldrDzOPXasm5RiYSctdJie
	wDeKM8adTLbTJZ9cOOzupeoOZVVTOm6BCL5tE1wNKAgpiQ+2bDdaH3O8cVl3ljTSQU3dwQX4wY8xX
	2TKTDxjCTE+pPZ0enNItlljFSSGuohw/YBNTqoH+FTXrJG0jbLbqIYLS+2T6jc8lxQN850tFbfmgF
	bK4bmW8BmLZoNRweb7gPoKDVT2jpFEUkc5n3TDlwmKNkUXf5b86DV1CYVhDSiaygJ6zv+JbO5a7IL
	0zzTziBUAHD3oWf0qw0tIunuD1Or5UpbsJ3PbCoyOQNAMfZK3bJX0qnm0tq6n6oRpFbQjGnfkP9kG
	YrVQjHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjPiT-00000000mNh-3cGM;
	Sat, 15 Feb 2025 21:28:49 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjPgC-00000000mC9-1h0F;
	Sat, 15 Feb 2025 21:26:29 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739654783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSwBFh8ZRCZGLdsfz2d5JFpVQxBwR9usCreYMoQo9D8=;
	b=NTRzTjyiGJaQZI793KXmWFF/Oi6/6pw1GWPvMYMWp9CRMXMkqvHpf7B/2yrF7zRhjVCN5s
	CpuSao6Bo19669ofuqLiOd5PqdMaNR//ZfZH28T/gjyXGWCoIAYePLf6lv+Q9jIbJNW/gR
	eIVl62mWA2su1+EwpUQzOl0bNe47nLEn9BUSm3FJJWscFHXEzqKU/qVlIISfUqQwnTWfZl
	qVm9zhkug1iNHWdMh0OpCghmbdWFvY1GD7YL5jDolYuLjtkp33amNs0MRF5yvc/VjvAO/J
	XYII3WvdIDJEN9/GHn8s1GBQD1DpQIJyfzuO3K1J7q0LVajMuYuTeFSUgX/opg==
Date: Sat, 15 Feb 2025 22:26:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Alexey Charkov
 <alchark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@kernel.org>, Diederik de Haas
 <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: rockchip: Add OPP data for CPU cores
 on RK3588j
In-Reply-To: <2914631.KiezcSG77Q@diego>
References: <20240617-rk-dts-additions-v5-0-c1f5f3267f1e@gmail.com>
 <d8ce8db2-1717-40f8-b53e-24cc71a758c9@cherry.de>
 <CABjd4Yw-r-ogfwcrph4K1wbkybS25gk6LFg8wpqLG27uWdybNA@mail.gmail.com>
 <2914631.KiezcSG77Q@diego>
Message-ID: <edbb0d1c538755e8388c29565fea1a48@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_132628_735724_4D56B357 
X-CRM114-Status: GOOD (  40.33  )
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

Hello all,

On 2025-02-15 21:30, Heiko Stübner wrote:
> Am Samstag, 15. Februar 2025, 19:59:44 MEZ schrieb Alexey Charkov:
>> On Tue, Feb 11, 2025 at 7:32 PM Quentin Schulz 
>> <quentin.schulz@cherry.de> wrote:
>> > On 6/17/24 8:28 PM, Alexey Charkov wrote:
>> > > RK3588j is the 'industrial' variant of RK3588, and it uses a different
>> > > set of OPPs both in terms of allowed frequencies and in terms of
>> > > applicable voltages at each frequency setpoint.
>> > >
>> > > Add the OPPs that apply to RK3588j (and apparently RK3588m too) to
>> > > enable dynamic CPU frequency scaling.
>> > >
>> > > OPP values are derived from Rockchip downstream sources [1] by taking
>> > > only those OPPs which have the highest frequency for a given voltage
>> > > level and dropping the rest (if they are included, the kernel complains
>> > > at boot time about them being inefficient)
>> > >
>> > > [1] https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> > >
>> >
>> > Funny stuff actually. Rockchip have their own downstream cpufreq driver
>> > which autodetects at runtime the SoC variant and filter out OPPs based
>> > on that info. And this patch is based on those values and filters.
>> >
>> > However, they also decided that maybe this isn't the best way to do it
>> > and they decided to have an rk3588j.dtsi where they remove some of those
>> > OPPs instead of just updating the mask/filter in their base dtsi
>> > (rk3588s.dtsi downstream). See
>> > https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>> 
>> Funny stuff indeed! Judging by the comments in the file you
>> referenced, those higher OPP values constitute an 'overdrive' mode,
>> and apparently the chip shouldn't stay in those for prolonged periods
>> of time. However, I couldn't locate any dts file inside Rockchip
>> sources that would include this rk3588j.dtsi - so not sure if we
>> should follow what it says too zealously.
>> 
>> > So...
>> >
>> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
>> > > ---
>> > >   arch/arm64/boot/dts/rockchip/rk3588j.dtsi | 108 ++++++++++++++++++++++++++++++
>> > >   1 file changed, 108 insertions(+)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>> > > index 0bbeee399a63..b7e69553857b 100644
>> > > --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>> > > @@ -5,3 +5,111 @@
>> > >    */
>> > >
>> > >   #include "rk3588-extra.dtsi"
>> > > +
>> > > +/ {
>> > > +     cluster0_opp_table: opp-table-cluster0 {
>> > > +             compatible = "operating-points-v2";
>> > > +             opp-shared;
>> > > +
>> > > +             opp-1416000000 {
>> > > +                     opp-hz = /bits/ 64 <1416000000>;
>> > > +                     opp-microvolt = <750000 750000 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +                     opp-suspend;
>> > > +             };
>> > > +             opp-1608000000 {
>> > > +                     opp-hz = /bits/ 64 <1608000000>;
>> > > +                     opp-microvolt = <887500 887500 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> > > +             opp-1704000000 {
>> > > +                     opp-hz = /bits/ 64 <1704000000>;
>> > > +                     opp-microvolt = <937500 937500 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> >
>> > None of those are valid according to Rockchip, we should have
>> 
>> Well, valid but more taxing on the hardware apparently.
>> 
>> >                 opp-1296000000 {
>> >                         opp-hz = /bits/ 64 <1296000000>;
>> >                         opp-microvolt = <750000 750000 950000>;
>> >                         clock-latency-ns = <40000>;
>> >                         opp-suspend;
>> >                 };
>> >
>> > instead?
>> 
>> I dropped this one because it uses a lower frequency but same voltage
>> as the 1.416 GHz one, thus being 'inefficient' as the thermal
>> subsystem says in the logs. It can be added back if we decide to
>> remove opp-1416000000.
>> 
>> > and...
>> >
>> > > +     };
>> > > +
>> > > +     cluster1_opp_table: opp-table-cluster1 {
>> > > +             compatible = "operating-points-v2";
>> > > +             opp-shared;
>> > > +
>> > > +             opp-1416000000 {
>> > > +                     opp-hz = /bits/ 64 <1416000000>;
>> > > +                     opp-microvolt = <750000 750000 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> > > +             opp-1608000000 {
>> > > +                     opp-hz = /bits/ 64 <1608000000>;
>> > > +                     opp-microvolt = <787500 787500 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> > > +             opp-1800000000 {
>> > > +                     opp-hz = /bits/ 64 <1800000000>;
>> > > +                     opp-microvolt = <875000 875000 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> > > +             opp-2016000000 {
>> > > +                     opp-hz = /bits/ 64 <2016000000>;
>> > > +                     opp-microvolt = <950000 950000 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> >
>> > opp-1800000000 and opp-2016000000 should be removed.
>> >
>> > and...
>> >
>> > > +     };
>> > > +
>> > > +     cluster2_opp_table: opp-table-cluster2 {
>> > > +             compatible = "operating-points-v2";
>> > > +             opp-shared;
>> > > +
>> > > +             opp-1416000000 {
>> > > +                     opp-hz = /bits/ 64 <1416000000>;
>> > > +                     opp-microvolt = <750000 750000 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> > > +             opp-1608000000 {
>> > > +                     opp-hz = /bits/ 64 <1608000000>;
>> > > +                     opp-microvolt = <787500 787500 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> > > +             opp-1800000000 {
>> > > +                     opp-hz = /bits/ 64 <1800000000>;
>> > > +                     opp-microvolt = <875000 875000 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> > > +             opp-2016000000 {
>> > > +                     opp-hz = /bits/ 64 <2016000000>;
>> > > +                     opp-microvolt = <950000 950000 950000>;
>> > > +                     clock-latency-ns = <40000>;
>> > > +             };
>> >
>> > opp-1800000000 and opp-2016000000 should be removed as well.
>> >
>> > Did I misunderstand what Rockchip did here? Adding Kever in Cc at least
>> > for awareness on Rockchip side :)
>> >
>> > I guess another option could be to mark those above as
>> >
>> > turbo-mode;
>> >
>> > though no clue what this would entail. From a glance at cpufreq, it
>> > seems that for Rockchip since we use the default cpufreq-dt, it would
>> > mark those as unusable, so essentially a no-op, so better remove them
>> > entirely?
>> 
>> I believe the opp core just marks 'turbo-mode' opps as
>> CPUFREQ_BOOST_FREQ, and cpufreq-dt only passes that flag along to the
>> cpufreq core. But then to actually use those boost frequencies I would
>> guess the governor needs to somehow know the power/thermal constraints
>> of the chip?.. Don't know where that is defined.
> 
> personally I don't believe in "boost" frequencies - except when they 
> are
> declared officially.
> 
> Rockchip for the longest time maintains that running the chip outside
> the declared power/rate envelope can reduce its overall lifetime.

FWIW, as an additional data point, some other SoC manufacturers
officially state that the expected lifetime of their chips gets
reduced when they are run at higher temperatures, which are still
within the permitted temperature ranges.

> So for Rockchip in mainline a "it runs stable for me" has never been a
> suitable reasoning ;-) .
> 
> So while the situation might be strange for the rk3588j, I really only 
> want
> correct frequencies here please - not any pseudo "turbo freqs".
> 
> I don't care that much what people do on their own device{s/trees}, but
> the devicetrees we supply centrally (and to u-boot, etc) should only
> contain frequencies vetted by the manufacturer.

Totally agreed, "works for me" is simply not applicable here.  As we
know, some samples of the same CPU or SoC may be luckier when it comes
to the silicon lottery that got the binned, meaning that only the most
conservative frequencies and voltages, as assigned by the manufacturer,
are what we can provide as the OPPs.

I'm having a more detailed look into this, and I'll come back with,
hopefully, some additional comments. :)

