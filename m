Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4EEC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=; b=oIFyWxcni7nVInyTI0IQ8Bs2Ox
	95zw4lZOcDDYUBX1R8MwKUbLPCLbaf7kaFoT7sez86tT1qqsZO6UiSxtvZzGqdnGJpATd0qEIFr2v
	fCx5E3Lc0QZ1jZYLWMzSOeZZsFK8Jmc0n2o0qmOi7Ru0SGux6MFCugJmReHHebwYKjhPzryJ+Z7LO
	qCE9NzDPq/5XsvZP7Xyj0U42kTtuLKOAvqPEIOPURd/XdFnzHNR/+Rd6qnbYj9KUzg2MCCnJn/4ZR
	JoZPpE1F3VPIpDyCupwYVNTOkncSM7jJ93K68yZ7pKv8cDfGa1IlQ3Fl0tcNohYUrteAxaXJG79/s
	v72lo/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzDj-00000006PRp-0iqf;
	Mon, 17 Aug 2026 15:25:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzDh-00000006PRR-0Kc1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 15:25:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5k6A3454577
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 15:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=; b=Q9gFdM06eRE5sR+F
	MBzVMIv2b0Wkf89NeQBw3SmTfXt9vyrpPReD75/C3+pKgN8bRPMczR2fTngt6sdb
	dIt7jIhgQEYYsst+WcRWRdPeyJNiLOujTGpb6fP+K2JXP3iCe6tQLJwojKSHp0D8
	/M9dXkG09McJM521PbGuy9wuaowRyYUDT8IUT6Qt/yfK5aBtC+CS4PTPv01VrVyJ
	g9ZTRmiM8VVThU8U8qrGxS9jRR1kBohqdOqIlaohDjKAU8Wky3Brp5j5pDHi7Chr
	EoXqcnYUK8XRa6DJb0PUrKCnPf/Al38p+h1Uou2ynOUFwJmjwNNW7c8nyawo+PjP
	XLCxRQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7ksh95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 15:25:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e789f00fso83127137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786980347; x=1787585147; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=;
        b=Z0oVdQiKkYeP5QlEHOGuOZphiK6jHiRNhz+NRZHwEuKljkGDDFNds6sLHhxJ9AuxQg
         CNyT1eRdlfpo3+8ZMB0b9kaDkHcyWaUEvWWtyPnCOUGqkmx6zPhCUBB8G7k3E6QNnEnC
         65427qjpegpadn8eDXKSoa62HwtRKi8gwl58IHmaGReV9opTPcGqZeAogjHMzhb6dfJ2
         AzZs7S4hoRn5dadh2OkaJGW2uPURLp2+VRlUITPa/QLtDR0EvswIKax+QaIpc1T2muf7
         qrEfPCOH4VJYovjSDX8jPXmvZ/IcYTQm4+5xad5xlkAASbru3tJXs2e6FF//mZ+pcKVO
         kpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980347; x=1787585147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=;
        b=FGh0i8r01vvJGlx32/EJUUPkXpge3XS/ziaB+t+yAOJewb70GHPVzxQxQGLdbbRboh
         ZEbvYxP3y2+unnAHSO8q+grj2gMDW6kTKiKL8lV6jC2wWBYRWAmvPkFu0L1gaoa0rDZb
         KODSrmuwn/ERe4XslSLG6/EVPavQ2QQETgaBTw9mhczrZq9P/ZJ8+UsLyo4vXzfR8exc
         ForqA7TWHfk6+HEsBfenJyzJW2EqXyj0/d6/fjQ0T56tJ/2j67Y+e/AlLpWmLCjKoiLJ
         U0kJGoPI6nFlbGogZZb1VJs/Psimv/eXTUs5BzuYSLvNtfEr+89Qn8m76cQvX+ysBIoW
         BzPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFhh2IA6EkPKD4G6lnUJr/PjjQTRp6sKv7nEYX8RV2hKLHCTeWzTBVnL3Q04wGUi1OIzhK/0CNG2hrMwHLFoEF@lists.infradead.org
X-Gm-Message-State: AOJu0YxBE89iNNoqLXtz/gWRHS+alNY1P46GtLiBrCiNIxnNQRlslUhC
	NYUko4aahXbwu8nDpQ5w357QUk20EY3Bpv9wkv1J6pDKUqpCTns5VNMJgzxeloDrgEhK3RBkRdM
	A4T9UMlIq7CE6bdTh1IVucbfLGQGXhAFC4PC6xTgqlJiaJJPOxmj3ujXLd84ewq2JbxFla2HvRn
	zy+g==
X-Gm-Gg: AR+sD11RNBoXjx1OyT4+sQZ2JWa1mKZUwzQajvWNGWpqr4bsBS6m/EXg2nORskFliQF
	utPNBcO+A7bpsMG6vVG5xtGqDHgC45dvf9EGkAJB2XL9StRjyHJ03w4P+UtyX2Nh1LyiWbS1ea9
	QYVEtOLaG2FkklDiwV5N+ubczKb2Pz3iHOZoYHpFnFuzGNUnRsStW+syu1eoBR4zGVV6N3WqvS6
	4EJhBE4NA+QBgwu4mzD2wCtg52a5LtJcsEXHRXZzu6yXzfnNOilreoqiyRkh6eNhiv99uwoYRcQ
	gafkM86FcOMW22jsghQ7Jfi3ZmvSX0IrPqRWapJOcRTUoTayayybHcnYkm8OaGuiiwlqlOcfVNA
	XmTwCIOdtG49AjLTy29ds6oAI
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1631494137.2.1786980347270;
        Mon, 17 Aug 2026 08:25:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1631463137.2.1786980346780;
        Mon, 17 Aug 2026 08:25:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e1a2sm75279766b.14.2026.08.17.08.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:25:45 -0700 (PDT)
Message-ID: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
 <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JpiCfbEqHeKmHu7cFdmmDftBw5FkRzai
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExOCBTYWx0ZWRfX1p40ld3YUQzB
 XdOKSRIn7Iobjkesmcaj4SaJv6wsvJ7ceTNUNYsF4aLtG22HKm9bAX0YMT5+FVBHtdLv9pqNDIZ
 DcNABhj8bIw8Zaqw80W0RzPxESmH2M0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExOCBTYWx0ZWRfX6WFuJO4K6OPB
 hiy2YDsp/UteOYC3ucSK+RBLEZZoMLkyiNV3lTyZHRA2+iE9HQd9YuzVyTxqpPEBJrPW3Fw99mB
 4A5VWS5OdvsnXvqloIdESj6aeZANCim2F8T27b/VAM+8UlDFMm/O5wIDdPgosa1EYR8zoBPLhmE
 88V5BQ+IOdf2VDJzQ42AJD7ex4sOyXlypa3A6Ckj1Sjq0s4dRdUnup/7WQCm/TODftwdPtz7+tI
 fC/YXCB3Qz631HkEAV1yrWvunwk4RZdHEzncRWung3HNVVVntOQ7ubvZqXu2kH3HLa06bljiM1q
 rM8indQYvDsXRAGD18GIuje6d6M6dSo3zxDGdMqBZDygP6RQt66gTAgq782lArFF1JMpc08LVsp
 fzqSFTD80JGPJ1vECbqb8yQkyPykGGzOlsoh7np4IfTrwzqTBbU2HXLPmvnWiKZPt5N94OTY+ql
 I0+RlOZa/KkHN54/QaA==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a8327fc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2hgIxXGGQldiWaMEjnoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: JpiCfbEqHeKmHu7cFdmmDftBw5FkRzai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_082549_128824_55253153 
X-CRM114-Status: GOOD (  21.93  )
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

On 8/17/26 3:42 PM, Hardeep Sharma wrote:
> 
> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>> interface through the common pinctrl-msm driver.
>>>
>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>> Function3 can't be selected because of repeating names
>>
>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>> Perhaps there was a longer name that got truncated?
>>
>> Konrad
> 
> Thanks Konrad for review.
> 
> It's a real qdss_cti_trig1 line - the in/out
> mirror partner of funcsel 2:
> 
>    GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>    GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
> 
> Both map to the same name because the driver uses one coarse
> "qdss_cti_trig1" for the in/out mirror variants.

But these are physically separate functions, even if the mirror feature
makes them seemingly one and the same

> Listing the function on both funcsels is the normal sdx convention for
> these mirror pairs - the in-tree drivers do it, including the same pins
> on sdx65:
> 
>    - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>    - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>    - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
> do it.
> 
> Only funcsel 2
> is selectable from DT (first-match), which is expected and matches those
> drivers.

As you described it, you found a bug (FSEL3 is not selectable), please
fix it in all the instances you've mentioned.

Konrad

