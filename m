Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162D8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=; b=PXtVx8nrJq6+GXLRVkIg/JlpZA
	2EKJAyOGdrjoOdpIBYON8YcpzOaMrqb2FedLFeAj3I104qJs/iiLnphO7turZRJzs8GWKIDd2Yrra
	ai3rq7bi/xwj5x/YBZKfwrfO+aO0JXh5QP8XwBmU7tHrTqSOU0x5NUGIFzrIq5kXeb1NiH60ufGWv
	TZ5arR2nK7kXB1KQ8ToxewpPkg/UQePlu3AjYCfHqFvJli+oSEKK5kKAREtQl/9aRGulDQhbZYqQV
	TTfV83LRuVJLBY9SomLz1pxwZLRvA+jLOJY0fqNm3dWpqHYHojvnqsTAMyiqXrqGR+vRT6PFZ9van
	0IWQnf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesid-00000001PKB-2cvL;
	Wed, 01 Jul 2026 11:03:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesic-00000001PJS-1tLu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 11:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=; b=Uqag1/vhaMu64kgUPrwJVv1vIa
	UXZC0pSzkl3x1JRxPfXi5gZN/vYN/GrVStDutoHqRpuT/cLTYDc1YmgdkKV7Tf+dwLYtQHC6ay833
	t502yCcGzZZ4PmY+K4DvpLV7Ykt3LaLqYEItujMJourhMTR6X7PGKzp/LMylu+RAR8IXl98eawYP3
	xRWlgrIdZHqKZGNCPQysnAoi2dKXaEB7YUZlDh7Q3k05h6Y5Uu2DPlHipF3mfMuwLQKt5j/835o4R
	Gsq0lsD+wLGsx5iGD5+dqDfEMbF1y2QjEvtQRvcUbtY/E2NU1jJDjJUtKZkVns5OOIjDDqWLOszDY
	PeEzsw/A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesiZ-00000002ept-1WN8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 11:03:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Upr643999
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 11:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=; b=j+HzF7h+yWvHFJaj
	xP6V7MnB5UqGZJ5SKxdy/vefIya+F/K3wbABeyLLp6iW3vizyFNsUHhHAD3nD+r/
	OyXRPuChpj4NhhyEVBEaJhTRn23BrkSBuTbrXB+frWPGvqpg4zn8bsaG1GuuGUYS
	jIeyribqpUAAdzgBV9Q0j8h8rgDnLOTXRg3Y+XFYRMLVSgy3DiW3DM6NxD9gz5ov
	zo3hFyHTk+BLne3oti/HdwiTPyVcXhUgwD5meYkElEey3cX9kDHsp4GL2WLV+z/e
	BGhsYj0RvHoBOdKdqJJVxgM/0AG77l95u5LzLouix7V75x0Qz1lZ1pbDw9CnuSa6
	LrWx4w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4ehn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 11:02:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7392d893428so24428137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903774; x=1783508574; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=;
        b=CSymowSmWZWZH8j4ES26+tYZiCfrCWVVX71Xrcmrl78a9tRRQyLbXoMFAz26Mo3M92
         FYdfc1iD4cWLnFvS3JFgUfRstiW8KHvxfnZKfgZER2W38WTwHwYNLt6LIfdRUs++c61B
         DxfqFvXjh1alnMDJnggAE4l3+7YFfTiu9svt/iZK2L2vQL/6Oea/FW79AByjc/3/3Ph6
         C9zBexhPod49F+erQQRUM5rXl+uPXKDLHP81xXWxGkCMSHBmtcWER3QejA79NbzjmozJ
         z9rtIAyY33JPTJ/0V+Vcnaw5t7NBN4H7hFHsg3GWTUU4Ab3BKEQ47Wa2qGLdlMyn3sYx
         0GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903774; x=1783508574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvGYuMepORYbrJ/S14Iw5fW/K4H18R5Nk/vIBtqYV50=;
        b=jGdganlHgyopP0BA2x8h7+vpy5tmEZK/P/1t+Y7OrsrRZvtieiUaMZR8o/qLJ5l4l6
         8aiDGyH/doLFBeyBC/fHb8YTz7eF0hRtPRgHHlq/CqIPWqXiFA/eXoj4QraIQjs9wQiK
         47iquvuPCVFv2b0IfwcEIK2RXqDldSeS85t79ifq0beauG6tLhDqArJ5Z6SRBgrR86q/
         lc5cJAGyPAMygKc6+BDG8ueBpECRIR7oRHo43s9HZhX73i6k5SX66VlUPPctsSsA7QHe
         vIbtwnyhHRNwXtPBFxvPE0E8l5g0/KnOORHqYQvtrR/vGA2XDDcGkXq1skrA0grA6nbO
         vQLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKyIoMy4c/8alxlHXcz1eIoZPfB2arOKDU62eeYlOTDPyvTrXHrnOszM53X9PMWJCqodrpI9U7Rdh2W5cA3KLm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn0OB+8LGAJeaPsayufUuTJq0zI2IuWd1y+OwbKt0gcocTUGGR
	VqrZkXQQUk0PpxoR9tzFdsAng86HwWfXgUsa6sA1WlGlxcH3jD5NHG1P/9kgiT6OH6MoMG6Rm2S
	ZrZlx1KkT+OxrczxnscstbH+eRPm2aJh1Xwfhb4+FFWMZ2jzYTVSDoqgmmA9y+haKXwU1HrYmNU
	gx19RFzlapCg==
X-Gm-Gg: AfdE7cnv7BuA0Bfzxrh3ZIF/SPvZOamI8fJPPte+1t3AR5LP46L1Z1QeIj6Lla40sT7
	Du1wH8cZ4OBqUUs2QUESoQAEbq3uVJUHsjuX0v7noIKa0/FnTJ6cJb7YKreusHbofHV9ul9OYIl
	0bneuaQO/zz8M0mGJ5nAQ50QNbEKEzlpGdqhJJvC8nhxiI0M1z1d2K2josV/hyBelxPN7EkHwNc
	iWf16+nV1QpKk4u7ZsWl3HoZMF/8xH0Vh+KoReQmM1f0Yk1vHoHdLrocqJSKWRWl3okW4cJD51Y
	fTwZjML9Gp00x2/FlIzybEg+iz4iUPLj6Bnqr9eZE78r5bmG0+Z7IeiglrQQ3u6YWmArXthuJ+u
	9EEcfWfGU+oesK7RxCQZmpBpGO+7k/t0jbhg=
X-Received: by 2002:a05:6102:f98:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73daa8b28f0mr87663137.8.1782903774611;
        Wed, 01 Jul 2026 04:02:54 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:739:97bf:9180 with SMTP id ada2fe7eead31-73daa8b28f0mr87636137.8.1782903774186;
        Wed, 01 Jul 2026 04:02:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dba380sm256467966b.26.2026.07.01.04.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:02:51 -0700 (PDT)
Message-ID: <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfXxFx9rwSwSBID
 9bFlsQXSXClY4MP7eeBzJQweYkVlPJVOAybDKPGnsMoxAyyWiuNjfnnWG1qN6u6/QyfFr+0V+o8
 i7YSGQWBOn0Me7PggvW8Kg9t1+p+z/4=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f3df cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TUQMdDBI74RIm7-lXFYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: dxrFAbeeBY10tumAozua6g2ZRVpWDEFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX/JDOUhaKecK6
 RpWNI2T9FBVskJoqinjHBIfcFnq3AGpmrAyuWLOib/Y+iGJeTzwe91g+7hVdAJEb/fygEKuZcse
 DVTNumtt72V3uCH59hP7IfaqC3es6NEkCqTaV4tclmx6h3C/KiUJblwWrSxFx8SejYTOCcvkLUp
 kdCSRytDH/Bvt+B0OXNO6LdLaPEXpiACHLtrpF61NxpSx2x3qYyW/oYLGt8j89Wh2difmdIrkMm
 WXyRzYK+47uOsgKO6sLluIm5mVsDECNgaspFnruhAO13A1YkYfuAlqWXmUYOH9BY4zBdi509pFs
 AdqooDv/GrtqqdNos49WEs68ekZyJ6woXWvk47eXokOsMFmi0Q+E2oKW12CHTsjru0PkyhtiRdb
 Pvn9NgD7KZmu2F0khurJ1Q60p1vJ21NSKYN4RH2ycdMPCMpUQqGjoghy2A1emaVzWFXqdnR/Yqr
 L3jtvGAQqSVbFcNWPzw==
X-Proofpoint-GUID: dxrFAbeeBY10tumAozua6g2ZRVpWDEFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_120259_871236_93192724 
X-CRM114-Status: GOOD (  18.38  )
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

On 7/1/26 9:31 AM, Jie Gan wrote:
> 
> 
> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>> On 01/07/2026 09:16, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>> AMBA bus.
>>>>>
>>>>> Convert the compatible to a oneOf and add a standalone
>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>> created on the platform bus instead of the AMBA bus.

[...]

>>> AMBA primecell identification. The purpose of the new compatible is to
>>> clearly distinguish this platform-specific case from the standard
>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>
>>> We already have a similar pattern for the interconnect TraceNoC device,
>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>> I do not see there a fake, duplicated compatible for the same device.
>> Can you elaborate how is that relevant?
> 
> Will fix it by removing AMBA related description.
> 
> Shall I update the clock name from apb_pclk to apb as a platform device?

Why?

Konrad

