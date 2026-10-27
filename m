Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C660606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q5XLlf9d;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyqEmaCh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N3PvoTgn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=; b=Q5XLlf9dZYfSbL
	CQMDT4Iwx7s9fJxJkzQiVwVF7IUGiJCiIJw0999Kglja8AaSb5vEcso2UkokFpZHJjmRfpMo3KaZz
	pTEII7tZ5jbqTjpVb4aqvziiUp7hO7A+vcm5Rv6HUVGC+I2H1PPoeabTj5L7+At99eVKWfGQIHYgF
	FYDlctUC0M073PaVrM03TQrf1sbuIWH+ItMnRxJxbtTanvPAI10AEPNtxS5LoVSqOK13y1lUTNdf/
	5Gr37FlXOhNI7Zol0JlDjeNpl5JxyRklSEOnNx2iVR+BNI9WMzPB1JHKnnKwbkUNaKsDlOKJzfSwY
	9rM3hAFPTKXA4MX1CALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLa7u-00000003nnj-0Fim;
	Tue, 27 Oct 2026 05:53:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLa7r-00000003nnL-2CsV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 05:53:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YvGE752072
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=; b=cyqEmaCh0aOI+N1/
	/pDcGlpWVdVeutex5VKS0y+znfue/nj9pQumOoDLWWOpn4DWYxPphMJqiROi+q5f
	9cZxyzwI3+gyBKsSpmp88LxvU1430K0LkZxKH+f+zJFu8PBNtk7agDYKvH1cL9io
	UIOz0XgCq75I3jaqE3nUjp3qV5afxAPdZZ7zqK5Rwf6ld0ZxQlsrgvTmiiQ7Bslc
	ec1vH5+SjCBzwsKg6+wxjTmBue2619fAngECyLoA2wzUUDAAEYyYNWlcVQQ+NyQw
	BS7PUuVMteEVWT1huXXaKQbbFdTTSkCFpxk1nvrqtpZzWawHu3yDFlYFhSR0KvzH
	6uVdyA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmma4hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:53:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so10692924eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080414; x=1793685214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=N3PvoTgnbuC+NugGqQA+UvgAhkGKSsWU91mIWe5wQbPbPNBNq00hXRyzZ0GWqt763m
         nH1XUmxK9BeeFzkATOMNOGRyu8/n7b9+JHGf5DgmEHy41VGLqq4uUjXVuQvbRhpB0O/K
         6LO8jBdwOEpWJaX1Xi6RpQTTA1WqMk4P3cDQqf30yfgOkcn9xBA+yNdn3WZINOSUh5sV
         4p+KBtdRTms3mmIk/bhinAXqYYzdlv25jBAytiY2cT7JiRivF8iYtsNpXeY/vDFS9cNF
         FoPmaviFq1v7RwO0987Mu03xmeHxpQlCIhrqf95iw1WSta43BFdahLa7tn3ep/9pf3MF
         tBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080414; x=1793685214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgYHmotmGu91u0ACrPhUo6ozUhf/4pr770wqlo4hPSs=;
        b=gJcMjRqSHo3ibmYgR5FNtvB+jL2vxDjixQFsPPBjOemXJII/lYULg9SYBvyOejPenP
         p7ja3gg0qDBvprhMzXZ6Wzv+O/QylFN0Kg3KQQyro8s46VRnOB+H1HF9jS2KKrFfFFNL
         4vgTb6Uc+gO5ebAaxIayddLpuKfrg26KcR5XX6uUD14xryXeHuvnOmE2xweGlV7L06K7
         XT6SQMwws67adlOb1hPM6tAd/rwPvLYgLVfLcnpm7+9xIjf/YdgBe4Z+oAlOv8s0Umqb
         phXrcXswkzssUISprJa80vdHMcQLE8DZwpJDOlfr9c1mNhRK02RDQ2sjADZeo0J7DuYU
         Oq3w==
X-Forwarded-Encrypted: i=1; AKwUvByfUk8Pna5c4qEzZ3CWmi98D2wuUSWGOHx4fksyubPTlmA38TS72ll0ZbtwLoPw4lxIYYEfimEjKLgOgGR4uXG7@lists.infradead.org
X-Gm-Message-State: AFq9FYKLyRgPbfZX+YQd6hRqU1geUq8NpM70SGk21YRApZOhFqYYQmfA
	8xo3zZ/vkm9XsLMfg1xKJL6QDQvUwRMi98zGmX5Ozte7xYJhMrIhQIgRf5GhDE4cgOW/Q7yfqPa
	R0WcfdKmNfuFPzeco5VzQgJmSd3GSMFPCWNHLU+VfLjpzsonCFVA4wjVVK0/EexR1esDRvwZrd1
	kIZA==
X-Gm-Gg: AYBFou1V4o5l+Cc5WPXOHZTsBpqdgrVSPdVx/mN5iHeTSU+jOQxg7bAXNdzIPrgRp+p
	IIC+vmVB+0nbBRqgJTGsLJPMWZrglWcgEKlNHIPmaoXBprBmx0JeWh57Qm7nJndHV3rGyEy+364
	000IKIMYEblX16IMqpQxXeIFtA2MZUlDMJa5ICFA20CmjGZza1TGA+Uz4gZ8zzWzRpU1hHbJ1Cv
	QxJde2ffNG2cvv51bIcZbf+ytCk6UoxNiCt9/aUd3tlw1Lq812qchX0POE140GJGqEpfg5UnBDr
	GBnXWXgHfDz02reWF9s37KQTSjcu8aX9/dlag+t/3jM7mjGGRtWG4uHgQlq2ZRsi4JGQiQlX7xR
	jPTORhnDJf0G33TyLsZcUC6ovyzhJslAczU3mmH1F3nHuXuWQEF2iJs2ue/whfq4cwcDeppW6RJ
	4=
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692385eec.9.1793080414091;
        Mon, 26 Oct 2026 22:53:34 -0700 (PDT)
X-Received: by 2002:a05:7301:514a:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-369e842b597mr12692344eec.9.1793080413423;
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm30226262eec.12.2026.10.26.22.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:53:33 -0700 (PDT)
Message-ID: <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:23:25 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfX82/7iM6iT0Ml
 fVYkC9BdEO8LI3YZJoajf5RgN6kZyd8zqiDLrZoBoEj8zP2BcQH5/eaJpNDKakmtQLwBAKQ8pVT
 cQPUWhZdZCNbt8nSBHEwOZ95gpXI+80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMyBTYWx0ZWRfX3cF01nJZYA52
 Q4iSKMuD4Q3NQtX0IRH2KjcPDROgEfgBBkxTcX3cG8A5W90nRlqnYxM6OHTJkw2uNTZ+51eDtqg
 mhPpxhAQYLVIupY9NoukHXlXubHjYC48WIk9MMzGEqcNOn3EVkrBW9yYbKOspf1zYwjpU9XR2Rh
 s2mr8e44HBKHV3vIvKMLOuLHSrMdnQilrdci0zNOI/BPPfwuD3SJYgXxcc4Sr8QgQ9V2Bs2o9B5
 NMjVfnfcQ7MZa8Auzq/iGoBz2rDQB616kOu3mcXWV3hoytwhVAIi1QnNJSHagYxXLfGzbhhrb6a
 /SRoP4aIO3nVKHlHi1GueLQLEHy4XjOFwOX7Ll2GPPeYL5lEJ9WozhjF/dM0HXR386G8RdmXc04
 8rC47PL0NXkUQVdvMVicm36sJmXRHpXb32VwydWTxbLrKW3W/iJf9XKm1EKT3DJKIRm6z9G1dWs
 zldB5bYWORFrjAJqXkg==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae03c5e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UnRI9tf91rfGD_JGq8UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: G27KwZB1_dJC1xpbU1_JIWbgW_guF3on
X-Proofpoint-GUID: G27KwZB1_dJC1xpbU1_JIWbgW_guF3on
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_225335_682453_484862AE 
X-CRM114-Status: GOOD (  12.96  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20-10-2026 18:30, Abel Vesa wrote:
> On 26-10-15 15:25:22, Sneh Mankad wrote:
>> To make the MPM design more logical and avoid probe dependencies, the RPM
>> notification is managed by registering for CPU_PM notifications.
>>
>> Remove #power-domain-cells property from MPM device.
> 
> Can you elaborate a bit on how the two phrases above are related?

The MPM driver now supports two ways to handle sending the RPM notification,
either in the genPD's power_off callback as power domain provider, or within
the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
driver to follow the latter path, which as explained in cover letter would
help avoid probe dependencies.

Thanks,
Sneh


