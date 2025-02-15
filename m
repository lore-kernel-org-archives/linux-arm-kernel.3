Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE83C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2L2E31Kpcq2+Iyw5Ftui3TXJtYkGBgQkdNUSK6FOPU=; b=AibhVwG9Y9XR0TXstKVLtPRi9g
	CPQcan9/INFhSTQKa93qP+M7pZRzEFDvwZUxdcY8/JUCc0Z0sEZHyh7opZ/2uCzeP6gkYspQAvf3a
	zsWn81ces9XL5N0nEblE6W7vjvu2C6xp17BkiAg9bvX5R81Td9yyubB5511VuG522FweQIBYYywQ4
	IZ8hkTVIpXkhAcbH2iF/BK+H3p+cCIky7xp1Z/Y9KfW3yEfM0j6IZeI+qwyjRFou/7xPomV3NXKeW
	uLSR+/i1Hf28VELZJKpQzSTe+Wqlsw/oyGC4YeTpVVGBH/FKLiEGYkvfrghISxOOELUa2T/2O0XA6
	/wLRTKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjOq6-00000000iUQ-1CXO;
	Sat, 15 Feb 2025 20:32:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjOoc-00000000iK3-3jcw;
	Sat, 15 Feb 2025 20:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A2L2E31Kpcq2+Iyw5Ftui3TXJtYkGBgQkdNUSK6FOPU=; b=Flupwaio4FmJ5qZoIxxEyCdL4j
	Rv1lnQoaicYreRiyWAyW6vkXr/NvviMBnAR+873c+sjRIkLY6Ed90qjsEyz/zppb4wmlgmcr0E/K2
	WzmCh9Mbpe0HlZy4FfXCx/OUNLZLFVxYFT7EdzTsppKcPGJWq7sQaRU/hiHVs7xB+P+fv91XCR4Qe
	MDMylFpyZdVm5iy1yiAvk3Xqr2rZX+o7351DSyfMp3nBqqXlW3W1wS0fCHLqOLZ/oXJNDMPJgqnPb
	7TKCFzsuYAz5GUVyfwDPBq/x9iObMpIwaWsZKUdd+KctiCEOsAhNoFP9zteep+TfXe3cUbhouijFs
	GwsVFESQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tjOoP-0007aw-OE; Sat, 15 Feb 2025 21:30:53 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dragan Simic <dsimic@manjaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Chen-Yu Tsai <wens@kernel.org>, Diederik de Haas <didi.debian@cknow.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: rockchip: Add OPP data for CPU cores on
 RK3588j
Date: Sat, 15 Feb 2025 21:30:52 +0100
Message-ID: <2914631.KiezcSG77Q@diego>
In-Reply-To: <CABjd4Yw-r-ogfwcrph4K1wbkybS25gk6LFg8wpqLG27uWdybNA@mail.gmail.com>
References: <20240617-rk-dts-additions-v5-0-c1f5f3267f1e@gmail.com>
 <d8ce8db2-1717-40f8-b53e-24cc71a758c9@cherry.de>
 <CABjd4Yw-r-ogfwcrph4K1wbkybS25gk6LFg8wpqLG27uWdybNA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_123107_089668_56FF9D85 
X-CRM114-Status: GOOD (  41.67  )
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

Am Samstag, 15. Februar 2025, 19:59:44 MEZ schrieb Alexey Charkov:
> On Tue, Feb 11, 2025 at 7:32=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de> wrote:
> > On 6/17/24 8:28 PM, Alexey Charkov wrote:
> > > RK3588j is the 'industrial' variant of RK3588, and it uses a different
> > > set of OPPs both in terms of allowed frequencies and in terms of
> > > applicable voltages at each frequency setpoint.
> > >
> > > Add the OPPs that apply to RK3588j (and apparently RK3588m too) to
> > > enable dynamic CPU frequency scaling.
> > >
> > > OPP values are derived from Rockchip downstream sources [1] by taking
> > > only those OPPs which have the highest frequency for a given voltage
> > > level and dropping the rest (if they are included, the kernel complai=
ns
> > > at boot time about them being inefficient)
> > >
> > > [1] https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c7=
34f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> > >
> >
> > Funny stuff actually. Rockchip have their own downstream cpufreq driver
> > which autodetects at runtime the SoC variant and filter out OPPs based
> > on that info. And this patch is based on those values and filters.
> >
> > However, they also decided that maybe this isn't the best way to do it
> > and they decided to have an rk3588j.dtsi where they remove some of those
> > OPPs instead of just updating the mask/filter in their base dtsi
> > (rk3588s.dtsi downstream). See
> > https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fa=
b7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
>=20
> Funny stuff indeed! Judging by the comments in the file you
> referenced, those higher OPP values constitute an 'overdrive' mode,
> and apparently the chip shouldn't stay in those for prolonged periods
> of time. However, I couldn't locate any dts file inside Rockchip
> sources that would include this rk3588j.dtsi - so not sure if we
> should follow what it says too zealously.
>=20
> > So...
> >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > >   arch/arm64/boot/dts/rockchip/rk3588j.dtsi | 108 +++++++++++++++++++=
+++++++++++
> > >   1 file changed, 108 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588j.dtsi
> > > index 0bbeee399a63..b7e69553857b 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> > > @@ -5,3 +5,111 @@
> > >    */
> > >
> > >   #include "rk3588-extra.dtsi"
> > > +
> > > +/ {
> > > +     cluster0_opp_table: opp-table-cluster0 {
> > > +             compatible =3D "operating-points-v2";
> > > +             opp-shared;
> > > +
> > > +             opp-1416000000 {
> > > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > > +                     opp-microvolt =3D <750000 750000 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +                     opp-suspend;
> > > +             };
> > > +             opp-1608000000 {
> > > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > > +                     opp-microvolt =3D <887500 887500 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> > > +             opp-1704000000 {
> > > +                     opp-hz =3D /bits/ 64 <1704000000>;
> > > +                     opp-microvolt =3D <937500 937500 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> >
> > None of those are valid according to Rockchip, we should have
>=20
> Well, valid but more taxing on the hardware apparently.
>=20
> >                 opp-1296000000 {
> >                         opp-hz =3D /bits/ 64 <1296000000>;
> >                         opp-microvolt =3D <750000 750000 950000>;
> >                         clock-latency-ns =3D <40000>;
> >                         opp-suspend;
> >                 };
> >
> > instead?
>=20
> I dropped this one because it uses a lower frequency but same voltage
> as the 1.416 GHz one, thus being 'inefficient' as the thermal
> subsystem says in the logs. It can be added back if we decide to
> remove opp-1416000000.
>=20
> > and...
> >
> > > +     };
> > > +
> > > +     cluster1_opp_table: opp-table-cluster1 {
> > > +             compatible =3D "operating-points-v2";
> > > +             opp-shared;
> > > +
> > > +             opp-1416000000 {
> > > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > > +                     opp-microvolt =3D <750000 750000 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> > > +             opp-1608000000 {
> > > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > > +                     opp-microvolt =3D <787500 787500 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> > > +             opp-1800000000 {
> > > +                     opp-hz =3D /bits/ 64 <1800000000>;
> > > +                     opp-microvolt =3D <875000 875000 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> > > +             opp-2016000000 {
> > > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > > +                     opp-microvolt =3D <950000 950000 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> >
> > opp-1800000000 and opp-2016000000 should be removed.
> >
> > and...
> >
> > > +     };
> > > +
> > > +     cluster2_opp_table: opp-table-cluster2 {
> > > +             compatible =3D "operating-points-v2";
> > > +             opp-shared;
> > > +
> > > +             opp-1416000000 {
> > > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > > +                     opp-microvolt =3D <750000 750000 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> > > +             opp-1608000000 {
> > > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > > +                     opp-microvolt =3D <787500 787500 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> > > +             opp-1800000000 {
> > > +                     opp-hz =3D /bits/ 64 <1800000000>;
> > > +                     opp-microvolt =3D <875000 875000 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> > > +             opp-2016000000 {
> > > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > > +                     opp-microvolt =3D <950000 950000 950000>;
> > > +                     clock-latency-ns =3D <40000>;
> > > +             };
> >
> > opp-1800000000 and opp-2016000000 should be removed as well.
> >
> > Did I misunderstand what Rockchip did here? Adding Kever in Cc at least
> > for awareness on Rockchip side :)
> >
> > I guess another option could be to mark those above as
> >
> > turbo-mode;
> >
> > though no clue what this would entail. From a glance at cpufreq, it
> > seems that for Rockchip since we use the default cpufreq-dt, it would
> > mark those as unusable, so essentially a no-op, so better remove them
> > entirely?
>=20
> I believe the opp core just marks 'turbo-mode' opps as
> CPUFREQ_BOOST_FREQ, and cpufreq-dt only passes that flag along to the
> cpufreq core. But then to actually use those boost frequencies I would
> guess the governor needs to somehow know the power/thermal constraints
> of the chip?.. Don't know where that is defined.

personally I don't believe in "boost" frequencies - except when they are
declared officially.

Rockchip for the longest time maintains that running the chip outside
the declared power/rate envelope can reduce its overall lifetime.

So for Rockchip in mainline a "it runs stable for me" has never been a
suitable reasoning ;-) .

So while the situation might be strange for the rk3588j, I really only want
correct frequencies here please - not any pseudo "turbo freqs".

I don't care that much what people do on their own device{s/trees}, but
the devicetrees we supply centrally (and to u-boot, etc) should only
contain frequencies vetted by the manufacturer.


Heiko



