Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AD2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaaCN1q/n3kjQfPqICNHxVDL1mCCzIPacgi5zEqisuI=; b=3P+bRLPothYJ0toWRgSYH+yL9P
	6tJOGOjQNBJQSAWyiaZGvdVB+elupk3Bw1dwbOWBPfOMtULGb61R+QIwjCc2JP+pJZDdAOfjKiSSt
	AXTM6QKjs0XHLxsfjO3f8sWo27socX057EhY2WSd6LqX3e+FsGVEAEmBBFVx1h+ePpOj+BhtufCbJ
	9boWSbtPIS9iXxuXrlvzgR75mBYPv5v9fD1Rx4V6/YFMWXavIduNMcGNnvTfiFAfLkMjZ66GinCID
	vkoovolHczbtVgO61EtOp/a54q7Fl69MkxFklx8bmH5+PYuu/Qk8sDbHqgl2kErFHEzDz2Xm6Eknv
	ZimUhDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVyc-00000005sCS-2LrI;
	Tue, 18 Mar 2025 12:23:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVtJ-00000005rQi-2anD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:17:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8pPL3016310
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FaaCN1q/n3kjQfPqICNHxVDL
	1mCCzIPacgi5zEqisuI=; b=LQW8MganX/bSqJMTX80JL/g4gJtfrPh1JKfpjZ19
	q64aUn3bocVCCL0XROtkvcwFD2VAfY8AisoTQNcvodZh2bQOQ5RG7VQogsS45D8q
	OobdY3EFwWYqZAPv5ZD2k9IOmddEYWdsVt1EVLd2EEJHKEewEXyYNdxacuFQMH7q
	Ivq7XeWZvcAEoCxNnC5WztUEEsVrLa3lDVZ6V9FrtPdJkXKisYjTT/7F1G8PWy2v
	EXNZY6wTqohJU9Jk1UcQkRb/7aay3c30yrD3YGPlriTZwapbO+9cEvJiDevm4HoN
	IFcmG0etoCmLESBMAF475MfL2gAI1S/hBiKHdYnyEKPErg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdr5tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:17:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4765f7bbe1bso96270231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300272; x=1742905072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaaCN1q/n3kjQfPqICNHxVDL1mCCzIPacgi5zEqisuI=;
        b=SGmN80F4Vc+9/QOOngD8bWeaVOTfHQj2nu+NA2CNOwVtNSCLPuXRg1LjKu48eQ+mz5
         v6Vvy855aimozAvUCe+0kGH+Uqkiyr6pL6F+Z+hRV48z1gp7Bo6LAQUuUInsH8Y2c1Vo
         Hj7qqAN0D/VMqqEQn/Kkku1PjNzbODttp9WXOPHfb6g/p22BySShKxlAtRblC9jb5YNR
         Tp9jAOfzepExk6XwvM/lWRvCkZkPE5t8EzVfPoCWnA3UqHc6tT3lXtCgAatzsgyTQaaw
         DW2kGYDhNpTEjeZC8jVwhFZWuqGqeMMlDwrw5w8WLpqhqjirYLxpUEEjSSQTN8PoleWt
         5A+w==
X-Forwarded-Encrypted: i=1; AJvYcCXyCRA4rTkhuAuxuhPFfE+epmwNIEOlXyTZPzpCz7+/4roMi5izw+Z8ku1gXnGeul2oM/1Be+BirA4XHEPZEhEy@lists.infradead.org
X-Gm-Message-State: AOJu0YzbUlx7kJKNxhZBPmuPHNakbnIZGgoI8vy7hDEcJ5lqfh1bgdB2
	0GPgTvPjtSHBIzPurdrVJp1vZ9NRkR+mNinmYQWDr/6vwYKBTu6ATwQUJ0uCZOp93jQEYdlwOmu
	nsZzbFMNGrBRK4vmv8COn6iNZVGkpKk3mIVeTVw4WSRzg9IHAghPiUI+ioH0spezOMWBfeuMqFg
	==
X-Gm-Gg: ASbGncsOlX/UVxkYEGqEz4Q2jbfyvJKtmVjpLQEQ+zIERIRiX4sO+yt7hGirBXCZq8b
	DBkNWMv8NNBP7UibeJ8GY4fEHrZCbnuuqwRY448LQ6TcoBYMDbL6T12udXd7+y9RijLusYiPdVY
	GZeVkNhV3cny01CQvhX0n6M7nN7QD3eIlgtjl64nz7+Mnwbyqmg4uZV5tUkxJau3eE+XzKGgdNl
	LZOf2uf64xkURz2RL0yGl8s/GvVvWPJFuBbqY6Er1gsjTQTAA1LX7vXpWzLBkVJ1kb7msXnw9yg
	+H5505cUrgbIpP6l/DQauy/ZDfqGcahXwfS76Yp2GjMM7OYQ8z9//ncsjidLQjnP45b4Q1g4mO3
	P5JY=
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id d75a77b69052e-476c81dfaf8mr248672521cf.47.1742300271838;
        Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPpyCMBm/+FHacTciTYh4rtRvXfyv+VeST5ueZfSRLIXQQ10PAbp2U7DCjEI40J7DQsicDmQ==
X-Received: by 2002:a05:622a:453:b0:471:cdae:ac44 with SMTP id d75a77b69052e-476c81dfaf8mr248672001cf.47.1742300271483;
        Tue, 18 Mar 2025 05:17:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a9525sm1640499e87.238.2025.03.18.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:17:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:17:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
Message-ID: <fr2s2ndjzyd2z7m6bsztudyb74a7rdvunehb6qfu6ar3s3i7hf@x7fap3clhlbe>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
 <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d96471 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=eq-DVYtN1lDvlgNQnWEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: PIWJcoleXp6lJjTgIuSFWzxDrtst914z
X-Proofpoint-GUID: PIWJcoleXp6lJjTgIuSFWzxDrtst914z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=556 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_051753_662413_A38249A3 
X-CRM114-Status: GOOD (  16.12  )
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

On Tue, Mar 18, 2025 at 08:56:46AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 17, 2025 at 07:44:38PM +0200, Dmitry Baryshkov wrote:
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Smart Peripheral System Interrupt Controller
> 
> Interrupt controller should have interrupt-cells. Or this is not
> interrupt controller...

Well, it is an interrupt controller, per the name of the block.

> 
> Anyway same comments as for previous patch.

Ack


-- 
With best wishes
Dmitry

