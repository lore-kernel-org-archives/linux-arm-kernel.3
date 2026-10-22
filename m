Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F524606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9430X/t;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJsLT3/1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzEB8MwM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=; b=R9430X/tSn4x+6GVMki3la6vtc
	p2bugyoybZHr8m+l/CMABVNiXqvKrncQCWJ5/TIqQxIuf6cG3Y7TrIlbfrK86Y3GfZi7AAgLQ1K3Z
	cfQGGIJsxVnzabVCoyw6Zd+q8+t/mN0Rb/2kW1GmTXwhG+wqa1AY9doYBixZMJzrI7UxEw0s0mEgN
	EF+iUy1sW91h+CyD2yAnHkKbDdb5jeLlUhFzx91vecCZQ43KAEISS+KHbyfmSS0hUZzgelDE5BIkj
	rw2GwX2eT/LqBImdYOH4cNtGK4HSOPr+wFDoNooP3TCeMfl2znQofwPE+Qm3ToZybImaycnXAG/4f
	xzFE2lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnov-0000000DcUl-0X1k;
	Thu, 22 Oct 2026 08:06:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnos-0000000DcUH-11Nu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:06:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Uic1564455
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=; b=gJsLT3/1t+6P8kg8
	WjfolO8NkEf9NuXXYOYi/ibaJQElqu7U7xuhvvhb0WI3Cx/pmRSSv1uR6GPPuHdc
	joWkaieN1xjaB7mX73lFUgFKjFUoDDjLCTsB9bFLFD72UHXJn/HdGw5VYTSi5xB2
	xyFxvyzZY5HpUPPVZJtZ91Xcq08qIayFgb2pGYz2tI+Z9WpEVvenyJ93oxz0X2R5
	XnGOUQlUFwb3rxBpLrEhC6LVdW4N74wTeSGgTbw4Qk7UuQAoOFWfChEjaN7HOn21
	d0ZOm7W53FjEfZFaKs0KI7qLzcI93PYZ2jGJUjOAYoupiwDSOhFmZMi+gkwvgsRR
	Q4kr6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:06:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338bd59032so2508191cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656396; x=1793261196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=dzEB8MwM8VeD68VahGB9PyGtWczg2cZycB7ShsltCvoZuzarYsknSZcxOpf35yyXH2
         mCluPxd4mryki+TSvOedDkLSb36h4o2EWJyEYmrpC/LXhroKXhn1Zti4hk5JKMrtbphk
         kKGL0JfvoD8Cm4mtAEiUUAIsUgWjoVj288L3gAiXFr4np5za84Inl1rEDdWqTpgK2tDw
         wJD00hMz57hsQbfm+83NTXrgF8dUkLLJ6D3aJMPW9Hm5uJPwEyDTA1Goj0OWttqR6BxP
         ZHCMXn2MVmlOEf7FC7hxHgg1rl+FLrdQh0vD07yRc++G665TL4u0sLeEzZAIjq48rXlz
         A0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656396; x=1793261196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=i5BojYOCA0d10NE9YzMeIqnfS58mwQoRpoH0mQgo2Q6C+ui9QIDm8qT8ePffhIZMZH
         fAltl8e4qBo29gXKNb5ZyKiqSESRhPNfmbnaTpE3uKKZOh+4AunNY7rQkrwU8GMYpRjZ
         X7Ez7MHHNShv0baO/w8gOl1Dvh9Dxd2E7NM/FckIkx3YvrDCNG6q/HfEPf3HwtKN6Ipb
         /M64UZK23+I/8Oj87ZbaJm6cHG904iLZqCp9H7wCtjOq8L7RkK1XaAy/tRRxhZekPB/r
         TPp0R5Y+u26qvyNUSCMlIXhLmmYYhBoxzfyjyby03d/7n6RbGv2YOZYeUAi5gs42rUom
         yjzQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1nOHP5+R0Wf6yhaunuOH3lS059FAFwj1uOxMoJWvwoI/IFfb9DojtuKOG66ndBqrwYfa7yRIZNaY8Qm4NxtRH@lists.infradead.org
X-Gm-Message-State: AFq9FYJhCVbuRlBDCyk1oho0UxCXyFC5ZhSGD7eJUfBhIFmTHgh6+P3n
	/U8A+Y/W8B/P+0SyLuexiuGA641YnIc9ZYyH2PbV46G4HstfD1Dax67fGhSK8ef+QYxGw7X7U4O
	Cs4GB8a47+bNGnuL+sIKwA+pL3bWSJ5/jLEEAMKQpAn7ta8tMWxpnn6ssPGnNY74emN5kQyPrqi
	SgnA==
X-Gm-Gg: AYBFou3UjNvdXrMVv/tSeDQUcUyQn363enjh/LTw2VXzrqi4/TMfM3k+d45g40+baQD
	U7I87EYFn11aWyXZbuAUFAplkAukuWcl1lEo2uS8xRcv645uzY2sd7nBkn720aOlYkoIG+sezIZ
	DSc6Nq8tItwqPEDHvukR1fhNvuvJG4D5m4cHArxQiOS5dRTdwzZVIO9v/u8MFfJ8CL2yTYv1Lra
	U8z3S9kuTln9QjYneh0rRI49vfBIU2BHF+vifpiUQtdJfSKoODseR2GbC+SZDmg+MKxNy7mO7ak
	kgjC1UYCRU7ETB0wqvEfW0haBDCouGu84LEgdZC1HKDOJ95F1IrCkD1WXlTGKLDd/toTGLC5DIv
	aeTjc7gn/kOBH9ig5uNJqDA==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438611cf.5.1792656396251;
        Thu, 22 Oct 2026 01:06:36 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438221cf.5.1792656395805;
        Thu, 22 Oct 2026 01:06:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm79781066b.60.2026.10.22.01.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:34 -0700 (PDT)
Message-ID: <d1e5541d-3bbc-4079-82a7-b0b4d1604048@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:32 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI
 panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX1iQgq5aYKvYB
 js+DRBnqWAWt+r/8ruPHatG5xRr2hpzXW6WkjKVUSN+W6SEivg99bXkBp7cJB1bMJqmgKFdjxvs
 0wH9U9W5mk5c52nrqiMpopiMuSkoFnWEBSpPgnWh9DTi60v/ZE85Ayhtb2ZLqAjXKFObk0p2pdk
 ZrjCacRrXvv4LC77LCBd6MR/DVleXWa7UjZjo1c2FaU4ftLBo8x4dL8OEOfUAdT9NxqZ82nVIKS
 +9s0vaQDk2rxEz2FJ0UtQLsKraBmzop+GtXeciwHuP1C3k+350mTa/HFdo9jIJxLiACiEnU47DO
 fCo4y17k4FuCjZpRPTOEPUpmCbJRYjZhEBCZMR20t3/gK0unTYPurY1Ii2u2Bc4d5+xALCSIQSV
 OcW/tjun4hg4Q83VIe7pzDCGPtGB62GujYTU29KF7DyY0mfsJ5LjaXi9FMYHdqtrlyxp/gyYQ/A
 5cZlkVUvZ/QbpCNU3lg==
X-Proofpoint-GUID: vTcJ6Y06aitkG5gqXvsL7WTBhVcIGzAQ
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9c40d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vTcJ6Y06aitkG5gqXvsL7WTBhVcIGzAQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX/5axF2fCOdM5
 k4Wiaj3skB29hEx+YB+2sjSzD8B5cTCsoiak44YGNRS8A3RYOZvL4WRN7y96L7nMqjZ5S99ihgy
 GXawsTmZA2quqU5qD0PWwSaHx/I9mf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_010638_325714_4390B718 
X-CRM114-Status: GOOD (  12.31  )
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

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
> to DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON for enabling this 22pin connector.
> 
> Add the regulator and backlight controller at I2C2 address 0x45,
> Goodix GT911 touch controller, panel power and reset control, and
> a 2-lane DSI connection.
> 
> Disable the default HDMI bridge and connector in favour of the RPi
> DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

