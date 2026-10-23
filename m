Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7AB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 08:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tHB0O6js;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4UQBO7O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPFd+fO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=; b=tHB0O6js78adN8
	wj843MUnF0OzHYblsR8vr+SCXJPzcw+8L6LRWp2pZsMuqIh70tNUIlLJWFgDj3vgQgZcFE/baZPNX
	ogGAhgTp/FZrfOPH+Jk3jR+mOn5/hNHF5M7TEMttCDsJcp5dvQzMY7CugAZTabvzLAi4qQclf/QGh
	4PBR4jgSr/c2Vl52QmNeSvOC6/nDY1+IAGPVPfq3NrJ/FYE1nsSfsb0d6aYIcEul5qWC1Z6LPkbtO
	vQ/PQoiJWlTBB0GCYLT+b9AF8w4Hk217JHYbsULdPwznzwYpPk2wEU7i0xWu/YdTAUKkhZDOQdFiU
	7bOB1VcxKh7E6DWg9PPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAIN-0000000FsD0-0BVZ;
	Fri, 23 Oct 2026 08:06:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAIJ-0000000FsB3-1Mfq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 08:06:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F88Z2112107
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=; b=U4UQBO7OvfeVT+v0
	++oqPsbyXmrsA7tzlP+uwizroGuKX8cWnNIN1LH0ZJpnDSJ8y88P9EfEQH0Fzxpm
	feBGBzmS4CiQBc1uQCcypry671AEWQ1hKDf+72l3GmdvwMcUC3+CrUV20tfRjkUh
	gWd8QlybeNXQWyHBckO1C7+0hLRQ1djNec1SosahkPj1T4zG0hIlMXvOa3ZEgIGH
	nxlFr8Z0mf/WMpYgyVjRNygIpgBioctlRvXTnY7FpkpnLtV1PcbEkDpfKriXj/N+
	SWa9xsmn9H7fxFsEt0vawjeSWyj7W4D5jbCaCbukP5ddVBOx4rBx4ki7LSBdZFx9
	Pm2hWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsyka2y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 08:06:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so9893185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742790; x=1793347590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=aPFd+fO0aOUxCACcLcC0Mn2mg+IFIWSYOFIEQmFTZpOdlO06SsUiS2fOfWE0woLoKA
         CThwT8Mbo11I7miEPisnHUEQzmr49vWu+4t0INyXSAiwr0x8rCm/LYTVBixdgbv2NSSc
         9Qv7+AaZ0ogODYvgQr3Nsbzlt8ITnXYjdN49hjxlIUdrqhd8hZrVgc/QegmHcXudrw1S
         4V1y1U7eEjzwmSc3nH8kqPm281oWrzUk8Ty4nsu+vhBGfeDQlJ4w2TlT8slPZBg6xRcX
         Kc5gfCOVRebBSLsnDf9um3A91OLn4VqKUqsHM/psVUvQD8vvyGcadIp+HKvYoLUl/twt
         Y68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742790; x=1793347590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkRK8y3p+giH1Dz66bRMZzeRiuELQ+JWzWO1dmY60cA=;
        b=YeZxB5mFZ5xWX0dSEfu1568fBgE/P4uEIvxuAw3VsKWkTZ44KG0cV/DbGofRdmUSFI
         YwkW5/ZFqWUQ/PzwwkMFjQpHmvIMfj/0PtxZq/SaWasFQyM3EdVCHp2ouHEY3+d/8WY3
         ytv4NSBDtpo/nJTN9yQ0387LncVsogWNhjOCfhEuAT5GQScI8og9mEm39THyx6YkxN61
         3MIrwl6qo9CP9Ma43O97qnwqseAFsppSqngItsOMXzfqge80fbw8BFDtyPjwDs5sDGio
         1nswIN4uOvBsYGSwbkyJ/XqJgLRWkVQD4scOZyze2pigzFdPlyV3D/7zWwSdKC4yj0XY
         h6zA==
X-Gm-Message-State: AFq9FYKpk3B7mZNCAmsVSWiyOfYfeYIi3gEPdJ/lb9aeHIvv8OMT1RJU
	Mop/Y3yMNJSpARL85lxnq6lTL48F2QEsjdq0xvR9PfhAsOzXrlqkeQ8ry9br5dsGPukHrQBCxWa
	wvPBcBxUaDRxBICWg7w94qP4jsZMwILsQa4pj7f9nSnENQyikJS2sxobKlPp4Kj4af+HNtgx2YE
	Fxlw==
X-Gm-Gg: AYBFou3kBf0O8Pz92Oi4oKINns4bTon4w6bip1wEKNLGOmF7HasU9K/F8jcjPEiyZrb
	oHQd8/LK1+FQfekY9Kd+VsT3ZtHtzatsRKVkaq9+YN8EqckzCE0uWmKa8rtGPF1QpNDUctF0nLD
	NU2z4WkPEdNliE2Ur/0RD3XTOUyLQljN4eG+eDZu1MNrcKy4CbR33KCqs4UEt+Q4PbMrYAizjXq
	BdoTCfXAXmBvuBmYer2ovkXBD5JcKOpYWIHQdak8m7/HCqeaEpAF0DUTZ+cLp0zeMhgORcll0rV
	0GtGA7xm5nA8jUBKqnAXWtv/Cn7u92Oy78PhqisHOJdIcq/x0CZ6S8imO9FueuOVAo3Og44C3XE
	E8J4rmTR8ijd3847DQovsLA==
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296824185a.2.1792742789586;
        Fri, 23 Oct 2026 01:06:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7313:10b0:939:8148:1e3d with SMTP id af79cd13be357-93f6f7f3e78mr296819785a.2.1792742788961;
        Fri, 23 Oct 2026 01:06:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d54dsm73770766b.24.2026.10.23.01.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:06:27 -0700 (PDT)
Message-ID: <f3c13144-660d-49f6-9933-9d9cead006ee@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:06:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU
 SMMU
To: patches@brar.si, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
 <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX4rQ+m8bEjiQ/
 da2klie++7OYuXd9I13juUA/f8DiRH3cEs7WiqzLsZbPK5WZBepuUlD3y/C8fuNoN1o/Sq4S6wJ
 fwntsZ4OMCBPlgCEqaaof8Hec/McSEFPKOyw4cKKvgPAQFgA8eWL98gG+3BwF76HUESGTo8wTAv
 sKpU4L8lP8PqOTJWe2iHpvqNIrefXd/3P1KF0S3QRknXPGmlhixrI6623X+shhwUUPAXJx5cayJ
 ebCVz1sIXiapwO1ZqaOuQY8CTqqvXBzudWgcQOF2hgdKMCT93pUdr6WsysiYWbFEzGI0IF6qAay
 cyo4plPuZND5gGyzTLnVF7hFwcyQ58Aj+KiETVBtifJbP/Pf8XCO4xPZhCEwiaJ0MQnzax4Txvk
 tRLiDA6XZ9S0UgnqxLGYQhVXbFBQp0tZFyJ1NmY4S586BFxPcCATD5zoJEo3gsZkOXrXu6B7Tow
 SPRd3+rro0D8BniWCxg==
X-Proofpoint-ORIG-GUID: WKWX-9cjDUG-RJi4K6Q_wICHX8SugojO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXxooo3dt9lU0v
 t3KVwCB0xJoLj0mvSTxafgiAT2CsGzJ2jCFQcdTyQbcSwl51ojo7UephGQXQ7bUX0Kl9ow3COvg
 q6bRZUw/CujxbMaGh/RHae/qqV+Pg5g=
X-Proofpoint-GUID: WKWX-9cjDUG-RJi4K6Q_wICHX8SugojO
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb1586 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U7Z_fe4AFx8LFHQn5dUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_010631_383302_EFBE4298 
X-CRM114-Status: GOOD (  11.60  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23/26 9:54 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> As on SM8250, the firmware on SM7250 resets the device when the Adreno
> SMMU PRR registers are written. This happened as soon as the first
> per-process GPU pagetable was created. Do not install the PRR
> callbacks for the SM7250 GPU SMMU either.
> 
> Tested on a OnePlus Nord (SM7250) with Vulkan.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

