Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4D6CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5Fftntf2RCN3VHPBxPE2mLXiYSeBR+dEngDzE4HyC0=; b=HgSqMHCegQ5V408TjMlkPXxasd
	AFSYaQnawF2ckWGu4v+74lcOBUIBKivR4bw1w1T10UjXwaugw7jL97+UKvEyIT8hK+ksahD05pQ3c
	tw7dknq2WPltjI4q5d23NGVlNaRC3o2ZjUf5M2Y6tHaCHF12ZEn9479Jk4H0Ihr56SvYyNM18XGgB
	/ZqlO/eeL7O+doDQY4iCdIJqywJJxvDuAEhSbh5lFQNUr2Htef7rHr6v/8b4X47NQtfTzBBDCoDyC
	3vtjO5my8sfl81HxhCEBSgv1b2fbp8zej501npRKKDpvS6jrD6G7ZVqBWzdQToECo/rd5NFVu0bKm
	VWtZ26lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hMc-000000079GA-0IST;
	Thu, 25 Sep 2025 08:30:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hMb-000000079FO-11Y2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 605B96040A;
	Thu, 25 Sep 2025 08:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59717C4CEF0;
	Thu, 25 Sep 2025 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758789004;
	bh=97eP1RrZK1CzM7LJ/PhdktA7pOXsynV5Pvzv79A+srE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+VmzwDHVzfldoxi7HY1QHRXIjxUHBqpvaSHHtiAvoATuXZpUo4wVDIoXmF5P/mRr
	 2dIDoKuLD8cmq8wBVAmbf1lLzpZ3llVAM8GzgxjjB+KV7gyf1Bag9HupYchLUhrY4I
	 zrIbv0AZjlKOompmLwjfOzXNL3w5q8OLHvj4pOwPgNbkF+BpzciAQtBRQpdU8TPmcV
	 jakS27dQHZMDO8Y2dCXKfJFMYrp5w7tnkACv0VmzCFtCfUayN1pI3qbjdeMZolO3/R
	 fTQr9Q8SdFFQKSbdWjafnyVoyWeQG44KWS1VK6UdIgo3Z84LttwqpajJYpyU4zQAa8
	 h/ylSOSv0Sm3A==
Message-ID: <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
Date: Thu, 25 Sep 2025 09:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.
> 
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e..dbfcc399f10b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -63,7 +63,6 @@ allOf:
>           compatible:
>             contains:
>               enum:
> -              - qcom,sc8280xp-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
>       then:
> 

This is not a revert.

Where does the compat string go ?

You are missing the part where you move the compat string to where you 
think it should be...

Also why is this patch appearing in a series about _adding_ Kanaapali to 
CAMCC ?

NAK

---
bod

