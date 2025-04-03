Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2CAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aH+MeY5wxEAwtijunPYNL+y+DpNd6dDfxP3oQyKVdZI=; b=bzkgsOEHcAXoXE8wGH4TkjFFrv
	So0QevPq6tdfkIsAd7gKV0uqKfnR09hDlrfcQ2gOMeiUZmlvpSCPLGhS4vojv59bKaRuraQeeAfBu
	mg7g+F9HSzdmNB+2tJjzjOkMAmSLkZwgzE3++Jlcxl2m2ubOUxlz9LGDIBej58YIj5LnPH0SCJHOx
	wNUduDUIhYEjnMLQHmdhsftoqnjt1rNWFPGA3FV6otQa9NE6cmHaJtryz2dpsIfPQ2lCpgYrwFpdQ
	Pz6Aw+O5AvQcGGKFn3vPD+XRUJQ4wJRcLbomOWfQ8QkwgL/32gaMZBz2iZEVAT/uqN1EfpTBzecAd
	wPG9pz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HlW-00000008ZCZ-2cuS;
	Thu, 03 Apr 2025 10:25:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GoK-00000008OiL-1cEJ;
	Thu, 03 Apr 2025 09:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=aH+MeY5wxEAwtijunPYNL+y+DpNd6dDfxP3oQyKVdZI=; b=EZumTnmMfnXjC+fIRGTIzUUpdC
	xmA4sKsK5GMhS8YKEute0EoJCcEazqvF7+am554iZXBLJ5qRjirO9rlLnKFgZmDv1UQ8J9kiTi0lq
	RdJgNNi1Djy1QT7PmMZb0aT/DV6ghoVgilR/3/l4NvUdtlqjuni8ugwvCcVO+Q5SIkn1b6H1xlvYu
	Xi0ca1YIjr3S23xDcgfJwcOYOYxi3Cq4dOiPLluvMr8Xf9RWfhcV13FdtJ41RYYUk/wn/86gUm1Mf
	RpTxxLLBEOo0tyPHYV8hO1cG3KIhbVs/p3JjiDagwc3N7ViaKg5AS9xNMI/CmVsP8UuyjQV0dEEbF
	Q298q3TQ==;
Received: from i53875bf8.versanet.de ([83.135.91.248] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u0GoE-0003Ky-Fc; Thu, 03 Apr 2025 11:24:26 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: devicetree@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alchark@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniele Briguglio <daniele.briguglio@icloud.com>,
 Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH] rockchip: dts: rk3588: add missing OPP nodes for lower
 frequencies
Date: Thu, 03 Apr 2025 11:24:25 +0200
Message-ID: <2652016.Lt9SDvczpP@diego>
In-Reply-To: <20250403091840.3349637-1-hello@superkali.me>
References: <20250403091840.3349637-1-hello@superkali.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_022434_381373_8D029E0E 
X-CRM114-Status: GOOD (  19.29  )
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

Am Donnerstag, 3. April 2025, 11:18:40 MESZ schrieb Daniele Briguglio:
> From: Daniele Briguglio <daniele.briguglio@icloud.com>
> 
> This Patch adds missing Operating Performance Point (OPP) nodes for lower
> frequencies to the RK3588 device tree. These additions improve power
> management by enabling the CPU clusters to scale down to lower
> frequencies when under light loads, which should improve energy
> efficiency and reduce power consumption.
> 
> The changes add OPP nodes for 408MHz, 600MHz, 816MHz, and 1008MHz
> (for cluster1 and cluster2 only, as cluster0 already had 1008MHz)
> with appropriate voltage settings across all three CPU clusters in
> the RK3588 SoC.

the general consensus is that you don't save energy when you're not
reducing the voltage together with the frequency.

For example cluster0 @1GHz runs at 675mV already, so reducing just the
frequency, when you're not allowed to reduce the voltage with it won't
save energy, just make things slow.


Heiko

> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 58 ++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> index 0f1a77697351..1b018823d5d3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> @@ -5,6 +5,22 @@ cluster0_opp_table: opp-table-cluster0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <675000 675000 950000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <675000 675000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <675000 675000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
>  		opp-1008000000 {
>  			opp-hz = /bits/ 64 <1008000000>;
>  			opp-microvolt = <675000 675000 950000>;
> @@ -37,6 +53,27 @@ cluster1_opp_table: opp-table-cluster1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1008000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
>  		opp-1200000000 {
>  			opp-hz = /bits/ 64 <1200000000>;
>  			opp-microvolt = <675000 675000 1000000>;
> @@ -78,6 +115,27 @@ cluster2_opp_table: opp-table-cluster2 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1008000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
>  		opp-1200000000 {
>  			opp-hz = /bits/ 64 <1200000000>;
>  			opp-microvolt = <675000 675000 1000000>;
> 





