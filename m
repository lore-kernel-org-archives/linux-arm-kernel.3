Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B25EC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 03:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT/ZqDsPgYHGke/D7GmpQMsslvQKBzbQsXJCmcrK93g=; b=zysa5g9elrX9U5j1/AUhEYu545
	6di0AanFE/k+PJMFS3YeZGVrFAQh/zI2bBtP7irbMm0uJPdMPZIKfz1uNKURH2I8gVoQvM6SNuRqx
	Z5cc9azJdKSSA9GAbz4Bdj/XdQRCvIfB54rZcxV+MxQG9kn3iXZ9/bajnWv+P+lw608qoQHHm0OWc
	jpCxJ/hB/LIvBcylhRfs54dLkv5/hJTMB/9JJxOhXj1l4SJntHtTZuKYB8GaZtfqPQkgVXjyGldyI
	McNj7MMDyZf3dTIWexxipXGLSwj/67cQzuY8EkltyXS/4oC5kF5tVdaJqSGChcV1EAp8d6fF/0Ned
	E+COlk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqNCi-0000000FK9S-2Nmt;
	Sun, 02 Aug 2026 03:49:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqNCh-0000000FK9G-1LvN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 03:49:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 481D76057A;
	Sun,  2 Aug 2026 03:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5D21F00AC4;
	Sun,  2 Aug 2026 03:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785642574;
	bh=zT/ZqDsPgYHGke/D7GmpQMsslvQKBzbQsXJCmcrK93g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FYTEJxj3LJN/b4Us9Qr8bZNPRF0LMQd1xcAcDQiNcgzWLh/Brw5/eoxnZFCsLdhP8
	 4NqfXmsWqvsS/kWdmp2F/OZIKtsDhQl329L7kAszW+tz+HvTnh2xjprZMHaH8swCFE
	 f1BVcfWSThRVqB5SAB2NhtFn+gGTWDd4x19X4UZCj9ivjvVTJ5Lf6OjVUbRwzXJrsw
	 hrfOwG5d73mfA9SXMbl6jKDME29Sm9w3TLC9Vg3SXGEcdRjZuTA7SMms0t04xdQyT4
	 YF0bqo2Zd9q1Q5g7ShqcLkN7Zi/MJ4mqEK5wkx9KmdDh+CWoPzFAmckgkSdo0oICeC
	 twEGDBTRun8VQ==
Date: Sat, 1 Aug 2026 22:49:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ruidong Tian <tianruidong@linux.alibaba.com>, 
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, faruque.ansari@oss.qualcomm.com, 
	avaneesh.dwivedi@oss.qualcomm.com
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source
 nodes
Message-ID: <am69fjQNTv2xJonT@baldur>
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
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

On Mon, Jul 20, 2026 at 01:49:53PM +0530, Umang Chheda wrote:
> Add RAS error source nodes for the Monaco SoC.

Why is the subject "repeated" here?

> 
> Two processor error sources are described: a per-PE node covering the
> L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
> the two CPU clusters using SPIs.

Please read
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
and don't assume the reader know what this is and why it might be
useful.

> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 64fc0d592282..4fbd1dc9a147 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -724,6 +724,36 @@ system_pd: power-domain-system {
>  		};
>  	};
> 
> +	ras-l1l2-0 {

Why is there a -0 suffix on this node?

Regards,
Bjorn

> +		compatible = "arm,ras-processor";
> +		arm,num-records = <1>;
> +		arm,record-impl = /bits/ 64 <0x1>;
> +		arm,status-reporting = /bits/ 64 <0x1>;
> +		cache = <&l2_0>;
> +		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "fhi";
> +	};
> +
> +	ras-l3-cluster0 {
> +		compatible = "arm,ras-processor";
> +		arm,num-records = <2>;
> +		arm,record-impl = /bits/ 64 <0x2>;
> +		arm,status-reporting = /bits/ 64 <0x2>;
> +		cache = <&l3_0>;
> +		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "fhi";
> +	};
> +
> +	ras-l3-cluster1 {
> +		compatible = "arm,ras-processor";
> +		arm,num-records = <2>;
> +		arm,record-impl = /bits/ 64 <0x2>;
> +		arm,status-reporting = /bits/ 64 <0x2>;
> +		cache = <&l3_1>;
> +		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "fhi";
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> --
> 2.34.1
> 

