Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yL+bMNaS;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpIwOsiV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JWgyLgTm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=; b=yL+bMNaS6p3d66IGEU8nIKHdk0
	vaD/JDI2HjzDCU1gsF2pR1ZgugPbP+ck+GA5CoQk+pet+1ho0o7+tbUmasUaWgXBvyXUQ//OWv3wC
	vDcVN9266nOKbypFB0CcTzEDcONKMO4zlhoNn+37Tz+yCZQ/79+MzwgaWV+sc7/LQ3aFSZgq8ypen
	PH7l+yYDj1VTDJeBWP8tbDbmbZpjY/PkbWRl3lbj+yNWgt3G0JUaIbGiddBT6jZukE9OgKWwgL2pP
	ZP8l0Gw5bkVeaWHXzotlcG7xCoB9tPImjXOzFpIIvN4RdfApsj4irIvFElW6wMZupQbO1VnWUECsw
	Bywva42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAMv-00000009r2o-07U4;
	Tue, 20 Oct 2026 13:59:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAMt-00000009r2F-0hJR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:59:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9vqT882037
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=; b=gpIwOsiVuQkaB0Mu
	bfmPS4Pk6svYoT7gmHD5CDnVqhURDasrAq2OZtnaWrFu19VosjQJT6syIKCdtOID
	UXSsMMUyQKtNo8JbQX1os39o1RQXoGru5sIKVw8ia4yRFb0a7ib2QOHaCV5awtT2
	xHgfBeq4QV0usI43rBKk5KhLTb7MO6Eax3zufuLgUqqaCSmKQ6zkHxfdx/qF4KGB
	fPfrWLqQxAi0fTtUlnK1MvezYxRdQxxZFSrfw+j2mlVJ6mkXm8FaifTKlsSpbSTC
	hlFjOhDySC38MRfMg5dkLZ2TDsRmZH5BofYAtDl751E6V7pOqCk40AC1/gKedSwT
	YSx2zQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2rf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:59:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso73604585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504745; x=1793109545; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=JWgyLgTmM0OmGc9pVchgUsQsCPv9pKosVIMO/udxmn94pme8Yzux2DwE0le1WdOcnp
         D0aZYWs4eCsVQm5yk3wqQNbPyJxr1C7Rd0rTxJYG2ZtYD8sEAiD/4+JXPdIiYB7tkLiM
         uEqGLLpdQJVqsR4G+t1Mo5P1ovjU7pWEKd1fAx0OXyNZZVyT8KI7JA3+dScbG1JFP7LB
         qWPLXycIzMa41QxzrGnyQIkpdIAwcNd8qkPYCDco6fBMGFskwkAEWSWVZG2zIa9lZSAN
         xwj3IexGCblSKvxK9nOzDP2j0kU+MGD5vw202Ic5f0e5CcpnLXEV/F7Wjwp+sLOFgR5k
         Zlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504745; x=1793109545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=1eorZtUFPZrYlXdsCEDGp2TpBREYnc7Sc+L0QJxOLU+Dpf2YHz0LMcsjP3liiI5jJR
         yT6T2gxkYtY1J1zgzymMP/6omD8wxK2B29idxqflyteA8dReYXccb8clbsqWDTFISbF9
         4/s5IJjs3u/TVv04alCDm18GdWf63c1eHDdG9VQvkYC3xyspT7z1+LsCya8uSAF5jxDd
         CG2PPdTAVbj/1zvQ1zn6a9y13pnLiCseREIoBRVdJgt6U9xo2+326VzTSkhId8vq9k4J
         hDqe3aNInjrO4LUnnHRT6kJT9Zn+9cvqYJ7mO0rXzrhGUCYNdYzvt/wZuN6OQdWPMED2
         xXjA==
X-Forwarded-Encrypted: i=1; AKwUvBzfWw5dwTtlUEHNQmtnNClLP6LGBJpazjJTp6BvjiYuHI1xptTMc075p2o96ao4NNVIk5zsaTYGBzKDYhHr03Gh@lists.infradead.org
X-Gm-Message-State: AFq9FYI+whSIfuQfoVrsnjSWW1DQ3uVXloYZ5TSrCO2VBFBavK3uCmR5
	Df6npDNCcq9Jr2umQbLucD9H7Hznrqo/EIRor4chUhmjWxHcID81KmBRXRhcv2E/yjwjVzTY6ZE
	oGxRUXPO/8xLy73oHh5NULW5/KaF8aTaPlXmJhozsMuHUwYpf8zRnKeXYWS04SfnvdbAFz7b4aJ
	Ht4Q==
X-Gm-Gg: AYBFou3RjFmvCWLuprkEpTMy7YTMM7FbWRDxTwc/1a7fReK9FAK+6E+0kVquZuIqZ38
	Jc/nwKp6qle7ka1Y9oCoPNMzrXOhiPj0/mB7SgsnjI+l9t3oy/lMTG4/fP9vwfgxu3APS5TyEAm
	Jf016Vk1eH8ZMMlTGl0cF6De9vildyZsr+O3kVIBZH97uAJAEqYTblOjraAGUy2vAalKT8QddbE
	cZUAg50uk2VZhVVmsSW0l6FT4d62Duqip/OvduhqHHiTUr6hhTgMo1hoj2ekZa7B9ZWf0+P6SmD
	e6hsTfq9DVu9RFzaPdcpqcIsVQlvUpAyRYjc7qofDVku12GPWecGwXr9hf51cYFGY0AmrMar/HF
	oXtuqb+bnfwK6NGoLYAxmXA==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095411585a.3.1792504745170;
        Tue, 20 Oct 2026 06:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095406585a.3.1792504744685;
        Tue, 20 Oct 2026 06:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm5010407a12.36.2026.10.20.06.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:03 -0700 (PDT)
Message-ID: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:01 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
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
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad773aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QZ93mQGBb8gi70IaLVcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX4SYemqZK5Gm2
 BSNDxL2nQgyjA6HjSQfrVjXvna+L8VqwlYfyDuhEMAKhaAJ9tN0PpolCXbWUtJXE74MWlAp6o+O
 rMIYMfnYsgbmZMA4IS0+K0o1kfoAdcw=
X-Proofpoint-GUID: oNNP8UDiv6dFUOs98pVTbY_K_mhh4Gw1
X-Proofpoint-ORIG-GUID: oNNP8UDiv6dFUOs98pVTbY_K_mhh4Gw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX9Aw++qYmDY0o
 XKFavk3EdQGsoq/3pTGYI+d6T3oSsD98wz5H9yUyrC3c8WOrVHM8yXFATN9eEu6IBQ0ewjr1XM4
 +qeZvLnshepoDeh+nAUSN6A/+ZnmdHCCP2YN3Ee97gKWoE6MVbYuRGswcnzF9+uPPltDgYymZDl
 vRbEMtoDqsBMJn3M0WTJlx65mDuU63oqp03uNTggLLr4M9znqwky1f8q4gmQaoCG9fL2eVWIXeK
 aifiXZfyU/8opm95NdWFHdOWlXe0HJp7AJBSUbdO85zpV66fnu5PEQTGunw/kMDDJvWjOZlsUN9
 D2U++j8aNANNHpglfpm9TQLH0ok5Ck8RnKtd92hQH8r5QHHD9uqwwU5RhMQDH7RFr4OJzNS0IAP
 t2/H+Jud10FBXgfAO6tooLJUYfIenghheIDHg1CNkblX2Sq0WUSc9/4JAjQSpWbb5rC6f1dAgQ9
 TtGfFjUOcNFJhids4qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_065907_216823_E24A2F9D 
X-CRM114-Status: GOOD (  11.37  )
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
> Add idle states for the  CPUs as well as the whole cluster. This enables
> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +		cpu_pd0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;

nit: ideally <&foo>, <&bar> instead of <&foo &bar>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

