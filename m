Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93225C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGrXNa6dHXvr4kroK+MTw5NQiqX7zWwS0Ak/+A0yv10=; b=XXfj2MUVpdml1uKSs9qs5VAwdf
	O3f/rQZoAIYxjSZy2XTXOvLTR2t40M6S8lnhNsyncRBORVyLHT9WD1zSwBbF+KyjqZhYsC8BKXHBJ
	UHf/iSAi7h2wgNksiMdF+4i07T39BzjVLa0MQTQ/PRxT4S9j2od2O4zGtgazlHn1SPPqlF2FvX06O
	vKR6wpE9ZxovJWspW2bM0HffZN+WVwpdyFbcIFdgwf+lxJkflIqhGauu6sMxuEtf0C4/Aw7hn3MuM
	dIw9KIoZdPFuMelU44NFDgayTsVrLVcXxK5BSprCKBJTDckaCwv7ILrRulzX+2d4/WwD0kJAOZ3lY
	3Jou4R0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Iwe-00000001waQ-0mNi;
	Mon, 14 Apr 2025 12:29:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ihg-00000001uWd-04B2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:14:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qg2016550
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGrXNa6dHXvr4kroK+MTw5NQ
	iqX7zWwS0Ak/+A0yv10=; b=ZNnmEjjePUV+BrjhfwfZTyG1deE26VgjPzjuXCo2
	YWBhbuGcHoo2EGQ7wYQa84DJiFY6uKeFTtqeAq2pA4PidWV0R6BqXsNcSSbf8MBe
	YF0B3Y7ghr7H95bhvH9LgPrqCSdABJrEiOPd5UpukkduE75MokYhKwkrc6nQwGON
	1WPuc2Z2hQA1rfj82vrIGp/zNwzMH2ygBfWAFOtNX7k6ch8kF/5ijpbVTnYBZTwi
	njM6B/f7Ox90/VGAKNDEnn+Z7cORaoJQxSkMSPUzkunN++eE+slgLMUCYwFYX4RW
	gTjDEUB0NwlU3JemWDeeJiW8oyF+fZxUNvumTEkU/zMIuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69mhuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 12:14:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so678037085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 05:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632858; x=1745237658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGrXNa6dHXvr4kroK+MTw5NQiqX7zWwS0Ak/+A0yv10=;
        b=uk6CkHV9SYNFRfGeu7l89We+OVpTxwHkvUcET6HSZcq39BkK5sd260yvNicu1KdWHy
         FRuD1xqRZjntZn7gVIh8JKM4T7xsE3lP+ev9rCjeufn13KgGtlAkQclnt7NsxjO3FanB
         vZ8tT7n/y5+VZjALj3yjBNao35kAzKJ4hSynSNF+YWiRm6rD+GOksbbL8mzs3/ScYVsO
         Jtaag75BFeS0MDNUF9LaEI5yd1ehhLUPbqmw0JcfucSxAgMb5ahnzwhaOJRRq/EWaMJR
         u8SQg50mRf24WZoVsq8t587y2D/tG9/drxRQgs4VJLdk1Qg2e//77CHvuEGy3/J3lD8u
         c2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6fCtpY+RTvleSjYnuBylqKJ3BNP9yd/Xj9OoBZZsDkG9MeXAeJmAv6gnvuhRjHFMeeiM4mHxqEt1R5oaaQ++k@lists.infradead.org
X-Gm-Message-State: AOJu0YxbVN4KRAKu/RwA4O3+YaZu8SpSauMmqGmXTdpCj6MU9wR+nQIH
	z07kEN0b5mqi00r1xan1BIc6/x+O0bjoeJ9hAKwR5GsSw1KqbsfVcbP79op6oZmCT+yIlGjxP0D
	nER2ixcN3euZoYxPDfayCbEctkL+NfmPQUIDbrzjR8zQEaG3iauVRebGrlWRn69zpkhRMEhSKPQ
	==
X-Gm-Gg: ASbGncsRfeTIytdsbGI4NTVehP9ejc/rPVrR6V/zMJya14iI6bK7wKj5nQpPho1bckv
	jA3rdJiRZ5iVCUmYay4TrRjcj5ZCFpvtMHFFpDq8K6DMOrorS3TiMu3SlWPWpr2vU+j0ReykFzg
	D2Q3K9E1NiiasvSHbDpllQsMWJPUnS/nRe75FxIZ00gJjv6CbCMb2++rlA6dNPUhvNtSk47tBvV
	yD/Xg+akAQTKaoJEHSxAdtszLKFxorwo+mIqZ4VpAn1i+TK2/5LiX7a+8j15Z/Ng5wauMzDIL8S
	Mlw9fAaCU1Rn84mLk7dDa4k5BsYFv4CqLs1pP9VZ2ad2uCIfrcvQ4y9TenKDNLPOfP7vvBEKFus
	=
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7af0e0f5emr1701934885a.29.1744632857849;
        Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxzp5iYZiEnUZWE3gvlgW+sXTiIEbnk35cNdFG+zRQtIEUe8+f5w9ReiZy8l+u4jZmVg+wwA==
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7af0e0f5emr1701928685a.29.1744632857299;
        Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2386b6sm1128164e87.72.2025.04.14.05.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:14:16 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:14:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
Message-ID: <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
 <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
X-Proofpoint-GUID: vf7iiAyMSjaOr9wdndxkUOKPB0izzsSG
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fcfc1a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=nRcdhEhJI-3p1s1dT_wA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vf7iiAyMSjaOr9wdndxkUOKPB0izzsSG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=682 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_051420_183408_C0F1C2E0 
X-CRM114-Status: GOOD (  20.63  )
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

On Mon, Apr 14, 2025 at 01:39:56PM +0200, Konrad Dybcio wrote:
> On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
> >> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> >>> controller. Link DP to the QMP Combo PHY.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			mdss_mdp: display-controller@ae01000 {
> >>> +				compatible = "qcom,sar2130p-dpu";
> >>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> >>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
> >>
> >> size = 0x3000
> > 
> > Existing platforms (including SM8650) use 0x2008 here. Would you like to
> > change all the platforms and why?
> 
> The last register is base+0x2004 but the region is 0x3000-sized on 2130

As I wrote, this still applies to other existing platforms. I think up
to now we were using a mixture of 'last actual register' and 'documented
space size' with VBIF using the former one. Should we switch all
platforms to use the latter one for this region? In such a case I'll
update this one and all other platforms. Otherwise I'd prefer uniformity
and still use 0x2008 here like other platforms do.

-- 
With best wishes
Dmitry

