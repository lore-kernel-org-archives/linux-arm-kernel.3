Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A66A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntkPy5Ll;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7FjuHri;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RrqCInng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=; b=ntkPy5LlSYzuJv
	b7pZ9zV35Gt428CurasT0khG7qnLhWd0hzGrhtTh6f0KO7iswT+lkYHfqIcZd0H9OkbGO9nX/LUtR
	f1MQfIb4dO8X/DKqYHTE3dpW2Xmr+GDCB84YyIl1WEybKdKN13SBl4xJojNNLpFkLKj/YdRDN32k3
	LvPhSc7JoYqf1Hxm5zZDZgBmjpSrf+Bnl8dvAofDoTUDChKwqTCqintAsQqy6L5HvbLuFY7GqIjEO
	HBgivHOSOYfjG+Fp7+ePkdXXz26GRpI8yQqe5SZKo66i6O3PHogh1cRyO6XlIbU8E1Z4JEFS2cO79
	7ohH40K/iXfOIpxiqshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJroS-0000000E44l-1iMw;
	Thu, 22 Oct 2026 12:22:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJroQ-0000000E44Q-0f2d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:22:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xwoo1962204
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=; b=b7FjuHriWyJcQF6b
	oVxgz8d4XnoXFI7faQANh+GAqlf1hwx2KqrTuYLjyW5FpjEwS2L/kimmAc3pa4AB
	CT4m7ayULxWWZG3q3wZbrPIeLAHicmVkjguUeG7SFxAspd6FWvaKxbVB3HurC8OK
	fcUz/yF/RvrJD4lPFSo6JhfOzG2b4VNvQPZIQxfZkBQgvZJephazPUFFGQ73TqiJ
	R5iVVRCTGKIlJJQdCgbkZ6MEHpNZ0Go3fRbWPJuCci5ZvlhXGO52remI9hyptRID
	m9aiYahu2KCq3Fmjs91IJukRzfggloF1DzztroxWsu6nIhC08nEbKX1fDlEAVsCH
	olWzmg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ak5g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:22:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9995cea88so17985205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792671744; x=1793276544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
        b=RrqCInngc+Tu0+TCS9qTVjMT7MXDg3E72rzRHbclwHlH6pZmlrST6pmcxOgScfvkpi
         cUaaSGhVfj+44robuIuuk1xdUKwQwTa21PSsjMpqoZ5qmtlE5Wvm7A58xJGKDXf+tY2F
         B5nB/txATiE+4oNGCU4HnkOou5smR58JQY5yeVaGPP93dxbnS7GeCE/esuMWYP9CFO3c
         jB7/FwzC+FTlE/BUr0OWBTUgOvcnzmh1WizBseuDpTTTN1qgB5K8dgD1QkIhkdT3+xbs
         JZvWsKn+bpZWUjwVK94nx4L7bGwvlcBrxa+Rkz8KOIo2rDTMknpyI2780tP9UUxcuNnk
         FLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671744; x=1793276544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
        b=k7/ufvvVWhftwySSTxMod2SctAmhFXHCtDWP8cZh+VqQKf2c2ii6XLPZ17Sxn8ws1j
         8bhghOvAiLUtWCwvFJYm5fQHfKbXCMG4Ta4TC8BT9FP4yxXN2aUIuGwDpbzHRdlNikXc
         5scTeN7epX+E85H/3+pKR0YpT4r7+917mN3pUHRvV7ON18sPDxc2LP/OOtSeFCTRzbmQ
         u9Da6Ae7iVnSB0aJzlQFJBfbwUFXJ2Cw9RReUpRPwEDHvxFdeWQe3qhWjziuIYdsHz2/
         NbhGGRlNC9Lr9PnszUFfm/ME9Am2sY6Mqy6tl9cBUJj+v54HXlstSVBqmrpinkHApUKb
         RpEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt1b6mjV6DboyXg4J8o24s1BtS0mZvma2BnqWJ55Q3N5sQeCMYeH8voCKTIocB+Uvwg/IvusrbyVwM0HjzWOuJ@lists.infradead.org
X-Gm-Message-State: AFq9FYKnfEwsusuY5OtXk9YviJ185enjAxGBYFLguUVSjvdbvwUvIEh+
	Z/PKFC9Etv9voEAzNdhWVsmxHR0r5Bx9nrlJBZDq32ttV/1+KuiN6rhwnzyYXkeEAw9fTRmFp2t
	/Dw0qIRHZaT6ClIHpjog9EnWSvR6SgZK2QkUdlNU+Uc/eBM5Ns5x5LKoeFnkmV+/kWT0thNc8X8
	va/Q==
X-Gm-Gg: AYBFou3M+yPhpSjIwDEtCed+ybMYsKCjETyLl5++JBzPUBSrBRpJMeScIf2EldMTW1z
	XJs94n0E6gPoZoIlRDkW0MA+FG7L5fvWlb+FKgcIqWkd1LEK0RgS5Kv3I1XJBF/0mnNzap2pSoM
	lerhEqnsHOyGY22mlV+mCY1na9VIiEngvr5IrXMyhBPW1Il7izXPNwK2it2aroxRe9teGEumQbQ
	2o/Rul3YND727WYegPhSx7bup6GL2gpKD33UTRZ+yMWo3bdu84wmdj7aUk7toBWuknHwF42I/KI
	EhamW22MX8qbpuY2WuXRcQauFCyoiNryLmjHvX4M4RoA7aoGvfjuI7Pl8yhljKylhv4M0rnmfbb
	GMpwi0yUCH6N5Pd58gwUeRp+cQgXp1l/lCw==
X-Received: by 2002:a17:902:e844:b0:2e9:514b:7a73 with SMTP id d9443c01a7336-2ea43fa9f19mr45591755ad.48.1792671744007;
        Thu, 22 Oct 2026 05:22:24 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2e9:514b:7a73 with SMTP id d9443c01a7336-2ea43fa9f19mr45591515ad.48.1792671743527;
        Thu, 22 Oct 2026 05:22:23 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b412756sm23642595ad.24.2026.10.22.05.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:22:22 -0700 (PDT)
Message-ID: <5dfd7245-c2c0-4468-95ed-6bb8a385da98@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:52:15 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
 <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfXwuQ9OHPM4YDD
 ufcSui93nyztvJDyUwmsLdbksKp/HvOlEWFWp5YnAOvNuaWKbSC0R35fc3LE0i72/zBEoI/BhDD
 L5JIRsA94zIItpttbJGW14b/ZWX5spteNn2t7fUacopnGzDhyL48LwEimahAPaSe8ByBEwE431C
 7cpRMRY0KpxE2MhoAk4Ii17SaHD8zcXE9QKVnCkT/6FWlkZBJoydZjMuTrclU2+/pI6nFqDq1a6
 ifm+cBg2Kpo93M7n7rhFp8kb1aQLph6nLvJCGTBybNL6rzOF1EsDWu+SAgDDFOTPiLG3knOxAIk
 4+JmVzjD+rQQe4PNzCtZM9rqDHJscMT/fpQ+aSRqHKYP8lafKLCNiJb73inPudEQ8tVacAxL22E
 nRBhOWCeMZJK6cvxte2zTkmiaweru8S+anrsoo5G8bktXsO0iPxXTAWHxcGHTzDdyICEjTPHaJL
 61OU8rEZT+Gg9dXZlZQ==
X-Proofpoint-GUID: ZrNnVTE--CW3dc8AOn2eI_ePf-NVvu24
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada0000 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ddSnBWzqd8mu_d83chYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZrNnVTE--CW3dc8AOn2eI_ePf-NVvu24
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX0G0nl4Gb91U2
 zQcvT7rLbRRI2m01bImt210qSDFwzPznUA0ZrWLwWf5Saan6nHhr8A6d1AIMKAifbbYZXlV7o/M
 q0GBwlCjoEkmpig7EjYBX6pjtoUg25I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_052226_225083_ED6D0F4E 
X-CRM114-Status: GOOD (  17.72  )
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



On 10/15/2026 6:28 PM, Praveen Talari wrote:
> Currently, on the SA8255P platform, protocol drivers attached via
> geni_se_domain_attach() treat each OPP on the perf domain as directly
> corresponding to a protocol value such as a baudrate or requested
> frequency, and simply request that OPP via
> geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
> computing a source clock and divider combination for a protocol
> requested frequency, unlike the Linux clock managed path which derives
> this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
> applies the matched source clock frequency with dev_pm_opp_set_rate().
> 
> Change this by treating the OPP table exposed on the perf domain
> device as representing the actual SE HW supported source clock
> frequencies, the same role clk_perf_tbl plays for the Linux clock
> managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
> iterating over this OPP table in geni_se_domain_attach(), so that
> protocol drivers on the firmware managed (SA8255P) path can also use
> geni_se_clk_freq_match() to pick the closest supported source clock
> frequency and calculate the required divider, and apply it with
> dev_pm_opp_set_rate() the same way as it is done for the Linux clock
> managed path, instead of relying on a direct frequency/baudrate-to-
> perf-level mapping.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

