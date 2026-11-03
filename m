Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5AC606EEBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTY+bmdk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1CK6Ffo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmbjVOHX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=; b=GTY+bmdkeJ8jbCj8wTLEt66up/
	SrL2bfVFN6uesWAg0hUSxzjawWPgGxlQywyWvoMa95TOefIi5b0Y4/NAdzJfSmJoaoXa08umWEstf
	o0/U4pHrMkohBEo5y3KYu0RTdlbYVEy+oIfv0D9EExaou0gk5ja6iTskogto+/8oPzM1nVnJhBvVQ
	vXIDFbhLwuacSFjg2+cNHg36st9hFwkan/RXqOD+eCOcdAdndb+Anh5dH1NmDLJWekuj8ZRUdhCgn
	3rjxFBDsx3XmCjHF+/ot3D6XpGjnW4D/vDVuvgthGLh4boa5dYatndzlWccpnYY7iVnIk+zJmGil+
	dXFlsnQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEeX-00000002ZSf-3cyQ;
	Tue, 03 Nov 2026 13:34:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEeV-00000002ZS5-1MDi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:34:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClEV03869368
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fSFNdJgGvwopHTFPREQKhg
	PmKSBKEGZI/r6GjlVmNlQ=; b=P1CK6FfoAAkGJNL40dyQMbJWqH1fCi3gQZd/8z
	Lou6/z0PloUEvicelSjeopBBgaVP7ptdK3DoIPq8HMk4bMEhGUQuadxsE++tMOTK
	MWMysaVloK09OijfNNLA7RIGKyc3C6Uh8w0S+jG84NsC/1tKHZMZ+uo+eo/J0oVX
	el+s8EVytA1aURLuFkYk2xt3EHyABEioJqpcwLyq3k151ne1Pei8ahFdeFDtNYN7
	ak1kBMTi8a4uUgZdV2hL5iGRsx08PxySTt/1Xp539W1ZjYegHY2C61z6CfBlrNzp
	vstikzjAOadT0/+ReQov7Ve0eVsGCKx11YGiKWe0AovtqQHQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy32n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:34:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso594782241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712853; x=1794317653; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=AmbjVOHXkBAWVLTas7rB3K5Z5OgJd1R3d+OBupfSRakRdc250u4f8YVQA8FIrV+AnX
         K7BabvOQV18i7PXddDNbxCCB6vBTEWU9a5jcXfcuARsCeD7cVkUDDQQK5SFjsxNeg0GP
         DYGywV0Js5d3yxa1NWcWvF8B+AP1skWD+jLD0AZ1S9prX5oAvetMzcncVx2bQz3gxCM1
         4PNwl0qQ4QkG+4tyoLEHwF6sk+m4wXPECaqmA4o5b3ZBtamNIV8etfsoXqZ0H3svg1Nf
         nLfvVEghC9lcA+BVkPnIKBLtXaTtn6UKCUPGKtPIvVB34BrptxaTu+UIdc2CxNrAkDCO
         lffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712853; x=1794317653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSFNdJgGvwopHTFPREQKhgPmKSBKEGZI/r6GjlVmNlQ=;
        b=DPiUKscDn5pBomjteNsfVrU3gAVLExsOUph4YbWKU/c+Ti37C4j6/O7nml3Gj64ESl
         kXcOC/oY0MO1j7OmaDhcSs8HqL2L/JY1f3ZFQo13xg2YD1RcvgCNS6VHyMk1zp3rprBy
         XiAkOXD0fFzsXnhN8e1Cgio0GLqg9hykqb0PuZOmSWG+kpg7kSAG/B+qCBlhnZ32ySA1
         OT8/Ncv0Z0qY4flKd6e456dbI3ltpv77Tm/2/4DMkexSsUjb0nn1CIrnAhdJJ55rMJw9
         OOkcFUivJ/VIp+N14/bCQNUYWr0cKJSneyNQjz1uVQmPES9QUOIijQcgTZR/OkEmpZmr
         BzAA==
X-Gm-Message-State: APuU4Z8DcW7UBOfQzDddOFdbrAd7Pru5dLXpO0eCDh57E5m5eXQa8X4d
	1QlK20OY5QXyCFsloiuLpSTYf5EUcWacCNRK5pkB17B5sU5Y0BmSINLsyUG7RgtjJXR4PnpR4gB
	RnO7Fw0wFVwalcugsrM8ZtEDol432zut11HVDmhynzndiu1Hooe6kXamUjDyDJrAFvCdfSUOKZF
	z3sg==
X-Gm-Gg: AYBFou3hn1TJj2zdd6h8c8lS/c4KKrE1eji9qrb56JoQnCojTsagmiF+bdLU2Tf9InE
	jsJ1ZasckkG7fKi9stlGTIGIcgYrB/AJ2H0tJr/Q3fU+JaJcbbHRV4TTjf9mY5x6BnQP0bQJJ33
	LD/aEyT7KaA2ImM5to/vrqAZh0YBxIPg6RK1WDDaIqFLjPWp8ukjveB0VSGq/2oscZ78eiX2JVe
	X+8pjZrEFwL76xXbZWr7v6YvtSLn/bOXxfzQzAeWPpj4eyzuFW3scHFuZCgLCU4mgCPAtlb5OPw
	1S8Uxt0pBD+rBzjnsQzo/FIPdhoyYUJg2sV//m9SKHtieELVLxhODce6qSiQax3Yu4yXMxvlqmq
	8Wh0jiuniF6xv6/mltJvnEW6mTSCtFY723sqVU76waHBMCme7a/rAAqMcys9vt87XPy+s0bzE7u
	oYew==
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330620137.8.1793712852952;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
X-Received: by 2002:a05:6102:3e84:b0:7cc:32ce:4c51 with SMTP id ada2fe7eead31-7d0725cefcamr4330597137.8.1793712852429;
        Tue, 03 Nov 2026 05:34:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/panel-mipi-dbi: stop requesting GPIOs explicitly
 as non-exclusive
Date: Tue, 03 Nov 2026 14:33:51 +0100
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/i6WoC/x3NywqDQAxG4VeRrA2YEVrsq5QuvPzagGaGCYogv
 nuHLr/NORc5ssLpVV2UcahrtAKpKxq/vS1gnYopNOEh0rScesPKmyZli8Y4x3V3PcBL0ug8DOG
 JTuZWIFQiKWPW8z94f+77BxCusO9wAAAA
X-Change-ID: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wi99EfjZrDJfc4ByH5DW5LiPzd+d5x4qqFh6JHJjz+U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLRR4h1JzI3varWGQUzdBOuYb4wR3+FhGm1v
 VLnE9/MsbOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0QAKCRAFnS7L/zaE
 w5RvD/9+qgHJdqEE9cOISLwTNLZEAeePooJ21oZyBXVJ9HzRowzhSVXfRV+d5UWam7pnTBKb86f
 /hFhyRxBYWnnvLzwf5T9W+Dl43T0Fv9vC/BFKpyUBUSlpZaoeCMZ9Lbp6BpPbfbDrs2ZA2GJGBJ
 /4geiGmFb9smNEX1UDPbPh4GytbFkh1ndBf47pkzIDa/5MUN0EO+BOUEWP8R68mdfEa4HO5jkbm
 a9L3eOuYNmI2O5puHkDc0I4VNhzyPvoMZz1ple0PGXsN0ALd+SEQfQb5cfssWQHKRSKDLJJRTpS
 NHPi9eaZ8ArXRDdB78eq26D1KGyt4vnhDA3j6FaD1BEz3pm14WA6whjvELRpXacKqJhWtdkm6M8
 kSRoleVeXCGClALH1TchAdVob+seZx3wqHArsiC9TC0HcdW4fWbjIAo5LXojtBYpOC9Mo1QPDDw
 wncDeDCOSlHLwNIzG4iuCw7EnNPxeSoBam28DzBbje7//AwBqDJrG+ErlZgaIJJ3ansHeIANht7
 jppIqC1pn56IQW16s7z5xpW0u6juotyKmkIteyeDnT/KCxJ4QVV7JFwmwqanBXPN4XhA8LUzWC2
 f8xoCkYRCCBjq84iApk0xhY+vDBg60VIqjo2ylevGDYOaE3CJ9XSK1KmUmBBHy4HnorbOysgo6k
 8ZDVWN2t2ktuuow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xD80u_QMG_bVeOn4G2wOaQwUyLcf0v3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX1kSjEKzd0Z3C
 uHYB2+thKbQomA0BYh2/L9wriIO2WXHYebLXLjRy4p82rA5+bF41kWJoAbyeDzn5CYgTxpEKz78
 NkXm/Agx8Y3lQURLcCvQxPggWowBib0wlm2qe9oxgk22WHIKwHkNc2llfZkCSuefzO1CDsoFqzC
 VHBh3aq/2hGOvWSPu3jPptm/yqmaRNsYjpDzcMDKLxkG+n3r0YYMyP5V5gopK9FRikdUHgsE/4f
 cNlLOIqJCu3NKnXTJjVsUul4pRsRjRW4kmv/sZd/Ui095X4dMaSvl7SVe9ruhUxzp1WlIiAVmNk
 sRMlbgGNmEeQQcc8yAQLNPBDRg9uGURN8XF+5CME1oYs+wCQc+lFZY9xJU3SSdAhYkdU25+ceiQ
 SD+DHfic9Odb4+6fM9Exzj8scxQo25LBD/b37E4vt9LVx/BjRN6goavqWopYbF2fOeFWBfB2qnc
 WuC5opUrnynsYgHY+9A==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9e2d6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2ktC1rJDgDHwaXYRQ2kA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: xD80u_QMG_bVeOn4G2wOaQwUyLcf0v3X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXxbcRRKOpUpOB
 /8ISajLqC2fWmg+argHtf8XtD/7eRthflXe1iGURriXjS1ZanqT7sMtaDfjVvar2SdtZFwM+3gO
 MLzuWWwgINLdCAKexVEaKk2NU4dTeCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053415_379143_36F0459E 
X-CRM114-Status: GOOD (  14.04  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and I'm slowly working on
converting all users to using the shared GPIO proxy which automates the
sharing and allows drivers to not care about whether the pins are shared
(as they should). This series selects HAVE_SHARED_GPIOS for the two ARM
platforms that use this panel driver and then drops the non-exclusive
flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      ARM: stm32: select HAVE_SHARED_GPIOS
      ARM: sunxi: select HAVE_SHARED_GPIOS
      drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE

 arch/arm/mach-stm32/Kconfig           | 1 +
 arch/arm/mach-sunxi/Kconfig           | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-panel-mipi-non-exclusive-gpios-bb27e91f31e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


