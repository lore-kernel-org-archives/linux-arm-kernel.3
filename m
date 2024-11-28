Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF351D70DE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRg/7d6YJzOoez+QkfVBlbg77QpvQiIofJH2zZ3Hjtg=; b=zOSvFjpf31ekW6T+fkGaHc374C
	SJ4WbCIzCEVB6JYMGo1Mnw2NAeREkSq39Kem4hds7mBkhr2DUgxkZ2KPs5c+wSVjAu/+W0i3yu6he
	vFxNIZPs7kUmK21Tpu4Zd4tKjcv7R+/aG2pBGK2BKq1HfMPelO5nBXAFYRksEBILnnFE0BvTTCHqf
	FZnw+6/HZhIRyP43vSzvTaxJry9qbxo7s8KQXZJXna3sW7mp6tlMbNVP6+/uLGjmP8UzI20aifYvX
	Hc7h1OpimooHw5eJDZCAQUAgT/J9xyQQ40RGh3BiBwKJ+BxBegT79/wiPkajpLDHiMYUeuvRsJsw5
	wVXJcMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhjG-0000000G258-2I43;
	Thu, 28 Nov 2024 16:50:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhiG-0000000G1uH-37Fl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 16:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YRg/7d6YJzOoez+QkfVBlbg77QpvQiIofJH2zZ3Hjtg=; b=LsMx96iWwDND2at+8Wjl7oCHaL
	ocO4idUaabSGW+jJXM0iWz9v9g3jsiZcEvFNARD91lU3/R7tRERvjwy89136atw1HGSjnHqL0jDhk
	5QtkfFAHTNemlNm+ddEmqUOwQoOSYLjhAN49Y0T19rRW3r02CY9NLpVxxJAq1L3GGQAM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tGhi9-00Einh-Od; Thu, 28 Nov 2024 17:49:49 +0100
Date: Thu, 28 Nov 2024 17:49:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: add base QCS8300 RIDE board
Message-ID: <fe332b12-d62e-442d-906b-7f3a72165b85@lunn.ch>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_084956_778127_E1BB37C3 
X-CRM114-Status: GOOD (  16.25  )
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

On Thu, Nov 28, 2024 at 04:44:46PM +0800, Jingyi Wang wrote:
> Add initial support for Qualcomm QCS8300 RIDE board which enables DSPs,
> UFS and booting to shell with uart console.
> 
> Written with help from Tingguo Cheng (added rpmhpd nodes) and Xin Liu
> (added ufs, adsp and gpdsp nodes).
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile         |   2 +-
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 267 ++++++++++++++++++++++++++++++
>  2 files changed, 268 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 9bb8b191aeb5..d9545743606a 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -114,7 +114,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb

It would be good to add a comment to the commit message about why you
are removing qcs8550-aim300-aiot.dtb from the Makefile.

	Andrew

