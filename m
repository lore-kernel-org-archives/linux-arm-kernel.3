Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FodXbr1pBcwHwT6smd38DBNkMH/fsPmYkFtkdnm0nzI=; b=4R1C6RO4KVGs86F2j7CkCbDFjq
	fOKkx3bIAKzMnOUSDgb8uPoK7Ibb4B5mR4TYc7s5LeQTvmi3A94uygjOcxXkttB55/R94KNrMHEYS
	XF93vkO3My3mHU3G6lWiAqSUCFHscGO1vJkpiEjok3vvfIVgzRqdN/AoliNzxJGdpRJ6t2H5en7wl
	2KWacSDWLuDrS5gcof9N4lcJiH9BRbxKEkSMYTn94ezcjZwfCpTtbeDrHb43ZqhKBbyIA1LqgdRdE
	cUeTCOvW+l3XxfnFVOwc3h/nkmTuMyz8M/fvZnp/WKAUXYdtBU/HNa9EYcrt9autSIJsWFy/gGKpi
	ap00Jn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrpe-0000000Ch1p-3cQO;
	Thu, 13 Mar 2025 23:19:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrnw-0000000CgqY-2bYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 23:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65957A41973;
	Thu, 13 Mar 2025 23:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13932C4CEE5;
	Thu, 13 Mar 2025 23:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907850;
	bh=gI6Vkk5pCHvVr9ev1OnfwJmpTV6cEVLcUS5gCw6YFIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrkrBhnBy64+OjE/MXzY1f53GutfxRbGgBOvbSBx8/8+f1Xk+9hzlFoIVChNlyT6r
	 buipkBH+b50As29cs96OvHLlE6MlHe/qFDS6fgZx5GuZY6MYlclmVIxFvRByw7Ssrt
	 xMonJLgCO64j8jRA85B1IWLXcdayvm8vqv2a2xOsGmsGaWrxBuuRKKXDlFlZj2Ao+b
	 g0bAKkX0TAur49zYccU4w6W8Htx6RCtoJZk0MeyICYSOBpSP/yVXZsbpKjOnYQCDAJ
	 wD66Dlp6NP9Q6GXeyyXLfQg5cUZM3a4talLaB4CtTSpYEqTcLDSi3x/cfqqr8MMt9g
	 Y524CVpN6PxnQ==
Date: Thu, 13 Mar 2025 18:17:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller
Message-ID: <5tt4wli2yodoet2l6r7ksq3o743nmi75hfksakqaxre3gmyr2a@zdotamju5ndp>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
 <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
 <d1814cd9-5c73-4ac5-a4ed-4cc2aae410d0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1814cd9-5c73-4ac5-a4ed-4cc2aae410d0@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161732_719911_43B3B03A 
X-CRM114-Status: GOOD (  14.75  )
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

On Thu, Mar 13, 2025 at 02:18:57PM +0530, Taniya Das wrote:
> 
> 
> On 3/13/2025 1:54 PM, Krzysztof Kozlowski wrote:
> > On Thu, Mar 13, 2025 at 12:29:43PM +0530, Taniya Das wrote:
> >  +
> >> +  '#reset-cells':
> >> +    const: 1
> >> +
> >> +  '#power-domain-cells':
> >> +    const: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clocks
> >> +  - '#clock-cells'
> >> +  - '#reset-cells'
> >> +  - '#power-domain-cells'
> >> +
> > 
> > I don't get why this binding is different than others and you do not
> > reference qcom,gcc.yaml? Is it not applicable here? Other gpucc do
> > reference.
> > 
> 
> Yes, I will fix them and resend.
> 

What is it that you will fix and resend? This patch or all other cases?

Please stop just throwing stuff at the list and until something sticks,
talk with the people who review your patches.

Regards,
Bjorn

> > 
> > Best regards,
> > Krzysztof
> > 
> 

