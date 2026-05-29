Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B3ACD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gkuk1hSYF7azCaKHz/S3pZc2XU3K06FzR8lRjatZQwc=; b=DFQVw16N/UtvDEfOjyeI/2j8of
	5Krk/RNLqdMpcQJetuFPwidmfPdWBi7S/0SBvhZk6iATplckgkIyUinof0w/kEATy3pYm4tMSPKGz
	fy4V5QO9lw5DcmUaODqscYlwEWGw/QYyum/4KEMXWgEpVGJVWDv5lDq3+oO6YVTeARN3ED0fy8bMg
	2aWI/TJdKh09TImdaQNHoLZpABtlVMyQR8Q+Pt35Q5yk6s8uV3008DnJ5+vdm51F8kH25ijyyiG8e
	8naKnvjSECCUV0+sSn/1sCDv7hNy3ojrwC2+Htvcv3Az4KiWmp+b4E9k9V7aEmuAvtVgheNwzdsXm
	ttfwIQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT18r-000000081Hu-3Q6K;
	Fri, 29 May 2026 17:37:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT18p-000000081H9-3vaZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:37:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A17543BE5;
	Fri, 29 May 2026 17:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BD61F00893;
	Fri, 29 May 2026 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780076223;
	bh=Gkuk1hSYF7azCaKHz/S3pZc2XU3K06FzR8lRjatZQwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XyPCHAU055g5ZN7YMdDu61wHTj2INteS4tKl7VRuD1bN8aKrsNK9viwY5qoL9mtGk
	 L7u0p3sRKKV9oeaoVoQsrKwl+EbB76H7gaokCR4TMYIbJC0m7i6wCTJIvH7ydwPbjZ
	 WBMncnMKC03ne5NRA1Sz6MmtemeRvtrATJkZnVvCf7++zDWRFJdfJV5/dNZ18twMH+
	 frmdzmc4u9ey980lzvzqhgccf31Qj6TSaHn73ea885R++JKooTRvRTrOb2OBHcu3CF
	 IAdnjwa7U0P1q/n/5TgsVQsg5qodfYeEZjAZltiLu229k2mJWqTMR9aTtAWkFkxtu3
	 262jQgwYtbyiA==
Date: Fri, 29 May 2026 19:37:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Message-ID: <20260529-bipedal-notorious-macaque-a999f4@quoll>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_103703_995376_2C4490D2 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

On Mon, May 25, 2026 at 04:16:04PM +0530, Taniya Das wrote:
> Add bindings documentation for the Eliza Graphics Clock Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
>  include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


