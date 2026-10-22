Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F1606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SnAm2cKQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RnKzNmQM;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLUPZfA8;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8n/A3fd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=; b=SnAm2cKQDvar9qk0WMnw3pKYi8
	qJ7DH4k8/J/+RYyivnPceGcVdKN+FMT/86+58rHeTAPqnppgRK5hTUQvMZ1C/9qmfYGGDBU+jVG+g
	ti9q4yWSGHs9uflhsYEHTBnXGb3ZL/IPHELKrBbTqQVGu9qdVJx/BwrqrKwFiwi4Vdth3i4vd5v+E
	GUYJbheqLPgg2ERSAvMfIAADMyJUBEpKEeKU2CUukWLQpxzTFGR4tKEQL4L0nymIHy4LM4uLnliDA
	5oYGGMGn1/b62y3bEhkjMvoTCy/qOir1GWtTNwuCwmYNRqEix3pETKaxmrbXqHwrtt1gXc74u0pdX
	FUv++QFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnob-0000000DcQO-3F4u;
	Thu, 22 Oct 2026 08:06:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnoa-0000000DcQ5-2KMo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=; b=RnKzNmQMAfrHn3BBkgyWc4jS/C
	ej2WJMw9oDGkEsT7oeYf1zCwxGuszBSuqCWcuhhslyQqsT+XPgx8ZiToDyyAvzBBB52uk9w0RiPuI
	Rt8ZuAwVUav2U1Ur1FfqmBRhAEmsRcDWxEkuHvZ8M9/8XxA0Ky9j73Eyd2cu+/bixnyAqFA0KobC4
	Q/cFaHlFnRY/jBXkTLImD0ufui0LipeIUX36bwaMo/kbgOJBPP7IfRsVxeX4cn7aJx+Uf3jPNAwLr
	aKvCnVJefi1LNZb7+QsYTar1sdTWhtTIKcOgKhCOxNnjGdxgtExQDxCO2WD1E4W3x+bZ0yNtCrrm1
	XUHPuv4A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJnoW-00000006Zxv-2oWm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:06:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Arw4110717
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=; b=WLUPZfA8tRU+Ta4N
	Kjoa0tMB6NuojI2IfQxeCs2fnrqRH0GFmVxi44ALBlByDbHjIU8RRjVq7MQNUxMc
	3YNsIo/Uyza/fELUlZ0THDwT3146BSatc+pT7ivTuJLFwzH02PQ/s2uLGo3JOo10
	4kuR+LmjAIrF1MS3YGE92Ogygw+NAyVntECCqnJ1sY8cZWMCR2XEn66V54x/epGq
	AG9y/0ncZ+W/a12mEq5R1P8nWPEKyLjI56KMUVrxcG9YH8xKpC7Y2GjMXXMdWB5c
	GbHecWt5Nju/8DgADrWHeAFZm4bN8imXOJko8KXyA1MMSWaaKaisbPiWMvxFpvhk
	FuG/TQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:06:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338bd59032so2507601cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656373; x=1793261173; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=K8n/A3fdOAMWYh0UX0x06Oa9LJV3Iw4hEx+NVcbf2ytzGiYM9dn+KP6/yyC1E6A/hj
         F/lCzKNNaqGOXri7vQwkeCYlc8oWSNIm24W7LlpzjiEYYX20F1lSBgFtFUGbDG853WDw
         zdpAJbjzXf3N/UZokqviDXlwD/S25xHROGYon4lMlVwH1ApqrgUd1RyBwzTP7K9T3LDT
         bYfgecKyeMM5j4KYsCVJL5GdynRpjBDhjAM1wBgHAm2DR9/K+Z4QJSe8b6gtapw9I+vd
         nxnQE4XFvMoqqzS1oT6ynlg9Q4t5AVg4mPnQjcTzbyT7vCbaZ1zq1Dw9a66i9PSPQMex
         QaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656373; x=1793261173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=Ddq3Cj/Kaq5SeXjdbsv4ILRHVHqRXgrbyvaV8f7giK3Z1NwxcdVnPkj4KAjKOTQjQN
         ysg7xnURCmewBqInfmKpIzafNV0axlYGdLyk28/VThc1yYJgWomJMZNyglmv+wuqmwhM
         svapcgKTDKRv30ZDfmOA/2sbsmtEIliB6cKzLQ4bQnPOX3YNBRKaLHVW8yE6bNtSFQAb
         9pDhBw/poefXhzsGzdUXyJq3SBhv4iTATUKlFdlArYQVWj/Re7oatYwZFpMsiVdCyGQT
         3ddVs9gsvheOONbdzVS7Qgx7/u75Eckld1h0cKb1PS2kl/ZXG0sNNrsGh0ZxvkwNuNyj
         qY1g==
X-Forwarded-Encrypted: i=1; AKwUvBwWFZL+jWKkV2iUr6Ocs+xO2sKTvKk4jwotZ7aGcf34Qec2otKg4uTYndTLttojMZe9jvMyV3inl72Q+g+pWfJY@lists.infradead.org
X-Gm-Message-State: AFq9FYIUXOXrVawpy5x1jo6ABb9mwwHuG7dEgPM35xZvw3jt+NhMblhY
	iJGF/grDPMwFWos3rceljVQpduDR7wV47zddT/A1HVeNPsbdpCGILvKxmRyGRKQIE92dQUQuNJT
	LyHuPuqiroWFYGSGmYzHWzXs2ODZI9BX+W0b6xbqmt24QKL7Flq+VseKnzDyPHMex1R6zfOHvyf
	V8eQ==
X-Gm-Gg: AYBFou2ayzVI9KIaJU41IoxVYW+injDyiW9Hb52H6aLKHmTm+Ro2zEqsIUIGAdhGTCn
	dhWEu/xrPR9CNG68e5/Ssj0f0Io+TCarZD7fpilydCGZ9mSG49GQTYRXQ3OFhnErukzJYwQPY8n
	wZCNpMcCmn+8pAP4eGETlPGpnXl4Ooko0Snand1CERTx06qXQbVv+njm4owhOvm/4RUxGBj0DcC
	/uHDBhXufLfmxyIN29o3FzRmVQiFXgmrbuBHY8cizZ40jFuWOVcr2uXfPAUkyC91ndZqVKUXrCS
	97I6adso2ir4cPjDr03lpiTzSlV0FQ2ToE18tBn1RI6ozww8gaguHB5sS97+9jRC0hn1QkWESig
	lwaY+3ugmGn/wyZEbbtktrw==
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85542881cf.3.1792656373358;
        Thu, 22 Oct 2026 01:06:13 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85542531cf.3.1792656372807;
        Thu, 22 Oct 2026 01:06:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59a14csm78770466b.49.2026.10.22.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:11 -0700 (PDT)
Message-ID: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:09 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
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
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXx7uhW4TLNkb2
 Ma/fc0f02g1qxxEJ9Y40jjsXC8Hmqt5pGIs3LGV4GjVMq/RTplOnQH+WTOiPSaQ5DhGE1GJlUzc
 F+c44zhExVHb62Zl577vumDYDGZFIE1pLY6zfJ0Jv+cY+RvGqllH2YpS4nOr1sHCzyArh7bXXf6
 6/Hhpa+rrwwDANchiAZuLQOLRBgs/EYdWt+1cB3WRD8BWETvAWoYn8fC4JqbC02hwGsBn3h+MGN
 wu7wd0tWCSRAxe3QgnwKOkYPnS0aAb92xLsqdmA92ECn2h1K/KCqVofVdNlB+prlFtFgvQOm6tr
 WviSBppNn2CK2tSUbbvdgdA5WmJRTsxfIURY7LGFXxCKq8xxEEmAXWWC3mWfUNLQkGZ2cP1l+Gk
 BSvFiZW2GixicA2d9/M8I+EU+w6WjiFZTJe4BEVc/PPVGyAFdkbih2H1j+MxunAwM6Nxq+kXt7q
 KZlblZsWioaxb0dnyAw==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c3f6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: oZMyloODWz7xfvLt_6cbb9L6PUAqFwLx
X-Proofpoint-GUID: oZMyloODWz7xfvLt_6cbb9L6PUAqFwLx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX7Qpk1fRxR783
 Yhyvp8Fo/4ZqbRNChlFjQ3esUHqz5xZlfQrP5+43HBCAJYtKNo0BU17lQeJ4kUS9xoP9AUvWtxa
 1rFDkSLTQ6pqsIlnFlqqXnx7GkXCdB8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_090617_707920_E0B720C9 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: -0.9 (/)
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
> Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> DLC daughter card connected to DSI0_B2B on carrier card.

[...]

> +&{/} {
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +		default-on;

This is a little strange, doesn't it come on as the panel unblanks?

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

