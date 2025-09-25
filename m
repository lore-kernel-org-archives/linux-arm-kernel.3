Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB43CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UHiyy4KxqAgQ+eN/V7jFale2Y0hm8rgKKn38zDKOn8=; b=Wg2WTMIpOqo8cDZup8/2YbB7tI
	gaww9oC34wyD/LiiySatcRSWEw8fc3wLisC5OIu4E0m/1EaDNa7y4hyt5p1X5rLuHg9yzeUNvB9NB
	h5XFq9Leu2izodwuHnbBx5cuD1NS8zbiAo2wt50prCXBJP9ZcYFEkuhN67LxVGao8qepMQkBTTnWj
	TVj/aSP3Alzy/Whom5Fuj3psdRWxfNEv16Vw5uGwRXeNWHLP015MM/nGaAnsmtUxxNTlSyHCeucgi
	7U7EnkflVOMooAehS9XYXgxb11fkSCLptPxl7ba1bY42465xwbTOAKG+j+ABR8JgworXWqtF/sOCd
	lr7j1/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1llZ-00000009HUA-21O2;
	Thu, 25 Sep 2025 13:12:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1llY-00000009HTe-2LER
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6AB76054E;
	Thu, 25 Sep 2025 13:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07E6C4CEF0;
	Thu, 25 Sep 2025 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758805927;
	bh=hCbg+xH0PAFSHq/z2bdjQ4pq3+Cnx9PLmBUG/OA2ris=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAnizgjI5yWSwS247xUL1Al1T++xVE+5Ckc0md+K/OeloABVWqUpTznDhQP7Ha4FM
	 z6iyGrVpaWU+VYgcG/8rsA1gQWAmWIyq4dgY7brtt1Vl5h16cutxxXRt+VAH90oVHq
	 Hjt/xHdyJxnU770UqWU+ioF2kPwvCUU27LEDHkhTTaLf5x67Mzg80k4F30/nvaC5yy
	 OWMFV0jXJYaKYDbfzzLesYN9ITDeHa7prYLFuwb587YSwMc40+UCxnx2w2t8scpj7t
	 Ql0bdQc+wIHIAjbDCva1q0rEMfDeM1zWPquSqLTpDRARLjAUVUr3+sZrcQJPy0WTJO
	 Mnwluuq3UnhrA==
Date: Thu, 25 Sep 2025 08:12:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
Message-ID: <g2e5ejykf6nteipzsybbjjjcdvko4yg664uxh57bi3ty3cljh4@5mv5ki2cqyg3>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
 <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
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

On Thu, Sep 25, 2025 at 02:14:01PM +0530, Taniya Das wrote:
> 
> 
> On 9/25/2025 1:59 PM, Bryan O'Donoghue wrote:
> > On 25/09/2025 00:56, Jingyi Wang wrote:
> >> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>
> >> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> >> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> >> camcc from SM8450.
> >>
> >> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
> >> sc8280xp camcc to sa8775p camcc")
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
> >> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
> >> camcc.yaml
> >> index c1e06f39431e..dbfcc399f10b 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> >> @@ -63,7 +63,6 @@ allOf:
> >>           compatible:
> >>             contains:
> >>               enum:
> >> -              - qcom,sc8280xp-camcc
> >>                 - qcom,sm8450-camcc
> >>                 - qcom,sm8550-camcc
> >>       then:
> >>
> > 
> > This is not a revert.
> > 
> > Where does the compat string go ?
> > 
> 
> The compat is now part of
> Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
> of this commit "842fa7482915".
> 
> > You are missing the part where you move the compat string to where you
> > think it should be...
> > 
> 
> It was already moved as mentioned above.
> 

I'm sorry, but I don't see where you say this. 

The commit message is a verbatim copy of the first paragraph of commit
'842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp
camcc to sa8775p camcc")', where that comment makes sense. But here's
you're no longer moving something.

Please help me understand what I'm missing.

> > Also why is this patch appearing in a series about _adding_ Kanaapali to
> > CAMCC ?
> > 
> 
> This was to reduce less dependency on the series.
> 

Had you sent this patch last week, I would have merged it into v6.18 and
there wouldn't have been any dependency.

Regards,
Bjorn

> > NAK
> > 
> > ---
> > bod
> > 
> 
> -- 
> Thanks,
> Taniya Das
> 

