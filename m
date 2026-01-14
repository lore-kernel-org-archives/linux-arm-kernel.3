Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4977DD3901A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=; b=ID3pVXKZqS/4DhNpYtJlfGY5Tp
	eg6U9TGxt8ajZALdAFpgXxK7cbo3yJbE1Yf+kieLOCkat5vofYr+fMj+YNpFolSyN99/4l28ykZ3C
	frfK+6kbxWYzfmGrqFjTW/qcFHoQvWMFtLs6JpFU7Hg1c8U11fIdbMpzTQor2sJhnfUfGIGduRDCJ
	wjhAqVO0Wul1fBWm/D0USfkDd5w3eilCg4YgERUMgnAurYEkif4HCthjqJXSo9qZ1pq8fR0sXrLjA
	9sAx4x7ncE+jA5+daveGxz0dMlQQwtxQcri8MMaN1tCPCXcO1eYBhu2upjlJCKF7YOIrOMblysOkP
	/UWo+QWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Zj-0000000Ae4e-0aTB;
	Wed, 14 Jan 2026 20:34:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Zg-0000000Ae3M-1Sv1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 20:34:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECrq9d2736174
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=; b=Ns25+uldQ1DaIQeO
	HjYOpkWlYYe3g8JDT1yTh0ggWSEOBdKUP7IQQdK/m6u87EBdlAiyjM8cVcsUE/ER
	wH/0zS36jL2yIJvdkx4ZYA/rFXr509YPvxYMEi0fqXFkyGs5VvrBom6he7rDfAPE
	uSmlPi1gYIFCKBxlpIQfchkYhqywZCRH4JNI1eeIJ1bo7Iwiq3lqAcdv4gl5TfL8
	g8vFo0OQBtaq1h+hGfP/SwSS/Ev+hcNCbDqXzEjBggdUrATyNPMVAUOoCQjwwgJf
	MltwdO4xzDo7m259cDcvpBWOxx4P36NmbW7DgQer7rb8+1Bk9ox2gnaTFLF9Vt1N
	gIZurQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5hj00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:34:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae546fa935so1928021eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 12:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768422878; x=1769027678; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=;
        b=N2/gmDL2mZq7rrsmKe7RUIyvacfyoA9vyRYFwMfLUQ8Fe+hS2YioPK/86vLH29sLLd
         G+JWihglutv4Llj6ANE+FAeK0CIaufZiGJf5dhWtZI9XkIUxoKMJe7cf9BfG44nByp6M
         4XvVyy1J7qBsZzecsgnykAzXXRvBQ/Z1EB4UlgUyQ9gdpRI+/foRWQIe6yKgzNEMTvyQ
         IGfgrCzB3YZQrS17v2eLflC4X9xl2T+lggltVj7ploPH0AZ4CVoNs0kfldQXBqu6Rewp
         Dhfsbwre+uD6Uh6xe+WIli8pnZbYrGJLaJCE8RCcQJcIqkK3guNE2wQySGSdkKkjz2q+
         cr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422878; x=1769027678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHW56oNgeXN1LDKk47rv/B9tfR21iu9oe971dwrhaBA=;
        b=g4rM7ycb8pUSZ67EBrhNBILWkZmz0MNc8EhIu65If4uSfqGovv7axoiWo3Lg7SyQ8n
         tiPxr/ZO8T473Qj2W2H/ZMFb0Q0wCrDdR0qK7H+2177T2++hhqSASKhfVF8+wRJRuen1
         sKh6U4kAGuFm1XIjhnejAiZF5X12HG7tCVC9ICeKN9frD3nUXxgIMUQhRkIy0wAj6fHL
         V4mZHIestUl+D0wH9tJaM+v+OJ2KL4SzbxRaDSG2ubKed+7GdW7qg67H5volphePF2Un
         4HYkBKqiYBilNzazc3itTvM8sCGbKFZnClY39oe6B21cimhqL78C93eYi8WxCg2kJ8LA
         q5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvEFvFV1LyzRrbypzpVjCrGe4yX5PhNp70mgSWvPiCURe2OUHvOoy5uwQYLszLCYAJMd4FLHcjCpXdUzpBzIpz@lists.infradead.org
X-Gm-Message-State: AOJu0YyTCMlEW976JJhSz3t5G1m5oqqNGjMg0vDNd2RR0yzHKrzHZWRT
	i2tPWGqlNZshTcCFNmzYznZ/ozAn3eybuB3lJL2NrS9a3XNPZpOMiA88bJaa6vnWRphBDKNeCK9
	S+Z941l2ygdxC0LaZ7heecBg4rtAIqALwDsaN7obssQ4VvhhbZII2TZuhQCV9JrE7A9qO3vjE74
	2OMg==
X-Gm-Gg: AY/fxX7rCz37BF6yM94DJ+H8TAvO3f7qUTIbSKRnXSSXWik0DvNZLyj+w3LW+d2w2sH
	WQsS9sR8ccO08tw5+16alc7lup9R6moEm1R14p4Gb9Ng4ceZ4hgp3pYCVA9wautoSKqrEs+86mq
	uYCO+3UeEwwDQq9og8aIB1hBIlPFzez++3ax4zmIl+z3/IwpnplIJ6mzrm+3+19LAu3TLEhJ7hW
	fQ5ijw7ymJIinUvTgr5tKupTc4XsBT6EGWrf1IS455MbG4qKV+mPlbZFnlrn+z3CBdoEA+B7PSB
	2BG3rTaBEwmzJiU63bK/TxxIM9TifGBLqO37PCSEw+w0Kl0bn4KIf+F6ZM9lK+miPM1g6kBMnKp
	YqJTxqKu4ezR600KYtms=
X-Received: by 2002:a05:693c:2c15:b0:2b0:5bfb:86 with SMTP id 5a478bee46e88-2b48f230681mr4714341eec.17.1768422878240;
        Wed, 14 Jan 2026 12:34:38 -0800 (PST)
X-Received: by 2002:a05:693c:2c15:b0:2b0:5bfb:86 with SMTP id 5a478bee46e88-2b48f230681mr4714293eec.17.1768422877702;
        Wed, 14 Jan 2026 12:34:37 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm21242064eec.5.2026.01.14.12.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:34:36 -0800 (PST)
Date: Wed, 14 Jan 2026 14:34:35 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
Message-ID: <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-6-joaopeixoto@osyx.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OCBTYWx0ZWRfX8eNYg0GhHBgH
 7SBWj94zhLuDV/96Aiq1zfhUyhxmw383yfccS+DT99YgtGyc4zsf7jCDDNBBF12PCdowi4x5bPi
 dt3T54Z5BfhxSa4um3iEI/Ghy33tP+Kkv1VlZsWL2v31smF8l2ihgNTFn7ilrYze9kUmeA94S8a
 dnl9G6uUE8ZIlNnd6TeDzzGHTCiS6l8Y2lTj96PxARyWZILYuTqbuT1S9x+0HmSfoeldjas/tWp
 qIRPIfhhr3IhnG2Fgm5zSiBCW8rcAdGnTPGX6Ph8jjrxP6v8zMsiHMfd2cT0miRd5Hzm/Jw32JY
 JCIzLyGKBVDw6QgEfMjDQ4DBjiZCpikp2HUEtuO+dVaMu1phofBHEgGlEBF07lAVq8u/ckBAeKm
 snZs1FllbEEoAwFOcX94MKqWiS8eY3HbYCz9lEPl/yURMWvEAx4ENydYn8JX78uRsrpiWFl61gn
 ctYvtLMgrBAEFkBfx4Q==
X-Proofpoint-ORIG-GUID: Pr64XpZN_bWosZWYkVBsujSOyqNLxrRk
X-Proofpoint-GUID: Pr64XpZN_bWosZWYkVBsujSOyqNLxrRk
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6967fddf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9CwZglbhEJm_Vmq__6wA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=VxAk22fqlfwA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_123440_503543_9BB98EA7 
X-CRM114-Status: GOOD (  12.63  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 07, 2026 at 04:28:28PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> Move the IPC shared-memory hypercall ID from architecture-specific
> headers into include/linux/bao.h.

The series should be rebased to have this fixup integrated into the
previous patches where the code is first introduced.

Thanks,
drew

