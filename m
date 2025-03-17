Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B37C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTF0o5A1jNBnA2VVNxf/g0tp/52cWeP3s/ro8/UTap0=; b=lnqLW5RFfUTpTjyrdT/3gDjBjW
	JBUHvX9LIjNB7oLRFlG8CecQ76fIRgXX3Ka2jOLLdqer5Y9sQAZi8V8hVmNatL/Qa60aYFVHimBY2
	Nyc4oIfl7TE6ZYo4u9+SShOTmA5FeSGtpYBjbNUhDJRqGQUmFvXIIETJYIcgxYfINY5dIixSlQGco
	4NTCDk3hMKfrVL9tuT3tHpEUM6BY5/cFTF6LpqgLO+zFYUo5VVTg5nJqEwuroRcG+WvG3rPU9t1VF
	W7esqBtYDMEIVhBdE6MvUhY3G0F9z+/ub4e6D6Ib6YornB1WxVZYX5k8jKu/n6eaWUkTYWdcUnO5/
	82zN9Xeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHGp-00000003va0-3m80;
	Mon, 17 Mar 2025 20:41:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHDU-00000003vCY-0D1I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5D49A48D26;
	Mon, 17 Mar 2025 20:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2036C4CEF3;
	Mon, 17 Mar 2025 20:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742243863;
	bh=EAH6DiCttghSq5ONxKx1j8unsQnFPM5gcsSzH37iVwk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fNK+qsZMETCsE4vmpMKLZl6mMxKbZdsm1Ao1mDGWMjmPYCVkQXEsVH09rfa1QEZCx
	 TXKDmiRQLmQufOImGnEtGDP7Mulf2Rnm4WsbooLztBQdCpHtNPwc1Q6NB9RxZ47fO3
	 ZwojOst6zp4Gj5Y2HczDnx1KkC6PVg+0nHIfHM/NG2IpNJkBkIwIpiydFBaU/kJhDd
	 5+23T/UpyHw9HRtOO5TqmfrL+7fCf+AsMgNpYaYQXQ3lgiHRWuaTjQPH1gK2reI7aJ
	 V0/tCr4gKU5y88UahVcaADEzP8z9wXgLlkpquCy/p2G3ck6oMT8ePuUc21Fl717hWQ
	 7SDdACX9nDedQ==
Date: Mon, 17 Mar 2025 15:37:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Kumar Gala <galak@codeaurora.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
 Sean Paul <sean@poorly.run>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 David Heidelberg <david@ixit.cz>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, David Airlie <airlied@gmail.com>, 
 Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Andy Gross <andy.gross@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@codeaurora.org>, Leo Yan <leo.yan@linux.dev>, 
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
Message-Id: <174224352766.683604.12560729798577306237.robh@kernel.org>
Subject: Re: [PATCH 0/9] ARM: qcom: fix APQ8064 schema warnings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_133744_211914_43AF0E36 
X-CRM114-Status: GOOD (  15.54  )
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


On Mon, 17 Mar 2025 19:44:35 +0200, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (9):
>       dt-bindings: soc: qcom,rpm: add missing clock-controller node
>       dt-bindings: display/msm: describe SFPB device
>       dt-bindings: soc: qcom: add Smart Peripheral System Interrupt Controller
>       dt-bindings: arm: qcom,coresight-static-replicator: add optional clocks
>       ARM: dts: qcom-apq8064: add missing clocks to the timer node
>       ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
>       ARM: dts: qcom: apq8064: use new compatible for SFPB device
>       ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
>       ARM: dts: qcom: apq8064: move replicator out of soc node
> 
>  .../arm/arm,coresight-static-replicator.yaml       | 10 +++
>  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++
>  .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  8 ++
>  .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 85 +++++++++++-----------
>  5 files changed, 136 insertions(+), 44 deletions(-)
> ---
> base-commit: 2bb3cf7805af73af62ebfcbb55e350549b6a0912
> change-id: 20250317-fix-nexus-4-dd0fe3bca987
> 
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com:

arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: rpm@108000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: rpm@108000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dtb: rpm@104000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-msm8660-surf.dtb: rpm@104000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#






