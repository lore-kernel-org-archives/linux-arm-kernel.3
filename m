Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2E4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o6sAIIBU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jha6VRrv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0Lk1sEB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=; b=o6sAIIBUTqTKDdwmkMn5q4gjpY
	g90RYs/xisAgK4gB+ecHxztK/zYCDeqn8GyIsEbbUd4bolw5+D/vIFDgDc/F2uJVHNlPTxGO3ph5t
	Q40Jcd6mmhOpAe/ZsFKHoLZ2e6ftznYJYVAAHA5p2MG1uzv5MX03ce+2TJ0az1l+lWiAiPaYnPJJ8
	y+5AZxkR62b0XJ4C1cVfDm8wUWOsimRjTqXDYLA2uRaLz428jGZ9YVIXXPObk+qYBtGrmrXYN7hQ1
	DsWlhfRLX7JrLcJJfFJdLhRwq6XqRbTB+pFtY2VCKWxRuUg0bUtsFmU0XB1M/fAIo0nYWEd3ZxmBD
	TTnNqDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Q4-00000009j43-0RH3;
	Tue, 20 Oct 2026 12:58:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Q1-00000009j3K-2iOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:58:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxNAg1293037
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 12:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qKQN33wg42pkpBLtGqBWtg9b
	yfzk6Ew0t8Bo7SdAs/A=; b=jha6VRrvWrZisQB7f0L7jZ5SFBRBsqegbN8CBx+V
	h/P3cCLvR3weXlnvMaCgUBTxQr7Or7S2b3UHTBwPrPt/c/6KEVkNflV84OPmrSAE
	V0/31Qkf3DHjNpvfds6+HliqFgEjx9I0NpqBtE6Tn//3MKW5hNQx8QWz6WRaAvgS
	iSnsHCargdNaQRxgkSp2gUkDT/1jbdJfGBrJDrMN0jXYKESD+4JBkBXZPIwOMNRV
	CKRJaO6rDXTKaG4Jf6iarhhAn6a9ybMKhkA6AF+iEHN3/A8p9SjFTQNXByoxmb9X
	2Y1CFQ41CZq+z0j2L1JZbdnOKlIEB4QWRlrCYonolhoC5A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2hq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 12:58:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a7c17166so69063286d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501096; x=1793105896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=i0Lk1sEBrffY6G1ivMyAwZcnNAuI+JJ14YKzMDnfM3o+7r6DNn5vKCeW5/SlgfO9Eq
         8ulHpDDDb1qKNqx4AaIhaRovomMs52v/sdTUlzffvbHkdYGb5oUjVSjeUPjxEzrfBE70
         w1o9YOo2une0zWAQrlJx21kZkQ7cv1U0Ua13tZ91WcQ3YZuh+oorOB2EsJ6YmUGr0MJq
         HOLW9D9UlSC+G5mrWpohgctwJPjo3I/frnYPVMIm8Yn31sDMRL2x8nWaSHUeGsb1v/rX
         Q/8c+1Y6WZryW73/FICwOlJ9eEpTIQ8ZQQzwNuYhVXBg4BeduvBn/UHz1ExfTVzG9tCr
         b7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501096; x=1793105896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKQN33wg42pkpBLtGqBWtg9byfzk6Ew0t8Bo7SdAs/A=;
        b=25imZ0hpEoD4g+XRnyN4O5mvujLr8baqSpnWH8T61Gx6RxkDomKjH+To/gOFijEKWw
         kK9wjDyao/KSBc7doHQ/aOiM652DgmGOyIE8TNwBiU97z2dmbgFde32MyTR9o75qwRFp
         Duyef9mdtgP9Pr1y3vATPckFxnB9S4K6M4U+hJbjY9shFjbcV8AXFgLwKNRnfggpB0aD
         ENV2dTY9QGgBcU1YMiG8ocmv3qgTtwnFku3SkzIWifW0iNey31BEwjiS+6WObee3QJBR
         6UGfgPuAxOk72MWQxL2oDEeIUC4lOAIVVVl2NRf1fbpJJBnvG2JPEOvEqQupBXbdDBHF
         7pOg==
X-Forwarded-Encrypted: i=1; AKwUvBx9PnksazurcBZLIHNlbK7tOKUGoicF7J1oQE+xozyDIT7imaf+t9zLwY4kUFpb+07N/ndgi8HPOmCAmsYVU3at@lists.infradead.org
X-Gm-Message-State: AFq9FYLGoZYqgWVUuOP6EYBKpzNroPJp6GVlpS+0NeiRuVUpxJYZW5YA
	JAj6W7+85Ixr2IGbjUf3VhWd0IA09J5Ru9XrnUrzJipOOwhGnmsQAdQl2B9aH969O8/EWZGwGyA
	4pUusqO/xwKhMPVeUwcqeW2VGngisfPvTFX2Br0y3gSCGm0Bw33Gf2cXm0S8rBF3DeGnl25uKCl
	OqfA==
X-Gm-Gg: AYBFou1pHkCNqvLxyqwBjD2kJmM8m+0OgsDdnMu0debTkEjakAtrPCofLyU9i58Ovj1
	MQ0/l1IebItNsSB/YcKPd7XgrRPmWgCFb84mohr1iCgs+9Fw+jKoM0DytTwngdYRowbuV/AC+i+
	3QmeaQYakAE1rY1YRkqfDm8xVR1stPzZyG7X6bRnbVaZFm+Tv8+C0pxe6MCYfcY2zZ+GCTN/vQI
	X8MbxoZ1YMbURc0jPWzt8jqG6pP1yGgdwDFcJiO3q18YHRbpajV936NxnKCOLaLRVHZUC3VtH47
	X0W9SFF/xAQdXbskqmqihZ109Fmhox3wKmeduo0neoAH64b4WeIKT/BB00PgR143ft2DovqTr3k
	+mrY8xHOUscCNgxEQ
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761767185a.3.1792501095536;
        Tue, 20 Oct 2026 05:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:372a:b0:93c:b721:b108 with SMTP id af79cd13be357-93f29b80a35mr1761764085a.3.1792501094964;
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d81035csm6353477f8f.15.2026.10.20.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:58:14 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:58:12 +0300
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
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
Message-ID: <npllqmvej6ua43g3vfr6yx2kh54iidd7x2gng66ltdujwi23at@fswwuqxc6l3r>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
X-Proofpoint-GUID: ImIoU-v5-KBJm5KIgiYUoOnDrDMDJ3Pc
X-Proofpoint-ORIG-GUID: ImIoU-v5-KBJm5KIgiYUoOnDrDMDJ3Pc
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad76568 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qThvZ3sH-gZQT-B3TrIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXzh09gcCJTZXJ
 xe3Od87JfY3YqEbVh5XaiRtp4E6VowgOrzSGNQq8xatP2VwRhgvmJmOrCMqt7PiDL1ut2hUkdQB
 RsUb3bimdmSFpOm/ICp1EINzcFmJZ+B98YYAb3T7+vKzfE/+pAra77+r5rLi91kics5AkewmbZi
 arek/4ZYxjNb/DHfD/3NIgGYCE6yK+nxo9MgF33s6qnzsf5qHXI6/NEm9DxJndN0W9l3F6xazvn
 gahuu0kgUrCKu1U834Da7419wKjK7qcv4p+xNg3W4sVnWi7lkjGWCRCKY+9q8fCgr3g4QvK5N5j
 bRZEt9Od+AKyJV5U4mnrrYDkDYDYL8SKHmYDyuZI8jJ+wSUndlAIxnYdl6n7ox4pUb7Vbx08L+x
 FJ4knILCm9a+En8xhrOPeXzrAHLYfnUHgexrIfI8JSLf4oZ6uVZFhxyijW8sB+5eyueUzbRBqDE
 HvDTLufUkPjG13j4cjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXxG7UdjpaI8en
 NDXAf2a5lPTnXmMwTS3qF1mHmlu/AoOSZQH8OROQv7iYt8ekdEq+wNFkFiX3jOZQuez2mPYcCjh
 VbyQQ+ctymSBjzqiHiWOs9hYsqYX6vo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_055817_797677_7C472A7C 
X-CRM114-Status: GOOD (  11.24  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-15 15:25:17, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables

stray space between "the" and "CPUs"

> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

The rest looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

