Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3BACD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RC8jmYaG6xK0VuQBqROoKrirquMSwIRTfAs/g0x82s=; b=LaNbha52VRrUA2HFrchX2dvPxy
	x84lYaevobfvJyb+sT7icNSgyg5OvWClG6fBf/rKWLwPs25grlASZ2A89tvh37+YfCG/VVDC/VgFE
	SGIhbJa+EepxxGC+EZDShrFw35BM+XdkBsfDmMMffXlo331yjhJRGJWxmacR3R8j3YtC/VZHQYh4D
	Nj3u3aRxBs0lpXLP+Ms3ADVL4RL5bgKiO/y9D+rExk6WJUEx4OVd8cc+fZ0i4/gJO3spnmuQWYO/V
	kEuceI+Bl9WM3FrhgWP4SMM12m0o/NsUVioe+rHznA6pIldpGpoMuESQ9yIr0RCR48e8GOjDSMmK/
	QDWvDMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuH3-000000007g3-17mp;
	Wed, 17 Jun 2026 17:42:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZuH1-000000007fw-43Ls
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 17:42:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 116CF60052;
	Wed, 17 Jun 2026 17:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F281F000E9;
	Wed, 17 Jun 2026 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781718118;
	bh=9RC8jmYaG6xK0VuQBqROoKrirquMSwIRTfAs/g0x82s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N+Mzdag973iH4hO6Sjg54nL3kg6ofkz0cQfNurdpysbU5SXY/OybFr3meSgPBeGPw
	 wfc7JmVDLkerB4mclX8PUwiVTc7O4jklyyIuXclD2Bx5XTAR5uQ8SWKX8g2Aw/bcZf
	 rgggTSpe6fhEYRPoSkxLmQmgd/hqkxfr3VKqIi9gqXYu80iouiWDWiLLrWWAxwoAbu
	 lCxCY+2R3aZDnnhAx+upRayjijyJmLPe2wdZSyds8EIW4mB5FFxeR3S2Nv4Q6ntixM
	 MYNQoq3wFKRu/LxhuyF/lnd7l9Qh604Je7hagQs5OqvaOu34TopxyUtf610uLzaBkc
	 MwTa3tHMZsieQ==
Date: Wed, 17 Jun 2026 12:41:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
Message-ID: <ajLbyqELjduwbKC_@baldur>
References: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
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

On Thu, Apr 09, 2026 at 05:51:09PM +0530, Ayushi Makhija wrote:

Here's a link to "v1":
https://lore.kernel.org/all/20260323102229.1546504-1-quic_amakhija@quicinc.com/
Which makes this v2.

You also ignored my feedback.

Thank you,
Bjorn

> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 3837f6785320..6ba4e69bf377 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>  
>  		vreg_l12b_1p8: ldo12 {
>  			regulator-name = "vreg_l12b_1p8";
> -			regulator-min-microvolt = <1200000>;
> +			regulator-min-microvolt = <1650000>;
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> -- 
> 2.34.1
> 

