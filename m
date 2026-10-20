Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x5Wwb+hc;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=niUAHtj+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1UnGiSO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=; b=x5Wwb+hcu98GpInJb2uYn8oErF
	RFPrirsdR3lQst5Ad2frpX762tcQmUYegIGa0qq1DFNDOieECuBrCKSkC3nDbnaIGN4uXrEIMHmEt
	gXHO6+oqjwonGmJ+mulwLsSNCyrGbLapFlx8UjLvK5KjNywi43zJF3JX8yFhD91E4rwvviM5powpf
	7RM7Sw+d+Ux4//RCQj7qGeEbuYus6mISYLuXuj87o9pCQiUW87Rl3JVUmjEJU6z5LZF1xaH9y78wY
	AwLIfLpP3iJoj34CuHnxz4FmkrdhCtlkKh74w9uqmy2S7NqfF0ddqTkS6Ndq6HKaZr0RIvKgPt5i3
	5MHkDMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJANR-00000009rDw-1rGP;
	Tue, 20 Oct 2026 13:59:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJANO-00000009rBi-2nwN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:59:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA1SD2809604
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=; b=niUAHtj+Fdseix79
	i7hZEjPU6kpD5iwYP7SQicrMCrWop8ANv9ccdB+MAu4XMVLdi3vXj0FFqmrjAETa
	Bp4kSfk8l0gjsWkLgiNfMjq5sXejMfKVoJIcKzdGr7eRxo1SpE5JRE509X4keplb
	3SQRX9WV2CBesAyKvhsOhbjhbibNbq4Gh6E+1F6eAVhxTQcsJSR2hJxt5pJu7UUb
	uJ3r7Z1WeqSbHkLarPLEMdjW6lKnzELhtOUugE/MFWLeMjHywHCrr44KuxYffy4Z
	BHs2P6n1Tim7N9q9GCh2x45YB5rlFNABP5VNSX6cO6RSYIqv3G9wTVuxJQBiTWMu
	8SX49w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2sgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:59:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso34171285a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504777; x=1793109577; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=N1UnGiSO+OEmfmronRHAo4QxqR8Qihm4IJtYhWJL9sXmJmLFaoki9LMUTVHppY3RA1
         M1hVD2T04Ypu7xmbD6hkRQFgeGL52K564D0nHJTBKIndv6LoAOpkTHXWzwf7zO7p0ujO
         si626yWgN/TuTWVN7UhxZhKZZHIDOiRaE9oocsAQ4b5vy3u54+AJdDzPf4SMw61Jltt9
         GmQF7+jfwmhPTIqFN2iTuSzAd/ADQaZyQdN0vRB0NLSnvFNdk4G9i3A8aYw0iyYrtGQ8
         nb9wB+ubg+sHKHBSthhLu3MK5dmy4lzfk/sicccFARNlqT8bd1ujaSmqlHmwlvXMfqhg
         BDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504777; x=1793109577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1SXnPGNUvUddGrYhMLJ2FZJsi82nqvg3oxQOqmRtGw=;
        b=euqZKSSQEvDsSNTAyYlknFzMA2qbrvJLP+PK7GapHYr3wZaNbBslvZ+WWNjyqCK/Q1
         CRcDG7MNhIW7Nd6lIfrM+dtnAWaUVa8mAOA1sWPvez+ubuAkh1e91jV4ryN6nl2t5U37
         8zYxf9VAZdsN4+qWxBYIa+FcMnCWtOACyIGzGVl3AxIAy2G5qbDC5IjLeV5swGbnCU8m
         Y/c40ZRLAQWvqqAK9lsYaXuRwOCaGUnLAxubdsBtASjespUK1Y2wcMNw8cuzEbeZjpi6
         ue7WmRGBu/mNGZ1l21Zr1iUBAtugT5QgVliXILKFEJMp+Kg0kIO9uavK+OVmtwKQPrY3
         58bw==
X-Forwarded-Encrypted: i=1; AKwUvBwbEM3RgKh1rkxpMQmQCkk9SnwJfRYZi5Fou5Xzt4CofKyKEKoqHJ59wvQB1LJp7bZrcUWSIZoKv7Zf77RMl0Bm@lists.infradead.org
X-Gm-Message-State: AFq9FYLvP7yutc3MUChRiUU+LxZoXWP+noH/aVwGGFpUL+/J3QwnLz+o
	p74mcA3hgZZw/KXCsJYT9/PdKTI//tX53hDaNRxFDQMKGOIxj+p9epxPOIha/qq0/hxVg/4YBTu
	+t2/EmcZ5f2XNki/f++k0WolCyPGhelAHSTkI+sZp9cIgSrtKfQP0ibv49KghzCEBm1NAURjEoJ
	k9PA==
X-Gm-Gg: AYBFou0Ko6o688RR/wbt0J8vTQwRdrCYLw4USfBsqzAbE2RU/p9mEQ7UZUf1yI2Sk/c
	RGLih3iaRrxCG+Zu3D4Vbm77Cn9st5dmuvx5zVP1Tx7e9dJzfzesWI94ZXp3MpaaOmYmwyD2J+f
	0Xz+juuAwaH1W15pqF1/iZFeNsZ8bgihLhBIwkyU6f7xus1IGjxIRt0WCBjsHvsE+yTIhC8dMdh
	GEx0Q4nkXWMFNQgLI36pkoZW5vgL4THGSlDnjflZw4N3D85Urk0T6JkNJ6KgU/YlYeq/Rg9ivei
	pjogbeWMZyJJy0iGaPBlG0yOTkH53NTL6rwxOi5OjbEngXbYGfzEmF7CAvo97/XEc0I+ighHuig
	Oq3dilaSpMhaDUyZUbFuL4w==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188995285a.3.1792504777234;
        Tue, 20 Oct 2026 06:59:37 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2188991685a.3.1792504776850;
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm485955766b.7.2026.10.20.06.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:36 -0700 (PDT)
Message-ID: <883e7b91-d2a4-4c3e-b6e9-32d0a87361e4@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: shikra: Do not mark MPM as power
 domain provider
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-9-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IqdmBq8ZEzKhxxgGNhCVvn-0eQvcde85
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX6WhVLKCdaAWT
 I2CjXNVsd2s6IcdNdvXz3Dzsocu/DpHOI9cmGN7OSi/QHUTvECj4M78zFA9NfR2W0elEPv4geKE
 QuSoEZ9x+kIFaKYFE0Av4RKfeRlBWhc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXxgHVnfWGqqXb
 nRwEE7EFi/yjGu0nFUTtZN04VzAiN8Q4EIn+d0NtlbELfHnA7iT5u1c5thl8kcn+ctf6UVZQ3dU
 fwTqT0HatYhT0kfaMb7IImHfZvDtMzSmRLpFRp9J6PjKfJvCe8wMzfrtueT6Apy261oDVrg0f5k
 ZOBc9MWgs3DnC0deCPwhgVkK0XSTs2dhYSj/bnaK50hAMd09xC84EscKh3aHqLlzWItq+CCcdfA
 0YRn5mqesqJC3AXmsY9Y6zHO2F4fz5h1PlrCeEg4YPVDhvqD83oTN9RSiZzjBFqpx8Bvu/5qxmE
 609p13FF23Pe/W2MOqgXLZ+mOYi2BcBJLBs3Xzmmdfg3RVIeWyKo1eoRyM5loTRpa7J9mOIVdZ3
 ZG1VkIZ68NCmQA3EZwUj5p9zhD/2rdLKYHE2L8/gv0KJArAuQPB7l28JYOgQKDj4Wn8UtLO5K8O
 Gf84LnmZffOh6EjkDLg==
X-Proofpoint-GUID: IqdmBq8ZEzKhxxgGNhCVvn-0eQvcde85
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad773ca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=F9CCb8yx842l5dURUPAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_065938_729393_9CF43193 
X-CRM114-Status: GOOD (  10.87  )
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

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Patch 1 introduced it!

Konrad

