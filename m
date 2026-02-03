Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0375E8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=; b=dmYszBBlFIVZUSQkcYoZTpA686
	oaaoJnaBdiHEnZZ91mXkwEFVMNawKsgD7pzr74GaJOXl/s3uSnfkWyeqi0QweK/LAAbT2vwgnbuFH
	oAbeub0jAYjkhKIzzgKYGF4+6DUPQJVCGLWDZbF0E/bFIAo5XQEtOkWfkHv8EtXcLPLKeZOyILbtc
	Vyaq5XY1AxMX3sEeedtU57doRsIF14cIXsFn23H8DSluOt46zZzuCZZRAWHaVteM03ksi1DtYOLOG
	vthR7xVcVJUUcZvEgOIDZjVUpA/B4hoS65DEhOv8RutaB7fA0vK2KpNyU0PpD92Vzy6z+OwlKbB1m
	Mu9OSsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD8A-00000006Qa1-1UiC;
	Tue, 03 Feb 2026 09:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD89-00000006QZV-0PZd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Feb 2026 09:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=; b=qAmwy9fEUdv+faIck024mbB8lq
	0aruPpCaa+Sp1l9bJ7Bieht2I6JT+gTW/RWbdkcTa0AjOCmLlUKutne0ZRVXBODGL48mOXZ1qDsbu
	2yZTJF7Qequi7vaKH7AkTn8cjiBNINNpIKFIe3LLjPzfyBJtf204LwdHu8XHIVvnXtR5hvIoKmrJK
	IextY4fPd8l6KOW8YMEycgvHFhxl4X8UVIxjSJ5iX6H4IuMI5zJZm1Y1u5EN54M9np+gTjcRlaxLI
	QG+60O5OGDUKrOZNCV7QvKprMwoGjMuguV8AKTSJ6dcQeUr8XgIX+MI9OPUKH5tQXMNvkL88o7gOj
	Ax1VfPjQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD84-0000000FysJ-3zaE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:55:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137KsoC2357123
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=; b=idUPcF9iVsmkfLbx
	qkYFRVlgc6dkVpT3RR57dfYA2kiRP6YXjP9aLhpIVRLCR1fI5Wkkne0J0H48OsAU
	1OtBFhcn4ixqJMKko5uoQUIqUa3Lm4DG6Kw/AZab9+LMR/U2Sd1F6JPOONVMw8+l
	9xNSB9sPU8OurPS0LJ7CT4TkFD/b9R7AcbRlcbjlGNLzHwJzHDwpIqDwNDUCJMxn
	xSxlOXNbhMHAkD8ZKzkrICOh174R4f/hzrB95HT+vr1NjRGNg0j4FJFVgCqKr4YH
	yRzBpYIGH7FXwyUsIRbJYl04ZpD9gALVXELw+e4JsAnUoNFTe1aJXH4qWjQYM10j
	q/e2dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0mbjqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:55:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c522c44febso128104485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770112524; x=1770717324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=;
        b=hKUyqZ/XVlVfUBehqCTTM3b4hpf7hYtLTjWMYZUvGGM9sydwq4qxnRl2Rxx+LOS6Dl
         xGgfCrE9HExUwqnbu67v6u4jqEh7T3fRmT99aI44hxWUrVwU9jITQD/nm0Yho2Toq2e5
         ZJ4SzxUegn5XrVAo2e7wqIdz6YzmT4F4EtqO9GqLkj75LHZ2RnPEf1BhEdwexowlnmDd
         Yt+vs9gu5BiIk9y1spFkMeSW12g7kJd8TYY45fRMHq3Zba6p3LkfVOdNmCTZf/a5+K3W
         Ybz/Z6TUIoEJi5KO2X+bR62Ux/X7YjFs+G/4nc3ymLFcGInMY+QlN5YttzRzjFWbLhXq
         qGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112524; x=1770717324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRZiBkWOvp4q+JM+fpJuSm/nhmi1Nv8wYQT3DHaM6Uo=;
        b=G6xk2ghRELWOqI6LCSchV+NbB0iKKMBQFNWE//81RC80IXpYhR3uYwBBkf9cyiKpbP
         WepLk0dOtwe8vGkqIUoO9RdfxGC3HHCsO21Xs/DjD531J/vMNVRCHtS6i9tTrGTwxUnX
         Q9FD+bbxx3ULBaJoRo5athAZNU8p41+ojveZLs/0dF5PKPyNBVBmmsI/44R9s9TQ1iPM
         9ITRqoQAut2bdRy5rrsH80dEV1kcAnbzBEquNEf/hDhlZN8r2T/8AJWOb7S+8fdMBuL1
         HAC/2mPPhO4yZlfMMUW0KzC7dURbxGXUy4x4kGFt47P0zBhW63s1mVwVeckHECAoJ0il
         eY0g==
X-Forwarded-Encrypted: i=1; AJvYcCUCyOXbU8+HizBViYjDTOGq5EyFpFd8i54gln7z6AtIh8ZMGNyOc/3ruchFxm5iTQ6Kb3KrAlmSH2NTxrJUf6Dq@lists.infradead.org
X-Gm-Message-State: AOJu0YwkkUWCPD646kgPoUNemYuqSucJHIzZZJ8xHcGYvl6LG0NbcPAU
	wvQDEt7BQk77d3UfRxoQk539ove7JfJYEz6L0eI3Wh2L5DoTuzRiGxVtd6vSYsu5Do4+xGPOPVf
	MvuY43XH3lu4h8ItWxd/w37Ixif7CBLvbzEggo29xn2sfWXPgPz+HcuHW3n2Tb/wsfoFVR0K5DK
	XMuQ==
X-Gm-Gg: AZuq6aKcGveBCYZy0BPvSwsNUgfoWBsz3wDs7VLTRmY46Lic6/d/6+Orawf6uyAfZ7+
	FbX4z1ljAVw6NDUJelfuGEUpgOs4yXAmrH31/aFwrD3aDW4ljWe/BAco1hZzjPNuXguqX764usp
	L8PmaWbyguGQydtrLvdZoMDKawQUWBWShx8ouXuQfpqrIGZWax6slXyi5qC6QcCRik+CjVV1vUM
	lrF2kvoVx7ODrvhOxBnK4Qe4tbkwWYO3xV8eYp/hGL5qaoEI6JjJgSnavHmV9Tt6yF14S7z6AY9
	+G0ycb6svqoc2Bm80OZMADFLxoAIeD9CpQqqrncXzjyZo5NxJuovJjOtq7yA3r+BnunH8D2zeUI
	ioknYXk1ZKBX97yDIjy55GikcVYTUUtSUpGjV0ekDva9ltBk9BZTnggE4EPL5bSThqyE=
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1404880485a.0.1770112524487;
        Tue, 03 Feb 2026 01:55:24 -0800 (PST)
X-Received: by 2002:a05:620a:29cc:b0:896:ead2:a657 with SMTP id af79cd13be357-8c9eb131963mr1404879085a.0.1770112524075;
        Tue, 03 Feb 2026 01:55:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed584sm1018869666b.61.2026.02.03.01.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:55:23 -0800 (PST)
Message-ID: <776a83ea-5739-4ea9-962e-c14ed822cc6e@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
 <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
 <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c14ba722-5195-472b-a4d6-3b8f6421df7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6981c60d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WGD1OUi62yeOWj14Vj4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PqSdiVKNMwg68kBnuAPSzzOJoRam-99t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3OCBTYWx0ZWRfXxZn7tE8VByLg
 4lewAN7b89sljGa18bp9llVqpUa72rgpPdGCMp6hJ8b2Bm/3mcdqllLlz4viK2A5LL2JsK5dHRc
 RoJH5yEayEfSEeWiOa1Z4HzR5rz0nYfi6z/S5g1RZeNialDSYI4paZ4awoA7DFpqcxAXpfTkl9v
 z4+6BZyqS4UrOv7m02GsZsO0X7SMq08upqKWHAbUyAKzOHUNbg4CJIjx36zZgcMxpCfw6ZkmR1p
 cRxqkjqTMljvSqOKZAsWnpdZ73w3AOBdMT/hohOd1ifKxGKTZ90oWUXv7C5DYIOWLakM9S4TRN0
 Cc2Z4R7lwGXpqsFVFxcMkwaTfooAiEVZ/sKFpwX61iARufj8yhepeINaejcxYIRkagSzUs7BADp
 Dm3k0Fi+priKgjcO8ggUD1B8j+cjKVVWnTPQjfVDoYr8jP+eC4Sc3vOIcJ9f1J8xeGSdtfV/Nxp
 aPC2t+hTG/yNVOqsE+w==
X-Proofpoint-ORIG-GUID: PqSdiVKNMwg68kBnuAPSzzOJoRam-99t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_095529_281130_DBFDF8D1 
X-CRM114-Status: GOOD (  16.54  )
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

On 2/3/26 10:50 AM, Jie Gan wrote:
> 
> 
> On 2/3/2026 5:44 PM, Konrad Dybcio wrote:
>> On 2/3/26 10:32 AM, Jie Gan wrote:
>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>> tracing data from source device.
>>>
>>> The CTCU serves as the control unit for the ETR device, managing its
>>> behavior to determine how trace data is collected.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index db65c392e618..88ec29446ba1 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -6771,6 +6771,35 @@ data-pins {
>>>               };
>>>           };
>>>   +        ctcu@10001000 {
>>> +            compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
>>
>> Sorry for not pointing that out explicitly the previous time around,
>> but 'hamoa' also falls under the "had numerical compatibles" category
> 
> I saw the dtsi is renamed to hamoa.dtsi but we still need to use qcom,x1e80100 for hamoa?

Preferably, yes, so that all compatibles for a given SoC are
""namespaced"" consistently

Konrad

