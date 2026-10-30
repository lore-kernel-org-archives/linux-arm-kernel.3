Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61F860A2624
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uOGVSUsW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLtXrypl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTjtHwv1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=; b=uOGVSUsW3NWHz5
	DZH6neLilsfCWY8a6Jvi3ysWoU9g71ZT6YfgRLzRXdT9/GNWOc1/+y+h0+F7Fkdu8PNGweTvaTM2B
	4R1BGZY6sEgl6bC5HZWQWBvwtn9KC/xs83YR6CeOqKxBtciCku0PdMaE4gfNyOAK+Y+pZIUgVlPLB
	Ae5Na5LB4WUhwxQDY9DOsXxK/IIJ05ZAEq5KgU8S3bdSaXUtMWrDgX6jWX0aUQ8v4I0Ttj8r6VwP9
	X6a6ur7GDutHe03SKuYRG1TqebxDs2aBFakrC17+gLczwiQACpj3dig7EE/mxpHBJ908LZ1jPK544
	TTTdHbdhCec9kPIu47IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi5S-0000000B8Xp-10zo;
	Fri, 30 Oct 2026 08:35:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMi5P-0000000B8XS-2gku
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:35:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FS9g1663361
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=; b=mLtXryplGnXfHaLA
	tmlbdaxGFX25tKXAXCGF4UqGa8w5dlXHMM7JB4ie0etfTPDjxg6yk7/dfD/x1Dzm
	BKhqDdRokrMVx04iYqWr2pBijZXMvPLzB/e7m3zGdfrQehS7k29aZX/XEMCZ4QqX
	kE5SgeaXYu92h61JFBZkWJPOmegtnHNGTSWxJwP7R54oP/ZRP+j9xrFfBU70u5sX
	1MBbWKdbm8qgdJ+qI0hLI3GgpjUQWQTHg6sGgx5au5R2PVEVbeKZa+BuAYPkL1qb
	VVZN9+9vrNMWbiCDuzMMPULbbELRgyKVK6dfECks65MPcr25TokrC9f5V3WQ9At8
	gDAy1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p22rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:35:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso9127485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349341; x=1793954141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
        b=OTjtHwv16UkHerslqPuZSIZfsIousRTaBPh03Y4iEc3b87A2EoRJtutVa6RPie9Ilt
         QvTqfJlKaCg46Pf+YPk5Qtqma5jiO3C8Egj9+6wkYCVc1rxHy5IMcSuxwMAXLSgJ25pK
         +nSLaReBrIUslCooVGjQxNTqGKwtFlxL5XxiUJDvYGD1U8Zp8t6sJ1g+QXvGFNy4sNjM
         gchFRxcw+43YV3m7vHFeD6NjXhpZ+kpMO3gqoKpySGpr+DphEQBj8dnGf8iSSzsip5md
         GzzWjz/ig0YtrEYZ7eMZirZmFwHCohu3oCAisUEbPhTOJJcsi7S0vXWqq/c5odnaI3mD
         upvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349341; x=1793954141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJ0hT9AzGdYr5QX4etV6d2dPIaVRRzNFWlNbAyzQgZE=;
        b=X3HzUAhp4Uk4JwX/e0I46YCobd3COOO/VhFxpIfpe8oEm/8YGEohAIaRRN/J5erLg6
         NaVoN1OfNi5WaatZmzvpLJ5W+v9hf+uYyV6tR16r6XQqiQ4j2PG0gWorvoNeEUMpvLOT
         L0rIbeh4pxsW0PLYSYxgG7jfUx8MpSd5o0ZYcaaCYi8BqtkaXzKLfYitpyFzjdq7RcoX
         N7TYBUpwsXSXqM8yFRBJ/4WZ0j1tm+kauvUrGm9isuFqB53YU9AefZwI/l5DOp9LaZSy
         wBPPy2dJG2YV6GMQC285BpbfYmc03GDkFmvwKBUZO9hgjWmsOpFw/CgPFZittVMKEWX4
         zNpg==
X-Forwarded-Encrypted: i=1; AKwUvBwK77ihvLdXqQltQTEEvovCYghbIHY1NjQ0UQc7khLxeArBF+Wb/y2FHEuUjBIZ2x/fYD3ACw4VCe0LwW0+IgQh@lists.infradead.org
X-Gm-Message-State: AFq9FYJjWYiz/twDKleI0igrh0X7iJ542HSGX7+dHX7366t8PIeH8+dU
	FxVOrPK/YHAac+eHrD9D0Ctq12nWFjxsh7jzB9sBmNqqnsuCanSqjiJT6ZIjfIJg6HdKq3Om2JW
	dHuwN/Jj5Y0VhjzhqTbg4PqeA0AZSf5B2EhzXlkyu/z3/VL/t6m1LgVAWSFWFSnfSCb666/ifUo
	K0yQ==
X-Gm-Gg: AYBFou2p0bi0MdsMY1JdrvxSpoDa0aT+bGWGuQPh89VjIi9RoXWXfXHKZ6PSvENxciT
	qM3s/DO5Nl232NNA8jhQWyLVTt8RWmMOnS/UjwcEdU4daQXjizDGYvonow2L9DAjyK23U5IiuR0
	3EqRGjOeKW1ursoRBwPOTZ6SEmtDt/u1UBIqFPyg03sudLKz32IbDClqSPtbsMxbwS6RLbujIty
	754IIO6rY72YQzgDYlnwJ/ofzlM3MaHKJEq4PhyVKY3iBQjdR0gb123HlqfXaK6PttsoCPHT+Bg
	WfjzyscyZAmPGG8CkgDHFycuZrUx0I0zAR7IJqwOZDU1xIu1Hl85IWVjX3T5mZOqy/CciTGZPkR
	pHvjZJ4fS4eMnlle7z8tjMjdTyGz81ALCUpvhCpHe3tRXhp34FX7z/sHweL5DobsZ+F9+LK4=
X-Received: by 2002:a05:622b:4d:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-542b687ae13mr24294241cf.3.1793349340728;
        Fri, 30 Oct 2026 01:35:40 -0700 (PDT)
X-Received: by 2002:a05:622b:4d:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-542b687ae13mr24293851cf.3.1793349340133;
        Fri, 30 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm39225666b.53.2026.10.30.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:35:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
To: Rob Clark <robin.clark@oss.qualcomm.com>, iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXwRyJs0cacSHy
 eGlISMWr+Al6T7cjUQomfeJ1J59FVD6NrOHKDO6oR+cJgiGo9me94bNkh8kEN48eMvKzOjQuGSU
 8PKBdDbR0sdE4GRmxlbYlcWSyHIfHKnbUYPBxAJdOrzva/fTfP/U/0glueEd/tww6TT9OOu9cQc
 7rT6wJ4x5hcUAssUwgFODHOhvnOJEMHXnLeqUfrWZSYy2oY6veg1GOgZpQpP+KaPX596IJR1NEv
 2JN/PYGHp1uyHmyJYY+apy1XGWZGH2+jTj38mgGcgc3lnV2A4ZlACc6+eD2jRc1oI3W5DVsTNk5
 BSMpxH72XZeRH08zMgGcesBgr+1VraYv/7AEn/RkKro0B831UKq3fhTQydyItohpDs/f5QMBdWF
 1eGdeMsaRscN2AHa9PeHFe2j88GpC2CmVKCScATFStCbGDRC02uzBtTVOzweYzidDvzaykenCbl
 kJdjiuInJ5U7OavlApg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX/6kcBcK/35UZ
 bxiTc0+KPTYBRfHi2d1iSuzBDRFGya+TrW5aQ/ivlbmtXLzMGemEYdQ5roJyQkXF7BeY1CRbTir
 x9y4KCmAc6TbDnCsi/ivuum3W/sh0sw=
X-Proofpoint-ORIG-GUID: ZgmUmum870CBajnEtOwKMfM_v2t7hl4d
X-Proofpoint-GUID: ZgmUmum870CBajnEtOwKMfM_v2t7hl4d
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae456dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nPYanoZRiyYWTCGofB4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_013543_798497_D212B87E 
X-CRM114-Status: GOOD (  11.93  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 10:23 PM, Rob Clark wrote:
> Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
> select direct mapping") for arm-smmu-qcom, match GPU and display compat
> strings to pick identity domain time.
> 
> The drm/msm driver attaches it's own domain, which it manages directly,
> so we don't want an iommu managed domain interfering.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

fwiw I'm not sure we have any devices with this driver and mdp4
but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

