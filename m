Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CDBC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kc5UYPl7f9X635NJ3Fg771yePRD2lZa815BaqxRGGKw=; b=TxEZbEonTjyijuFo2zuIyr4Rcq
	nf3l9nTw4OGTnD+ReLnk2P9Otd7ZSn9oIyNxK6jQ2j+chZBJhRMZ1vEvXBeFUK8PFmYj85e3AxN4A
	t42rCQ12rDfcqA2ztonCy+TnNHMQNW2ASX2wiZVFCvetU6XOtnR1GAtCzwv7db9NGJXEwsMVTHHfL
	H5TqZzKjSMPriIV6qZNIMg2dEHpSllQV/GK1W+sZG0lJ8XXnSshHhUk55A139itzFHYIgBR8MhmQ/
	6C8S9rcng2iXhw1OYPweJHAkiw0IaJvpV8IN/hxENHD8DgVctL5PE1QKj8Y9M7pcPTk3YFFKb58/L
	fN3iuTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvoh-0000000CgE7-0JHw;
	Thu, 10 Jul 2025 18:16:19 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtgC-0000000CKkH-1C2P;
	Thu, 10 Jul 2025 15:59:25 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4a8244e897fso12863711cf.1;
        Thu, 10 Jul 2025 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752163163; x=1752767963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kc5UYPl7f9X635NJ3Fg771yePRD2lZa815BaqxRGGKw=;
        b=hyhfco0uiZOxgkmaKkInLarGv/TFVn0N26/QbQ9pk73XL2jAmyj50lOXg6sTJZbiDT
         6K8vUfuccdkDV85wUTSThC3li1VtGdblr6EfBlYdt9Rb21kD97UEwT0rzK7MAC6kkAi+
         dj5Wb+Kf4XETaUoZ926A0/ESdYu41r+Q46WcaPPMP5eEfU8+RpUHePOzBkn+lGmcxS35
         KH8y9zn5H8hGNxA8kWK3bwg69NA+0TD7CFcS7SSdHqNTG/63iOsLK/+DBLjSbxTtxL1N
         dhnWdheoziz1SeozHsfigtRoi6/L/B1DWSDcqZvxVxtDwfhXnOoCk/3D2WpH5Xhkn1Qj
         l+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163163; x=1752767963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc5UYPl7f9X635NJ3Fg771yePRD2lZa815BaqxRGGKw=;
        b=ervuY0ZYVDdGnEPUfCxn1XhVraWf9rMPiLGYqZ9B4FOmSapWXzhPjYh0OG2M+4Naji
         cY3F2N12AwL8VhZszUSckHdvKHr4R0FVw9T0Yf+CTbSY+Eyk/Z1aiVzfCP4P1MlStQU6
         fe+QoFz9OJD1dLtJg6dzDGO7/xz1LFPFZkD5lXGm/rji8vC693lT8hEWx4j4aWjX2ycz
         gIsf6KhihdlEQUpfS7nVcYOl1y8vMkcDjvLgqa0oyAGgRaFQ2h+yBtd0AUkj7U/VYp20
         el0SY/AmYDqcIz8D/6te/hlkeLxoACfQ8OOUWwDxtUyiHBorn3lVdzPElfhNef263nDu
         lHUw==
X-Forwarded-Encrypted: i=1; AJvYcCUsdwBChJXZSyIctMAjs6XmCDLwTVfelNpwsuUduDBdeDIn4jwDfEGA3Z38B+15ic2C9lQ6lBBRNMTJidxFFjw=@lists.infradead.org, AJvYcCUyv/Z5ZkmvjDjSu5gfI/8nXrDBof0hl2rf96aRluwDLiU2OVEevQ1wfNL5L2bXbOhvx+aKSN2ZGl3bInx+ku5E@lists.infradead.org
X-Gm-Message-State: AOJu0YyioU06TMeS1joPTRp67+oXvphq4qoNtV11g3YaKlLQ8G4YR2gx
	SuOLhH39678gRK3sTmvyAdLrClkEWd3btLPd3fw4+A1GDTEfYr2I45hO3Kb1lkEDbRSWRNt9F7d
	Bu2ckx0Kp8up717iQx52M3gzpFGOn5RA=
X-Gm-Gg: ASbGncvu35ZFtsSCFlV41IjPiRnHqjzYitzh4ZmU+sEj2AUqbtBh7O5TEoXG5Vg4Wpc
	ZdTGFIKb+bCQR/eKNF7b5T7WKDgAPXbY2Z6Szw7dNQnWspM6cgTJWGKQPbjTZ6OFcNjLnAj3LB+
	T9TKZKzRaudLG0ExkD7y/p/Z1ZNWsbXJXqCMIosSpsyo4g
X-Google-Smtp-Source: AGHT+IEhI4AzpjBb+4MG95Co3MJ4O+5/UGoMQAVYVLzb+1MSK4cvxAy6aVFWEBdljfwhBMeShvoYgQRmoCBDnmBmDEU=
X-Received: by 2002:a05:622a:4ac6:b0:4a4:40b7:9cc with SMTP id
 d75a77b69052e-4a9dec54757mr100730111cf.12.1752163162448; Thu, 10 Jul 2025
 08:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250620100010.1291658-1-amadeus@jmu.edu.cn> <20250620100010.1291658-2-amadeus@jmu.edu.cn>
 <5025631.aeNJFYEL58@phil> <b6f8f705-f661-46cf-9dda-6f18f8658622@kwiboo.se>
In-Reply-To: <b6f8f705-f661-46cf-9dda-6f18f8658622@kwiboo.se>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 10 Jul 2025 19:59:11 +0400
X-Gm-Features: Ac12FXx1qPTjJO3HuLgi2Tlv0SZqUgMUIca5qO-LsnRBbRElxcE-W9k1gvJPLZ0
Message-ID: <CABjd4YzCL3U9yf65FUBE6EMqFjZHosULU7fUcjVo9VJ_=Ov+Dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency
 scaling support
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085924_325990_96682D45 
X-CRM114-Status: GOOD (  35.73  )
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

On Thu, Jul 10, 2025 at 7:09=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wro=
te:
>
> Hi Heiko and Chukun,
>
> On 7/10/2025 1:45 PM, Heiko Stuebner wrote:
> > Am Freitag, 20. Juni 2025, 12:00:10 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Chukun Pan:
> >> By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency a=
nd
> >> voltage mapping to the device tree to enable dynamic scaling via cpufr=
eq.
> >>
> >> The OPP values come from downstream kernel[1]. Both 408MHz and 600MHz
> >> frequencies use the normal PLL, so use the corresponding highest volta=
ge.
> >>
> >> The voltage used for other frequencies can't be less than above (875mV=
).
> >> Therefore, 816MHz to 1200MHz also uses the corresponding highest volta=
ge.
> >
> > There has often been the argument that selecting a frequency that has t=
he
> > same voltage as a faster frequency does not save any power.
> >
> > Hence I remember that we dropped slower frequencies on other socs
> > that share the same voltage with a higher frequency.
>
> One possible difference here is that the actual CPU rate is controlled
> by a PVTPLL where TF-A will configure a osc ring-length based on the
> requested rate and Linux only configure the regulator voltage.
>
> I have no idea if the configuration made by TF-A will have any affect on
> power usage, but I suggest we keep all opp here because both TF-A and
> Linux is involved in configuring the CPU rate.

It seems that PVTPLL usage shouldn't change the equation here. As long
as the voltage stays the same, it should always be preferable to run
the core faster (i.e. at a shorter osc-ring length) so that it can go
to idle sooner, given that idle states are less power-hungry than any
of the active states.

What DOES change the equation is the different voltage that downstream
DTs define for different OTP programmed leakage values, as they make
different top frequencies correspond to a given voltage for cores with
different leakage values.

> The measured rate can typically be read from a PVTPLL status reg, it
> will be different depending on the ring-length, voltage and silicon
> quality for the rates >=3D 816 MHz.
>
> >
> >>
> >> The remaining 1416MHz to 2016MHz use a voltage close to actual frequen=
cy.
> >>
> >> [1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/ar=
m64/boot/dts/rockchip/rk3528.dtsi
> >>
> >> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 64 +++++++++++++++++++++++=
+
> >>  1 file changed, 64 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boo=
t/dts/rockchip/rk3528.dtsi
> >> index 829f980ea353..5cb7f10b79ed 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> >> @@ -53,6 +53,7 @@ cpu0: cpu@0 {
> >>                      device_type =3D "cpu";
> >>                      enable-method =3D "psci";
> >>                      clocks =3D <&scmi_clk SCMI_CLK_CPU>;
> >> +                    operating-points-v2 =3D <&cpu_opp_table>;
> >>              };
> >>
> >>              cpu1: cpu@1 {
> >> @@ -61,6 +62,7 @@ cpu1: cpu@1 {
> >>                      device_type =3D "cpu";
> >>                      enable-method =3D "psci";
> >>                      clocks =3D <&scmi_clk SCMI_CLK_CPU>;
> >> +                    operating-points-v2 =3D <&cpu_opp_table>;
> >>              };
> >>
> >>              cpu2: cpu@2 {
> >> @@ -69,6 +71,7 @@ cpu2: cpu@2 {
> >>                      device_type =3D "cpu";
> >>                      enable-method =3D "psci";
> >>                      clocks =3D <&scmi_clk SCMI_CLK_CPU>;
> >> +                    operating-points-v2 =3D <&cpu_opp_table>;
> >>              };
> >>
> >>              cpu3: cpu@3 {
> >> @@ -77,6 +80,67 @@ cpu3: cpu@3 {
> >>                      device_type =3D "cpu";
> >>                      enable-method =3D "psci";
> >>                      clocks =3D <&scmi_clk SCMI_CLK_CPU>;
> >> +                    operating-points-v2 =3D <&cpu_opp_table>;
> >> +            };
> >> +    };
> >> +
> >> +    cpu_opp_table: opp-table-cpu {
>
> This node should be placed after the firmware node for the nodes to be
> in alphabetical order.
>
> Regards,
> Jonas
>
> >> +            compatible =3D "operating-points-v2";
> >> +            opp-shared;
> >> +
> >> +            opp-408000000 {
> >> +                    opp-hz =3D /bits/ 64 <408000000>;
> >> +                    opp-microvolt =3D <875000 875000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +                    opp-suspend;
> >> +            };
> >> +
> >> +            opp-600000000 {
> >> +                    opp-hz =3D /bits/ 64 <600000000>;
> >> +                    opp-microvolt =3D <875000 875000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +            };
> >> +
> >> +            opp-816000000 {
> >> +                    opp-hz =3D /bits/ 64 <816000000>;
> >> +                    opp-microvolt =3D <875000 875000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +            };
> >> +
> >> +            opp-1008000000 {
> >> +                    opp-hz =3D /bits/ 64 <1008000000>;
> >> +                    opp-microvolt =3D <875000 875000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +            };

I.e. here the mainline kernel will always choose opp-1008000000 as
long as the regulator voltage is 875000 uV, unless explicitly
prevented from doing so by userspace. Whereas the BSP kernel [1] would
request different frequencies for different silicon, e.g.
opp-1200000000 for a silicon specimen with a leakage value of L4 and
opp-1416000000 for a silicon specimen with a leakage value of L8 - all
for the same regulator voltage of 875000 uV.

So my 2 cents would be: no added benefit in having "lower frequency,
same voltage" OPPs defined here until we implement an OPP driver
reading the NVMEM programmed leakage values and selecting different
*-L* voltages for each OPP depending on those. Once there is this
support in the drivers, those OPPs can be added together with
leakage-specific voltages (opp-microvolt-L0..11).

Right now OPP values with frequencies lower than 1008000000 won't be
selected by any of the energy-aware cpufreq governors anyway, because
their voltages are the same. Exercise for the reader: try to convince
e.g. the "schedutil" governor to select anything below 1008000000
without touching
/sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq :) This may
change if OPP tuning logic is implemented such as in [2]: that will
try and find the _voltage_ resulting in PVTPLL providing a frequency
closest to what cpufreq requested, and use that for the in-memory OPP
table instead of what was provided by the DTS.

[1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/b=
oot/dts/rockchip/rk3528.dtsi
[2] https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/soc/r=
ockchip/rockchip_opp_select.c#L842-L994

Best regards,
Alexey

> >> +            opp-1200000000 {
> >> +                    opp-hz =3D /bits/ 64 <1200000000>;
> >> +                    opp-microvolt =3D <900000 900000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +            };
> >> +
> >> +            opp-1416000000 {
> >> +                    opp-hz =3D /bits/ 64 <1416000000>;
> >> +                    opp-microvolt =3D <925000 925000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +            };
> >> +
> >> +            opp-1608000000 {
> >> +                    opp-hz =3D /bits/ 64 <1608000000>;
> >> +                    opp-microvolt =3D <975000 975000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +            };
> >> +
> >> +            opp-1800000000 {
> >> +                    opp-hz =3D /bits/ 64 <1800000000>;
> >> +                    opp-microvolt =3D <1037500 1037500 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >> +            };
> >> +
> >> +            opp-2016000000 {
> >> +                    opp-hz =3D /bits/ 64 <2016000000>;
> >> +                    opp-microvolt =3D <1100000 1100000 1100000>;
> >> +                    clock-latency-ns =3D <40000>;
> >>              };
> >>      };
> >>
> >>
> >
> >
> >
> >
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

