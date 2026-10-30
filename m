Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F6C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+oJVb6E;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jofX2PlH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DDD2zp5Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=; b=Q+oJVb6EdfNHQe
	7w73EOmO1hH2F/iTSF1cYNKYdCRzAW4gz/tAOa/JTFLLdqSZ08YkF30je8aMVUna0ibAvtXM0S7kc
	BIebHXjTOH0STKR3PH4mGnU2WM+tGMi+9uvVQpOaq9iPcXH3b6GtA/lxCzlpw9zWKyCXGxkV+wc7x
	rWIdo0ahc2Hdb49smQiCl4+X2ZvEdhbGDRV0/wCq4lTb6NgfI6xqAlJjbPKGiOxMI2SZkGUP3nIKH
	6Nqo0HBJFyK2Fwv1s5iN6Hlq3x7H2cz4JgA0iOHTTN0Pv25C0YCjTeiAriXqhCQ8jj9ksUOHKSOGU
	c3n88c6oJMlRYJU3m8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmM4-0000000Bjak-0kbc;
	Fri, 30 Oct 2026 13:09:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMmM1-0000000BjZs-1ePJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:09:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG6PO2072304
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 13:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=; b=jofX2PlH9sK44rY1
	hTJwH/V8S1h2Ehj/NWXUdY64MVX3m+B7He4PrRq6Yb9Iekg2dQxrn0HvtZI28zJ9
	RRcY15pL9JIX/ZRIW1lSCPl2zi8c+svbt1KdqyBn7OuE618BEsyNZA/awYfXJfHZ
	x394lXmUJwAi5oWW7Y3mnrQb4mhpf5ALmAZkfuOBe1PS6soxP30XEchqhEVQXb8S
	6wfxhs5I3ebouclMOJoynZoJ8Lm7FMseFxIg3Aa7qkHnSU7I8HOiGB0jkDZ1sMbu
	mKCDKfioiruMwPg2jwuK8B5KLaUXuIWmy2seuAdgtrA912gg7ClcJYCBdXlsoH4r
	r9G6wA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p36h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 13:09:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988ba2453abso18913241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365747; x=1793970547; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=DDD2zp5ZH3B3+pUU0wqmJdPIERdHx+1+JrTFymWgjN+DFGz69UDiUnNThkFkP//tIk
         SnQ3Tqf+sA9sQvTV5sPQtFTI78eyP5ClJIRaj6zjExEvSU8G9qYfADIN/wZG0ltlRUGA
         oKwVqiC2IsIOzGwjMSwMySdw8psw9Ns7bYANSf+YC6JMc/6fTZTw2KVT4xynXUz6Mc1b
         AYSmxGiLZLngaLvYULH++zLd730WZRYCIFHk7yjDPyto62rrfmd7jfOIpNC3kjIqK5b5
         /yh1p30L2uUhOEAhaEJQkAWQRCfauNZP5s6izAkRylHoDOkKMru/0CgU00ou9thPcPNn
         Ih9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365747; x=1793970547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=aMN8+fQ5Cpc1W1l/4QP3XEpTBB+HqUYJqz7VQJGFO4dFaxT/5IFjuPDDIOKnSaSTLf
         OTLb9EM8Mf2DVwLxdEQuYhKsyR7x4eevbF0jjrkp7xHR/AnhuEv/5+aY/3wpYlPmpaOO
         Eau0fGW9xtNI8Vk1zJCVlBUMolE5oZ4+NxnoUQvZiK0iusOzlZEGZKsYe47yb/K85kLs
         3mhTpmO0B8/NyW0fUUUafrUmyal3KeMJZjnBiEE1jw5FXlAYEeRnoIFGD4wUT/hQY/dK
         UASdjPogPat7lvtOMD/Ryr/o8qw7KOsWaVWrwkv6cAPF9Cf/ppmKAnSK15igu3m6zPwT
         bAGw==
X-Forwarded-Encrypted: i=1; AKwUvBw34lcxX+lgoZd0ngLCaC8HsL1aGsgDp81q2oq1xDeOETyjAY81l9b9X6t4XbOIfxuDWUv6ngVDQESEl6N7EHWP@lists.infradead.org
X-Gm-Message-State: AFq9FYKGq5GqKZLiSoXvE5TNeHfRg7fJiGtlDQeNHNSUo6b0jujZBa8R
	GfEwN7jizGC1E1l7Aputhb0gmQXvBEVR6cUK907EULKFXV3K209oroNKbaFy3/HgOq46s5Kqoqw
	z+a5gJqlSNN42SpqXl2JAZzO3RWeZH5s6uC/jugoTYHd4jt6QrA+JMTdVThRvH/gCno3P8RWPXO
	+atIqiTSXFcg==
X-Gm-Gg: AYBFou012c+V2x7BW+0LSQeScscEg8FZPuTTCZYPEDTdfiTcOM9ePgHPQU7NLLlNQcJ
	EoSu2hUsGf6Ghetoxdup0QGnMedm43SXoVI7MLdBJ3uU59hRiA3bVP/GuVgBSc2aFvoeVu4l/V6
	ks2+V72ldxm01Pk7Q9s7UwI8yvfaL8eI+lcX4QUaZlgt0M2LvjkCPsMbPbcnCn8oi7MjsDQyjO6
	Dv7JoLro8N4zeY1mxtX6vtUEORAPa5GFu69fiNKg1sQfviijxDjFx+vVD9zyncC+tE6i7d6Avrm
	aG2zOoWmaGdRnO1ftxfQR/xlV1HHKAnWol3ucC4DZmypjA6chR2LXP+1lhP8thJds4dCajQk/Nl
	iF1w27Z/xJFd3zmDMJ/Afla+DP/xUfEKZe0WwAP7le7bZigehOAyRdkw2rHf7j/COz/6J16Y=
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802593137.1.1793365742048;
        Fri, 30 Oct 2026 06:09:02 -0700 (PDT)
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802519137.1.1793365741491;
        Fri, 30 Oct 2026 06:09:01 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b01b5esm605327a12.20.2026.10.30.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:08:59 -0700 (PDT)
Message-ID: <3f11cf8c-db2a-4243-b1f6-7f2cb9a7a87e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:08:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/14] firmware: qcom: scm: Configure LPAC aperture
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX07XXcYRlYSs9
 zH7Y+7IJic5UGo1AWdeIrbjZkdJTZyTPe/qr99WckOdVQxdwPq3qmacYQb/prnxfYxopxs7tmBq
 23Iillknhu3d4sBGpZua8hjpr2bH1XXqmVtXbC+2Qzkf9F5ptwWlm/IufD0JkfmFahWLuDXc0Lb
 UptjlMxvorxOBhWEt9PyrdbCfOe468A6AlAbGYyjHpNCUv7B6gIAboeqMeHlb5nsKUqbf+BSmHH
 Ba6MMIpQOYAgP1Y27qgm7Lphl1qITw8qARaDw0JkNFsqNa+SZ/sjlRx9wb7vB2p4NttInPvbvn+
 oUlXAQtY90J00Zx2Irr5R/JgBZ4XEjMbFJ8LQsa/lMlbMB2uoosE7QSOj8JrKodW61DIfhYmw6u
 ae+//irY4vda9tJlopwFWqwFJ3OUSAdox+TxidRbO/jDdHWdEXm06W+xlXaS0vuLXcnGf1tu7PC
 oJIt6dTOG04L7ih7vVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX/WGQ3vOW2OmV
 4S88aecuBWGoMKtqqkxGzfWGNFh6IeHS811HsEd9o+0/ciZBBgjx7CaGSfE4xzIOyx15MqqZSTm
 HnnlxrjNJ9+h++kbHwlu3hPAYx+ZTQw=
X-Proofpoint-ORIG-GUID: y6g8Yuq258U4OO8hvTe0OXxj9VhGREGI
X-Proofpoint-GUID: y6g8Yuq258U4OO8hvTe0OXxj9VhGREGI
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae496f3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=HiRCik2jR1DMqHai1FgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_060909_575024_453F4C61 
X-CRM114-Status: GOOD (  17.64  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> In order to be able to update the SMMU registers from CP for page table
> updates we need to configure the LPAC aperture to include the context
> bank that will be associated with SID 1.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  include/linux/firmware/qcom/qcom_scm.h  |  1 +
>  4 files changed, 26 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9b06a69d3a6d..92093399f20d 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
>  EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
>  
>  #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
> +#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
>  
>  bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
>  {
> @@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
>  
> +int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
> +{

Please make qcom_scm_set_gpu_smmu_aperture() take a parameter instead
- bit 8=0 is QCOM_SCM_CP_APERTURE_REG, bit 8 =1 is
QCOM_SCM_CP_LPAC_APERTURE_REG

Konrad

