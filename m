Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHM9lsLk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpxGzwiZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DV2/JsKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=; b=dHM9lsLkV/w9F+
	/IJ+z7ku9clZ1MbwjkicKZAqUCUVsOapj8gqDaW/QWqSklzr7cTSBaoUGK7zN8bV2KdI1SWfLecxZ
	1E2I7UzT6CLSNkf0LtUh4zYu0yu5mO/VedoUmARbHCBbmrASZo/mvuGfi8cOs0d8zZQS01Mm2KrzZ
	M8BIEtMyvf7kTE/vTvwLIcKatJjStw+eqHubb1Bnwt9/ydajZxsJZ9uB4WpV3pOOOn557lZjMnJ0t
	yEUarOXopYa6XFbPw0sgJyFCGw8lvm54ysCvbdiOWhAqVUc8tvfLOCVLynJpETfvmzBq3/Nptb9Mv
	l+3R2h5bHo2lIumjqd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLa41-00000003nba-2Mgl;
	Tue, 27 Oct 2026 05:49:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLa3z-00000003nbB-0ec8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 05:49:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5iHuZ404122
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=; b=hpxGzwiZiSlsGp3P
	W9QLw6M5XPzomtb++twUI+iwwedHrG60xbKa5/ILDrcktnaL8yM1xnhnQSJd+6vp
	LlMANgU6F44dEUtizmCSHj2LVn/A8yK8VbrPG4P09Y8xwRVdkFHNY0w+6o911b7q
	ZkYvQqHC1oGi//5Sru+Pqu9NiTyW4IjrnN79PHcD5syyurmMO1kHdy4pjt3oY5l0
	n9iFcrZtUom7HSIA+eBGfzZhPijKgXGmLMkr9Af5OvxJbS+pdXMpJMayHvcErtaw
	pkBQDOkZOtP1h6QXdCOH7IQ/WAZCoOEVq7Qfs6A7DLIX8aYCC78upfwusa9y20R0
	GHixMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t80gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:49:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so71684eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 22:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080174; x=1793684974; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=DV2/JsKoFpWZErX4ITgfEajpgirT5v0LGwsF+nQOEsNISZBpzw64YsJ7m5ZfBSLzae
         4dItKCDGlpbKjrqoESe64mJBJKI9zSIDjqSfHoeXI16dNyIOS5vpkV9m+GhjhNzf7t54
         MTMvLldODr5gI+KlRanqjGD6hHdqD91NWLu1fkCCP1n0ztldgX4oBFB44b/qMMUo6FFc
         fYMk4ozl+2Kp6wZ/G/UNPrvvn7uYiXbLvm4GHSC8mPP7ZFyk2/ah9sfwX9jiLccabk1A
         4ojYl3OtuJVqFz6RE+925ruVfctYCEcha6k3F/zkvLgJxmeSQLE2/96fnCEFko0Gu0X+
         x7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080174; x=1793684974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=k35tRjtaJdsvpIIUZ0gAv7LX90e5Rg5eTtlTy48ydrYjYBW0KU4U1W/mXzkP4OBY/F
         LZtEdo4QcVEY2tQp7xlsXNRMxkAV4eyateTheg7ZAhC1WY+IKqOLWxsk1QIOHqVSTpgy
         HZb30Hh/cRz7QKgd7jB2YoUPeA7iRbJQ0ZfexYLIhB6pUk/wD5N9fs9eIvqdWtT/LGup
         41t7IUmmjWrUkblCQyC95voGsYbTgunl/07W9o2Q5IpG/4I35V7eGVynBGYVn8W2GV79
         /cHcO5yVFu1+6T93pLkWq1kPnR/Xq6mrIxo21fLvm69vmC1w9TFfq53M5e50FRvpJaph
         RRKA==
X-Forwarded-Encrypted: i=1; AKwUvBwAzrizkRSiODtToPU3DPFF5GHBUh4fkJotx+SFj8Ne5k5MTrN4gtii0bPlIIokRjy++TW0njOKm2EkH5cDOCHL@lists.infradead.org
X-Gm-Message-State: AFq9FYJdUrxpEekRVyHtitXGwM13P93o5tqk6A4t+nQJQ72cvTbAJD5A
	00hCq2brvYs2/+x1A1GKd/8Tmdrq3H/m8SZhj53fCVk3LQpS8czzGfB3k8MONxRY+4lx60r7Dxa
	luArwC+MxHTrK1VXLXiFfs/nE0Wk/Egk5xh2q78vzIo9Ipcv52Ze3Rsf8VFunRHZDJN25da45Uf
	1f0A==
X-Gm-Gg: AYBFou3w9MBUEJRDF2q7bI1cPOxspWTvpj57ctEA7RwU6XqfXMcJgQEK6h2+fAR6Cg4
	/Y0glOSFUEc0HGQNEJ2F3J13LwUu2nppJeexg8xUdkYGrip9fwZ2MugvxEdPfFwwJiM4FkDbcRm
	1Vd7waaZkAaflkBE3r7RAawOFQo8nm3kNH5guhnO0TbiWfnP05hUTCUtETVt9PZmhsYgVzKrt/l
	bEBCMHEfr+oVUz9zaczvTfImZfhgNoXrVs+EBpi/NW78k2yo4BrsHUVK6wg7bXVt7+H2wO/qAEo
	0cAEtmVF/KQdP/qUtq2wRwwg3UeWwnXcJ5TWf2kpSxJXteXJKvwNk6h0iwMnuFsI/vROnrzctZW
	wVAVg9As6w2MNgJzaFWm87vrpdQ==
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031699eec.7.1793080173547;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031669eec.7.1793080173027;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm35294210eec.13.2026.10.26.22.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:49:32 -0700 (PDT)
Message-ID: <9cb32956-53ca-4f29-95f4-ceb629b9e884@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:19:25 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae03b6e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3tai7eX4eetm6bD_N14A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: mfxz99AqiosLR_UBRGosFMjBM05Jfel9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXztwf1xMt2BXT
 KgQC8BJWzUhyPmtogsLJq3MnGKtuuwzxbV0je48EZFADVpPj03yhDJ0LhxsOaLYB+L5bORMA6/p
 7J4eoMHYTGVGsjefmgYFyVV5xuaq4Sk=
X-Proofpoint-ORIG-GUID: mfxz99AqiosLR_UBRGosFMjBM05Jfel9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXyEsqs/r4dcXk
 hk5e7TEnTow3WfYYJdqzBdTHNxClqbMlF69AWRW8Uw/9peUH4iwRn8FSPVo6Ksi8uKTihRRpzDQ
 9AG5HhsqYeS8lxGs0id7XnAMQIfYVZqAxdU6ezPquDDKwS3GBGDNgUnMvG0BhQgacenLSSiw6Qb
 VxqmkxqjfCYh9nhIrXdKQKQN6A1cmBiHh8uEsDgQCvQ/G6NRycam0G0nFD07vaV1o+LXIHRc/n1
 V8K48Va/eFxruVufNZr3YnlkywFXQPyU0U0YiIrJ1HXSOCL54wS69a8VVXJcvGVf5kv3ezcMQww
 oB0FcWngKgkoszZJSG10StWrWHheC7z0GQ/qQdZSfWtp12v4yCnLXhI1bJF3c33s4CY19JDNfHI
 lywEmYw/P0G3HyE2c4qAtT1d+sWC4gSFvj6Tvcg2qj8X945yHn0t0kW8RJD5m/dhFUv8EbYBFCJ
 zkfhFdufwwVfgsShcuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_224935_226670_6E7C3B89 
X-CRM114-Status: GOOD (  12.62  )
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

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> Add idle states for the  CPUs as well as the whole cluster. This enables
>> deeper-than-WFI cpuidle.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cpu_pd0: power-domain-cpu0 {
>> +			#power-domain-cells = <0>;
>> +			power-domains = <&cluster_pd>;
>> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
> 
> nit: ideally <&foo>, <&bar> instead of <&foo &bar>
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I will take care of handling this in the revised series.

Thanks,
Sneh


