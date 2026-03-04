Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A1DEB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=rF04fj97IqlMWYprZR94Hsf6ig
	VR5ciQzXc63VkgudPb+3G3YoAes3FGbO7nyc1A1to5o/q1mMl5JvmgwtsWocYeIqQNk+kXQcz9y5Q
	zJPow9QI9A+vVqQrhmEfaBKUmoItv0fCjTxVhteAE+7SxMGUvW+7WVHQ+Qd9A3XFlh5YGI9jS81Ao
	ragbMToDVe5R1jfxYkzvHSZAqBRjc4tdqMHW2ToMvbHdT2NzEhmvmyZPZAXfhUSxBys8mgQPbitha
	mBhd0OSe9dtmivNyVteBNhXdl8DRPyypdvZCCuA2Ft8MwTcb3RELh+w1rf3Rvpavu0yF0JmXJe2v0
	VkI9SCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8i-0000000Gocw-1CO9;
	Wed, 04 Mar 2026 09:03:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8g-0000000GoZs-3vey
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 09:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=NJ5CGi6XRYa2Y4hYx/tIc7vV1p
	gTxa/7q+erOPhSho1eQunaixzgIvZckrC8v6AuKwtcXPDbMCh+60Y2vtoVN3MMk2kVc4aEV4Eim2K
	TgfDuH/M8dZRK3HR7uHNepScUfKSllLOGqTmlRukSQqaSHvscDIIC1LNLjeDs1ihEsoVZ0UB+6HCb
	2tgRLgI0sW5VjDsFcXGNf3iifEZ9TiSCtSTXcE0q8gFEjRnmZMlgppLqvwRU00jKJ/zUQskviqzVw
	cvh+NmPg6zZ1sv4cZCiYA5Ehk0vATqts+zSqUVva9BY/AptdUyPMSwRJT6lQsBj+ikusc+HG4qpCo
	s6J/4v3Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxi8d-0000000D135-0Efn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:03:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQwf945101
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=; b=KM1nxb8aj0tWlKAq
	b52Nx7se77o3CBamhSkfMSBNL/LoHsX6BkUJw8XnmD1Hk32c0FZXccAxHNksV1kf
	fNRo/k1ZAt3VNvk16Evg4xhW52CXIfNhQiqDirLYASsnk31X4aLnKZmGdfZypEwU
	YUXXRyyM6MQxSqtbgN01xRiU7PnUPmyqJNjLj3J8QnRYxDI7QOvrOQ2ZkNSAKCtM
	a7lNFKTSwcYExx9osupgM7HO+JzSxfF+A/fFW5Vyyx+qhBCGWyYkzfftDhOr+6xh
	iSCVrsUVqMbrd409to0DbK/MIt8YJrf7MQPa/SWIJn40kd+UAL3tUJrNjzQTJDaI
	g5mi2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfccxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:03:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb37db8b79so4960809485a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615005; x=1773219805; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=EeZLUEfXAVBeIuvXTruoxGqlso2pBJDDTdirNzFuP9vaHgNz6S/ZfqpMgmt6VA11bz
         AdCwlOwaNsdlRefZVLKiM8E68ElszxHvsDMkTEIy05LQjEte0Oo6iXYiismu/LCxySH6
         HmtsorrupmSUn1IIXVWiRz+cNZkzezhSuCBA55rv3/UMpg5YOQk/DTCmpcy7GuxuFgQR
         DiygfrPcFZNUuwITjCKQE9ugYI4ImbdVej8oF4ZbGR3B9NbrluTebiRhKV4RP3Se/lNv
         LSi3k3bzv3/J7Cv7iOzOi+Omw99INz4hwa+ueYCdxKDoZBw3O9reUStRjGdmYAWPeMMA
         lmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615005; x=1773219805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m25Evgz+upNl8LtXZ2aO7wMuzsie8zywScFsKF98g7Q=;
        b=KsDdXyuEIAXLpobNzvSGmD4ioNFz6QueHzxUv3lCJQc+lO2ZdSXLs78EdnzzEUusSg
         CbTXpYHPLtKis87wOMXxESMHZSAIE4ggdA57sNiIWfFIjSRaXiJVY9ikQ+puy9qR8ZiY
         TbEzsgilPiqXtMuNBluk4DWhodr4wzi1xRHnk4Bx1xWyqejMon3RxhdSbXKqfQezh3KS
         qXRWQEgQho5J8Aw2cX3RSxiP9hMyQaOyePRXfjbdcrdQ63pfwUnXv/n/k8sO19AngPrT
         1kbY8FH8AfZKMiC3WdZa5mHl2IQqmvwuTp9Y+mUmQeYZ6AX4yhvvIP0QcTh3Gs1AAj4I
         rdpQ==
X-Gm-Message-State: AOJu0YxjSGcDiTV8brMAALtBbf9wai/fyOjTZbrJVInvj/nCk7T1LSJk
	wAZ+kEgPzXsSaIKBOY3pYa8JXlCzbQhdHvtu4U7FUwaC5HKFaIK1SSfQDklbbEf6Kx3LG2OnDQD
	nBG7hS6U4/3lwtXllJvIuIMb+oZTNMfH8oD7brjK8cx7JU516E0uCgSklMoW3/15qj27kaWfOMX
	lVkw==
X-Gm-Gg: ATEYQzyU6weT83eNML4fYuRHiQdwldcTqdvzTDyz8Lzhbjd2Z1Tg84s+lTjsf5CC3MP
	xHT+3Ghdh1eOhUYYFCjlvB7OkUJuDQfBqseqdbUwt2tYwl/5Wxk5eRXyVtpxg3JxfveLg5Zl89F
	aemFPHeje+dRiYqV1qx9Hu/zeZH/7k4pr2e+zQgFLM71FW+GAdFD3nHbh6F2aivU5M97CEzAO8n
	5Tcc2GCj7ZunLxFbaArhyxsXQV0tlqAHx/RnFBEhCvsFIWHI7awq/6n0uc9u8tSdXV3UL99igaE
	XkfYBAkB+//kdHgLVZnCrOFC8/tJ/DE/jq/WXvGlF28PBDlVjJhHM3Puh7fYwu9Y9liGtkWx+YL
	zUP8YhRQpK3FRINZFlbxehcB2QyZLyzKRaBKSAQjvXZ+8V0fDK+0w
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148301785a.8.1772615004795;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
X-Received: by 2002:a05:620a:2a11:b0:8ca:2e37:ad07 with SMTP id af79cd13be357-8cd5aedc525mr148296585a.8.1772615004301;
        Wed, 04 Mar 2026 01:03:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:03:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 10:02:29 +0100
Subject: [PATCH 08/14] leds: Kconfig: drop unneeded dependency on OF_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-gpio-of-kconfig-v1-8-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=808;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=esqrcU2iBVY8ci/hzt1UovcnezFcilbxILgA7vFytvo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UyednvCwSCoZ+nWGbhEbuv0oD/DsD+ub+SH
 Bayu8pZbRSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1MgAKCRAFnS7L/zaE
 w1PEEACFpMfWSUuL7d1juKi1HvQOLE5EdxG8E6A4QaKtXdS3ANVfIy0qrGuEIUQXgicbWadwYfl
 OaTottfXrufEJmdI0fv5wm/Ba0Ce+dGauXb9LT3oWERf8IIESub3fSBxQR47tJ3RvMiImrdQvVN
 kKc/LD7R2+gjpCuPPTddvQZJ0tlkKy8e1ZTmaa/hkzkJ94XaN9nPnEIdFCu9Kr62779GyMchvXx
 BxRd++vsdgYSwLCw/buTmw5zNTr370yDqP+1qH+rVjMxtfO9Zw8zkY6hmSt2xTXNEqu7awNMt87
 y9s51NYMLEt/5kNRRBWwiQXOTueyUnFLcKDvppzruElRsoI/mAX658xGSGoP67hp+abb3nb6OLi
 JL4vTng9bv5lINhV3xT8Atk3VZh7t7iysgSY7rfnm/j5+USEIwNtWYLtSKS/Joc6vNav3MgRLhO
 4LmEv8gppfOWfvU+papRncEUoxZKfsuyg5JDM3qszyQdUxzbvR7uaaxIY92hvizidXOfkzZHiUm
 xis1G8tdtqLlUrRO525gB+cnSkXockjuD9cvWhGSr90WATkl8RtxCNSTacO8tjTGK7UiE0PavPA
 wmJlJkD5UNPd6btvf4QqiFjWdL6XosBMIn6BtwfkGMIKJS7BPu0sIS693sDZqL7tU3J1U4xbUVW
 GuGQMI9pJeVyrkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX4nBFlkR9VxVr
 PXVpt5zNtVX/ERHeRz7aL9Aoe/hiojyv0Gr8GPX7H7+sDhtvGtINrFMreZMjNIzxs4hs3TlFcpl
 oEZmKe8ayKbE1toMCarVTvjo30IbH5k3JdapUQaF/qg8Gj2Se1zbVtCOQzGTT9sz780UJJOYPg4
 M/cH3Q/stVUZinzm59UWKmp7Thj09zFDVPvpDcEzfP81Hd4Jy+cJ62mxqMYQAd8vmzgtm+sY/hi
 5N0Rt8XIwVsWNjM/n8NKDQgJAYC+6aL1haLAicUlMNMis+aCOqb0+6hISNd/7hCL58mx74uB56S
 WayrwH9dyXQhadTr/U19TA/zZtMIrzJOk+dUGCCjwjo9sQZ0dU4JaEGoMnHzpxap3ghBSdTje2/
 /KXwDb7L6T0iXaPjUg0Ss1xHG4YmqzIjSvZA9F3IGAUceNE+Y8l0vuG5BDy2fzeB5c19WR32GJg
 NfWyxbx/iMcxPYGCquQ==
X-Proofpoint-ORIG-GUID: 1t3mixsJUcSpODSVbg-QtRMdW6-c1TmM
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7f55d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ULgK7OEL32dECu8VbM0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1t3mixsJUcSpODSVbg-QtRMdW6-c1TmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090327_590776_AFF5467A 
X-CRM114-Status: GOOD (  16.85  )
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

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/leds/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988b35f304e953e873af3afe2ae04b8..f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -765,7 +765,6 @@ config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
 	depends on MACH_KIRKWOOD || COMPILE_TEST
-	depends on OF_GPIO
 	default MACH_KIRKWOOD
 	help
 	  This option enables support for LEDs found on the LaCie 2Big

-- 
2.47.3


