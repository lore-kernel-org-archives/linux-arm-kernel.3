Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cVaJjgrR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpZsGSX6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxnjunXc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=; b=cVaJjgrRLzVeUK
	J+yAIeZNR/KfwoQtA9JMEW4PuD4fwmru9gMopmRESB9HjwQxwabg4bSqlFZK0l/xfX1mdUI0MQ0Z7
	UbxzDn05GZ3isq82MdAvLCkgMwPNhnVuQ483fiI/+Bs1uf3ukg5FD/FHYMy+TkMnRKP7XN5hLDLjX
	Ieza4etLkP/cns65BA4/aNat1lvNart8hIKQ87n3a+mmt5V0+GlPtdRkUiToMTXXubpvJc6h/hf3H
	H5hKefwwPcVK9kt8pEnAK85UBKUM/pYKWLbbj9BFRntE1m2jIRvl/8ELe/+CePbh7v8TgqSMTXpgJ
	/gfOW/Ddq/T5/0dFikqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLI5I-00000002Gwt-1PkG;
	Mon, 26 Oct 2026 10:37:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLI5G-00000002GwY-2xbG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:37:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAPCVN1708639
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 10:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=; b=TpZsGSX6x4fCHbKw
	U8ef/568RxKDz0hovaxFvn9IInCc6pKY8/Sn3J7Cbt6yKqZr5KGpuZkWs9oe6j7k
	brO5+mOteKXKVH5HZzNaziob0mdnSna+I/c9Up4HcMbd6mprqlDkbSmUutdRWsP+
	eoa+c5k8kh9tObqrRBGOrjRsw4WJGbLPV4MsPhrjHrhfaDss//ip8gDbQn7ZD72+
	l+QQlPfcVAdnMvjQgAfLhDg7A6URh6DAhD0A+pYAdoljS0JxoEy4D2Wu7xtHHsL+
	cRCQRxsvNGOHaC8b82Ix7/gO/UBHgrG7XrIzmwzmfJPdUoxP39bSBmvh/XnrtdJ4
	32Agig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda1sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 10:37:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso8545026d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793011060; x=1793615860; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=UxnjunXcBN63zmi+htyT2TQEAWilLbQJ1bF0xo8LtztWPwnevDHYb7MSe4HkShwqTt
         KF9seG39Hf3YuMSs7uVRuJHIdp2zc31HJevsNgsJXmUkJkzh6Mwn5RmMhLVk3/Gphkyx
         hz+cAjHsi0jdneF1M1gMFOaN/NzYn52Zy1c80PRjkz9hrtD2pmnkZmSoLPYPqoQddaGg
         0Z9OT/hb/g4//Vfg12JXnPkGkzuUvhCZilF64iCeUv5FUtHUlNiXUKQbjtDOJeTSAZvc
         OljJ8kCXSOHY4sThPj+Gmw4rb5mnaaNAfuyDWNUwO+RBw83BNNNCdMJzbKk4ZN3wTkVm
         24hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011060; x=1793615860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqjg8xNmhBbt2RfYvkv54a120ybeK1H1UlJE53Iy9OE=;
        b=NmPK7JXBtaZCJ6LP/Osck1q1hM4C5i8eBxDiZfYnUQmXTIoPwQAlmZ5LgV90api34D
         g4C2jSopy/u3fvzTljgueeHqD+uUYoBdnHchNvPYNuubT6ztM5rOqsSafk2/L/2HVf+y
         RvUIQz1g/vFcIhOA7IZ9cdWlOylqhZjj6TWRZbckKC/iy+iv6EqnGB0T79UGb1Fsto0i
         hKmTvtRTypAfYlGoe3Q+9tvw3dd2Nw2oNqHaYKznjIXb8hnO+BWho4fSNqf+gPW9azoQ
         cDHPtx1+5DluUt+9iTGyNgmu7j8cCaSn1DIWcwGZiiXXKq9cnmHbLbESXWcVLS7fhomS
         DLMA==
X-Forwarded-Encrypted: i=1; AKwUvBwxshlFGDoKcwSW0M1XDVaFBC0QAUuoJhtIpZyfbTRTjhvRskfW78jHuJm88y3OUkD5UW2gd/El5gn/6FLtf9r2@lists.infradead.org
X-Gm-Message-State: AFq9FYLlHkxduW3efzhR7hwzcfMk6bO8HpnytE/TjFW6IW9qVGglI9Kw
	ItWrwE8EVA3YVIPNuj2qb++ewjo9rECUVNoU2NbkWrdF2CPh3AlomfZTq5dp6GS+0QuqLxJiJN1
	dKGDYaUMD0JUxiQ+Y4rEyxfwGVA9PLujXu/+0MWqvY7gxQ/eKpndptyS9fvFjHaQHcZEZh6pDz2
	T20w==
X-Gm-Gg: AYBFou3IjuWxeVfsx4XtYJNnRI7uCsxTYtyLXbM5EUrE6ssE4es+or6egSGaTwC/dwg
	Epg2JQRyOp9f+zCkNENvGsvFjCE/uFKpY5HKM/e+XGdKdd9IB6nj+EDpiUch/AvaJBD2uXHP9F5
	RHCbih1hpYNNDeaqK6SkDlbcf4/dNZzjgfnfg4uFyMJHnp2BlqEvUvcowsDq/xzmHusGs2XO0jr
	pjXyjqoQn4o5m5DP47Yjg+zO3ZrHfEB5dv5Bc29vSuPrpTQiIt0qWne5f1oDKeP8Dls+TUYDLaX
	yty4CHxVz7WCapvJZALT+Xn76Szm22YWTckxoOBVV7o1N+eg94mkYCrvQKsWWua7zwOjHtCARNj
	gX3LpRQWAIvoSccsFCPY4wA==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130936185a.6.1793011060065;
        Mon, 26 Oct 2026 03:37:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1130929785a.6.1793011059540;
        Mon, 26 Oct 2026 03:37:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459924bdsm3389733a12.37.2026.10.26.03.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:37:38 -0700 (PDT)
Message-ID: <7b95f254-ccb0-4ce3-9b35-c605cacdf74f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:37:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
 <o2zmplbtmoueumw3iqejfsdmucp5f66woa5hmw3vodbe66reab@syn2ashugzyg>
 <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7d35f41a-c72b-4743-b8a4-0ba715be6756@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8nx5Z5BQIohTFPK-Ew_Dm5UaZ9WuhQNL
X-Proofpoint-GUID: 8nx5Z5BQIohTFPK-Ew_Dm5UaZ9WuhQNL
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf2d75 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=vYu95guM48VmnKZvmccA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfXxpVgL8m09HFY
 BNUEXe+2af8jbGacCbd2oizhunMYJ9YiRMpS68HAAbQ3iQx9uUW2/TpAnijoab/47MCH12uif8A
 vFyXQZUvkejPXuligYhjO/Mu7S+snsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MiBTYWx0ZWRfX4AeNhecpYI8g
 VXFkAkkfj1FycTpdd4A8jNaprfDyJYc7RHEGKimqMrfnyfAfOFYTqbnZBFcNiq2suIL0emyXhiv
 mSSxuQLEippjsr6m6TbIBFUuGtIrewNyrJRmTwTVSrQ62YEgaphFmCNa2+xzx0aN4Y44+YdVZpe
 N+GPFQqO5j8yAQUSLv+H/3GIpMsxPtophiXNgxH05ksEZ7CJL6E/ARQUoEm0nK19z0gCxJ0XIQ5
 mwOstdQ4TMzsG5E3r6/5zDVV99q3V90RV+f0tii/ISqbPKxmh1U0Q54WXIjBBaCP4RQer7YudNX
 nkuIMazoTLh9xosv9ggw5IaxYYfTnFrwj1SVfEKi4euC0ITvYRsqSwXQytQcKtq195aXSVFpIMz
 THDofZ0Ay+6jg9KAMDiyWnztZQeXJTVkzEZWn6wwoA8YTM9kEziCovlhRJc6Af/4k+2SJQtEQYF
 ft2H7o7AjhoZDaEAMKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_033742_756034_B37D27C0 
X-CRM114-Status: GOOD (  18.06  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/24/26 4:57 PM, Anna Maniscalco wrote:
> On 10/24/26 1:36 AM, Dmitry Baryshkov wrote:
>> On Fri, Oct 23, 2026 at 03:16:27AM +0530, Akhil P Oommen wrote:

[...]

>>>> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
>> The rule is the opposite: new kernels must continue to work with the old
>> DTs. If the new DT breaks with the older kernel, just specify it in the
>> cover letter so that Bjorn doesn't merge DT changes before the driver
>> changes find the way into his tree.
> Ah ok thanks for clarifying that.
>>
>>> + Bjorn/Konrad
>>>
>>> Not sure how strict is the requirement for compatibility with older kernel version. An
>>> option in your case could be just do an override in the board dts file of the
>>> Steam Frame.
>> Anyway, would it be a problem? Does GPU normally use SID 1? Or is it
>> only used by the LPAC?
> It is a problem because, even if nothing touches the LPAC ring, it's firmware
> will still initialize and that will cause page faults if sid1 isn't setup.

We're slowly coming to terms with the fact that all of our multimedia
iommu setup was terribly wrong all the time. Venus/Iris recently had
a flurry of breaking changes. We have to follow suit.

Konrad

