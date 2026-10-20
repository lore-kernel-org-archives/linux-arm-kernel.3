Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC6B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quWdbbTl;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nBata8Ao;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEVhMYAK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=; b=quWdbbTlTBRFMv0K8I5eUQtDV5
	RljV3Ri2QL71dydeZ0djv/4kJfZKp5waQOgShvAssM3Bt5+B5YD/JcYsMQ0EhuPa33HVdqNwvzAc4
	MgME51+dg4VyknneR2vJY9+JKAsnG07b7fULmc4a2RX9efr+ayySbAEkbB1+S57VT5EQ5yzOV6UpD
	2W2eMWrK4Ed+F5YfN5OvDt0EaKnhFPUxp300SQ3UzsEAYrirVpjdSoyaBXY/6R4H9YxEE+tqEahCy
	zigpSSEDhwmiE/SK8TFFWhsh5HSh9YGtMRyqGWAEeK62qiE2AWKZXj6/OGD7bN150pJihJhjhxIf+
	vadGni3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ro-00000009jIm-2w51;
	Tue, 20 Oct 2026 13:00:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Rm-00000009jII-0iml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:00:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx64i2524226
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YA9sqWUQC5W+VQQaSJzAueT
	T7pF0UiI4Jt00f8SsOs=; b=nBata8Ao4VnQ0BieJol34j6v3+8RBs32VD7eaZhp
	wXp9zyryFdPapgD3yxOU2W3hDf5JiYjP88Ek9vXfcuOTmpdyNSxfoBJe8FPwG06e
	HFJYU6HG9XkXi77mdk21dStht0pSLtgXgiW5zMVJWu97Xf52mrC2xyeNv7JTnMgm
	mTEyxSpXc82kgha5oxOYCqhQAO0D+zoKPptIjk4NtdfP6jo35Qx7IwESX7SP+B0/
	AbLNThkdI5J6Zfup3pl/sOU+/oOR8yIs5nmnZ6TmFeT8IT7l/TTX2hX/LUlDFoQq
	aIf7n6cVLxDjNRi7xaa45QG9c2pMkXett3AUJJOBnZ7KDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2jep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 13:00:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso125197685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501205; x=1793106005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=TEVhMYAKk9Hm4bsx31HdMq+OfxM906HuaVyrZIdKlZu6RAWUzZIWieWtz6uZQ4tPJJ
         CZaMNKDqCjbT7gSAtgD8LNIBks6H6vLoSGkeccxdegFOOU58keAlAPb9xfSqliHNcHUP
         5iaQJGtw1gcUytmXax+1syPyVcMlyJrsi24msc09Rn+Y/+oTqyEt5UQFxnFZy7OKERnz
         HzcSvo7eoFfpTM01QsE8oBTMs6a4yWaJE4Y9u7ZWQkYlsYr7tkjpyG+1nTS/SGBA4buG
         45YGKIk3mz3MNDWLpiPHT5noKdOlUsorHLwdjc6Gque6rhlXU16WbUoSQ4iQNyBdADYz
         +Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501205; x=1793106005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YA9sqWUQC5W+VQQaSJzAueTT7pF0UiI4Jt00f8SsOs=;
        b=XZsXAaWXFvbSh0UeADEx8rvHD/dDa+iaJ3+AW694juZkSLCWWnP/N2CAItVyKn141X
         wKq68Un1b9UpKswWKpem4Q4E45CkInWigrqHl2X/LUxscst6L6Qti2qV+1AOlF7q0TaK
         Ir4qZCMRTajRvLSfmXcrKGrT//621OogFcfxezzxbx0ts1Wqufq7anL+AOS0JQ6bn4cE
         iUxWHTVUfV2ZlCdH19j85m2O6UZBW5wFrMwRB4pKnXgAjNpERBYu7cWgc0pUjIivE4CF
         oyYNZbZoDDWK9oN9Ke+E+xOF4JDgFE/H6YXjBVTQDf1tXOB4pOa5atFT9ZyE4TVHWakt
         xV8A==
X-Forwarded-Encrypted: i=1; AKwUvBzOvZAqPxQoNjImZwh3wQo/b2dj1aupmUBlBjEJ8vc49Fa82ub8mmPTxE6I4ZQx7gcIZnVNwsmSb1xQKfsl4Fw4@lists.infradead.org
X-Gm-Message-State: AFq9FYKPyQZ60FuInoqUW/cpJv+1fiXPDQlTrk9I8CoQndPCYfkHWg8g
	G2SxWDECwuffNYtPd7qkkAqGqgnKEnQBrJfApIP9rrxTXX4rKSrppgS5re3kCXeGjRqKovdmA/V
	cE4nJioU3YL/1rOunq+GuOPtXglYEwdbOqePh2m2IyD3bCfgkGl3ElIebgTVlbu99RBd59dinnW
	NBSA==
X-Gm-Gg: AYBFou3WyCCxcyuC9RJXSN2fwM2eOgDbLBm52PWQ34/iYOUY0cfI5pUyocwv8tIjI+l
	pOywFanmiJWNAoe/bVUg28kcT6ggeIjm1bm5Km6re7+jtR/aB5n6pVLqj7gUisUYZ1rn75dPTUv
	gZ40AAKatPILU93WSaUVIjZlTAbGf9BNZcAMwE1DoRVOZCu02KMSEpILH/DYz+3THaL261gIR/A
	T8L8ssDGJUG6Jq7XLyc3SHhXAtxY2e8BNk8HUBZ6Di3LBI1xR/k7pOe1ZfUREmoJdnMtj5JACQO
	3nq1FNfJ/yQG2duXA9mylssUh0c7lv6ZfMX2UosjpINtt5qMumhatDKfQBKp9Ik+zAZ2VwtiGTR
	kWVx8vTNzblo7sNad
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311657685a.19.1792501204480;
        Tue, 20 Oct 2026 06:00:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93c:6341:1d66 with SMTP id af79cd13be357-93f4c66bcedmr311648685a.19.1792501203724;
        Tue, 20 Oct 2026 06:00:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm83132575e9.0.2026.10.20.06.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:02 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:00:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
Message-ID: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tFTmln4Ba-xQljx_xRv0KTsVwIJO-Mux
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX8QP+6EpQSVd6
 mi0drhkXOR4qyyFeqRZZB41NDRY4T+x752NM5TRfQO2duxWcFJRYQXtUOjTkWEeonBWH97SQfw5
 eo7JnDQpAk1TWWhcRnNbC8fNiDGbxLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX8CKpvTAk9cNN
 ALzrjf8JuGeV5hYFZUA2OzFDsLhCkAdRhKTGrTDXAynVj6OA3o+yOO7VV+jnWNprs83M9qXXcHs
 coC4ByYxBFotfjOOZ4uXQD9gBPDEvB+IRgKMr7A9TUenC5vXMo7wbF8O0+Tlm5h4DB4kjjlzsOk
 He4jKaY1appYu0TOjUEKYQ4YAZNV3w8OUz4cymfYybXLzWpvrF/in0PZebUog0/eaZDCmIE8tZO
 uTeP3B1DpXjfIpxlf88Qy66C/yK7qMW4qw4TJxNnYi7T5EjFGB0jIpw1siybKwnFdM4i+oi0Ixc
 By/pSA0Lca6LgW8qyAELGKS+hwh6VaqK1Cak0nKgH37cQiVaClHeKfUQO1vF3uDulr4tHYxpnkO
 SrHFld+Swh5qnOFGOrh0bBNE72HflRkWyzX2HgLXu5f719A5/dk1FOUZRsaU2xERTl8YeOE5wKC
 fnAebswWq8Fu9y6a/gg==
X-Proofpoint-GUID: tFTmln4Ba-xQljx_xRv0KTsVwIJO-Mux
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad765d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EzgOzLDDTgUawJARWFgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_060006_219757_726742B0 
X-CRM114-Status: GOOD (  12.29  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-15 15:25:22, Sneh Mankad wrote:
> To make the MPM design more logical and avoid probe dependencies, the RPM
> notification is managed by registering for CPU_PM notifications.
> 
> Remove #power-domain-cells property from MPM device.

Can you elaborate a bit on how the two phrases above are related?

