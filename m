Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76967D0C603
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kq+AJ42zFnUje9ibgB4NURSTs3bMa39Xa+9E7xEO6BA=; b=G5BMmuMddfgCcgEC1JSKYuvwPF
	ZJoNFZGna9la8EzYC9HefmJoBIfVIRpl8rX+KNEmb0wof4r/MKEIepuq9lekfFoURILP6UurBNp+L
	ebZrT9a1D8qW/q2YTj289eavdOgVidicSlvR7nXGQ7mDEX/ai/IodbFPftJ9iJATO7z4i45QF/1j5
	Dt/ZYz4WTI8d3rKiqtaY47hVXbZBSGlxfRIcAWeFQC98RcUNTvoE0usaHqwHwzz1yLiwFOwohXSO6
	m5S5C0XJuQNOYGrUKIyEZxitCOwOG6SBPPwT+4iZWQNiJGWDfC17KrK15sLSuj1qz4/PMelAZWMNH
	Ih55DCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4J4r-00000003bcC-2vq6;
	Fri, 25 Oct 2024 12:06:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IzW-00000003aty-2viv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 12:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 469E2A42E5E;
	Fri, 25 Oct 2024 11:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B975C4CECD;
	Fri, 25 Oct 2024 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729857629;
	bh=JQwR/chXzlq/cfm1F9FSdwlz8BaZGJQ7hxLBy6o2r70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFMr3E5atngJrrfXomJ8sggk5kYc52xPUiMWbJG8e9REsB8qS6m5oKahLDsOrS6ej
	 XcP97XsIAB1fTjdXj9bfR97BlvQ9Pt1HobJFz1wC0+MfYfzIelt6KlgTKEt7Zbdv7w
	 KN+NYfE3+8MBy1yt070yeslEuOv/Au6GoVwWRzVZHKJYrNsbAvRITn7o2alDGDknXT
	 J/yQqpcO+Dr8HDZqc1RmYzTjuoF/VEO5SumcAyHBEIIVXRS3/RZF4eTONinhHQg3ih
	 r3NWn/NChPENa3ZolwDaxUi7Gfgl48YKM+wPyFfEqoaPhyGbOGq8NXn/cofUnp/MC/
	 TTXjAC25znh5A==
Date: Fri, 25 Oct 2024 14:00:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, arnd@arndb.de, 
	nfraprado@collabora.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH v8 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
Message-ID: <lyafg7jwbwoe3j7voecgd5tnhrb65utc3vkc5qqxoqug3qd47m@iudkp4w2mrso>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-5-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025035520.1841792-5-quic_mmanikan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_050030_827173_9C63BF57 
X-CRM114-Status: GOOD (  11.72  )
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

On Fri, Oct 25, 2024 at 09:25:17AM +0530, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add NSSCC clock and reset definitions for ipq9574.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V8:
> 	- Replace bias_pll_cc_clk, bias_pll_ubi_nc_clk with CMN_PLL
> 	  NSS_1200MHZ_CLK and PPE_353MHZ_CLK
> 	- Remove bias_pll_nss_noc_clk because it's not required.
> 	- Drop R-b tag

That's not really a change waranting re-review.

I wished you did not create here dependency, skipped the header and just
use some number for the clock. Having dependencies does not help anyone:
neither you to get this merged, nor us to see that it was tested.

Please confirm that this patch was fully tested.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


