Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB19606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xEzG+yPn;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=A4sAs1iZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3R6UvoeFxFCY/Ej/MVx8n6FebbxoQvB9tmIs9Jv63a0=; b=xEzG+yPniZOr6YTebIpaPt1fTa
	t3IASOcaIhS0KbY7k/IRyiExY/qTE3f9qIrtIeGmmuJ6lDs/UMOHqjVNPIVfri1yZyQt0mQmqvGX3
	G2jpn7arkEc8S8RCOtdFly/te12q2AYx3O94VUTrTqSRe3bC9fyDTzfgr3qyEE+bect26Cnb87KYm
	bXwzBpT3crNp0wzbnL1AE4FqFFyHDt6H0qc/L4MOcpCRYxlzlujE0qTqZHdutixWGJGKw+Ym8iaSF
	groL0g1soXAZpEYv1nSqZCfyz+sNQfxN5+972hautmovU8Cg3oEP4qUgfAMvVwUnDQnOov39heSK0
	X7mamrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKyX-0000000CfnL-44LD;
	Fri, 06 Nov 2026 14:31:29 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKyS-0000000Cfly-489n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:31:28 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Dcjai1890826
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Nov 2026 09:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=3R6UvoeFxFCY/Ej/MVx8n6Febbxo
	QvB9tmIs9Jv63a0=; b=A4sAs1iZWsz+Xe7qnrcwmJHgmp9ac6ZISDzRGcUUFnCN
	1ekY1+GBrHwdfo7muahziFncvTiS/aUUFn2amuxZiTcQZ8sUYT/X3aGJdFrVwJ7N
	ztRtKQb/UAIh0oaaVRq7EQGLhUIwUmhcnE3osWp+9zM6x8ml2TKjNmWQFhPkhzom
	rJVbJu82Q+D4UyVTl2gjddviOfvQPXT89j2egh3xYtXn8ZA+EIaEtbW8iKfV9PMf
	aS8+KV5ROBTDRUiw7HAIJki/hMzI9AeVYLas3NK/J9IpLwhgUEgzOQ/xfgSS+6t0
	jWMtkZ5osacwLaefXZggMa9T/on6PKYxogYgRcB2FA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pc3ej7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:31:21 -0500 (EST)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0e4c2f052so9177917b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975481; cv=none;
        d=google.com; s=arc-20260327;
        b=bDKwWUxz5piKskFkXRp11g21mOGVlZa6UAyI7D/ZDm+RCIimp/UaX7GKbS7dzlcDll
         Kkccic1Y4cPFBkk6lEYKUbhLvSMeK1h4Umve4CCohqCR4+YVGd9AejDMhxCakPx+ahFt
         z2hnd+EtVqcxwARlCBr4h8jSgxtfSa5j7Xe4akxEHVaenk4OIn6Ycf6M0uKT9gPhgd8C
         GeoYYXLzP2bTl+r0EGgqJHiDMRmBS64a+676TorN+wUnMXOOhsujI7nqFbEzV+1Kg6it
         ZZROi8nnvx4eMc72PR+/L9Bhcn/nuGBD0/V4PjEiIEZroKglQp8hEps9sOHHqQRuMGTx
         OPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3R6UvoeFxFCY/Ej/MVx8n6FebbxoQvB9tmIs9Jv63a0=;
        fh=0f6mZqo3pjEPgBOM84DszOyi8/zvPg2wpU1J2WwKdxE=;
        b=fNqh0rUTq3Uj/U8TRIPeJNWsA2ETzxD9mrC0mcaT1l6Se2vIEPJGSX7Zmw888L6KOq
         STyUgMgw9OH3yChVaDfi8Rx0eOSn6nEx2joMDvSHG2fn5KcffViBxDpohVKzTUJUsOrU
         l4zPXiwLbRLspe0j8+RLh4jl6yQQNgo5WVXDXFVDrXFteXWZ3i3KXDGCXHKx19HhAUqu
         ayRefiHKzbNIhtWwyi38eCo1ADn0k6zj+SrGRo8MG/1k/7vPFpfwqRbziBAPIpsGp86i
         U8Cpl70TrGvwAS/zuDBpGbInnHIWmuY13eAE+gIXlwSRzL8OGDMfAUe13uhREB5XaD5+
         bD8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975481; x=1794580281;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3R6UvoeFxFCY/Ej/MVx8n6FebbxoQvB9tmIs9Jv63a0=;
        b=EyhcaEuuwSEAPhgYfoRxKK0ZbgbP960IO9axUufbw6YHZHYv182dPtZuTxs4ecMuTO
         A2UKi8ka0TyMrT9E+LgHjU/PuKzASumntxyyrDEoDJuqBcWvFKxGn68l/9v3AuvwASUs
         qHzY97r/01Ghty0JYmlw3E4WQubJIXwa89Ze3m36JzBfyyBMJOCZGp0WkpyaNaXDUa6p
         MvQfy6jzesxjOIet2rSmByOJoq/FWDf/+x6HELlcd7WaUcmB7twXOvnTHa08m+4Zq4ku
         9tm+TYNAVnujAXjbl+qF+s0MDOs/em5Ra9n0Wy1KhT9iGyrr5Xmwq33Zy5H4jD79aUgN
         iDlQ==
X-Forwarded-Encrypted: i=1; AL+hErEQV66QJLzUbW+/ch4vspHMT45ZMC2YCLyoC5ySM3SMPFHxkLDfbGaDwv1M6FcrugPMqqTG3SzSOExWu/BJASxi@lists.infradead.org
X-Gm-Message-State: APuU4Z8+1Lp2QnjrHtLzV84E8yqLgUyW0J9COU5Ady3D6Lt767pwOOBO
	WDhqvjFfJjabXhykvll8nggKJs7MiAHr6CgdiNdPGH7RsquFUf1budzaDhQqGeor52gTWtlJ8aM
	4PHb3tnOecl/q3otwjkpQVLhV1yEH/Ir8X+wvuWRpbYI4gwkkN66jI8dwKaRM1DIzy/SmlCv74F
	Bxnya1Do+UpvLgxcDlLsAB31k56YHfA3XYSGuNQFtUS9d4eno=
X-Gm-Gg: AYBFou1FhxxDOo4qcN5dp7UNHnKHM6/5QsBBUbjeQfVTQ1T+njjA0I6pvrVZeuiwrR3
	qf+9D7y6H2OYNgSqIk5Ram//nknYRdqSWYxD9HAVYP75lB0d598tr3CiIZI/5SUlW3fab3bVcRR
	RAcS0V/1Ntvz+3UFjGt+AjQk6iD5reDQ/sfzkIiQkl924qNpUAj7OCLj/vU11ChVOnDZqL/gPNY
	X3dGr6BVJHsy5/6A1Xz71g3Tnsbm0yuicI3eE63VkvbMvtJzCGA
X-Received: by 2002:a05:690c:8e0d:b0:8a4:aeb2:acfa with SMTP id 00721157ae682-8b341b2eb3fmr12005247b3.54.1793975480846;
        Fri, 06 Nov 2026 06:31:20 -0800 (PST)
X-Received: by 2002:a05:690c:8e0d:b0:8a4:aeb2:acfa with SMTP id
 00721157ae682-8b341b2eb3fmr12003307b3.54.1793975473710; Fri, 06 Nov 2026
 06:31:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com> <au3eALuLVKZ1WXhp@google.com>
In-Reply-To: <au3eALuLVKZ1WXhp@google.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:31:02 +0000
X-Gm-Features: AclHuK-uSTIad-lvfbjp5wOphNsNX579YiHzXoYmvUtAiDrC6RcBzvikndjQbQU
Message-ID: <CAPOPQMDz32WrE8K0BDVLKbPc_Owx9izjQ+xPsJEJ2Cwy+BNi7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Compute hyp early-allocation and pool
 sizes in 64 bits
To: Mostafa Saleh <smostafa@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Quentin Perret <qperret@google.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: d_WP-Tdl0QDDutj3-7uWv30Wji3jt69Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX5APgM5lxzTZE
 GtLv8WqApdF9EyZimJszFctaWUtlEcb3mQL2XQdvlCqvPXV2YIguDViEea/zj/r516lB2/oCIBy
 DHkWW2IWft3SPcdo7zLPuhS5rJHOmI9Xi99N6xY3G1w+X8uxWLvvV8sk92+fRQ08VAG7ublZce8
 76trM5wMhBelvjtDy3cFXPzHYNuCpYTNkhobV5Oi3zEvBlvxllwGPfwCi7ARZEFByumI5rNZDwB
 UPop4AnSCEsQ0pTYzsYGCEfy2cxblbvNEdyeNyzNEHERmRPto8LWdb+uEm+ysoYjf6u4UT6tl5y
 A32FQ2tMNPTB5WDcWH+yF+pGdL2DQMNRvhDIveggpqlPWV5fr1SNcRi2WnD2BFCfIpEesbhhb11
 4EKeiVAGLFpxsEWEjwbWborkzzwjww1vdYDOXwe9+Q3n0u+ilr8gROxd9WSh6DS8Ltc4eL82lfh
 tDfegrDKXRTxJRQUQnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX0e/FeNBITP/E
 lECiu/JuX+R0+wWN4TD8oNlxi1X9/ucaoDpFV0/hYOac4c1YneCIC+mox3EqXM+BCqXd79kNUiN
 fUcXp4tmB7nJZAEjX9yqgYW1WCyaJisbwndZxDo75q3irRKJZclS
X-Proofpoint-ORIG-GUID: d_WP-Tdl0QDDutj3-7uWv30Wji3jt69Z
X-Authority-Analysis: v=2.4 cv=EeRd0/mC c=1 sm=1 tr=0 ts=6aede4b9 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=qqJXGgh0nGIGBJ8XPqMA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=10 spamscore=0 bulkscore=10
 malwarescore=0 impostorscore=10 phishscore=0 suspectscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063125_284146_BDDDF671 
X-CRM114-Status: GOOD (  10.47  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mostafa, Fuad,

On Fri, Nov 06, 2026 at 02:02:40PM +0000, Mostafa Saleh wrote:
> I was preparing v3 anyway, I can post it today.

Thanks Mostafa, and thanks Fuad for the pointer and the correction.
I'll drop my patch 1 in favour of Mostafa's updated patch. Fuad's
description of what happens (pKVM init failing at the BUG_ON() in
hyp_set_page_refcounted() just below 2 TiB, and in hyp_back_vmemmap()
from 2 TiB up) is more accurate than mine, and the hyp vmemmap
overflows the same way. Mostafa, feel free to reuse any of my commit
message.

Thanks,
Xuheng

