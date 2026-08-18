Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7BCC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 00:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCvKVybEOFdX2cDIvd//iYNxXEPL/iIJ382Zpl80Syo=; b=eTaOb09Lkekbb1JetlRy3WiW/1
	/0XR5KejEXt22Cw2Hk5W92qn5mBj3Kk6IZ7vMMUjOltzlNGCupCTWVw8k5J/mLXMzJgEMmSLq0m7L
	UoSQnDKAKKkU/rqqgZz1pLRvYhDcC0k2lVRO1S4FxXYUSJtzf1wdOcuRJHCAKt2y8y8NsNyiP6AtP
	SI4uvKszdKUR2gwkoBkSQKmgXAMbvKCBRsNY8gY08CiSJbkICz2QQOvbQFELtJ4BxYzxYFskuJNK4
	gkVBOIYyE9QzN2CFNjfdDIces8SJ1PEI6iYdtfqlUKNTgp6Sks2BLmtsAd9NrYlcGMxpqhTecrgsN
	XOpuCaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww7bt-0000000718e-07JY;
	Tue, 18 Aug 2026 00:23:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww7bq-0000000718I-1pli
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 00:23:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkv1M4076891
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 00:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCvKVybEOFdX2cDIvd//iYNxXEPL/iIJ382Zpl80Syo=; b=Ka1c8tNC1h2W8CdW
	Ud0LNsLs9Jw35vd1G3ACu++WWP9vw/meBFaR5Jg1fnELc3OUumGVR7D0U0gOK974
	VlB+dfOsZ3mYAJ2DczbpyssKJl/7d+Nlo2BWoWgjza7BrG0VtgDZN26SLHXlqn+x
	VC5Qu3m5v8IXroEyu4LGdO1H2sKo1AmyiqdAsLp7nFIaJ+coztLVSUOFme0N4m5N
	qSaZnk9cuzZGJ3O0G0Ft0DVEP0rV5XEg2Tw35imp2yEeDXAx9pxhiVeu5XuQB4n/
	HBDtqeBVY6M8Q0yTHKD4MeCHeNk0kxUp5iqZW6R0xZOQtRG6t1BmAuhy0s4k2iBi
	W1FQTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7uwq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 00:23:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so422505085a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787012595; x=1787617395; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCvKVybEOFdX2cDIvd//iYNxXEPL/iIJ382Zpl80Syo=;
        b=FV9SSfOKz4zFZ8o/edf0UM+zO+QXAcZWe9FyyfO9sLkJq5YUL6MDqFmiHA+GOohGca
         xe2SBXC6igE4S73UqV1Wq7DKZ0U/6e5WgqrHasvl9XBeIh9n80fPWnaYNx/kwC39jHph
         wVyp+V6vxP5IuTFOMcGup4M54jdeeyN3m1zK26B4Nrb9TBTo4Ba3Z9+wNynCcuRHUxXw
         XR/u4U7Tsj5YrZit/v/eCEi6V4iD/GeGNaKvbmn+SXVP/q2GUwjA3kGmiHLY/fkl1uMp
         4f5NeycPp0/nYCS9QTqW214Nq35vCwHbC7LfglwIiCMsqFFdJs7PaFqYbpNDg0bXyyve
         skVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787012595; x=1787617395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZCvKVybEOFdX2cDIvd//iYNxXEPL/iIJ382Zpl80Syo=;
        b=ryD/Hllu4Um2imKvxPPmYotiYc9yGt3K7bxbtakAXofyErSzFDh4GLJ6gjkyIrP4Da
         fI9xn0Wvei30QBZhiB1jcZsh2lrhQP06GTa5Zefyn0OnmlpzZxSAkGiK3bRY/wz9/om+
         wXBxb5jfhq4xG+XRtRKJDCMmQIYhgmcUhPFKvi5+T7prINIKDWHxHSQlx+nhOO2b/HaK
         aD9slRufT18qA8WyyriZawRuzIvY03AGA+XbJhf51VXTth63tDCpjRM93V43Fs+9oUtw
         UZl2cnLX76fLPAs8CY1DVvCHYUEu83TRHlhVoyItW6Lo60ozykVPMQJl5lrPG7GznWT4
         tfYg==
X-Forwarded-Encrypted: i=1; AHgh+RqF3TwBVnKWQ989s1wxHXZa6kYkja0Z+yhiDEbX5UbED7VXcFodCG+Ci4DzWzvIdJ1KZH17airnERrC0eN9NlJc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq42vRPgtv17Pdoj3oR+Ej81OKvOgvk7gH6t6rWeFw+kvJ+APJ
	g7HXljBfxGdlNm+sW9+/g1FHhDyQFo8Z6mZkHtP3/JbGDDIRxMSHPpu3K0kLWuy4jFMfi5tBzaV
	PyyHPN8bhW3wxqugSZRJBavobvK5Ne/DU1Ya8jmnoOYt7ElxGiaxxKcVeDsxnZpa6Jm/vDUU6tl
	k7RmUsrWkActqVPak=
X-Gm-Gg: AR+sD10iYCr25hLQnCdK4AAVZcd13snKiuqO/g5epLNromiQ0QE/1ozhXxffvSsMWU+
	d8oISdIyQtsiIbsVFeEO8omhVdyuJSZBlOORXBm4uPY82WQclP1rMENi/9/9Fc1LcGVQBJobGxp
	Rt3i9SJt2+k4DideHLWOo8LSCS4g8H/mMIfh8T5ZItMMkxnFCM7vDixcr9YiRIa52+5GgGJ8JZt
	8q4Pml2HHfyeR5PrQoYcV2PTh2wkOpkfrs8cRfTH2ev4nfywW/nzhwam7c1ctyZSPI2KsdiddR/
	KKJP4i3WTfVSC27EkxEpDXhYSKQ3P22oOkvzD7E547zWSO0Ner4Oo2sWsImzgzjj9Rh0CBXoVt+
	U6jxz6kwrQ2axvq0tn6EI/4n9dqjr4eGd/0I+RwqcBJDnM+VYUDAbEDEepGLSS0euCCXS8l1ZmJ
	80WEsWZIJKY7cs
X-Received: by 2002:a05:620a:d87:b0:936:9f44:d1cd with SMTP id af79cd13be357-93704b8dbf7mr471771885a.27.1787012595338;
        Mon, 17 Aug 2026 17:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:d87:b0:936:9f44:d1cd with SMTP id af79cd13be357-93704b8dbf7mr471766885a.27.1787012594834;
        Mon, 17 Aug 2026 17:23:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0a1240sm7763161fa.3.2026.08.17.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:23:12 -0700 (PDT)
Date: Tue, 18 Aug 2026 03:23:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <haajolsmvil7adq4pfanmdrkvgqygwioncpikawhbvvar5kpnp@rese34d5wt5j>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
 <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
 <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
 <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
X-Proofpoint-GUID: -sr26E2zlKi5o4b3BAf14bRVvywV4c7N
X-Proofpoint-ORIG-GUID: -sr26E2zlKi5o4b3BAf14bRVvywV4c7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwMSBTYWx0ZWRfXzi/1qk0FbgL3
 bgpiYNn3gF76Ihugbj0JyCMVsaiqMV2I1V4pQLvH66luif16ZQsmWtKYBQF1z8FG6Lxo6EKeU+L
 G48hxH/amFeKIyZ1PxXwXi6UROYwtwIrzJYmLsyLb61ZkUdXioa70GvSjBcUd+XocLSoN45oTvK
 Bhr2fZpAT6S99uNmjDv/nDWMXWpxQ3dANxY2udH6vgWv02yvSvNeEqu+d5pvsg/IAOL8sDxiD6L
 10kBLvG2chrhnF0WOvai0dUe+IuSXqIRbmrtgESIRQ9gYhae90QZQpGFbiV7KHAdAv8PjJglMz7
 +Y1RP7sjHwWQ7dsUA+YL/sjJxgB5PjRjBpt9YP9x2pjusaLjymQUsco2B4/TX6G3apXCkR4f7GA
 Fb2S5/jYV+5mQN3kq1qankw8Jgdf88FrHK3ZI6d6gZauVHYAl5IORSbQn16C75ngkQ97rHS0Hlc
 itTmnlQ4TTJhSwN965g==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a83a5f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=jrXjsD0Mjyjvaf6d-2YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwMSBTYWx0ZWRfXx6VtaKQ7ZuWP
 EHI+5ivvrX7F9Ulyjnx9/2Ijt+2bxBgVkv+3Tb/o9jgp+JxF6zyM0YY4CDG8kxKzo72nMyPtGk1
 K2FUIJh2/jtELCxC9+e4BkSH90VN//s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_172318_491873_CB4BAF08 
X-CRM114-Status: GOOD (  39.68  )
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

On Tue, Aug 11, 2026 at 08:39:41PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/20/2026 8:10 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 20, 2026 at 07:41:35PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
> > > > On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
> > > > > 
> > > > > 
> > > > > On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > > > > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > > > > > path before the SMMU register space is accessible. Add the optional
> > > > > > > > 
> > > > > > > > Why is it limited only to those SoCs? Is it also applicable to other
> > > > > > > > Qualcomm SoCs?
> > > > > > > > 
> > > > > > > 
> > > > > > > I was hoping to keep this series focused on the core infrastructure
> > > > > > > changes: the bindings, base ICC bandwidth-voting support, and DT
> > > > > > > interconnect properties for the platforms currently supported on
> > > > > > > Qualcomm Linux and have been validated so far.
> > > > > > > 
> > > > > > > The additional targets have not been tested yet, so I'd prefer
> > > > > > > to add their support in a separate follow-up series once validation
> > > > > > > is complete, rather than growing this series further. WDYT?
> > > > > > 
> > > > > > Then it should be a part of the commit message. All SoCs since SDM12345
> > > > > > need to vote on the interconnect (and then, in the cover letter mention
> > > > > > that you convert only a few of the SoCs). We possibly can help with
> > > > > > testing on other platforms.
> > > > > > 
> > > > > 
> > > > > Ack, sounds reasonable.
> > > > > I'll add the first platform onwards which interconnect voting is required in
> > > > > commit description.
> > > > 
> > > > But to what degree is this related to a specific set of platforms? If we
> > > > look ahead, aren't we expecting the list to grow to include all
> > > > platforms in the end - resulting in a lot of noise and churn.
> > > > 
> > > 
> > > We have seen this issue consistently on SM8750 and later platforms, along
> > > with at least one customer-reported instance on SM8550. As a result,
> > > downstream Android implementations already vote for the required
> > > interconnect bandwidth explicitly on these platforms.
> > > 
> > > On Qualcomm Linux targets, we have observed similar issues on Kodiak, with a
> > > few occurrences on Talos as well.
> > > 
> > > My understanding is that the interconnects property remains optional, but in
> > > practice it is needed for Adreno SMMU operation on these platforms.
> > 
> > So, it goes back to Kodiak and Talos. What about SM8150? SDM845? Earlier
> > platforms? Is it limited to MMU-500? A6xx+?
> > 
> 
> Thanks for waiting this long for response,
> I rechecked all the legacy platforms which are present in upstream.

Thanks for your effort and for the very detailed explanations below.

> 
> As per the design it will be applicable to all targets with MMU-500,
> (Even though issue hasn't been reported for all the targets on MMU-500,
> e.g sm8650/sm8250 but the nodes will still be needed).
> It's independent of adreno version i.e A6xx+/A5xx+.

Ack, this sounds reasonable and allows you to easility select if the fix
is to be applied or not by using the generic compat strings.

> 
>   Adreno SMMU — upstream Qualcomm targets
> 
>   SMMU-v2 (QSMMU)
>   Platform   Compatible
>   ---------  ------------------------------------
>   MSM8996    qcom,msm8996-smmu-v2, qcom,adreno-smmu
>   SDM670     qcom,sdm670-smmu-v2, qcom,adreno-smmu
>   SDM845     qcom,sdm845-smmu-v2, qcom,adreno-smmu
>   SC7180     qcom,sc7180-smmu-v2, qcom,adreno-smmu
>   SM6350     qcom,sm6350-smmu-v2, qcom,adreno-smmu
>   SM7150     qcom,sm7150-smmu-v2, qcom,adreno-smmu
>   SM6375     qcom,sm6375-smmu-v2  (apps only, no adreno-smmu node)

	adreno_smmu: iommu@5940000 {
		compatible = "qcom,sm6375-smmu-v2", "qcom,smmu-v2";


>   MSM8998    qcom,msm8998-smmu-v2 (apps only, no adreno-smmu node)

	adreno_smmu: iommu@5040000 {
		compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";


>   SDM630     qcom,sdm630-smmu-v2  (adreno binding to be fixed)

What exactly needs to be fixed?

	kgsl_smmu: iommu@5040000 {
		compatible = "qcom,sdm630-smmu-v2", "qcom,adreno-smmu",
			     "qcom,smmu-v2";


> 
>   SMMU-500 (MMU-500) — with qcom,adreno-smmu
>   Platform   Compatible
>   ---------  ------------------------------------
>   SM6115     qcom,sm6115-smmu-500, qcom,adreno-smmu
>   QCM2290    qcom,qcm2290-smmu-500, qcom,adreno-smmu
>   SM8150     qcom,sm8150-smmu-500, qcom,adreno-smmu
>   SM8250     qcom,sm8250-smmu-500, qcom,adreno-smmu
>   SC8180x    qcom,sc8180x-smmu-500, qcom,adreno-smmu
>   SM8350     qcom,sm8350-smmu-500, qcom,adreno-smmu
>   SC7280     qcom,sc7280-smmu-500, qcom,adreno-smmu  ← our patch series
>   SM8450     qcom,sm8450-smmu-500, qcom,adreno-smmu
>   SC8280xp   qcom,sc8280xp-smmu-500, qcom,adreno-smmu
>   QCS615     qcom,qcs615-smmu-500, qcom,adreno-smmu  ← our patch series
>   SM8550     qcom,sm8550-smmu-500, qcom,adreno-smmu
>   SA8775P    qcom,sa8775p-smmu-500, qcom,adreno-smmu  ← our patch series
>   SM8650     qcom,sm8650-smmu-500, qcom,adreno-smmu
>   QCS8300    qcom,qcs8300-smmu-500, qcom,adreno-smmu  ← our patch series
>   SAR2130P   qcom,sar2130p-smmu-500, qcom,adreno-smmu
>   X1E80100   qcom,x1e80100-smmu-500, qcom,adreno-smmu
>   Glymur     qcom,glymur-smmu-500, qcom,adreno-smmu
>   Milos      qcom,milos-smmu-500, qcom,adreno-smmu
> 
>   SMMU-500 — without qcom,adreno-smmu (apps SMMU only)
>   SDM670     qcom,sdm670-smmu-500  (apps)
>   SDM845     qcom,sdm845-smmu-500  (apps)
>   SC7180     qcom,sc7180-smmu-500  (apps)
>   SM6350     qcom,sm6350-smmu-500  (apps)

All these platforms use a separate v2 QSMMU for Adreno

>   SM8450     qcom,sm8450-smmu-500  (apps)

	adreno_smmu: iommu@3da0000 {
		compatible = "qcom,sm8450-smmu-500", "qcom,adreno-smmu",
			     "qcom,smmu-500", "arm,mmu-500";


>   SC8280xp   qcom,sc8280xp-smmu-500 (apps)

	gpu_smmu: iommu@3da0000 {
		compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
			     "qcom,smmu-500", "arm,mmu-500";

>   SM8750     qcom,sm8750-smmu-500  (adreno-smmu not available yet)

Yes, patches pending, I think.

-- 
With best wishes
Dmitry

