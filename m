Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D69CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A587y9lc4mlL2FOV+I2dGKERVSGMPSsMV9ly56hGOfI=; b=ok8lg9jEjg3R8J1g8AxL1VwQq6
	80+A/JLSuIjo7NSSyZ48xw1jkiTvobUu1690urVuHKvhQo8Xku297pXJnJ4SiVp4Vyux469gEuYuW
	EcqR8KUBMxoi4BQ4OCoCUNnNs67Ji7YD7tDnq6fqhXuEd1THDCmlJn8wlRlPEXiqOByVSO6zUopeh
	t+9bEOokpSBSWawmJeskTkNB+T3/SKcSAYdDF+qCd5LEHOv4lFiO6gFPHI8HFFPGQxEF4NgxlMKbS
	fM65MFaGlBSchPBfNwT4r2Dt4D7r9AFtotE0lzc8wuhyaJkvtcDjooxCHUyTZNVRZ3RqvZvHXshNR
	h0jCZKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1XX-0000000DD4G-1dXp;
	Tue, 26 Aug 2025 21:49:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Uq-0000000DCmk-3KZO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 21:46:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E718F60226;
	Tue, 26 Aug 2025 21:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBCFC4CEF1;
	Tue, 26 Aug 2025 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756244787;
	bh=vSBMKA9L+YzJuJM25V0/ghKt9jA4Bvh8WFzzdoSLXyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRVzx96c9JzDI75qper0rXAaximc7QD/wUa4TfD+S3Lm41MWl3XrqiV5qqvsjX/Dh
	 9d6Px3CEmX70aVHZ2rEGV8sztGvXx/1AxEaSaSJ+Suye3GBCC9QKkr2Jxso1drJSe4
	 B4EFQg11Ih6+YMu8HWd4QUw06OYyc//TT4aSOFhre/mVnLl0GTcNahIQ/Tp0XT9WmQ
	 f1UJo2zt1g2BapeF+oMWI6dj/gKCqnOIrJhyZ4Oh+G+b108hhjIjQVKMaAQm8PoHbH
	 IeegxsRJCPk3S6nQS2VqtrDbRpVS7jrLeR3s8i5F3Hg3M6SSeUY4+cwgd11ysQho5C
	 q/1CsLtqzYr6w==
Date: Tue, 26 Aug 2025 16:46:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
	coresight@lists.linaro.org, devicetree@vger.kernel.org,
	Tao Zhang <quic_taozha@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: document the static TPDM
 compatible
Message-ID: <175624478567.528178.9412029558267421159.robh@kernel.org>
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-2-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822103008.1029-2-jie.gan@oss.qualcomm.com>
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


On Fri, 22 Aug 2025 18:30:06 +0800, Jie Gan wrote:
> The static TPDM device is intended for sources that do not require MMIO
> mapping. Its compatible string should be documented clearly, along with
> an example illustrating how to define a static TPDM node in the DT.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-tpdm.yaml     | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


