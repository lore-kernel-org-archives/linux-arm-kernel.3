Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0019AC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DdJ1gMHWzOjplPr4v+9JtrcaHIdGLk0WTVEXhfhPJg=; b=EMeInYWDmblIOWHdk8pikln7ez
	W60Iu80y6WzT034zsMxP+3TO2xzSv89c4KpVgwHHHYJzdw1qjCz9OiZKRJMgxAMQhgO/qn8uRv+n4
	CQZMYIQwnTkW3Tm4b5Cf8WqaNVbybjoQ8BUgIT5UPCk8fc859EsNK4iifQ0zrd+GjxEdDSnsC3iAt
	Qb2Pt4/ybaZQFWmNBQrCFyQwMGHCd+tZkyTEplFV/ysJ2mjomk3wwIvar2o0q6bmWYueTcR8fOSGZ
	nHN/ZaHmPihRmqgmSShCDkgxC3vJWOhXUX11w8vT9rd+nJdjHtHriEcHFkr7jyp1xK4EIao/DPBCb
	kG783meA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN3T-0000000BU8i-25Bp;
	Mon, 10 Aug 2026 10:16:27 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN3Q-0000000BU7m-0VuK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:16:26 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c1600d040e4so234241366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786356981; x=1786961781; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0DdJ1gMHWzOjplPr4v+9JtrcaHIdGLk0WTVEXhfhPJg=;
        b=o9wRF5yktuT4bb8G3kDG3BCzkK1MkT7Sdjs9REY11RCvKeIMfSCU5F1DyjRDf97PMf
         gmQXcawEidSmfDhSPFJ/S6rGRawKrC79UBjTnkDEuZ/y6IY1igUCehMDXmwcjZAhfLMv
         /vN+noqkCIkTvcZiIRhPR+4THV7uUSs8wBu9UGLG2IZiZwNWMnjMomCVqpCjomkHHZMs
         yOyT5Jv3wQJB/yo+fNqNt68qrukjmk8xTwViWL6a/HqXSKYb7yIl0w4875EdubFGlqBn
         KUu8DePDZGJ+SrAdFFry6CIJ9xaSejRDbIgpxb4qW9iIkGJfbVcnFkmci/Gz2AZlsff0
         hnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356981; x=1786961781;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DdJ1gMHWzOjplPr4v+9JtrcaHIdGLk0WTVEXhfhPJg=;
        b=gpnHH0oVPHMoLR+w9BZ6OgV7ZeISeBxahMY33g96Giw2s/qgZu2lNvO1FoB7jso2ya
         gRttSh01m04SqPr8FDmEX+Uu8Ziu3egzKGLTZ6mC1NRSeqcK8Ciyhv1rIfHVecT/Tz2o
         +Fhl6CkXk1n6SVlxGOhIweJKg3LGHNXUGfDlq2T1sMAatFqiC2YRMgzUmyk9U2ZetVOo
         +bj7jdxbPxzFDcos4jPggNE30PElEgJBn/KWtOCtrdILvrTElF4t+ESADm9LG4CNMsZg
         GdYK+L29vovP8bE3J9QYfInkANNs65Vp0MTMJim61XPgdx3O/c8npqJorpDnLvbgeeWc
         BVww==
X-Forwarded-Encrypted: i=1; AHgh+RovlZtzKB6ylz0NH3+q5gdjNlDm6Pf0Mj3VOxaccZBsuGrNFtIOD2XqKYxAhR5lRHsKwsVvEY67ejiehajWUi0t@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0t+J2/GrGXKitq9t2rMEGIhDlTArbhAJhq3ewwQK3esdUCgjp
	3gc/X+3BcbP+QCRPn28ChH4Za8Rv+3gh6hJkucsKXharOdmCtaTTO/QJDABJoSAOJdk=
X-Gm-Gg: AR+sD125JgzcU8dX9KEk1PHptnRFHao/QFj1UAl1ZrggrswqgzeoyiyYKgVHBBLaXRe
	BQH5pNDHEjvWFf+V74vnsWETZRHN1jTDBqOx8hFO0Hs7FtAALGiMDhmOKc25Pu/Na387/qG+OOV
	tKa7ouT2k1aE/FaUjBFbGLcNGxFrPKrS8YUqmLCq1Cy0BUbc5EHIJ+u2zQMkUXfug4E+iD36C1F
	3OiXMF2vYjHpcFYCKDpHPxVMh8p5WvSy0VVvdIiX6PSZkiiiWpFmFdLqUGkvyPULlQ1E9S0EcCm
	bfmzG13GKL52E76RActykCDcia7nGkyeDPauQt4WENU6dTdN2/1XC0QzrLpGvfNv1eVxdtvGHB6
	Fi0YxBV32Vhb/yeSAXs8wvFW+wH3prt0z6fxzTy6oF0PWpor6/n5L5ZJmK6G0gRBBsT+V+dBE2X
	QT2OKTpEwBDodxz25TJDq5h8k/u+y9G0FGzo6b4tIg9td8r75ud+e7Rb7Y03CICmthZ9sEqS3fZ
	d65jGs1I5U17fL2J2JnHY0p+wGI75ouQw==
X-Received: by 2002:a17:907:94cc:b0:c1c:6d29:8a11 with SMTP id a640c23a62f3a-c208d3ec3cdmr919652366b.13.1786356981152;
        Mon, 10 Aug 2026 03:16:21 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a33sm357250966b.2.2026.08.10.03.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 03:16:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 12:16:19 +0200
Message-Id: <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Joerg Roedel
 (AMD)" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, "Robin Murphy"
 <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Luca Weiss" <luca.weiss@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for
 instances on MSM8974
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_031624_265365_8B9A2035 
X-CRM114-Status: GOOD (  20.03  )
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

Hi Dmitry,

Many thanks for working on this and sending this patch series!

On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> spec, however they differ from other Qualcomm platforms in the
> implementation-specific registers and also in interaction with TZ.
> Venus, MDP and VFE SMMUs are secured and require programming only of
> CBs, while GPU and JPEG require full programming.
>
> This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> and adds only MDP, GPU and Venus (although untested, it is required for
> display to work) SMMU instances.

I do have a patch series (sent years ago to the mailing lists as well)
for CAMSS so I can definitely test this in the future.

>
> Note, to get display to work properly one fix is necessary, [1]
>
> [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@=
oss.qualcomm.com

I've applied this series on v7.2-rc7, with the extra commits between
that and linux-next for qcom_iommu.c backported so that your series
applies without conflicts.

So far I'm stuck with the GPU not being able to probe, adding some
printk's shows that in msm_iommu_new() the call for
iommu_attach_device() is failing.

[    5.971154] msm_mdp fd900100.display-controller: failed to load adreno g=
pu
[    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000=
.gpu (ops a3xx_ops [msm]): -16
[    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
[    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach=
 to DSI host
[    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa=
1 failed with error -16

~ # dmesg | grep iommu
[    0.127014] iommu: Default domain type: Translated
[    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
[    0.739899] platform fdb00000.gpu: Adding to iommu group 0
[    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
[    6.006877] platform fd900100.display-controller: Adding to iommu group =
1

Have you seen any issues like this?

Regards
Luca

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (12):
>       dt-bindings: iommu: qcom,iommu: document the MSM8974 IOMMUs
>       iommu: arm-smmu: add global register definitions used by the QSMMU
>       iommu: qcom_iommu: extract context bank programming into a helper
>       iommu: qcom_iommu: support the short-descriptor pagetable format
>       iommu: qcom_iommu: handle the SMMU global register space
>       iommu: qcom_iommu: support non-TZ-managed instances
>       iommu: qcom_iommu: restore context bank state after power collapse
>       iommu: qcom_iommu: halt the micro-MMU while programming context ban=
ks
>       iommu: qcom_iommu: allow faulting transactions to terminate
>       iommu: qcom_iommu: program BFP (prefetch) settings
>       iommu: qcom_iommu: add the MSM8974 instances
>       ARM: dts: qcom: msm8974: add the IOMMUs
>
>  .../devicetree/bindings/iommu/qcom,iommu.yaml      |  16 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  85 +++-
>  drivers/iommu/arm/Kconfig                          |   1 +
>  drivers/iommu/arm/arm-smmu/arm-smmu.h              |  10 +
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c            | 445 +++++++++++++++=
++++--
>  5 files changed, 517 insertions(+), 40 deletions(-)
> ---
> base-commit: 6c5c106bff878247a9cc7255077aab9040df8bf8
> change-id: 20260809-msm8974-iommu-upstream-144b1e2a15f0
>
> Best regards,
> -- =20
> With best wishes
> Dmitry


