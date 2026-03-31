Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77620FF60EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=; b=LcQAof1zoK4tvMH9Obj10iL8Pg
	MubZn5/NVh8BwYcj4Cr4cKeNAyKe3LSVjy18+dCGz6F8WnRLDz+kiKJqUEAK5XIYz34ws6meyP/Wo
	cr4hvTOTYYZY/kmoy5us7kgpUbuGXjtB7NrwDiJHUPSNbISzqYRb0qFJu77OMGZerMBhLbjDwQRjq
	e6/ys359KfIs2hZCZRI0yPskeiAmbXEdDVwihOlYtyFsBGqqrWYLMc7IpcoooGZ5/JV8X7P6/bSZQ
	fYJVm+hivPiHX5lpg/72ZeD1Be1bW+31WoxwAZTocugAfLur04Iye+zLKAgo9gK003CF6P7NY92YB
	eJtaq/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V80-0000000Ceyw-2v4k;
	Tue, 31 Mar 2026 09:11:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7t-0000000CewS-2xwj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 09:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=; b=f9w0Wxgf9kkAT6DBrvDRmWELSy
	l/z/rKl1vZq3NHLHPkgyK0U1eraEJbIcr/8E82MFaXWbzSjBT/nhY8Ivjz1UEhzNkJwxW8ckC4h0D
	XCilGIf8/l9X/aFiAvx0d0wivp4PJOFKXMaUb8sr2tyPlvKiALWje1UrJJiRixMhcls9Z2c0i9uu6
	aiigY6Uyn5lxFu7b2I8+Wh8fK2g30HnMBPhwWsunJxuyx3TubJoPSHzBVRz+cqZ5eDPEyuYUrdXKp
	TceHBiE073KCLBWiELxo+8bNDjrC3NujBpw30xDO6ujeY/sbuQyTmsZfqbWEptC2xeo9zO3eaKx4Z
	kq47dz4w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V7q-0000000FUri-1d6e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:11:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OR3r2465168
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=; b=MdOc0tFzP0fitCoG
	RfYYIB4f8UbT+5mwQwxkxPB8CNsfA9uIMRnwbdETyvJR4aa2T5bk/DuBX9XAANsd
	wozjQ6FJ2Z+tdyqgXwPatehkoXTkX4vv42mtuJEpF70yrOVWzcB4UPgsMxLiOsCU
	5LdhlHHLaC5z7Fr26ft9KPFZ6xLFQLlEd08r3KKgE1w8Gbn7vAr12S1ZKVFUMtLx
	IjdkXbTSf05JXmMj34s86w8k2kEOMDSttGYtsTY2Qp5LlgXeTueKa0DF1yIGf7lk
	vYmvfPRF1FyUKfHhpCFw88XgjtDhpqsQEPADf7Zg6skpnAKGLGFs2UTYsyzC9pby
	dpG4zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8f7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:11:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso269919791cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948264; x=1775553064; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=;
        b=EW5v4kH+LlXvnsxDo1oayW//QlponLo8yagkWbhcRrvr6zmZQpnWHUW5q4ociibioi
         ySBqEEoRn6Or2YvJIkvT58A6kXMZ6+E9Q/D26HKe/Iz0N9MhktskE53O4fAHlrSzBUch
         of+7lRagh2aurqL6EEwBc7BrbTeiiErZHFrvyabSr2Nk5J2/GIV2APlAbbje7sQHBNg3
         oyshb+cOJiEH3M9ohJGMV3j1J9ANbBIxqyTArXMMZfkaQioCKLDwqGLM2w8+DrG6sjtS
         SzI/PAuk+lzsChyTCPYDljJtPSlj6aIUqzyM1dFaN8vRYweM+GWcS2647qwEo/8dxNQ+
         gVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948264; x=1775553064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZYn1HKYylDg+Z/o9KelqX0nGe0Wz7pWx6kKrxzddsuc=;
        b=lga3c0TMp9ZN1cSoKKxC7SA1SpbyDilmEH06bCRk8vRSMLkfFBzBMjyAMHqBGw4Mkf
         acfZz0BvDMBkG82B8O+D6NQjgrM4DJuDbj8+H7brlhZs1c8Jj6cleJX3jerO3FMHD52D
         QIYZzg5bvkN70cWAxuHPGAWypU2aVwAm75V2BCyfaipU/xcEufI4CVcKiCUi60x5ZCDG
         3I7L+iCd0naCjxbSXkde5Sjf5ENU2+9oA2cw56WtDweBd3fBc/x3GxlGnCpPPlkDoYiI
         UOc7/fer3+QpMo5nPbH0vlquyvLxcpyffBd9w1x2CwuS7wasi8pGSple8FitlChfBTa5
         WXvA==
X-Forwarded-Encrypted: i=1; AJvYcCXKwLbvtAs8ZsNoekwYisvXvilcbKvSKhRBHRDSvtY3Zb/4oRw4fKP4Skh5zBp1UumcbAfAyGmMxg1r9XI7Xjrt@lists.infradead.org
X-Gm-Message-State: AOJu0YwOOwwFyWyNJ6nMMdKSHrJD/IKPy2+0cia+YW0g3p061vYClvwm
	pLnBTf9JpFgO+FLzLa7gC7V10+LPmL685PbrmxHvi5ooFixwALhBfsVf84rM8nKihatg2R3SqVN
	uQmQJ+LGWnHZvIOuMfddL1OnJBkheeljHBvCY2wNjVj4QmU7xfeeYovnkW7Zlhnot0jBXBHlde+
	2JDg==
X-Gm-Gg: ATEYQzzrAONAXKic+H1OPONvDmc9Zx9Lrm2pR1eTQfdqypUttsU+K9n1FBiYREiTkFL
	4nJimzPyzEf+2pyC1eBvhkpSwNaF3h4f/aBi7DSbgH9/73eMEkTIRgIFajhP4OmHXMxYDpItiu+
	ViZvUyMwh6TyNXpTog4o3eLXQYVpGEPsKQl39RpPe22SMscpTtr2K4f0KkncEVIsAsGPVHeldsQ
	mGMDZdrXJiFtMrKJk1tbvB99qEzy3z7YuVmrO8qb7cF1GPK7aFjC+v2igCIWRvXyJ1Owb+mzj6B
	sWgEmGBHh7u5joqJeAk3v/J+bE0GdebNosPBYvKHpg31C5XW8SCiB18aUh8KpmKHb95hvDJUHQy
	Qr2JQByfvUPIxQMFckw0EFTxSAyGNIcuMLkPvZTZdLSfe6oV+dw8=
X-Received: by 2002:a05:622a:5591:b0:509:2618:cef1 with SMTP id d75a77b69052e-50ba38c8f89mr207886401cf.47.1774948264407;
        Tue, 31 Mar 2026 02:11:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:509:2618:cef1 with SMTP id d75a77b69052e-50ba38c8f89mr207886131cf.47.1774948263973;
        Tue, 31 Mar 2026 02:11:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:29fb:516:a90f:8dda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm25974860f8f.14.2026.03.31.02.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:11:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:10:49 +0200
Subject: [PATCH 3/3] ARM: pxa: pxa27x: attach software node to its target
 GPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-pxa-gpio-swnodes-v1-3-f66d86d10d8d@oss.qualcomm.com>
References: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
In-Reply-To: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lXrcmBjNJ9rFUWWUhMV/Bc6GOxeDD8rw9zJqRe0nAas=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpy4+faIwBvVqVTptRLwY9uBOcWoZ1SP2ZjfVS1
 qfCp61DhF6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacuPnwAKCRAFnS7L/zaE
 w3dKD/9E2WKXApEehXfzw9zlBzjYoF7Ps5Cao7vjBzYmw54g0E2DzUlqHkn4QTacs+DnpbCmdzY
 IHaFvN1b5G5/tM6PfLrN9dJp4KUQHduEq3Zb+wEnpIkHaBd8WOCwys4Y79RYqkRCoVY4mElE1WO
 5BBM+YE13vEaYUCW7CWBfdc4hTzVrRGP7yUCjAkS/XQVmdgbiX5wcqNT7NEqFM8HQ/BngsviGuU
 LlGkQT3PzrQK8EzjpYt1lnId42EV+jIYmupT5jguZr1Dx8RbhJPu3LoezXlPA5Cmi2ze4c2C4Qd
 tBOrykbjUU2SxMYIGUGKQgNHOV4jQO+LweKFlGantmGX0QQ+pyAUb67IhPQ7w9AnecYVSgbVITU
 2YgX0n20BW/uW2GnxDA7JRQO1YnIFyhZth0406HypjDj8JeeFi1p3wFvkkg6bLFgpvlSEgotjCA
 QpaWIN1/tKWqKPPFqAQ2vbEcFweaWlJ4bzVBJj34vB5Af6PIwUf7cEy7cHtqYkkJti+nmUFcKlz
 tVhWJ+5tLX4Z4N3bibGOsOJDC3GCjZJhMTCUteYh8qE06Tr4ArNpjKxiupi+sghae10AR3496E5
 6jXRnMC/74/+ms5mY/2O8BSMddjJlnd0nuy2HHRnJZFVLHYf8oK7rv48TUzsTmMxbl2uQm4VDwO
 nJkgQAUk/ylcQEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 71f3szjDhK2CMrRKj7D1vY5bNeyjzCwN
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb8fa8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=CBFrsqW9wnp9SfA-JgMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 71f3szjDhK2CMrRKj7D1vY5bNeyjzCwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX6esK0Bv8Nwdj
 99p2svFvv4oUorY8SMLyjba+YRSm8Up0GH8LNi0gzK4E7IqGd1LrI+wPWVKeUDFI38HVczxbRrB
 fwOlgHcaXMole0cm876O4CjI/EKkAUWctYCY2uGIZf9wjOmh/dxItrOZr1GDtp3ZlVjWbqaFAce
 czc+aSiBYRH66lFs02Ukj2eoRQZnvMNoYZp4Ui4lZs/51maD62hlWFYaZecsV3T1YGOqou82ITX
 QMJNQNwKB7ssPCXfvi0j66AswufLD/NeeywLzRiYx/n1hjThPPjgS1pcFkSKTLxSoJ8atWuoYas
 dNPYHKA23+RYzJT6LeUngHuJboFjyATwyqiEdFy58KB1STv9NNIS+iHltC022xeOdcsz25aOn/a
 worWOeAp5rPGa2MVUcU1thr0GPmSBl6Gv45o9OYODeG06KVU8QJyo2Y9QGLF/ilKLyPpjExFBoP
 ISU07G83513pC3uCZJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_101106_959123_DA83BB06 
X-CRM114-Status: GOOD (  18.43  )
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

Software node describing the GPIO controller for the pxa27x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa27x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index ff63619790383859ba111e3efe7619aa6cbd248e..bacfd50939fd447ffa11d398867dea7fa638988b 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -277,7 +277,6 @@ void __init pxa27x_set_i2c_power_info(struct i2c_pxa_platform_data *info)
 }
 
 static struct platform_device *devices[] __initdata = {
-	&pxa27x_device_gpio,
 	&pxa27x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -342,6 +341,10 @@ static int __init pxa27x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa27x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa27x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa27x_dma_pdata);
 			ret = platform_add_devices(devices,
 						   ARRAY_SIZE(devices));

-- 
2.47.3


