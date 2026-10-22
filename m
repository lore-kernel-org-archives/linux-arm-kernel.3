Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A924606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZbfUn4ST;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNq+hvA9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j/+xURqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=; b=ZbfUn4STJabxMu
	ry306ub8S0JzPKKYKyBkHBMu1WhMEadnlheMOj/U6S6MzQMabbBWNgkhDqITmLS0urhb0xwlWH6Vv
	jbldHHOK3H/C65dfY0WTCL8OgchK/7BABA0fDIrh0mu0rBH3/ENB3RkXdvM1xjpUw8JhtGcDF83Hn
	bZF1BPpNahD+B+EozYOk8NY/FcBhldImrXhQgpANe8B1HTom8Y/y1xTCqFSYJA9D5xWHLXSJ/MTQq
	HM0IGMEEc++uydSEAyxaLHgKozaaM136AYaLAyeOx71+3NV5aIdOe9RkPBSvf8/B4lkWQ03gZghJB
	z60oExmK2x/C6C/fTpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0cX-0000000F1Sy-3gl7;
	Thu, 22 Oct 2026 21:46:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0cV-0000000F1Sb-2gUc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:46:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHtVHQ387720
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 21:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=; b=UNq+hvA9A8DEwJLN
	NSYfFSTtglUNNRNcKnXpBoF+eJxXXmuGdMTgqw7kmS6wZSsb8jP0zZbtAYPZSzvI
	sKxCKw85TSNNzD8r8KAvtkuj309mg2YOI9eQdAS7L1XUYlYegnK3AIzwdnpPabzR
	ts1NDX3Mhqs5NgWyklR+me2lpJcGfo2BgTM6lffe6lljiqxNlxwjjqWlaMcYRcZn
	7/v6+pT603Hh7qLgcO3a3t8hIvCiz5xj+hQQuoDccw+7GKskfaEsyKy2wsD1D5s8
	e5B3IBFArInFKq54Cfemsc0cdvi8cf0svwEMsRslmd1Xlg78ZZ+q/UsIiFXWZdty
	4wjHaQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq4qcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 21:46:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so427468eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 14:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792705601; x=1793310401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=j/+xURqw5rBa7qoPln03YWFYVHV+8LvCulevr9vNaP8UWhwlLtc08kTHrfUFRtYmcb
         GG3qQWCPHMX2QyZGcltoyzVfKsvr1fs2Nk+QrOVdM5A6o228cFOuNXK0vsjXYh7658c3
         buuRRELoxG8v0kHVY1Php1C/+YU8oLwZHBePe31Yycgtgrx32ZFPHPAE+CWKoZdEG4GM
         CjToCs5pcJWqcA3onA+GW/QEeqpE4YSlGRsMyTnQJVZR1azgJZlZF+98t01QaErOe+SN
         zjuHMKCBthD+N671MSE79mhEXFT9q+oM2Q8JWznQE6IsJJbdIQPaySzjgTCwIN0h73Tj
         wfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705601; x=1793310401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=kdCgUmCHri5YLBFbPPetiWHBsM/a9bhYM95FCPfTW8exDG1N2ulKHZwrcTmkDFN3su
         +018yol9d12DghtgqCEt+ztcewcMEbxxeOHFFLCRJ36T6/LhwwPRoBQSuilMtXuoCHu2
         S2vwfEEVnCzPEMwqcsXNjSL8wsy4xhGeYQz/mmoHoRg4sAH3CXqJfw6pHnEPgkI69BRC
         gDBEAvcK733bXbSsiqToHYJcaW+zGCT/kwCTGAsu4LdRb4VLGw/mQCP8b9Ih2hvZxGM2
         w2vbd7BB1D+QCCnsEi18y3y8XCocvxFym/cfI4Mk4JZPGtfN6fRUsbZZDTCxoAgYDwhe
         c/fg==
X-Forwarded-Encrypted: i=1; AKwUvByafS5On+7904PmNUxHqvaXmHoL7ida5l6CAKKDDCqS3OxlQe0OkNK2ebfe015ExLk18pmmZqQ1Jy8gzwegx7Wx@lists.infradead.org
X-Gm-Message-State: AFq9FYKc8ui7inZZuD+WLa2plp+8qH6cuk/aMcxx2qO/uDxGPpWiGwnx
	KFcvLkXnzbNyiR5TONA3MhHsogyDbEjP5k5xuW9v46s4QVx2mqeJwqZctpWdinSq4h772rdGFvd
	SpykGKj47Yf0gK4IfxJt6erTgrSxPaeDpTKsqxbvrBqYNhkeiCim8fZ6/7Oxh3rjZdd1CXoCo+V
	lfIw==
X-Gm-Gg: AYBFou2RJoBPZUztiwN8ZdBgZrw0U8oPHidoRCSZMcl7v61h08+ez0UVZ2jZHx4ajoX
	9OLT/AaLeVrOGxtn4IDMr3dyMLCblO4+Au/8sx0IXZnzNHT7bec6VPlMF/HPPLaO9SaF4WZPZQa
	IW2s/jbP5wjwtIC4ukG/Tiwutme7sWSA8z1aB4pGIQYamdQwQQelDxc11tR8fesS7Kf7H5wupwD
	tnDbgxXRr9+8o3PF9MILAG/AskfFFwHeVHv8n5VADCEBNRk+qSxvTERw4yZfZpSOB2xa/EcS0W/
	qThyP+NwM9ztRFEY5ds6uSfbFMiEkkeAt466e4XIOpbXoQpuQMWCxvzrbvMDZVa9TIauketkhdK
	Gbnzp+51eUpQFy8ZuLCUh8IVg
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494697c88.41.1792705600377;
        Thu, 22 Oct 2026 14:46:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494632c88.41.1792705599029;
        Thu, 22 Oct 2026 14:46:39 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e9e9c4c7sm954775c88.4.2026.10.22.14.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:46:37 -0700 (PDT)
Message-ID: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 03:16:27 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gbO4Ii3u_twliVQICNc1cvc4FrjC4dwE
X-Proofpoint-ORIG-GUID: gbO4Ii3u_twliVQICNc1cvc4FrjC4dwE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfX6JmYyCB7iIVD
 PsNzVOBh1nIDErAOsd3Fup8AjCibELHiH97h3ZhHPvWHyDGQBIbz83xrsifdJyaJqwpBz7JRLDW
 CpBZ4Z3RxSoROQ9H1EhPdNujb36Xvek=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada8441 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=InArmlTPJEDsLdIP4zgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfX7lODMTQeW/W4
 V+l/fNtcZKZ7WG07UiEh33AXrDCKFW1cu0RoCNy9nLx2hHL+Ny2DOrEkOVhNwM/vXVdSfc0oPyG
 RvDRsKm+msMnUV6nCcWVphO8HaIFEFidzjPQbSrDgLhZUUj1Jiil18iukrLwUTkhAYQS6ej9H7d
 Vf6O6RI3ZR+oh8d5PnBPFhndHWGcLzhCkwqLy2XWV+MSgqOQ+usWrQARKWmy+Oe7XeBTIWqgODM
 QW5ropVwlYatxXtZ2mQsxDtyct6YdXszUyy11q9xX1V/mBs2KD5i5ntHXywMbAd6ehaKMwuS74F
 7h3ZKiVd4wnt4IZvmvCQmn9I3AaCamPv0ksXaFEnQKyk0nWfVXN3H76dpYdY3dk6GfysFLwyWPD
 Eo3TM+pXcgDvPygU6iBXWKYFE5TtYcSOvJPstJC8Tsifayssq0cRlUI28tVyRiQmU4knC6f4i/y
 I4xJfc6zzI9MLYOI1FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_144643_843842_5B703F6A 
X-CRM114-Status: GOOD (  24.46  )
X-Spam-Score: 0.5 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>> but which should not be a part of the defaut set. With it in place you
>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>> etc.
>>>>>
>>>>> I'd recommend following the same approach.
>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>> similar case:
>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>> Let me check internally.
>> After a brief discussion: it can be either, depending on what suites
>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>> bus or not).
>>
> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> 

+ Bjorn/Konrad

Not sure how strict is the requirement for compatibility with older kernel version. An
option in your case could be just do an override in the board dts file of the
Steam Frame.

-Akhil.

> Not sure how to address this.
> 
> Best regards,


