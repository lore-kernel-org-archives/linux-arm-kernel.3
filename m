Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A7CF532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB28BWPO7N7gzksfCJKxrarUICKtPTTIw2TWmlDBYM4=; b=Lyg8apuyo4uXCl8B++SNktV/dF
	l3iZrzkpOy3gfv4Qc2wCvy4y99bupRWYC0K8SaRb+iESJs97Tt7J1/hnvjdMoAhm7/q86LgHr4QqZ
	4s1vfsD++sjW3YMOU7Y8fVymG0/JUTHSE8VnrqgT0lzp0bsbC+Bgby0NZH+5vBFnjNdx+1oIqg82B
	Hx9v9RRxJlW2hex8ma3o6lNXbrNf7GcBvt53pwBN6pz2yDfEv1J3073qlmxsCcbYml1t8xsXB15Q8
	e+/hXtLLIAwM8KNQZ6BMXg+zBK5X7IBGFCIxWRnPGKlAijN2a5/XFQ7ZTFx8DHMjKTwK0mmiOX2Xr
	1RaIrlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4r81-00000000Mze-1M4J;
	Tue, 24 Mar 2026 02:04:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4r7y-00000000Myr-17IB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 02:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8834A400FA;
	Tue, 24 Mar 2026 02:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A2BC4CEF7;
	Tue, 24 Mar 2026 02:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317856;
	bh=PPFIkVoC2rBoIdhXKT6M45k6jVgwNHb5gnHdZ0SHbFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCxaJgX/cwReVdpq3ssAtSk5ez5SrjbHqbE4E6u8kew3DMyxZrZ3/AIa53dM2TbaE
	 ipLfSBQDibZtdJvPyRUOFMjMzgNNbKbtooH1fv39zz7WKM7jeLZJnjKCNqwzO3w+gd
	 CTpxub2pJHs0kWnQAMcsOfXIzLG1pd/1awLFVdIr2RZuMoyqvG3UVdfJb+jYnQ/ROc
	 aK3yVVNZqhOaCp7jKLAlZjnNpaxKOasDA9C3/LMVCP3wsGWZT5njYlhSenuGYBJRa2
	 AT0r0NfG/tSdjLsPuvR2tbalnztUzMCs5PNtqeKE8ztikUrrmjMy/sCv30vCa/ji9k
	 nmUJJDi/9MYOQ==
Date: Mon, 23 Mar 2026 21:04:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <acHwvzjcvqNxUjm3@baldur>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_190418_322544_348DC423 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 

Please add Fixes: tag.

> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>

Please start using your oss.qualcomm.com address.

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

Are you sure it's not supposed to be 1.8V, given the name of the rail?

Regards,
Bjorn

>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> -- 
> 2.34.1
> 

