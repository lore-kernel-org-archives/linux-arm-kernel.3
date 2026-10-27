Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F55606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RbRBnzvE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kw6X+lgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CwDPqsTx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=; b=RbRBnzvEL7hoHN
	SLtMPvwxAPtZDXLDLyTBOqU/mmq+99FEkiK2uJDTwa1TXglYhmyVk9DgZ1Hbg4xsLRRWDW21Y9GHh
	nU9cl0ilhpjU6wTGJYxNfBzedLtNT5tsJQd+dEkbTc/vNpxmyKeA0vag57KP039LsoAh1Fw82CQ2I
	WeGuRXWqKzm8LKzGpsz9WjVUp3qZBhnjIuV0hwtCbii2TeT6siv4/nj4tY6me/34TavD0T48XiU0h
	VcMEXlmEv6k034U+gbYCETl+DVSW0vDu5EkebupWFaa22hAgpBpRJwLjZTQ+4eKbLm7pCgm4xeQ5d
	9kdLVhfyQkNOpgLAuUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLa2q-00000003nUB-1aDh;
	Tue, 27 Oct 2026 05:48:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLa2n-00000003nTc-3Sb0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 05:48:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z2Ar1297005
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=; b=Kw6X+lgnXrRlD6sO
	n0LqdwhzK5HQiwnbjJVucUMo8QaixvlobbRKcKuB5pkg/xYhJBo+Zz3J1GPRaNRl
	LjsmBsg0vGlNlgM48M1V14ZVU+BQmSSSD4Hv6iuB/a8VvZq2ESN3eYRUhhNLj4bO
	Fu51VRgld6cYq2dsueb7rHbfvduZ3zetGi8ruxs4Waieyh79rovR8X3KbTA3Fq8+
	cTGnLCg+EXDT/Z4yHF9noV3xsn8d0pchmPpH1sTZ+QC/qeRdMweDMYDy5uOkS1Iy
	57JsmbSZChlZOV/UKfbiV9WtFMh9ywogZfkrHf4MJBKDTExx29+WCFWykGlqOoD5
	1tjAzA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xua75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:48:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7922359eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 22:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080100; x=1793684900; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=CwDPqsTxJPwH4SDjOKsFWOKyg8pYwZ+vrlXvVSPXwNKk2w9LZ6J01UupXUKFfAY/iz
         a4CtloUqjIyokGG2FUv5qnEozgt8sh9RkJ6A4hipp5DztQjAyk9B+qz+tsici+cg6H8b
         HeNVMVCo40iHVyifZsubpmpYyOowDgcx8hnAciBJ82gTM44fhPR3Su4fpWgWkv8vXcSj
         G5J7eq5yquflzBojl5kAFIXYzTiueZ/cEGB6avlNWI1tCymiCq5uLAaAvB1U/fwiin0K
         SXDcvuBKBIww8r4dD+luwBISHiEuAigpagOKjXvb4yhNM50YnqASdWc52c4MEDMjsd/z
         +Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080100; x=1793684900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESb3SmQ8meudOtCfPOx8wemsamBBkJfF9HrJP+pAGkA=;
        b=XzqrBg95lDi7deW516ZNhZ1mAIOi1R2OONu6+CpqGKnUq4qNqqhzxdhFnymf+GicSU
         KKgLF5+K/6AQ9xgkh2Z7kveG97O4fmXAj3yxHD9Tx5za8R27h/YyYNx8P9eLzjDrKo2g
         p6YCzxi17LpGL7+6nQms1LD3ikwbMBUqMlm6wweEd+0viEufSjLTvFpu/LR2HYoa5vQg
         LFtqfqkHxxLRMdithu1HDvUBe9yLjGCVM17pKqy1V/QpcKLsdC3RVyefE39N/YZqjG+h
         /TGmdBpqc6batVnMsXIFUVSSGLZ3AlE4ggaZj2IWt1VYYbLOWCGj6eo6EBz0aU24vohz
         X9xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxTlNS9QHPDqVH3cUWJ957+fP5SxrLRskCZyMKIMNwXjy//0Ut4ynmFPHWqwteNWDzIy8OsjBzF8XTT7K3M8jn@lists.infradead.org
X-Gm-Message-State: AFq9FYJimRaUgipkECMWTNmsOGpidye+yJ3DU5SEYrCHcL6DbZxHd7w7
	vnF53gBadtN/Bd+36JVvjorHrxrkDYP3PQ1HGonWdMiEH6SE748JEMX2DTYo/QJWY7ksPoAFImM
	2bN6U8ygMRPheK+cKIHRBOn5jE/l0Eam4HD1MzHp9JSVbjqk/u7uLYPTK+/3KZtV/X9oWAWQLMT
	h6vA==
X-Gm-Gg: AYBFou0tHPW+3sVRvcuynxpMLGbXIrrQv2x1Yy9YB2lkIrRP94KsWva6IdoUqNM0Qpc
	zuS17pMg7CsbDEReyCQcCGPK7lfPpxFEf5szyx0+l9VqACa+OoUqPhJfFZLE8ChygdFlaxdOFMA
	hpE+qyJ18TbpljOiicgsYUvcdfM5HCgxNS6/fLFWjTHf4fPISpRCG5VfvOhdtSJ6J3gvcdhg6Lb
	DsyKQ+bojalC+e0VCeL3d4g7Oikw8geJYOra/hrUgPNhF8bA6f07YTycvX2vGHRftUbIIBoz2Oz
	KSRaHmIBkYTBYgDjuCacbHoTTsAmqZK/92dVlHJEnvptGknWklD4Btmd0JBHv52S2XusXNt7jwZ
	CF8RYoBtn+UxyxJDMtOOe51ziIQ==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11695108eec.11.1793080100116;
        Mon, 26 Oct 2026 22:48:20 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr11694676eec.11.1793080091301;
        Mon, 26 Oct 2026 22:48:11 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm39226087eec.28.2026.10.26.22.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:48:10 -0700 (PDT)
Message-ID: <9387d067-cc44-40e8-8d60-d547d222522c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:18:02 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
 <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 977OasX_yZ__M0odcMp65aXAW-NwBTjg
X-Proofpoint-GUID: 977OasX_yZ__M0odcMp65aXAW-NwBTjg
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6ae03b24 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EBxl5K2b24NMC96zZi4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX3tOBfxRrRoXr
 az5VEFtaJe1NhF7b/xwgXLHaiJImBmNlWBly1/7PYb1Or1G1Ev8IMr0/bweqbHsoruu7O/gXCNQ
 EaUQZbRlqqzCNQGQ69WOWmQ9uH1q+/BweOnk3xMRWi0Zn4chtTXuQFUHZnLoa1/G5hhzZEyYKC0
 Hwfs9EYTYFyx1Zo+APyWtF/Lj041Ko16e+TJVEIG6U5ougPRWrQA4LcgQ26pbpOAatojXlQOyzU
 y7GF15SWrfuhXGnZbFGC/h2ON9xpKfQQ7Bxfqy+ZGrhrDI1++xKdWZ++YlK9t1j7OlrPkKY3/n5
 i/6s7PFFfBWM7qrO0AQ3dPlbVmxAFfyjNuozMfZDMd7grR1YVHBUIpf6xKqOlvpnOMno0PCq58R
 tN9pprhMPnSwXKBFk8Ixb1gMxHhSiEuZMOPoaTKxcDFnjw1Q3+j/LOlvvR7is2wbiqiHnAmv7Kc
 J8yzwUQupSJ2d+Ye3jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfX1zEQu+R1TgUI
 gRJ3i48YQVQz+xFf1vMbIqr5mBHziGDNS3VD3d4PD0FfraZTNjfS8BD+ZMqG4Osj20uRtiN0J56
 1qKoVLvvarPQjFs6/KzCc/DeYzYZIBQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_224821_876768_690B5874 
X-CRM114-Status: GOOD (  11.23  )
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

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> Patch 1 introduced it!

It was done to enable LPMs in Shikra without depending upon MPM changes. However I get
the confusion, I will combine both into a single DT change and send revised series.

Thanks,
Sneh

