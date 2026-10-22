Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B98606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DT2eoUsv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eVs747Uv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsVE8zcI;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UE7thtrm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=; b=DT2eoUsvVmLZUE
	ZAf5GkVdmRn0H/BeMQi6NuIwK5zj02GVZomzfRD2lLDql1q4WDemDB3W46CQzp7+wqgM86xL9FNXR
	2WADeP93qfTAT/Mdr8yE25MXifrQJavXOA4PU3hc5PUnI1uFNwJIZK6eyGaNdFf1OOIoz+/3rAPbh
	g+Pii50TD8Jl5BzV6kbLtlkCaUXncW4Y8tRem9MeYsxMJ7ZHNBL9GyzNFCEMUFVo+qndAXe+40FfF
	rkPJ1lTgbxUhLc+eUheHX6n/OLykUxKF+Z8GnQ1+f+Qso1N6qEdFoIiSGyG4+0fwGbYGjYAI1Gfd+
	eIsXMFfoNWVObBPjMNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJod3-0000000DmGJ-0hNe;
	Thu, 22 Oct 2026 08:58:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJod1-0000000DmFH-0k8a
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 08:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=; b=eVs747UvkjiI+w+yrfEgSjzXZr
	t8FsixX9j91/AK5Tv1vkFqt4DKwdWNQ3TCrf4xfUcPSNutTd5PDyVFmsgN/07CLgbFZd5VD0EKapP
	tg7CuDqRPD0q8SlMbnVdVlax/1UoLNsX3gjk6SsmicoAV1UkbB4E2QJJOWyEhdy7ujOivMgdlBrSO
	Ie5xURV2JWUd5HNi/G+zJWo0jBGBiVLzCD05sV2G05EAy+RorbE30x1Ou05IQPtWOePLqeyTXe7e/
	/pzvufpCi+wUll4rnCSKQYdNrVpU2MAumXdTTtBGQ2YR2K7wqqenEIMK3M3q7Ku2rCeGBzdMWEgI0
	ODSO4zcg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoct-00000006hdM-2uwF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:58:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Lovq3194764
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=; b=jsVE8zcI+fke8xtP
	AGMzS/nLog4N9L8TppW315PZf4yVv3yfK4WpPVff2VUUv+Vn3V+oTHhtGCerGpoE
	f9YyFdt1vxxe+ouO/GHq1Q9/lHI0ZVr47JUtC+GTXNoreVL2x2wi5awuPAgEwSa6
	qXfDzZ1pG2/H+bi/AnZb031e76p/l2lXDjF+ZT6bhDOnNrevOOt005A2J80i95dQ
	cZ5dRiNYYvJD96Qc2xPgELqpQ0PMMZegD4x44ASG7WTlfBud7FpZBEPiFxU3nIYp
	LSrQc3HP4wOFa3tVYHE38p5z7bw8x7JcW8zhgQqoXbqrW3GD1e5nD/Q3QmhxbdrH
	Ng9HMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq05ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:58:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so170364585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659496; x=1793264296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=;
        b=UE7thtrmywShHsS95/J9zfrixEEQpbNho6ud9xzeMf6Inl7NEZArC1b3r3EXMNTP2j
         BrtfCuj3lunV/1eMBVC0ELUdZVc8SnuKFHd2YsEw6ayPx4oFlPhGPBD2fEL5fbeMF8f+
         HxlDx1/sKSCpp+u4tjC3cEeW7SZS0uP2Km6U0MQR1ktzfWd4nKO8s6kruUN4O6tLs+uG
         0/tszYOckG1YEhpoZv5HsQpgEEpW9qS4B0MNMogN/3MmIMbHme9rftzBLZY5lSnkOu3G
         L2BgKqQiszIiqWuUa15zSMA3fpOwkrx0a4nxFaNSZF9W+iBA9DCL1uC8AaRcgCTJ5rws
         UqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659496; x=1793264296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PgmRG5zgD8CvnXk8EtW3AgReOwJIYBKgnTHlR8v6VU=;
        b=GBXpJrI91Zxp7N96fbwKgmXVgbZlTBBKCh0F22jif452S95APwLGVAy3NU83aek0Ql
         WD8H2Cryhurt3t2kga/PvgmvJGA0eVMttsf5f32RtwS/zpCMtSb/N9/491whDmmcSL3h
         MY+WN5G0Zr7re86X3xzqsJXaxAnqBm555W/u2j0B4qUfxKizUv0DHb66i0gMeUR+vqqG
         RbNhyx+0wYJqUbubp/xGtJYnmDsIIMHWh+AsbDAe8NijL13kPfInYjDM/It8ge9fWLva
         naIxYo5+U9TFpNsxY2uFbdfn3tTS3XH5XKOkZTnccATJzoWh6lSloOAbmMSP/iTyUSYU
         b2BA==
X-Forwarded-Encrypted: i=1; AKwUvBzhlBcXXxyjH6s0LhOUzPnWcZ9bClPKlMlnd1ZFS7jKZRavYSzGA9+RJcPHHao5shFx1iSW7Ky6Fu21hh4ddRtL@lists.infradead.org
X-Gm-Message-State: AFq9FYLVb8XIFyuU87Z1HtkXRpYaIpW1IWi+vmf0pDOwaFZe/NQI4waq
	ae/E5uXTiaiHHaPhuUj0sGMgaGt4ffVCBncY6zwd4WKITaa7ajEpX1p6ePwnFVNI19rFPAayO7M
	kImusYSuHO13w9NF42uT5DJRnb6c0ZhanVzWYSEnQDxY1gMPWadnS1oLwunH/l8bwMRUBoX1p17
	v+pg==
X-Gm-Gg: AYBFou13ceL4m8nfThu+ruWWNP9iZ76jqCNeqKM2YZiImEDk+cuBjxkWw3K5kaulgqp
	1g8vzA1omEjMzrFKP+Gg7CUdSbXPcdkKymBnlhfT6ZL8SJzcX5baWY+9znTAETvDs/cH9s0TtT5
	vIqqWehPZ8ZLJLyTkdCC1mGf/P00SamCLOKx3OhLuCZhrXP1xWb0+fXYBMqanstSDuJP7x1WX1X
	9PqkkmfvV6cNwY36wM72/vYMHokg8Nm56fDamg5ufeav2uKicc8iBBYisNrnKwStexLW+TMZsyw
	J/QvCchJEeK9rXuz8o3rwO5h6tj5X60nd7MAwKjcyKO0z+vJJ/ppuHsWZqhmTllYAQlpKoZLuZ0
	BhwMAPOavLiJ8RA+SxbxqKy1OQWtA
X-Received: by 2002:a05:620a:6410:b0:93c:c2f4:9182 with SMTP id af79cd13be357-93f57f66009mr872005185a.20.1792659496042;
        Thu, 22 Oct 2026 01:58:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93c:c2f4:9182 with SMTP id af79cd13be357-93f57f66009mr872002585a.20.1792659495503;
        Thu, 22 Oct 2026 01:58:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b28f70sm61625525e9.4.2026.10.22.01.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:58:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:58:00 +0200
Subject: [PATCH v11 2/2] Revert "crypto: qce - Mark QCE as BROKEN"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lcYKx5PHTS9y7X7qBQ5d8cuijJO8c8zYjjKHfQc3vNA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2dAhmptlaoat7oiLg/6ol82V7USxsh+/lLc8Z
 X07B0BeF4uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatnQIQAKCRAFnS7L/zaE
 w9kLD/9Yfb48Ar8hhOmNvaf4Glb/uNcJDnptVhvU10P9yDGMc1ZNdIv0tuqhlVDUXbhcyZlDJkN
 UNGU57+96+7hSzAx2m5hVC8ZKKP1LmKjqBSlwVVaZ9vCLGrhmCc/eO1h1r/JV9eBYrzl/TiTXjj
 QagN9AACbUcgvn45Rsd009YLKGabZoSBQ0j4cGescYA3Mqv9w0RTCe/Drcg5uuTHxKp/KNparBq
 ABgeDfhBtPIHYK8Kv+vTVT6ISI19mg3/z/mePdltsf312LTOgAeeMaoKgNnP9R2AyZqHNzVi2n2
 QY7j6VxNIlZlSYFNi21ZyoIP/75OH+ahEyeOO13zWWjd8VCZ1upLEh7P2jrvj0/UD8DmAsBv1cH
 gE//7YZSE85FGRIwxmm6mXA2yDkyDD51PdXPBct/eaSvfhuzBKmhA6BGnUxEnaJU0mZ73roqZoO
 2CWlAhMfsExy7OyufmEqwv1cSUA49/0YRdZeVEPJHHnnjb0fgi5jyWRdgh/T/XIedokRJY5zF2A
 ga4/uix7hUdYVAR6LgDN1bSwFSINg6D13n7Ry718U+Zg+qAN136rw/B9z2n2HWnu9dmHoGoq2M9
 gboZc7CynC++IyLQ4VphDwJjItxmPAMhnsJ/5DXcAQ5X5V9qii/Mw496+xWlG02dHVz6po+47bR
 G1rxtcHnt3afpQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: h1R7nrTd11LFFBx2oUzwQP85EMr6c5GP
X-Proofpoint-ORIG-GUID: h1R7nrTd11LFFBx2oUzwQP85EMr6c5GP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX6vSkHgygkvC3
 393rRMCk7uZ6ETkKYGmBw1Hei5Q5+Zl9cZdUddHWfWNGMJdfrTbri3kKZJ4k5ekIKcaht589xEh
 azpeaLF05FH3Vc4sI8sI5NsmPZKUjw4=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9d028 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX4Sl/ic9mILbk
 jCa7/fcW6IYi6zTWuoT+uTer3mSoMkB/x6TqlcPaYvthqy+pAoaNFokn/PXkaO0w1eHY5EZw6et
 PSc3W8cpQzhYQqrEMddqPpMQIild/mR3OhGqsdebn3r3XTYT7jsqVZoWC9wDIoLpwyKz0v0Hz59
 yQO7AWb+IbkRkm2EATnXVh/jD8MFbsmjfT29R3sCTrP1Lbr109yNdfSqazrihCm5JX8nVvXvtck
 4BHjlM9jxUA2/KxT11GaFealWeafBAc1BKEwT4E4B9dn7vf7fCZRCdEq8mcb3yzeHCgtaubKmof
 CkCJBX3bvwqL45D6bpIWOp8kKgr+Tc8bqw6zwyOUklfJE0f3LW37hdEKIlNecaOS8StXsUCOcGG
 iDOK72NxKocYhW8GThYQGq3VBiOZcPX5mVT65IGznp4oOpmUW7To9PlTl/v0xVaxjTnBWEnx+Qe
 pglCPQwgfN6tw746cSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_095820_051342_530F3CEC 
X-CRM114-Status: GOOD (  20.23  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label so revert commit df373d39c6f0
("crypto: qce - Mark QCE as BROKEN").

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Cc: stable@vger.kernel.org
Fixes: df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..e80927f87ff26fe3f51db6409f509fb99ad614a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1949,6 +1949,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3


