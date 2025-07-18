Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADD9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uko5dho9StPWdJr9vSxujAGNhLPc6riZ+NbVrSX3Cek=; b=alMKx8RYz06/2S6x415LnRr5dF
	QZiyuMiwfRma/4ViFQXAAnjsTFbDbnEL9GlbfIvs9tX5f+5R9221rxxnoXh6zPQk97bZdcqY6VFIf
	6FQQBYoGVg0DLMxfrdb+mt+tNyZBVwL6rjd+0IEGpLc8TVMo9miVLoNBRrg/FNf4ELhTGZF14KqyX
	iuKYS/h6dXzC1Na5eqHtLXg67iYdxFrB2YbicBLHbm1auKHjvVZjbvpnverV21fk4z67eHTYhmM1J
	6/Iu7rorCNgtfpZNrYZHDZri2d6Hxgh7L3oR/TWoZOuyh1ic8gI+n2NViakNooeion0CU9G2qTi7o
	WX/qI/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclVl-0000000CjZc-1wDd;
	Fri, 18 Jul 2025 13:52:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclLV-0000000CiR4-1DCi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38AEE5C62C9;
	Fri, 18 Jul 2025 13:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD9FC4CEF0;
	Fri, 18 Jul 2025 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752846111;
	bh=avJpFlqig12EKxnGpyoNFdv5k4eIVYy9aoIS6p/eMc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZbGbpXgCzOARuo5vgET6kteenJppwv4exXdqXMgEzWRrWkIYETKx8sRh+SM/jDtPs
	 OHjrgWFOE2lRI+saSsdQ6iNGi12rLhAj2pNC4YUKRmsQ10TBqDomKCmv56YFfIBb/n
	 lux43igB5+Li3CCJMmTPSowTUsDHIgfyrH+O5fuDoj7AowXBMy/epfzIejCFJNYJoV
	 mFzjfV17nb2j/KUwSG1diISm5kTTiV1YVrRtbjb1I2auZAX4FFanGE+YAGE2vYkU5t
	 CkmDa4r7DuNDhCOFTRPN82JtP7S6izBIIOsCguK6lc4ts6sGKq6B71MQ3yKbdwmNm1
	 Bace+ZOeS7C6Q==
Message-ID: <6a6a471c-1d1b-4283-93b0-0f777a44959c@kernel.org>
Date: Fri, 18 Jul 2025 16:41:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] dt-bindings: interconnect: Add Qualcomm IPQ5424
 NSSNOC IDs
To: Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
 quic_linchen@quicinc.com, quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
 quic_suruchia@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-1-f149dc461212@quicinc.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-1-f149dc461212@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_064153_375028_9FCDDD7B 
X-CRM114-Status: GOOD (  12.56  )
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

On 7/10/25 3:28 PM, Luo Jie wrote:
> Add the NSSNOC master/slave ids for Qualcomm IPQ5424 network subsystem
> (NSS) hardware blocks. These will be used by the gcc-ipq5424 driver
> that provides the interconnect services by using the icc-clk framework.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

Acked-by: Georgi Djakov <djakov@kernel.org>

> ---
>   include/dt-bindings/interconnect/qcom,ipq5424.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/dt-bindings/interconnect/qcom,ipq5424.h b/include/dt-bindings/interconnect/qcom,ipq5424.h
> index a770356112ee..66cd9a9ece03 100644
> --- a/include/dt-bindings/interconnect/qcom,ipq5424.h
> +++ b/include/dt-bindings/interconnect/qcom,ipq5424.h
> @@ -20,5 +20,11 @@
>   #define SLAVE_CNOC_PCIE3		15
>   #define MASTER_CNOC_USB			16
>   #define SLAVE_CNOC_USB			17
> +#define MASTER_NSSNOC_NSSCC		18
> +#define SLAVE_NSSNOC_NSSCC		19
> +#define MASTER_NSSNOC_SNOC_0		20
> +#define SLAVE_NSSNOC_SNOC_0		21
> +#define MASTER_NSSNOC_SNOC_1		22
> +#define SLAVE_NSSNOC_SNOC_1		23
>   
>   #endif /* INTERCONNECT_QCOM_IPQ5424_H */
> 


