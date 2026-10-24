Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 04:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nDCnn1Mz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GrLZsrRu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kjJHAagj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CCFZSnJfbb0t4Od1R7GYxeMrSVgMiZT2YXq4WnpQFGQ=; b=nDCnn1MzdGofIz0imP+cX9l9Nx
	C9rABx09Mo/ttNxvjxKq/aB1LGbm5HNKi9Zt8i7zUuw7hSHecbsYKttiWtlmBzmImI3vNmKhMNB3B
	+hCFVvmjPMDApP7cLBuKBkHQ4Z/1nC4chOuknz8nPAnbOkaSMK1uP5rHKR3NdSLWbUJa5gNdS8l97
	PbbBR/nkn88FrMbM2U/AtQSNYtmdoTYZ4s9aIRIS9hvy0924d0sqI5m3Douxr7Fov1+1JZrwiknJ4
	nc6PNG5tNSC72Wr13cveb4yX0w0tb+24q+BPtRT4y8fj7AHIHwpGfbTSDslrSgGyLElSpPKBM47s9
	rC7O6WgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTF2-0000000HPlb-29iQ;
	Sat, 24 Oct 2026 04:20:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTEz-0000000HPkm-0Tdm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 04:20:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O1t2gX3606355
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 04:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CCFZSnJfbb0t4Od1R7GYxeMr
	SVgMiZT2YXq4WnpQFGQ=; b=GrLZsrRuksQnJKa4mbAlAaFkargDdoV5Kui82d3+
	48QZ9ZxQ6YHsNP8wMq08yGIvm1fJK+PrEXkcq8jRzeWBxZEyanE1bU0ub8s229iv
	5N606N2J/T0jZuCTsGLsr+HBVNzvUa5+TiSkgtH09e0el95nisrVJpMFDOCL9XNh
	jPahp5ow7CR7x2+elXNKY2IqaDlM7n3U7lk6ziX919metEIIUHlnYEJsLqe1JCgq
	eDXO0S8vsna6ajCW3ezQqzLakZy4hbSQhpwOSKyI2DkhYwZca1NwxQjxgwyAtOiQ
	i69VDiRvrty5jYBtLxX9ZhAcWuu8cDrHZUfyxJGzvkYTCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt9fh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 04:20:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2552949eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 21:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792815619; x=1793420419; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CCFZSnJfbb0t4Od1R7GYxeMrSVgMiZT2YXq4WnpQFGQ=;
        b=kjJHAagjtI9v9j7TkVjG+6nKo/JGm9O8GmqUMZzFEvlpUQc8o6sIGGsLq3x2qNs0Bf
         fgHkrtXgMJ9AMepoz3z4vCDb7Jl8DGqGK4uiksHrI76Nr7tWuofAt9Ycyk65Uq0hLLce
         +2pclJfJzk+1io8sbaDWIa3NdMMrhefFiregem+P6Va81y+nVTo36M0DSKz/j2cggC2D
         mdFNBpLTQkNXtWUD+wow8YfSAVPXZwJhhkCKmt/omqa9RzrMYbwZHHyAgiMNnRUyHq1W
         XLl23FeCBEm7OXjgS8cVhd1jJlK/jXL+R23M6s18O4ppXXZ5Z+PsNwaRlgfy8aEMAoPv
         S1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815619; x=1793420419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCFZSnJfbb0t4Od1R7GYxeMrSVgMiZT2YXq4WnpQFGQ=;
        b=RaelYQNkZVuBilBufDLlbiLpdnpAn4rTgWbT/U5v/i4Hv8Q5buqpid4dyEuzX9jym/
         mn5LyCSAcCtVx9+EIDprxPhJA70IKe8nQXRsgwoIzQ2GqC+rpcA2fuLBM14xt995ztv8
         8/VMTCDV4aL+vkR8kQ/WOUrcB9C32MRDT9S2YSaAfAct9SqoEEr/ynCDJ7J1BzRHO/gE
         ZAlQAv5u07tEruPQFixN37zfUVwBVET+I7rKWWZS6ZMxwZpm46o8UIASASiH1AgfY5c7
         Y1Lp5n2eSNVM9ZrVcgYC+F1PlBR24LP6P3KVjNZKZFBNr39PdG+xefFzBftL017cd9gt
         4mSg==
X-Gm-Message-State: AFq9FYIh8aU4VJvSGCx3PsYiRF0awwVSZ7+g3ActlvcJGVgsNOVSJiVH
	hHWgEMZgY0+26g69u669BqHtEObdN4ZYxA/WgyDf6oZ0KTm+4DFJpRo0wLbEogswbqTXQ59I51h
	NU+tJbUKP4uy6Prd0mOWjMO3YZ9upir4MXUke39KdQXm8liSnm6Hf0bDrgVc+bpTU8XvgLHtV/v
	mzdw==
X-Gm-Gg: AYBFou1zIQWAge5jLkmtO8u7a+RNS2CU4qYaw713ICc1jDJeihRNs8y/2sWeotn7/df
	13ua+ZmXn349H1opCV2GxJ7vqFzOsklCeAauvQZE/5lbNZx7Ts+b8JYHs+eIv+8zsczwoKwvnIb
	QA4H5JPBjAbdSjym+qWJ68cFPdEeW6CfSOZ1OHRv8RYnwS0SNIGu2SQ6P5ks7VwNM6HbOb5bNlP
	XEX6MebK8BdKfT4KWutyDm46faKpAi3CG397AOC3uWLLe9nkcKgbu6SByc4L/al4PQ4O7r+l0ig
	/G06m/o3Yiwohx5sDrndFpcHQ9lGoEWKR8F9IPWmbImU+1/8PHIV0cuvykcpBllye6Vz0OVc/YY
	T7eCAYXWuvZDuvVQYJqjQaSRGhunkt7GAi6hzSFfmXc5uZuGN
X-Received: by 2002:a05:7022:7f06:b0:166:3e26:c4b5 with SMTP id a92af1059eb24-19935be7e56mr1530841c88.18.1792815619356;
        Fri, 23 Oct 2026 21:20:19 -0700 (PDT)
X-Received: by 2002:a05:7022:7f06:b0:166:3e26:c4b5 with SMTP id a92af1059eb24-19935be7e56mr1530814c88.18.1792815618827;
        Fri, 23 Oct 2026 21:20:18 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm3215224c88.14.2026.10.23.21.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:20:18 -0700 (PDT)
Date: Fri, 23 Oct 2026 21:20:16 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com, maz@kernel.org,
        lpieralisi@kernel.org, ruanjinjie@huawei.com, liaochang1@huawei.com,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>
Subject: Re: [PATCH 00/38] arm64: Add support for FEAT_NMI
Message-ID: <atwyAKSnttnBpked@hu-ashoraj-lv.qualcomm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAxNyBTYWx0ZWRfX8ygo4CH9IpFe
 KjQhrCoQhCFXMITuutG9QFvuwgnaMvIXgCiB02qnxAqeSd0P8q1Muh2FrChKn3QTuz9hWgDLcGN
 p+5yoSm8I6qqSZ8NIGzutIdtUsWYeXE=
X-Proofpoint-ORIG-GUID: tXCHaRFZHy17WgJ0HrEtzddeEnpQoxm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAxNyBTYWx0ZWRfXwdzwsOwH4XrP
 bDFvkvSFvvqQaABqNklDkefqhFJA902Pr62P3OMLtSddZ7IUFwcX5DDzbkSFnNhdEXwLYx+UFWC
 A/HnxzpYxNjCrgzeIPF4MwSK5J8OaEErn0lYbHAeELfjqt0YkvwH2bATwiDiUlTpl/xychdjyTk
 EDMBrgruRI9TSVi8UK8ROUuXcFDp2UTRFirB9y9Tu5q4PZ59kI0kmSYUeHNntHB/cZijCDgj5nO
 q5OEFm2EzMocgPdWIcRDTAGAnjvOv/0ifyfv3IkpKMmo5Rhcg+6BLFi+YWbtXoT9AqtzGLssB+P
 6M40NtYYro2cedv6AYwrZiidmFJa3+4q20hgagzK7QE5oY5Euoa0WqiUCg7N7sAVfySjqIDPUD6
 rEG6UG/bLnzcicmGLDcu9tpTflhl8cDoI7WCKgshJ1FEJDf8pHKIssBKEj6u7vMfPFfhae5ICOy
 H9ZIEJ/MBFArvuehA9A==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adc3204 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xBwVfey10Lg1JJy8PxYA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: tXCHaRFZHy17WgJ0HrEtzddeEnpQoxm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_212021_171661_9BB3553B 
X-CRM114-Status: GOOD (  17.46  )
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

On Mon, Sep 14, 2026 at 11:20:24AM +0100, Vladimir Murzin wrote:

> FEAT_NMI provides an architected mechanism for supporting non-maskable
> interrupts (NMIs) and less-masked interrupts (LMIs).
> 
> Since we already support pseudo-NMIs via priority masking, introducing
> another flavour of NMI on top of the existing infrastructure could
> easily become messy, making the code harder to follow and reason
> about.
> 
> To avoid that, this series first makes room for the new NMI "tenant"
> by restructuring the existing exception masking logic (patches 01/38 -
> 15/38)


Hi all,

I am working on arm64 HEST/GHES Type-4 (NMI) support using FEAT_NMI
and GIC NMI support.

On arm64, the proposed ACPI semantics are that the Type-4 Vector names
one GSI corresponding to an NMI-capable GIC SPI. The NMI property belongs
to that SPI, while its target PE is normal mutable GIC routing state
(GICD_IROUTER<n>). This also permits a platform to describe multiple
GHESv2 Type-4 sources, each with a distinct NMI SPI.

The current Linux GHES implementation registers the interrupt with:

    request_nmi(irq, handler,
                IRQF_PERCPU | IRQF_NOBALANCING |
                IRQF_NO_THREAD | IRQF_NO_AUTOEN,
                ...);

request_nmi() requires IRQF_PERCPU, which marks the descriptor IRQD_PER_CPU.
Generic CPU-offline IRQ migration then skips it. This makes sense for a
true PPI, but this GHES interrupt is an SPI: if its target CPU is offlined,
GICD_IROUTER<n> may remain pointed at the outgoing PE and notification can
be lost, or possibly it might fail the cpu offline since an interrupt
can't be retargetted. 

The GICv3 affinity callback can retarget an NMI-configured SPI: it masks
the SPI, updates GICD_IROUTER<n>, unmasks it, and updates effective
affinity.

Would maintainers prefer that GHES explicitly retarget these NMI SPIs in a
CPU-hotplug callback while retaining the current request_nmi() contract,
or should genirq gain an explicit routable-NMI SPI registration model that
is not marked IRQD_PER_CPU, but remains excluded from automatic balancing?

In either model, the intended policy is that irqbalance must not move the
interrupt, but OSPM must be able to retarget the SPI before its target CPU
is removed.

Thanks,
Ashok

