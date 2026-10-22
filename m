Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bsc5ctOQ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h0htjNc1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FLxXXfEN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=; b=Bsc5ctOQePGRmMkx+8Gl3DhW5j
	u+fFMvQygiZnGV2RkAWUsx0rRwyPosNqdE/0lvWV9qQ/KSckaJKX5itQAy45nuK35dsccjUgZmEgj
	o7eEhsRHjzFeywkSDxyIDcy5NTBvACvD3nj0yjvqvZ/Wl6HOBt+oXnuy7biGSmZYb6hTVykqH2VL9
	kEgdU71m98ObbpybDuFAzpr9aY9lw1C+0Ja4cEynJDzGcN52OMVzLuEssQ//ualWCG0Cx1vtFyYWe
	YjIAPVdgPtybqxlP7iYvnbnlau65m1+D0WCgVqJjzHeIwD1GKXVQheIrvKhqG85mB5NxCTyCiCv9K
	rVIjSADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnx4-0000000Ddb0-2uno;
	Thu, 22 Oct 2026 08:15:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnwy-0000000DdZQ-1YKF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:15:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7049w4110612
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=; b=h0htjNc1Gi/TTbwB
	2XaQK37cydh256mj0l2Rc0f+BGpNaxoxQoc3hEBAJiR7L3RhAtuyzKVwwDMbLSnV
	VUuVpIM6jVR+bqd0f0HzxHl74JKQJye2ntDhuLTDGdvPa5P3o1scr8nYIFij6S1S
	FuYvYcp+PvVTbmR4BuLvOquJqncLx2xoD7pv7k2CRu+tatmn2nP/UhSVv5D4fX14
	bzLmCHY2bJ5MA4by3LwBTlXj5fvFUqFaZwiVek1eGkKeaDKlE3ofgWNBgzuIXH2C
	gJ0GBSlNIJa4VNvuzs6L0EZH1OltbNx5X/PnBopbQ32Zd0hdIc9n6i5965OENs41
	fSzl5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahdt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:14:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso22036885a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656899; x=1793261699; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=FLxXXfENr5J7DWk/WQ40CsclgY/M1R5oq21sg7kkF1Xh7iwvvbkEkCOAxAGV0SIZV6
         tjdlT1hQX04PmWxwSpWCYOpOJ5GV6onULirwu4HLrZr7e6/hCI8bfT8VKMlDV0NoIFGi
         gaQ071YmiRTxdp3GkW5ozSY5FXPza5KyQeOgCkvS2D3va6F8bATFffzGGeZBCCvkxvpr
         PhUXVFoAg4wY0Z9nVhDpTs6ePrUCt+TOLHGGyQbk0xTZBzgBb59+eEmKzYhLt7onTUKT
         vi5hfYUd73T4m8s4PHFyB5m0ODbf+wKqP23IIqCHjYrIK4YcQxDDbkxPnsF6Qn7eTUIr
         6bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656899; x=1793261699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUI+hmYTCu5bYV+y6qlEdBVQQJXoW4DLqjJoc6XO/JQ=;
        b=iquggUd3Q47d4ZN1EAQvXwws/Q1Yn6prS5r2yU+glxdtD0qIChc4jtSd9RfnxykzAp
         UIThaspFybelBuEYhJB7WY+SmyPL/KTmjkmFJHn3i5h6n6XjXJ1lZ/LLYnkdMduUP4Eo
         pAW5ks7H1JU35R+WD9dY2Ss6CXjh2sgoMlCedwJ12I2wJVzyP+f5Wmk2vYbK4I8nXxv9
         /fdzmhh+Fsm3DBXAKtqb73wFCo5d1nyQZH+tfXiEoopC6utlAyDxxcVPU267ZD9aFnsQ
         R1RDJFZ+PFAnfRWPulAUXBUNRHg9Xicm/4P5AW3ikwGlBvhIm8KckltPYlJgPoEQXpg4
         Gdsw==
X-Forwarded-Encrypted: i=1; AKwUvBw7R/P2rO69l4YBlE5nowdp3qYrFwvnah9IxI/O0MW+HXXkH1XGJr8fEHUVlyapUsk8nMzAvSRftU+2q2dc0VGa@lists.infradead.org
X-Gm-Message-State: AFq9FYIvyiEh2qCl4ajR5xI3SyBjZ9GPjXttwM2gC63KfQH8LpkxSPif
	9OTlqCYT3G0mKecW5GpqMKjVfAQjpNVgLL7IkK7cOtZqUREaughYjlhVd0s/U+xOoOya13R18Eb
	gA7JCz1P545QAM6jsTy17DveSmQM+mOEhw+69MlkeDDOhBcBHAuvXq3URVXj47/gkJBk5uhAdOq
	ONQoqt8FOBAg==
X-Gm-Gg: AYBFou34CDPper0ms3HOdx/zlPJb0JZJWA8YdVTkjUU38wzCYWPNuFIE3S5E30wLokq
	w6PJK8j3psOTKXwAj8HnuHSBMCWBQgRRE99Bo5ZRS3FMLvk/bVICOGSX40E1q3MZForkgORux8B
	YB6a0jz5COPvFCH+uzuU5y2Ck+rnOJIshuWLV4EtlEV+Ci3gZ1m/xvNIwTNVDXXJi4oki1ulqSJ
	8YAr2q740ReUARLI+Vch57/LpFmMeX7K1VYQ4Nc/V5Pxecxt9Vo2qaLRmZJqP70JyvCuKZxhZ/q
	G9JU3TZoxChy5GmFTf6YTTcOU1lBsayexux2EvBZb4fVxC0iA+0DPm3f4obUQo0nkZsBsFHfy3M
	3ew30ndnWnpmcLRogKh68lg==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970996785a.1.1792656898913;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr970994985a.1.1792656898555;
        Thu, 22 Oct 2026 01:14:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c1c3sm80367966b.32.2026.10.22.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:14:57 -0700 (PDT)
Message-ID: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:14:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX+yDrfNh2ySW1
 ewHrf4t2cQF9RJKYOdk5FCZVpuMsOmSkuzhnv3M6CgCzxa5HRRXj7jJFhixR5kIBwMHHayFbQY2
 3ESSPEm8xniDnjHaHOsMZ5Re8NpeANj0dIvBy74ndKNVpuu6UXlEoEKLVZbYWTKcyvxrbP0QK+j
 q9AoEQQWmCOtUkUARUEttMpk2VGL/DUJIyR7tmxNqa5BPa5Dayv7+aaU9qhFFe936QTqhfiSRmP
 I4bjNs74RxXiANrSPATab24Io6QlHBmHf535zVK7oY9oC3YSpS1CR1xqc39+lWDGEgIxZXJgmHH
 dOi1X9ufhVZon2Z+BPoQmSzA4vjT3jW7ski4lNqFejLudJSeFRQNXAkpcyfxRCyW9CngdgfCfrR
 3mhkVJlgthNdJ12kRJiJGAwgovF+1Xo6v5yHnL0RsUApO3XIiNnMeH5MGxAoNh4m/JWt2Fxn2qO
 SAWc+7DfKEyQkXEOmTQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c603 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XF8Mg0B5h9f6Zh5FesEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: is0C2FMlTzzDwGQze8VELy37qCGuy18T
X-Proofpoint-GUID: is0C2FMlTzzDwGQze8VELy37qCGuy18T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX5LEfjRAClNnu
 Nk9pF7nTTcRLM9bAMm8Yk3YaSTHZWy9PYj44W1dOkVm3EF5lsqLEOVHQjIJ2y9KccFl5YZVRWMc
 NRbJG2NJMpzJmlYDxyxlXwBKjw4qN3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_011501_165118_B96B366C 
X-CRM114-Status: GOOD (  12.12  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> DIP switch. There are multiple daughter cards designed that can be
> connected to this PDISP1 DSI0 B2B connector.
> 
> The below B2B display interfaces are enabled by default in base DTB:
> - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> - CQS/CMS: DLC0697 DSI panel using a DLC daughter card

But if they're daughter cards, they should probably be overlays too?

Konrad

