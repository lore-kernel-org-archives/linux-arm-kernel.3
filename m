Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE08606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UdY0nhgE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMfuYuMX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Am6dT0AR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=; b=UdY0nhgEOU1By5
	Rzu9CLd5rVeqilgqQvfVga/761ZDOJXPUu1/aC9TsRs0/CJRM4xau2ASiXreCZNkZ5PkbQzLeGa4f
	B1umY1CKJ7aX6v2QYmoId6y8KLSlbbiD9v4YTvYAmeWsqK1/V5Z9rDkEUsSMgz7UJx1FNi02+vJZT
	d4xFrXzlbLO8QIZZaf/WkXRrKtEFvQEIlMV7yfjyol7qjUgGs1EUpLY0s6dho5Zi7kMk3IMrZUpmG
	lt+5Bs8xRUx0lPNzx/78TICTAFrV3YlxOymVcEdIHz98/D6OESFKTYRSKnQmfZrZICrofIyWx2UmE
	dZV6NPG6H8k+DWm0GvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoVa-0000000G2ZO-1RO8;
	Mon, 02 Nov 2026 09:39:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoVX-0000000G2Ya-0Std
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:39:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AaCn2361343
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=; b=ZMfuYuMXuVHTnI2i
	yRZUsfLxhNsB1lBdsevMx40wIH3StJl3jo2kKp+g4KMSehmTQ0yXehaYpdehoLnP
	H0d75uGi1E1sYZP4lWoxyiF72Ja9RFQIj0qeTbTBYVEn1X+okz9Jr04uhFi8c3zK
	usZ6B6TSHF9F3cDWhUpQBzTpzksq/nfJCBNVWPX6xmPNqLq6lHzHimUpAORJcQrF
	nZ+gaSH2ct0wJBT6sjg0dM82nbrlB3zzYqqmdB5YpcX3sjMxJ2DlNtURTWrwn5BL
	4E0uCdZ9MBN0tollRRR/cLIN/XAf6BKtdezCntS/NfolOg14lHd1K8AmkUl1oiBq
	28BRnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x6yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:39:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so241242185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612353; x=1794217153; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=Am6dT0AR88cJntgzuAJksJe6Me5v4WI6PI3WNuc2wNTM49G+Ze9sfG4b7TRal7dbGy
         jFoZK+LUEX+2WERKPjkgg25fKfB+Pm+1NTMyCXsqlIZWmDJfK/TaKK95ZSM8PjIxaCmx
         yGM0xkrHPmNRsF4wtwGLuZdXpCAf13Gs8ypwPJprFxB1zT/GvX8CtTr3YkNJO186dJrB
         0yco/ioNkF890lUwJbpi7Y7kZOmi74WnSuaq7eOuNVgQfexk/AG1hAKo41ggsZf6/d3n
         u+4tOY5U6nyIcYeN6X83YUKXzhx+iswMo6dVntqCJl2s1owoVpckGWzMXxvit9tOQzUJ
         7iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612353; x=1794217153;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=SbXJlyesZfJhVV6+G24NbIsIZIw3jEWtvMoGhMUx3LoDkBo5w8ovx56cWwQ4CMmr8d
         3vq94/rWa13mJhaNEiSgCyidG3ZK/OWME9PYAQnYRxC5Q6GeN0d+BlDyJf78Bmhi9bys
         oAcZLNeWnmICJXpaiamrIqkKvq/TvaCuts+EHBTcoI/cnAOfQZtHPnfifvW+jAkgysb2
         xAjYMqLW2YdpfUyUReDJ9sVGqIah+qK2L/o8Y7zdW+hzrWCAYzAwlj9w8vDjrlCvFcsu
         n5cGpOiHTrKzpWLlD/qKt3ikwMlA5yBWhxkkiYPcag5El6nefDuRbLKXoqVRbljp49fa
         F2+A==
X-Forwarded-Encrypted: i=1; AKwUvBwn1F4KkdVbsqwoYL2b/wCuT0pITTQRS2kIBzvcJDwXXHE63sTw+ko9k1uZ+6U9kXFuswhWqNM27Hy5VIDK8qGJ@lists.infradead.org
X-Gm-Message-State: AFq9FYKuJoncQWXYdz13EIvV4hhrCgFu7+KftXrg2KdG44i2w79RNU+3
	o128KS8tzYzbd9fS56jpMhpj4uZqkptmowSNh4FDclqhahScDbk3wa586YaCLvkWp1E72LXGoN1
	eEW3LOgUojFfeBzm7Avwha5hnoGfFJ05rM3OzQmLERkvDRqCEX0h7B2QI+9+z6fDqPv0MjsAp7K
	9cWYmSriB+OA==
X-Gm-Gg: AYBFou3UhAvAcOfEzy5SXW0OsrKegYErxH7o9uqNJeMEugQN90XYV86a4YdgZz+oigq
	qjVNxxKm25N/H51ASQD5wEW6JJH1jBhQjoPIB2ETRX0RLDNeWliOpJtcMF0T/1vR0ZpeBSYW9p1
	vuuMDh6NtB7znzMdnQ7WQumMJaZax8XeXEz922bkKvkcJLrUfYwu8a2pyYQwHioFYSM11Ew4Lw1
	Lkj+mussizAJxi/HnbOcfKL66juurmdItqeVls6PiFZY+CxJenPDXllRGsI+za/HC8Ky/Pxmdrr
	OHx18ubAkhDeyPHo4bTmw6svPddN+2DVu2RCME0lUtpxszRFG2f/Be07rU09IfwQtWNoguEEYd4
	ySE68DR/w9Z/3bo9LCVu3wupmuHoOhj9ZxFbVsSkxT5kqqp8o+FQYM8xX8bujlTuBul8V6orkmH
	Tl
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519529885a.73.1793612352664;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519525985a.73.1793612352017;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm18880436f8f.57.2026.11.02.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:39:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 00/12] gpio: mxc: probe cleanup
Date: Mon,  2 Nov 2026 10:39:07 +0100
Message-ID: <179361234152.49297.16476841533966255067.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c3xB5XGMldj06xP01HmBvvNFPyyxNu4g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX/3QBAD+tt218
 NH2BtXp93z/ZXNPzB4cSUBxIE5l+zCL8/SFarhBhWZ1Ak2MSYGW29ncafv/P2hiYEdRIQZTwtON
 2DO7r/ZafhPw4XVZSoHJE70LN6omuLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXz0CSURLRPNHD
 18qK2jhOE+QXrzpmZDSc1zdRmci9f/40S3Ieuj15arRi0HamIy9IiP8WEcSyYm8IGVfCvo+5r73
 M/7KGoxkBT+w0kP0GVvemJOkNI9hnAyPM6wlXSKNRdlhvq0hAHoOaj9kE4jj68YflveW80KpOpT
 yDh7CtfeAA7HwDzwrbSBY8GNlsoOh0XuJIzZ9rhpQK6bm/ET0pgsfNAJ+/D2Vrf9Q2Nr0TmcArX
 BRT6M4EBm4QP+LFolExclj7In0lmkEg/NMtohgJAoYDbAyJX5SdceTM5T2fiBnVsVUb71ObNhd1
 NLlBZZkb+RUikn8tQv47DZd9Mmou7UbJrK04ynTMMmoqyfxNspZD+sR2fNYiI3pi0TwrF9c2Sh3
 FEssPJTgQoCBHsqR2kNgLrox+G9Ysbh3J/8m+qbbiMw+hclfd9RZUwPc21TU/L268u5kIMI8Q8u
 YIsN6JlE3OhMPrNRpSg==
X-Proofpoint-GUID: c3xB5XGMldj06xP01HmBvvNFPyyxNu4g
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae85a41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dTNmjvSPNBXJgja9_wUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_013915_268112_B7774D07 
X-CRM114-Status: GOOD (  14.96  )
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


On Tue, 27 Oct 2026 20:09:27 +0800, Peng Fan (OSS) wrote:
> This is the cleanup portion of the gpio-mxc series, following the bug
> fixes merged in [1].
> 
> For Linus's comment in [2], I will use a follow up patch set to
> update pinctrl-imx and gpio-mxc.
> 
> Patches 1-2 are wakeup_pads cleanups: consolidate enable/disable_irq_wake
> into irq_set_irq_wake(), and use for_each_set_bit() for the pad wakeup
> iteration.
> 
> [...]

Applied, thanks!

[01/12] gpio: mxc: use irq_set_irq_wake() to simplify code
        https://git.kernel.org/brgl/c/f9922db7dd7ac1a0545e165b4ca52bca77394715
[02/12] gpio: mxc: use for_each_set_bit() to iterate wakeup pads
        https://git.kernel.org/brgl/c/8b56c9bc04d5febf1bcc6b3ab4020608f7b59bc9
[03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
        https://git.kernel.org/brgl/c/fe290228900ba8a6351677a97feb5e7a8bc493ca
[04/12] gpio: mxc: replace of_device_is_compatible() with hwdata flags
        https://git.kernel.org/brgl/c/363f30458065046fc1ba1564a1932f5deddbbfbc
[05/12] gpio: mxc: convert pad wakeup compatible checks to hwdata flags
        https://git.kernel.org/brgl/c/eba30afc04687a53300011bfce94e95cb4050ff9
[06/12] gpio: mxc: use local dev variable
        https://git.kernel.org/brgl/c/569d0a6f57fc119c7f9471bfc7e0886070c6bf95
[07/12] gpio: mxc: use __free guard for runtime PM cleanup
        https://git.kernel.org/brgl/c/6d0d40d6d39dc0314a54d89ed1635da9df0c8159
[08/12] gpio: mxc: use devres functions to simplify probe code
        https://git.kernel.org/brgl/c/02f1ca1b7a56cb52813c476b9c881862d29ede33
[09/12] gpio: mxc: add dev_err_probe() for error paths to help diagnostics
        https://git.kernel.org/brgl/c/a0739c3cc3d414d981b124543d6b45eaaeaccc08
[10/12] gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
        https://git.kernel.org/brgl/c/5ae5ecd98ed2ecb81b8b27e184fb28a278193673
[11/12] gpio: mxc: use BIT() macro for single-bit operations
        https://git.kernel.org/brgl/c/116ca21f82df0eec13a1b949746aa17fa65c0a22
[12/12] MAINTAINERS: Add an entry for gpio-mxc
        https://git.kernel.org/brgl/c/2505bf94979f596f2b2146cc654bc28cc46bbb9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

