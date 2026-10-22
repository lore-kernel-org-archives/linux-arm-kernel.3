Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E622D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dxCW8R6Z;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwdV+474;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ejerT5kx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=; b=dxCW8R6ZpRVF9d
	k6wlK9LBPHsYG296WGsYqtChkzmDAdH+5zZWfrGKvBUQpvWBpmRnN7+LYSZ4cohTcEFKPAokvlpOf
	Qf7qa5LZJiCN8JKlvHdhUpAsrhPVkoc8Wl7hY236spmDEeavl8jhyggzeSNFhG6a5Lz/6W3QkqJd1
	7pN/2mgRLEt+9tj8OFpXD1xBEE8Pplpg6BYj7xqqrKC4kdG/D7s9nHCjDFz0Ihr2vugfkhigxlcw6
	qVqvSchvL4+tR8axIIdf8LrVdPgiZu4K8IP/HJnBnshIETCvFmxddiQs+LF/JI2HvtRuPfC+pgETf
	5cdmoFvTf8jY8J8sPoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoj6-0000000Dn2n-1vLg;
	Thu, 22 Oct 2026 09:04:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoiy-0000000Dn2D-2p4w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:04:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70FYL2516191
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=; b=iwdV+474yLO5p50S
	vwhffizSEih/hIHI0dZ3QJGTkQPu3Pab9WOI4nahgE1oE2+USj2yzz61VZlc8u6I
	IzEcH93XSHV7M81IWVRGfLoFN64HyJMzByJ5I12MzYh4jAP14/PHX2J8c8vlFxOb
	KQ9ipcIJvarE9FHwREmHE88evVwamVvQ9i3VoqwAqpTqtyrN7jLZDDdmqby2AJdP
	7ExLBMF3XMWGLagjG5dtqZvwSAt67oUJouFWiKOK1K1QKTdBE7rlgXtJtvcIvtBg
	7Ki5oDD3DVd2A+N1/w4I9JVzvo2/5DK8QqPsHyP7FeVbecNnTkEPbznSAbVFjgxc
	70TDfA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9ky7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:04:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91795e52969so4378616d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659874; x=1793264674; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
        b=ejerT5kxOe/u5uG0QD8IH44VBrMCnkXgzmDSe0mywxO4Z7DHWNUIbETSHjDUwFgbGf
         WPnWV1z6e00S/n1gA6DsU2e+GMRP49/w2KWMM7aBpvDkgZZkT0Vt9sky8wy23t4QQmwA
         swdj7GCeFL8CTUOXbyPeSWX0+Beg578dwJrVxZCuv6lIHhOlUSBiXTEyp09MTffJ6VW3
         7gtyR7UMRlEk43duheBq565QTz9q3eutbZKkW+KnIWiaMr3P3srx2zRBix2rmK3eRzjO
         GMgdC1m0qh0CmLcstr52B4ljZXAF1CtmDMFBbVTDnXG20bf0S4edTzVQ24AL7u5jnA0Q
         5mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659874; x=1793264674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
        b=1ZS9gYqbTtIb0yKcoS5F5iyP9yFqjp5y35whsMgI6CYc7h/bheuxAm78WM6JusrDlW
         8oyjekvcs5oVeLMwfRziuXX2WsCaAkuTMTuN4G0S0UwWasduldnfGwHq1S9fCl7VIS9V
         o7kI6l169xBLLrBF6n2PaRHtscxIRRiaTop1zUs2F4ha9c8CbeuouO9atoIJucXnn44o
         0hEEmjFEMj8pdoC4t4D3rxAKfEXAeZ4L6whppMev9ATpeKBbXCPim0pkyKL1vEmP+lPz
         HNxIiqxiaKCSAPJVdeGWm1bAnGUEHTg0WjIPDDXG52ftP5KDjVXe7o9azZp23ras0v4O
         MkpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFvm3EvTwtEBuXN/Dul8wLBVJxiPsmbAlxmr5lMFEiUHhfLik3XcyZXLcC1hhxpBXuAqaPOE2uaSkaLCOyBIm7@lists.infradead.org
X-Gm-Message-State: AFq9FYLNLKDJUrbNxHLJSk4r6yhfXOiCaBmoifRhOi+amPcU8SqeqjRR
	twOR4CdrjdYwpFCFxk3RejDWRX4KUZ87QeY2C6qLsexoxS2mVTZLiim8Z+Ph7NpJ2a5knYhhomv
	c8m46SxZPjIGv5n8Mkk27IM7jItCBfwnFcX8rPlQXRZiBHFYvP/6dKWv2LmDmAs6y+gUzVn6TgX
	3b3w==
X-Gm-Gg: AYBFou0o1rMLFBQonaBjuATRjmJIxKDKt2m9/0ft4uaJInmYJVotEDbj7RioUAZWXYe
	BV8t+JfMrPz/nG0uCj71/XO4HBG2SpDI/beMNZ9KZy9g25aBWq046XAo34iMxwknunR28KbpxwB
	hQGAfQJLYNisLuougol3MDyQT+0m/ma85YEV0KFisNzMhsnu/ufc7YlaWzhKjw8HRVK/bQyqxvH
	S650K70uTNApuxyqp9tAi6HntDqFYtdB9HLJmep0DsZbjGumOPlI4S8fa4ys6ec+CFqBKm8y+32
	DWUVet/6OglD972d6CB2nA+R10PHHL4wNbiY0Dl6UFvg8fVQY86fGoYqxnPBcVhQ5siJ3V/xdH3
	q+YjJR1irtF2OgQ2EgSj9zg==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr903740285a.5.1792659874202;
        Thu, 22 Oct 2026 02:04:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr903737385a.5.1792659873706;
        Thu, 22 Oct 2026 02:04:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f29aesm85858766b.11.2026.10.22.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:04:32 -0700 (PDT)
Message-ID: <97c2268a-0cff-440c-8e21-f19a809ad377@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:04:30 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/2] crypto: qce - Only register algos if the user
 really wants it
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King
 <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        stable@vger.kernel.org
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d1a3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LeLJCEefvvVT7qkYm4wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lMV9Rd9TvVUkgfCTCqTieuUmL2lJZQ2d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXzsP9uz0jtqr7
 HxaBFm7bNCaTpziGZ6xC6pkLw+5GoAlUfz05rdlWRRlJDOOxkFy+qIG4Tfp9m7tIIRnTlsNjQEB
 D1vSXFlivM2eInhSiNdpthZux9X8m3U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXzqMKe8viMfqE
 VvEpXNiKVk8nFxJ+dT4dnwYC6rcAuh7YxUkF++8j2xQ55Fg4sqnQ7tIbiTP+QMeam91irxSMHAQ
 O1lsEif3g8XsodGJcVVoWEF3ZQb+xH5R31+QaE/UTL/b0HXpdQ6tAsQQCd1bsC6W002WIPbjBsn
 l2dnmb1w5qSifGqhzpm0zYh0ygr+Q7EktdE8hVis3y5wwJCo45aRfE7rHR+8+j4jSSvpRbukWPl
 SofPP1FANP/TMloNXYA8vH8G+s+ryljvM41kthv/T70ExU+jDshhrcrArccm4LHRox6T/DJTFOd
 PpoURP98i6Lw2sw2QKbbcb3COtmna41if/zE22miSWN81N8UZnAnNEANIMo1MFqWAv6SnQbG5cn
 w0OyQCI+bapmo/mNZo1xzY3+7im+SWR3GciYLpmqCCnwORvXd07jme/EY/bCxnqSEVAt6Va+3B0
 GZ8QxPYr4S2X4Vzek5w==
X-Proofpoint-GUID: lMV9Rd9TvVUkgfCTCqTieuUmL2lJZQ2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_020436_735091_F21D82B5 
X-CRM114-Status: GOOD (  15.95  )
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

On 10/22/26 10:57 AM, Bartosz Golaszewski wrote:
> This driver's crypto algorithms still have a few issues that need
> addressing which don't currently trigger any self-test failures. For
> that reason: don't register the algorithms unless the user really wants
> it.
> 
> Add a module parameter to the QCE driver that by default causes the
> driver to *not* register the crypto algorithms. It will only be one if
> the user explicitly passes the do_register_algos argument as true.
> 
> The power-management part of the driver is kept as is to allow scaling
> down of interconnects gating of clocks by runtime PM.
> 
> Cc: stable@vger.kernel.org
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

