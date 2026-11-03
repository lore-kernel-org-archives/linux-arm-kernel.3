Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4764C606EEBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ipb63Gf5;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsiV/zLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AU+mw0ED
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=; b=Ipb63Gf5JpfjWg
	Yhlz+SdpAWWO8Ya97Kn1I3op6FNHvScS2l9MEgGWEnYIyT8lrmm94QYhgpHfyGK1R1Zb3WiRxlBox
	x6ddr6LP5IGFrG/z/M4ay8tq2cBtzb7M0AmHqYPAABwVxZOdxFyfNgzHVdITlssOxinpoo9Jyry9E
	djz86JSFnKAsaakmmQZ9otyQpZ1FZuzFdK6ACavTHC0caQ9GiAnrW+QW/OZJGUzJw/PQyZoe4axcN
	thQhq3jTchWodsLXv0jd7hUT4EA8E/qiAzhnGkTS76kxFwT8hb8XgELZKElLlk5Y3BqpELpkGGSGG
	ebz2GLHEykn6YsANOG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEeZ-00000002ZTe-47Ip;
	Tue, 03 Nov 2026 13:34:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEeX-00000002ZSN-1Wcp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:34:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClCG73506766
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 13:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=; b=MsiV/zLnv5StFd6p
	hWvIzjdpPt9IQDAnWLv0tTrBGhCXT6u4wo6edsawVRotPX9NAWrAfgVi5ddHdiaL
	/GkXynkW/wyyEYd90f/TZ5cMEQcY7/FilTG67WsbGrdsuFkJTIx6ZtxrjeOgAQRK
	SlyRxNJRt+IOgiRCUykisIH3nJmlVDP+XfdwOCYYAT8dKmhUmLvi3Jf64xb6+OwC
	gzOz/6jUAoRJn5sH0nIA9iCDR/IPID3189s7CrV1cOIyuKvr0H6OW5FfUlHp4cnh
	NOeXAFq9T+O4R0O02xxzXBBrEX5vW2xkGRZ5lErI6Yn1X6ZP0Hk+IjpfHlMOqQsB
	cnyeaQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9af4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:34:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so644777241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712855; x=1794317655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=AU+mw0EDf/JRWSzHZXzmYVyx2+o7Jz937Fbdg+/8d78Pq6tY8CsWF7FvnxRg91icAF
         03ebnPaKYrEoEAKBww54+mZ8p1W9yOEbBLpibrqsKtrmU7wdLh008ANSY99MOMPCDKhx
         IFQitB4m0GoazTk3g0X5O8Gf756pmltsyVt06uf+TRmFWYUdG+b5pzf57mKGhdlgj/R8
         RcX1JZkN//5XsC6wn2ECsnTZJ5uUy244FIa6YXieA3v0Kg9Rpy+wvs68XO5fYhs7YOBn
         J2JqkTrbyN+fCQXPPufvsn5neNUOuxas7lOov5qzLpW+xi5UF5M8pyHwRPxicbAS5fze
         r0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712855; x=1794317655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=RfHV3tZiUCx8trBxKPoqY24c0MVCvV6OkcyOQNuzZD9scgZYSnrWvTDgtaCSnu75D8
         z0Fc90yV1+nGbZ8GMgaBwlXFDXkFzKugUl8hlU2BghRPYyhtTHdxo9GbCRkwmC5hFzTN
         U/v14rc2Ar4yeXlwlf+YUQGDeqDBt67+jUZVzvBmLPPem6gUO0tZoJjCjejdOKFJ4ECd
         WKXxZcApPxqgN/V5r8Iov80XAkG1VRcw5NAgZCS4pL7qjMFAkb/fF66pLZthvOzhItZB
         MAUjXvQeiYcIojukCw4ksawMCBeXtuAc+BxxZanep9upJ5E1pXzwf+kZ8AIw9ClX0vM5
         QJDQ==
X-Gm-Message-State: APuU4Z/8/iutQ80h3VPHrOEihg7x1+9A30bWKWfJ7EJXSPVKMUwowcuP
	P5s+RecdJwkf4HhmxovzYDrYZrYYSEZo96R6Y/t6ZGBp8QYqhLaORAVO5c/h5q0+tqvaTUThWfP
	L8dND80rFSlxNKt01WwPYX+jv2xNLoVSox+XR6Q9sWreMGQnY2U543suldvCuoiUViDnNXX/t4L
	8ePA==
X-Gm-Gg: AYBFou09RJJoPEoXFenAqUXjmKGStPo05WJL/W2CtfhUrK0rXvWe+AaZOXDjYeZGhN3
	csbhocbSG9v0jBXvd6hXIodtco5BrPJuAbrM0QLw/MKe8Al83LnnKLbTyZHUNhGvC8EQ+7rJXB2
	at3TQVJzpAjWX9AbIcFNYDWCf+dDpGAKLwvfgkEKABLKPSsULP5PkvsaLvIoPqcG9qI2RVKVm/F
	2IQeF3L9NNPLyoV1oecoo1Q4zYTl/M9CyUb3xrjD3GvKHcdGQPlcTnFT+Owk+MB/N4R2KTTNtTK
	1ctdVD7Ue/7s2pB4bJsvmt3L3WGL7w0VY/n84+JezEkgJnR59vEgwU7l/+sFKRS4o8JV3XSX03n
	3uDOMfdyGAnayTpLnJyYFGvLnlHuw8cqyL9MQ8JJG6EWJOnqWEgXaVSXfqDzNdnOIzkczVwux9s
	0G6A==
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343544137.24.1793712855149;
        Tue, 03 Nov 2026 05:34:15 -0800 (PST)
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343520137.24.1793712854700;
        Tue, 03 Nov 2026 05:34:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:52 +0100
Subject: [PATCH 1/3] ARM: stm32: select HAVE_SHARED_GPIOS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-1-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+xwhEIq1Kfy5I5NBWcOLNXVJMoR1QHxqiMRtC7afj20=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSGfA1l9T+A4p0kHk24QWFBtFJJJT4XTpef
 LL7mrxNOM2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w3MtD/9uudBQVkBxiiyISXvd0Y8Wm8gryDzgKaUNm4uEeMoX6xWUdYiho8KqcFnTr2vQp4EHnl3
 V0ky3XWFAJp0xs5mWtYBVxfPRZRr8cnxjlXKA8ij1iB/xGYMX9c36/H6dvhJMcv0J5TVL479Ho1
 Us0zp0l9KFSw9Wb7NAJYRFMMmmycip9ccbIS5alE2M4qiJmOoP+brHSvRaXMTZcIfAPXSlDn72R
 e+KKlEt3o6mq5kvmkf1IqPQPvfB/e/Ge4s4s76EVwK/1qjlPqRuRLjDkBuwi4db9tshI2O9hd4/
 enqe4FeuCfB7VRHCRYiBS9m+Ic/QKQaDynxnHy8un+GYvrJ7tUuoXIL2n7bU3ArxHq4feXatqZU
 7QD+4rD4k4y0Wpu4IX6wbtG2W46DJ+782W3LOnAbWo+QL53D4Re/Um+LJ5mYVG04dNybyezoMDM
 b16yKM6XXF+aWYlc9lVXiHYH/S4Qv0AKH3gbG6oH7Bs0aRloOJoTG7tF+k6SGgKz6DdorIl7gq+
 B2jzN5nJ7CW8Ir2RG9+9/iWLT/uwfmCqrpUIYb4rNPgFRBhkawf0a0XJ7SC6ofdLHCFkD2Zf06O
 UXxh6oLDnuX6xMBcFK3qaQYYVC1zi0uFcU5ITlheV7DslAZ06/VqIMwIjTDugUu9CzVnemUyQbq
 j0MTBEPlGcNcfIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GLT_mFDjuIc7fYgJeIz_qHYQAV-XpW_q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX1/ZP2JC45/G5
 yvTJFDqB9UkNl99+dCBxbHoXhYo3Mm6WgL1oux0GO7meC0F9/IN6J82KHP+h8ioOYtTFiN6OjYG
 X204SGORErvvsUzuPoyWCsAU75VQBsw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX6IOQG1ogO+wS
 GnIwkews0v8icgd+drgp/yXNcHM5pV/Ewg+aoOQvRScEpWpPuflYhBszp4134B5o+92xnk4dTdq
 MYj8eWeuDblFnx5r6Vp1IKhKmPIdfY5oN2FANzgC9tiyPVT3BHyWOLetaS6paS8eGceX5CetI6E
 I5qe0JWTVKCFzJAFvtq361SBVISGPFSWaYGLrObPqSmR6cAWpEN7e+f4lVs0EOMeZRxFbkZYFqK
 36v/05jm/Up6npZ3CKzZ0EO6qxJ5TJQbM7ljnKSapCJrDxH5a1kk/09VfX2koSF9ajiGJTDfrXq
 LQFwr7/vv4rNagigFuB+8EQD7wNW1X+M1hI1CLPQyEurmLrs4oKcAPHG5L7SqBkVL8z+UJIYMyQ
 LYJOXFpVNKOY3VhJ0wB3pmIru96aec111h+7BC6hA54cNVbsXq4Avl0ZPubk6K7DWdbDqtALPQR
 dc6Ak7PCLBMG3WW12wA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9e2d7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=b5q88MxlnkSnrj9B7awA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: GLT_mFDjuIc7fYgJeIz_qHYQAV-XpW_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_053417_523066_719BD469 
X-CRM114-Status: GOOD (  12.81  )
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

Enable automated management of shared GPIOs provided by the GPIO shared
proxy module for stm32 platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aabd86e4843d6a6326cd22a2dd66e..ecb6b35610f4988b4fca3fa10defc260a149f7c1 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -9,6 +9,7 @@ menuconfig ARCH_STM32
 	select ARM_AMBA
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_STM32
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M

-- 
2.47.3


