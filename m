Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28121606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0tHxZqBG;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQY9vFS+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR6EUkTA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=; b=0tHxZqBGluYOuh
	Qx7KciThpAMVr61U/3T/p2yy2bFwhMxgteFqGCnZ1Fq9XjzMYOUnspqOTnC40TR/vVJ6m59KfZR4I
	CRZLthVe/SDhaHEkOtZNqmknHfeC0yHutAvmAKvB8upu3klPFm7v8n1491Ft+ykWVBjasE7VCbo7W
	GnmYrBCCphZ8tAGM5tsE7C3eRrifWLDouLgC1YKGgu7i9OZWfQePBisjCFNn4xk6kYnXC/Z4ayRyN
	8QuNTy1LokyZfSTM0mzOiGKoZWxC0GnrNj/qcog5Kyu04JLOjqr9X1J9Q50Vqga/F+K0tk8qAeCG6
	s7W1gcFXrLH8/ZT0nNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtX2-00000008GQ5-3EKr;
	Thu, 05 Nov 2026 09:13:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtX0-00000008GPU-1QR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:13:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56V2nc2588239
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 09:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=; b=VQY9vFS+f916fsBm
	rX3P5iE9IbgB/XThZDvdwekJ7uK6K5qkEEV/GOdy++Ybca0QLidKN3svnWQjIFuL
	e/sz8tVl5tbtUIEcZ4UNlG9au0DU5Kmq5aXsfIGhSmnn1vDPZ9rHxjUgt7uxhmGz
	vpJnyA3qo4Cv5bY+cZ0xVctvGrEbRZqgPWkyC0hVrK8MJ+Q+r+zejMh5GdfyPxCm
	g65/vC6yBgHSZByj+mjuZNByeCLUy49DmrLweKGzv2YsfzeLxooAvVsa/GMa7s7m
	zZfgkrDd1yaAEHWh+P2wJ+7/VkdCuHDoQx/CT0BKuBKe3D0mnR+aXtr3FqAi7tsx
	i5WkEQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89suq1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 09:13:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc099197b9so1294245137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869992; x=1794474792; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
        b=SR6EUkTAH8KZiytP/FJ9ca4B9GhlzJdYhfTkiiWUhXnK7Z53uYngE0UCbbbpreNTvo
         5vzUPj6B5ViMJrenCx92biIHFZSyd6xV7maqt8fboSRjIcc6TLw6RmL3yjNQ8swbEtZ1
         LEnqDeisroFRCE5vd/V9yeYALWojC/305ijiSuYMmmDuXHD2Q5J+vqKmlRhoffTES+cM
         Zjv2vlpFsoQVob5TdpRCZCQ/1bgVgwPoiNFQ2yxv/vFuwd3XYogarp1ZoUxxBRZZKgbz
         oHER2r5PSeXgKS500NAnbSvduE8tE2dEc5bxFFLkGagGV+Q7zmcxewMFM2Z45puptHyg
         XIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869992; x=1794474792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
        b=UPjlXP3St+MgKQUuRhRV1cguDPI2TD/y23i5DMyl6nrjWWnj7QkZ/Ntq9zMhab64FQ
         /XyUVcZJakQktNZoDWb1vMGLTcWOKNodAijEGev64wlBsq/DQ58WxUEPIgZp8R+wbkeT
         oAjFj8D/hqDMbfLkD74QQMR48F0tOhmhp3iZERGRPHx9BXbcFruH09aZ69+hOICYhBmM
         QGIzv9h0orfZHL41DY8xnaHtdWjVq8C9Bbna+pdpVS+v5s/tFBbEF3qBKfeb9ScvGDdg
         evZ38697BiE62vUMJJykYWzOsiP1nt1remvLTjPa0nCif8vY4ncHSFgOfkSIPtP9aOdh
         tEPA==
X-Forwarded-Encrypted: i=1; AKwUvBxozDCiVHBdr2F6v9hk2HZrefyQEmcJ23rCCla2yDeNxHUvW333qet4PhMWU+gOcmcpzG5qX8I74EOPL2hg+6F1@lists.infradead.org
X-Gm-Message-State: APuU4Z/mAAoCS3suOOeEccujyo0MUAIoJb3oyNA8kLXIaTdYSR64Lxba
	heinhETViSOxRgSox18gAHVSe3ZiU4Dho4YI2xsC53nhhkjzizyxZ2C000waCgiu9D/6PBxuyNj
	FEQ5ETZsc1Wt8kv/ljso7z/WlNIeqsH4YkqTV7QLdlkvTN9I/Vennxg6JHD6oWH8bpJ7GRxE8mI
	/iKQ==
X-Gm-Gg: AYBFou0+e9lay00rmPk2wWW9kw/+AwvXw7rBluZmeA71QwBH73MBKyXC7XX2TWkznWp
	uKq8xffNMBwoBQZuOkhTz8eVlZOqcBE4ytUHtjRkKEcOk6iqKhpc8G8MU4xpf6JqzP+RUrCbe0a
	0droW+e4vOGhtFeHBAs97/3s3bMZ/IAReFM9v7bF5LR2FnBhUOJRQqIrbZ1AHGdV/xmevRpdDy7
	rj2ArWRlmPVo6jb/+B0T4sY1zJmGjh+EU2IPIUQkoVt+2nktAP4CNArKQs2Vzn48Yc9W4beFUMJ
	AdX9AVTpsg0ixI0//200+g426JTqCTCMsjDCK4TeA2AzS5gu+B+5txV7WIeTDgt5qGX8BNs8Mi/
	fNciiz7O1Tn8UKH459EYzcUvoTsYYLCcAc5ftNi01sPAoAN7xGOFxFYGH2FdDwtj9KPlAM4BDdg
	8o
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d072cafbdamr8260495137.25.1793869992590;
        Thu, 05 Nov 2026 01:13:12 -0800 (PST)
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d072cafbdamr8260470137.25.1793869992117;
        Thu, 05 Nov 2026 01:13:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18175bsm8523052f8f.7.2026.11.05.01.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:13:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Aaron Antone <aae@amazon.com>
Subject: Re: [PATCH 0/2] gpio: aspeed: Fix lost interrupts from write-1-to-clear status bits
Date: Thu,  5 Nov 2026 10:13:09 +0100
Message-ID: <179386998646.14190.12898260042958043905.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
References: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9dmcMKz8f_C0TWMsZjn0BjuulXoVd4vR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX1GkLnxI6VY0g
 b1UOBmXKtLEpnDBdGFwkyWZ3V1k1+UZYjwq7THxw9ho4Qndh3A3NBMdOlCWUbfjiMgMLmUeH+te
 o6EMMdBOOjkq+/GixGw8MXDddQMJlipdtoVJ7fJdhiCikkuI58xYRXbceQagAOC2k35nNw5OAkc
 PfF2b21nlGynWtpJAq4BKF4ncAdlBhLHMhhFCnHa3mVc3KDj67n1tN96FNL9tMx11Kpmi1miPiy
 Q8xvZct/66doFPidn0EcLpjU3jj+4PoaztgOJO9rILuJW3X9gySFv5yr+9qneZBMBtrtO1l0/hl
 WYwR5ZDBu4WpsM/ThY4xkb3k7Y7JkH6VnM3zbvxB89Osb0bxS18aJ+1eWPTLhTu9jltiJwvBK42
 efGmpfR3iM/OjZhafC4+5Lb8pn4+E0YMMe0CMbNgR6VFE6qK0/HjeMfljYMBMri5ZKXpOWACX1U
 yDAtnbBYByfUkVIgvqg==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec48a9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=voHqOY2aTaljLMbC2lEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 9dmcMKz8f_C0TWMsZjn0BjuulXoVd4vR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfXyqYkDR/AUVSx
 Bqm/4WknGh5RSf6yTP767Ncg8hQh7au2z+KEwjwMJok0hcxkpKgcHFBLH7La11dofyjGNzfQ6Xe
 mWQccsX6Hj4vKlwFDryVSL77scBcEpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_011314_400599_848E79B5 
X-CRM114-Status: GOOD (  13.65  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 11:58:34 +0800, Billy Tsai wrote:
> The Aspeed GPIO interrupt status bits are write-1-to-clear on every
> generation, but the driver updates them with read-modify-write helpers
> that write a pending status bit back as 1. Each write therefore clears
> interrupts that have not been handled yet.
> 
> Patch 1 fixes G4 (AST2400/AST2500/AST2600), where the status register
> covers a 32-line bank. Acking one line clears every interrupt pending
> in the bank, and an edge that latches after the handler has read the
> status register is lost. This was observed on an AST2600 BMC with two
> lines of the same bank toggling together at host power-off.
> 
> [...]

Applied, thanks!

[1/2] gpio: aspeed: Clear only the acked line's G4 interrupt status
      https://git.kernel.org/brgl/c/5d362564bd2982def7e80d7f1e756a97440c7adb
[2/2] gpio: aspeed: Preserve the pending G7 interrupt status on control writes
      https://git.kernel.org/brgl/c/18cc1d1ad94df8a6760fff2617d3d6923550cba0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

