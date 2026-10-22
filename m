Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF8606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HSW+1VF9;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC+Id0HG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GLbjLWw0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=; b=HSW+1VF99yqMctpPOSNfM39+oI
	IJCikfBhWZCTig/kKO8SDbCtLF0miPT7+rPy8xx3qaA4CUYX1Z1rsqhXIxdr5sRkQSJSmRozPPLib
	jcenr/wAdLoftihvjeB6s6/IADg+7BoZJcpTifT52VW7iqmQjcgGvwRMKulOqCoMGLYqXzcRn82E+
	G6DgLX+ucYKT3gAV7d1lh+bYp0fiz4Rr8xlUkE1HJcFqgAOtd72/MCUTyWQ6s1tG9bskkTD+XxPYt
	NZrnZ7M2XsCrXIQjeWmY0s2XvEYDIITaKldNIpg4dXm2aCjiV2gdo+1vQWzcGlkkDJLf8mRjNKhJ8
	uWn34mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnpe-0000000DcjD-2HeS;
	Thu, 22 Oct 2026 08:07:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnpb-0000000Dchv-3tsV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:07:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7098R4136779
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=; b=JC+Id0HGcxwKpJD1
	ibh6qFVHKM9dmBjD65sOixx5xw554XLDnLtPjxnCKc+ShzclOWADpNIJG49iLWBY
	quC+72LO3omfkHpfHAHLHKv8pqZ758X3SJRAk0ccIM5AiS7ILJ9ptmSc88ztAzwt
	FtprcO4sGLGSdD1Ru5WtvqMzq7iks1uRitRccIpXHC9rtA+3XlwSZT3ETuY1kpVM
	LI/t/zOI+TXbmkQx3FhLQcNszGJ7NiYkcwmUYRvVVKo1noX1/cU/Soo29zTuDoSy
	vnD0+CBRANW4lTn5j7rdimZMClXa4ef3AazXwbhlLeXj7qw+DnHATqeSIlnGKFhR
	wcWDmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9c8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:07:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso28033385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656442; x=1793261242; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=GLbjLWw0VN5bJR74O29eOrfZYPGcVMfnrXQrgyILa0LDQwAsaPlvbxtZpETaDJHy8r
         Yfge4ics9LxILV+6NPmj5RcC05yvJ6/ObY6k6HwyPYF38N+we0mM8dnbyAqlePjRCjgn
         PI6zUQxjY8/i/973iQ2LFbSOMCVt47yR0pXXk2WwHAS+JwQ/6w/p3d0jTTOPfoeOjDYB
         3PJHKDUrnVrFG9KzprC6amoa7dIrEgFvY8KcLpdRXACDbTxaO7Ciwnb4VtV01B7ELw9b
         jORkur6n5SJGjPFJaOSFH1TYXKfmBUfal96UY56Cn5CPegP5/Es0/wClBqxO8b1zGXxH
         yLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656442; x=1793261242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSaRk2VkS1xIuFpPyr8N9sI7leu9tBwHWTMr+MJpINg=;
        b=QKj8lrCIjhNUd/8+uIM7DjF5d5xzSvflBi33Pa5in5erqcE3Dyp9vvIvwie1dNn/TS
         CNa1GuzLsnI4XCM8lO+lBpHTIDS81vpYIPRjrilp7F5VV5moH7gp2fVTIVIfh+aHmW0O
         yrQmnAfHgqt40AYKS5+LDR4bykEL0BXKNrxLfMzb1u4DTvdxDHvDEIZHSl1KqBLQ9Sfp
         GEVjZgsQ+DujTssISE8ka4ly1XYngT2Qs9zy4ZIBI2yk0NT34TuxaJayyKj6MnOIJ6Nd
         eJZtFv8cIrHTs2egqc4hA9wkKPNbOWzRygIfhvi1bTJkevjJx5erK6KzXJU7ElUgckh8
         6LHA==
X-Forwarded-Encrypted: i=1; AKwUvByCnn3QTPtq4IEWvSYlBlIZe4hV7ZgDEK7fJCd3FJHOh8APeBsEIsWU/cd/4P0ff1dz/EIPIsCmnZyE6L7nf52K@lists.infradead.org
X-Gm-Message-State: AFq9FYIyQ2FS4dls1RaXSTtPQ+EhbLjzgrTXNt0qcGilhWfM/+8bKzUb
	pcvgfDDQY0MjeZogFmSY86f66kp+WQC66lRR3SZOhh+ZcxSJZS1mpOFlhuDqvLGYp2rmuV+j6ai
	LJRid13YO1I98EhW4ChVShkvX1YMshlOsS/qjdxVIRTEp1EP4vah0CEaJVD0dDvlXN9p11sJwAf
	j5HA==
X-Gm-Gg: AYBFou3vrF3ovFcpoEwqnmS2rQlcjurdIqocBxjrDsrOxjtoMz527HqcY9CSoQEfJCz
	D8t5Zma+jdcYCsGSuq0TYJkFBhmVU7NgK2o9hHbvfA2QBGpvRpdNPWN2W4mANW9k7WB1BqExzmC
	PkObxqWwpy57oi2mfTIa+qLxOewyCtmHuK4myZShIlYky/jsqmcYJmdiCm5RD38DM+5XNmWEAnF
	tqCgPO9SO/kcV31ND6xq1ZdLfrFLMDEVGNb3NhBo/eEMbVJwcqDx2bsipKyGb/Uw1Q8JnEJX8Nt
	lnyZSXapyjvpUZ2Wiho+zEJAcNHv9uYBmYPlz3wKMuG+iKVBZe3M4hMrRLDp/fPUGm09LV1XMfJ
	qVa2b2ayalvcUCxBoOkdorw==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008991285a.1.1792656442402;
        Thu, 22 Oct 2026 01:07:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1008985485a.1.1792656441987;
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm1627775a12.13.2026.10.22.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:07:21 -0700 (PDT)
Message-ID: <52029ffa-1bd5-4243-9550-85cb00bde8c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:07:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXwDhjZVNlB5c2
 0d62K90rn1OieVX0Jo+NHplY0UF/b+P1EdHmr3NhDuXinNzWBNTDMtqjMRy38HII9qu1WGNzY8t
 PaB4crqiiVgDM+xzzQcfLSeXU7sy4vY=
X-Proofpoint-ORIG-GUID: jZal1ckMXsYQ5_8nKwIVhWSwIM__lqrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXycCSbiFTUquK
 XFKM0G4/E2Kb8rPZ9PUl/3qcDqMHTFR640MKETR/rWCCyyHazyAmhAcwRmhueYEgKiiL28a/UoF
 f6Bma+qa5w74JZ3gG1M/c/vbN7x5DJGhOMnk+4UqbzS1zMlaytABKvua7t7zG/c+1bxESPFfGD+
 ZlYDGvhQ6QY9xiF7gDMAAar0HfHysEMjBEofLYZ95zwe28s/L6Cmp0BawerPljFgBQtaljnd+Jw
 n95AplLZz+opGJc6uCb4I2zVUuZKWndI0L7Wmd5QHanTozOdOKXTjvtFVngF3ldDO1TDaiXnVqV
 8JGx0B3DxJZ8Y1WmraZByub+4Y/TAf2cPRkTNpIJIjEiye89CDrFegqs/4l3cZsyhP4w0FdkL2T
 n91EIeqX3V5jX6bRxbjoMJHrL3EPplzmKYhFuMBH8YW5EJtcTXZyWcogCzqBSGsU5hZQkgTdNkf
 D3k/pd/EnaXS0655LCw==
X-Proofpoint-GUID: jZal1ckMXsYQ5_8nKwIVhWSwIM__lqrM
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9c43b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jboVpbf-MrRR0o0IvX0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_010724_036617_CCB9B2ED 
X-CRM114-Status: GOOD (  13.52  )
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

On 10/21/26 5:17 PM, Anand Tiwari wrote:
> Add a DT overlay for Talos Lyra EVK, to enable LVDS interface when
> LVDS daughter card is connected to DSI0_B2B on carrier card.
> 
> There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
> connected through I2C5 with reset and interrupt connected to
> GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
> using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
> GPIO on TLMM GPIO2.
> 
> Disable the default HDMI bridge and connector in favour of the LVDS
> panel.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

