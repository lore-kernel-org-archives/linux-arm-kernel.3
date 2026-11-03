Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2981D606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lba7uFb+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QmbkTUT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcrdPyTh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=; b=lba7uFb+QNBRwr
	QRTcxx2RgjlHRsrNt8Us+f4XeYhRNhyb+LvIvDBaB02PL4YiQMVYUflVi/Tc8Ki/2Vs0e7nE9ZNWi
	jhmsJr4aHiLsO+WnZlDTSKsL8q9xL19RCxNDdF8bBhWDmYe89x6JiMTYAz7QKl0ohjDSz+usTE1Qm
	nSAturYfgf8TewcRJmDX+bD8+EKDeHzabfctgTVvdBI0Zi9B2gY+uQbtWiBfwa9QkjLvZOV4d1Z+B
	uvC26ZtQrA6TFVROJStXam2ueo5oQZLGE8w5fB1IzRn3OcSjTvZk3NHKZyYuq85WxLExkZmVYpa99
	uLJHKR+PH7Ix2I5JDikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEeb-00000002ZUa-0OcJ;
	Tue, 03 Nov 2026 13:34:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEeY-00000002ZSz-3SWg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:34:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClJ4Y3869453
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Nov 2026 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=; b=QmbkTUT9EgzLQBTd
	DwbS5LW8ukNsULr+oDxFwYnWgiBPXw3dEogpNru3TPt4l2RQMK/YbXTyxbgQvxtp
	25KeFLv4HAUw9jIoRRfOfgpUSJ+nSYeH8WZ3pVHJCKKmyG+gUkaxtcGaYwQtNu7z
	thD4iYNqoWWEbPZgu7X9/AoSyNOFB0aaMpEplshRjGOQFmgpBM5s88x0hhZAKiIP
	o8eRJeGjCCTksdklSC+cKahTNWalNlHkpw2s+C3R5MVlPOp85pgbZoLXzAaW4mXh
	U+OCFkQ+6qG6tvpY4rvZLH8gUlWChW8CuTVLkd5qqkWknKpEPpL0j/EYHbmGBM21
	K1RXeQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy32nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:34:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so3105245137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712857; x=1794317657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=DcrdPyThG5TKQ1ilb6JTJjaaYUZGUcOP4qzC4r9IUGnJrwCRRKfEfY5TQ6i+ASPjzq
         iilkuIu1quhxXigUvpebOH7CJxurjnlT+kJk4HX01+huYTUYOugQDTFhaEjqMdPnYzwt
         lyUi6TU5+sdQgpff3AHr6J0JDysgRl5cdr1Ia2Q4Mblj8aN2xgOn/517OXY99rckAil/
         kMyNjGvU8M1j6XpfXAUWGKJ0CFklRFmHETovKhN31tKq/Rk/+SgujEtMbBEQoCaWXdAY
         dpvIQuz8WqD4gdOH9tDBHnZF7cRyWDKyLzqBuhy6Kg1TfEHM+TL/PrAk0MidHgSgSeJB
         v50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712857; x=1794317657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=UxrI9eS/VdsPoEUm6dSF1Bw57+wobC3OsHpWcMcuondt49pq4zRW9Kueo6ARkyVKQj
         a0L1mFaItNjr9Rt4RY7mi1LmpumUrbkQY9XX8akcXmXfqwqKr5iZ3LmbEzZC7ssOGhR5
         IPxEBBltH/TtwYk7RnPWNUNp5wxbHhpF7TblVMPymjuQehfcHSmzMgVN5Lkv4CgK4hg6
         2vA/MZ0p+2H+NlUZw8imOZY+t0x4bwFmjQ8BRok3yt+iSjDs5YDYXI6yF9BG3DTL2OMe
         5+CqHOe73iNLwI6uj9BgiSpd9q52qtPG296BFJLSd7i4JSj8IUNWGenl7CHWSKdb+7TY
         97NQ==
X-Gm-Message-State: APuU4Z8Tioh8Py1TU7W6zfq+0WRrNbOOdO0TBI30KjEiIIJUdEF2fZXl
	6GARMIuOO4Nqip4kA5dtr7R9Zg4X2Rbh29q/MAlkTELQ4Y0fVFrWmHMYoY5STpMKj+qpEViXfh5
	ytlPEgsNAJFnnmrGTOwt2YveHyWtG3qsNkhNVQSJ/lTI1yIld4xZTSaeNXAeycUn99tOZKT+pak
	iK4Q==
X-Gm-Gg: AYBFou1+1TYN9BkBnw9kZjG8o1dTDRutaPkk32P8dxfkGr0WxA0kxx8XMAsBONxWshf
	GG3zkeJ9yH4XRPaZ93FLpJl5ybZeX5yk6DwmHHlDZvTOjZ7Nh5hUNdDre7v8rnQjsWzPsCByChB
	Ys0Ce/1BPHwtH6QBsr90afzv4K3lQkEQWX1NjMdMA/okKDTsTGF1UlK3p35tdCpI9LhYgN2a0me
	BJcm8wUyRjqy+trVYWqxXEm7b535Usb3cnSjSey8Kt/4cujKoPIA2K6Em+yle135mgL3AHB0Z/M
	IMvLfgzeYH7vnzKsZ86diygewBTf8/N1Oi+qIwHFNw5d4kunQv0/OCmgx6FAf7iKQAN6aBl3DZ3
	RAiQiyRYpPUwnP4Urh+/1q6VJQ0zVhzoxv/aDPYGtYxXRXCngcnumPEOweGWzPxCslfDecdSGQ8
	lxFg==
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046273137.0.1793712857343;
        Tue, 03 Nov 2026 05:34:17 -0800 (PST)
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046256137.0.1793712856891;
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:53 +0100
Subject: [PATCH 2/3] ARM: sunxi: select HAVE_SHARED_GPIOS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-2-aa862c1d71e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=715;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/AFcbMcZblHubDxf794SVqjhIpAl11By9m4gfG7n6zY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSrAQvg5vxhqBArsuQUFlydgNSbeoyY/b4+
 Dy4eH/ORcmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 wwCqD/904Uu5wvPIs2SDwjL5QN91sAwhgbcm1t+Qgn/BiD2d4ab61Ev+vE81zGYobw9S9j/z8Or
 Vy/17jrUknJfanVDqVnL+RRNJm/WgqmaiWcjSjSFY3quypJPXqbFyriwzSEmhskOF4u+2lY+Ro1
 Nx2IqrKHi0xwY8ljDETtM7qA1uDQ4mIpNSvol4gysTa9PdFmLjEy3dVjNOYhWWIFfvQ3NPV37tr
 LxD+wjUN4QZRs4uYJLbaGbg46Dy8/mH5a9ZAUNoY/RPsvLC3zSCV0My0pxNRYi/xwYz+yvneaNA
 ozana2AyAeMNKlUAU0HDlpo3KYaLiuB6WHlM4x8b+k7eW18qu6kshYVv1nRhq+uU0mRPzuFKJaE
 10rqsKleMVnr+Z02+Ab/eEiGud09h+JpV8mMTTbExeL+TPMOhoULvd9d32r6boIjouqA7LD8DQ9
 oZsa9h4ytzL/jDdISTbVqxB8xPiPug/S7MDj2lJp6Y080Ze55l8q72oAooI2vS2XiFq90z8OL/6
 TUrcCKy5ypAjg8UMr9ipDDdMB9J5qU85VqhQadmJ3PRDPXtGCOqqm4C+L4xgUXzjy3MwiVflOIS
 Y2gXpDTZzMsb1qBfeHIGzzMDXn5ewPKLVavffLJok/ZIsKxZ8Ao43gXvd5YjX7cyCUs67vt8NQp
 fttVjqjLLdb+t6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 1_A8tGsRW0bPYw3mSMQOGEn2jzWTMhY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX550lIjo4DyJO
 VCkqICeeAtziJhsc8KHe8XP6oWLKCeb8SxPwr1FUDX4CNY9Rw3r6sHlkBf711d3RrzRW7hd5F8S
 mECvrvjfmkI1uzryVula71EA+OaQO5PGoDX7iwnuHh3DaWp5kFuHnuFmVeHlCa8dY2gGU9CPEBV
 dZW1h9R8ikFQPjEdLEOb0o+xjKmDKryQczRbPd8+Wn2BOT+bXwmcX3QMeHIL9zYUhtYr+gpadTV
 6yb+Wx+LHql9Bdt7VSyEaMV3oCPcJrYlLNuKjYirEID/gVV6/L2zVMs5sYEjxMyEhwy1xq0O27j
 XjMDrRLxuDWRIJBJzP9BUkPfRpKt4pZ5rn+c7n5d7IBeYQFiFOvk/Q8UtHT/jLkw0d3d5hZk2FS
 d/0/yfvyIC/9ooTJaTd6IqyVwNRXxh+9aHx5/VPTyX6AI2G/aRezSX0Kf+XKPWiH/KP6jboMUOH
 SJY1mdWv9plKKuKgPEg==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9e2da cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eCt6F14imeMwFY3J13AA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 1_A8tGsRW0bPYw3mSMQOGEn2jzWTMhY5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX6nDophipMNoV
 12+SRdJvxq0lr/5ZiNnCkVXeWkSuDAPYjTfP7+cY1yCBqGtvGmGkizSJao18vRHPTYg2vXqubSx
 wJUJgT93/Ldx7w51qowIV5OjOoMwoGs=
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
X-CRM114-CacheID: sfid-20261103_053418_870621_FF4259E8 
X-CRM114-Status: GOOD (  12.76  )
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
proxy module for sunxi platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index e015f2497111a42133ddd4e7ddd172eda06d90ba..b62e8518e270459444e7d4ee382ef753c368dd51 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_SUNXI
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_MMIO
 	select GPIOLIB
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select PM_OPP
 	select SUN4I_TIMER

-- 
2.47.3


