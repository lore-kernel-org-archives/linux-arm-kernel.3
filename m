Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9PX7Ohp;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfh0gGab;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y78Lm0Vz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wlayQ34COyuwCVdd9ySFGiOccgyxlCLIpyflH/Wx0yg=; b=t9PX7OhpTwjI1s
	T7Cbv1gujYrwjgvSPJOae91y34cKQDvgMvV3Ss/d13rPmj6piYFiZpPEU14hFBuUc6V/jSmNAKCut
	W2270RolPrxN6kmVyLlfwTnIoXV9njKWmgaa+FGRtGJDSvydhgALgNAnL24ELySlMe/3BVIAj1nMJ
	6M9BCcQiqz6B9mUKWna/L+zRLevyiez0EXYxslfDEw4ST/mSstohgmUd2WCDcmgaIqchDLpHh9qu4
	VXZppz1YYHo2IMEPZcbnZCcVMkQRTh15mrs3hcmk0/w3BHote3vZxlm9jrztVEyENL8d5132pGygv
	npoHC6P994k5dct1nUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoe7-0000000G4W2-1yZF;
	Mon, 02 Nov 2026 09:48:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoe1-0000000G4NX-13Xd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:48:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AX0N3086640
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlayQ34COyuwCVdd9ySFGiOccgyxlCLIpyflH/Wx0yg=; b=lfh0gGabBZwHMr4s
	PL7VHDpS5d72vN0O3CtMndO81CH+VHTQ0ZUgRW+YE3fR3rTIb0Ozsi+iaQEm9r32
	otpwHDYP6DZFx7B6eZ+NwRV1BWYOLYRbgFGgs4cre5KiDtYUVoasc+5mCXmUAp3U
	HKGPYWSqFCiUb1Lrs5gwZQQEs7QsBLwfq4s50+3NxAHJLPc2lXAK/dcmAnyqkSZE
	cbnMuo0vh/wf9NN2tnRUkRz6gXQ4DGCqxpBBBTnm66ImEd77ii0M4A2yVNMkCZI4
	/0U8aUqHQxTL60b8hdvqwhVtS8unP55oHEJYgIy6TxGncQv8rNYRc++6tdDPf/vL
	ao3dXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka616dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:48:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso1986307a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612879; x=1794217679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlayQ34COyuwCVdd9ySFGiOccgyxlCLIpyflH/Wx0yg=;
        b=Y78Lm0Vz92X+mx+TL+694TLZ5tRSpsf3kZzdXFbAWy8u80hiiE9t6MGOsuc0DpYr+u
         X0GJQkHpmIqU1V4FoFvV+szE3/Jna1mG6KO9TADXnBENlt24n7koZTo3c1wFCFBXiP6r
         KXF8XYg8V2jeTD0dWttHBsCVB0WjOvg8xeoj+N0vKFdaN44ceONpTrPDuxz/1KzOj8sH
         fhwPn7c3WmvUbg/53vqRi4AABlV0JKgoD6THWJ7FMtaGMFgcEU3Ou5jWtTYIpKJmjEsc
         OysONyLw2O2fVb72fyt7n8Hfbmw7pBPU+XsxgnglaL9VHnvLVj1lOUh3LjaXbAHdZGN6
         lrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612879; x=1794217679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlayQ34COyuwCVdd9ySFGiOccgyxlCLIpyflH/Wx0yg=;
        b=gtF1am0kxLjEY1+gnbxaZ8811fVdgYxPbXLacrlMhmk4umW5QxghsLmK6hR7ysPuqs
         jCL4KHD3ghLGpHYxtct/rojdLt1W8gbGoxM/mMzNeD68/30mDAl8JPajiiTqvClypBOB
         tMGE//j6pbSnjAtDHcnUgDg3j06xmAU59hIcd2deMvVY1LZeu+8Eu/R1/f6sOzq+g7X3
         q2dyPy81yYqmWvdHZa+FkCulLfLjuNM8sFpzmHucaP7dzucj2+tGYDFQcMHEfAflBccU
         QuXmpOlberPBB+Qz0XQuseWOEvrRGAJHSgYb4dwcyBC018Bt/mbHsJwRC7jE7JrZLiyp
         s4vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY/2//D1AW/YeQzJbrGntQMvwmwKjjJnq90uM/gT2zUxNxyUg3s4giZLLEfOZxB2829fqyeY0nIix8r+pnqImH@lists.infradead.org
X-Gm-Message-State: APuU4Z/WJwgnt1pYr5VaxD7/5Vh699rp1Niuh10RsTmoAIb2J+5KHQte
	YAvTZe21nWuDaY967F4BbLWGfOTHHwXHeER8Z1NfLvAvSsF0jSpJ1dDG/JCpHE2RFZaIKL+fO/c
	A0l/nIEF4cT2Wyrjn00LrTvESTJH2p1Q6F5mMxghd+yi+ObwaMMoqG45l2J/X1neAsOml57hwYB
	97aQ==
X-Gm-Gg: AYBFou1TGnDNgAb4ZiigI0f71oF6fAT0EvlxXmB0UxmAkZ4jUCa0d8rOnV/4L+dnqEy
	T9pyKugdC2aP6z7MNoDNp8jTzLvH5MtFZwc+ADNgXHopAqgGbzEDlKuv15bTQT5eCz20HY9D+m+
	7A0YWe9gKK0hmWmcLAUeA267vjjrNsbspa1xslAUrbXJKBQ2dcfBa/CfYxvOHujyL5W1LZ4safP
	/N/FcRRylmKNr6X1OJgDT6dj0En4/oVDFT91QBsvP8xeEqR07isZ322p5ZrQupzEtiygSs6b4dF
	xJxdVtFbjJq3Wf9++HOimT42i7ow4Ucm9B3r76NMuz7DOkqkOQCEb1dysnFskMbtdQx/MQPPozz
	+07H20dfh2TBNslnM4w15RpRSLTgDrMr6Pmon9AWHJWBO0qv43Z1SlsKfab2MQjMaqJit/fZsiM
	LPnzAsSukkihEl0Jhtj01VdHCm9x+isTFF9e0=
X-Received: by 2002:a17:90b:1811:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3ae897ccb04mr7615463a91.21.1793612878585;
        Mon, 02 Nov 2026 01:47:58 -0800 (PST)
X-Received: by 2002:a17:90b:1811:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3ae897ccb04mr7615443a91.21.1793612877805;
        Mon, 02 Nov 2026 01:47:57 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:57 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:35 +0800
Subject: [PATCH v21 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-7-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612831; l=34454;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OLufkC/GfMl3G1ax7YGWiSarQKUu8LyPrFwUylu/GlM=;
 b=GrK8ApYNlAgv8UBIc4QJO8lJAbhuy5VrhqPiZzXI05E23WkeqN4kHZYVgrPfZVnddco2BsiwR
 zSDyU0PqcW+DBOeKVu+14XHxqiBWAwQPwqqgOsNvjtB79vzVtplqg4l
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: bRNujYFksGiyD4rmzQIFfdKq5L34lFBy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX6jN5eSJbOrJ/
 F3shsSLV5wV+WL8Xtx88P79nuXt1nZnfTKdknXw6OlV7uTs4TCzk1LbytW4z9jQYS5s2b70WaNN
 lN9yasBIn0ia0hPgud9g49bqgP815C4=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85c50 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XjKv5uM7SgSNu1ZRucMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX2YBoEEAOl1TJ
 Vj63TptVa6jdPv/UYiYvogSmuagvOKOre6vl5VHL7nk+OkEHKxF7M3tH+Ef5IHR6CHg3AooFWVB
 Sg4D1u23lxTCTdjUsbl13I9pIpYAPN/nN51F/I5wuyzDz4e4Kfww4z2mULG/+k6e32RZBruGDyw
 XMR0Gnuwy8oOAQbDWUIBAmTfLwH+pWfv3KNHdHTbI3e+GvhWgEFjDFUV+kdyrEspEWfEm9/ZFj9
 7U+ef2UTc2Qn74uNIfukOqy3LN0F9SThPccrkNSiqUq6w8Ivw6NiZU/d+eHYyI5JrwvBjtOHv0x
 eOuyTOfc9BlpNys8kSjF8q7BvGW40o8rmQi32fl1ioYldBIG+Yg3phtxvoeUEW3lRC16MQY3gPZ
 aQj8NyJeAdBPjvFvunfthBs788qDPxK/CFkXndgbXKhIGsKT650ADV2kXUXMcXI9gM98U5Q/b00
 jglaHX9HwFDVGka3SAA==
X-Proofpoint-GUID: bRNujYFksGiyD4rmzQIFfdKq5L34lFBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014801_470817_DA0545B0 
X-CRM114-Status: GOOD (  31.91  )
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

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the synced ETR buffer.

When the current etr_buf is nearly full or the timeout is triggered, the
ETR is switched to the other etr_buf of the etr_buf_list and the synced
etr_buf becomes available for reading, while the ETR keeps tracing. Once
the trace has been stopped, the last etr_buf is read by the generic sysfs
read of the TMC.

The byte-cntr read is exclusive with the generic sysfs read of the TMC. It
is used only when it is enabled for the ETR, otherwise the TMC falls back
to its original read.

Byte-cntr workflow:
start -> ctcu_enable(ctcu_byte_cntr_start) -> tmc_enable_etr_sink ->
tmc_read_prepare_etr(jump to tmc_read_prepare_byte_cntr) ->
tmc_etr_get_sysfs_trace(jump to tmc_byte_cntr_get_data) ->
tmc_disable_etr_sink -> ctcu_disable(ctcu_byte_cntr_stop) ->
tmc_read_unprepare_etr(jump to tmc_read_unprepare_byte_cntr) -> finish

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 400 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 163 ++++++++-
 drivers/hwtracing/coresight/coresight-ctcu.h       |  88 ++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   3 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  87 ++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |   5 +
 8 files changed, 729 insertions(+), 28 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
new file mode 100644
index 000000000000..08dbc8e6b2ec
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
@@ -0,0 +1,9 @@
+What:           /sys/bus/coresight/devices/<ctcu-name>/irq_enabled[0:1]
+Date:           October 2026
+KernelVersion:  7.5
+Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the flag to enable interrupt to count data during CTCU enablement.
+		An interrupt is generated when the data size exceeds the value set in the IRQ register.
+		0 : disable
+		1 : enable
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..821a1b06b20c 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..bff87e776a75
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,400 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+/*
+ * The byte-cntr sysfs ops are shared by all the CTCU devices, so they are
+ * registered by the first CTCU with byte-cntr and removed with the last one.
+ */
+static DEFINE_MUTEX(byte_cntr_ops_lock);
+static int byte_cntr_ops_users;
+
+static void ctcu_byte_cntr_put_ops(void *data)
+{
+	guard(mutex)(&byte_cntr_ops_lock);
+	if (!--byte_cntr_ops_users)
+		tmc_etr_reset_byte_cntr_sysfs_ops();
+}
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+static void ctcu_cfg_byte_cntr_reg(struct ctcu_drvdata *drvdata, u32 val,
+				   u32 offset)
+{
+	/* A one value for IRQCTRL register represents 8 bytes */
+	ctcu_program_register(drvdata, val / 8, offset);
+}
+
+static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
+						 struct coresight_device *etr)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *drvdata;
+	int port;
+
+	/* The ETR may not be connected to a CTCU device */
+	if (!ctcu)
+		return NULL;
+
+	drvdata = dev_get_drvdata(ctcu->dev.parent);
+	port = coresight_get_in_port(etr, ctcu);
+	if (port < 0 || port >= ETR_MAX_NUM)
+		return NULL;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port];
+	/* The port is not initialized by ctcu_byte_cntr_init() */
+	if (!byte_cntr_data->ctcu_drvdata)
+		return NULL;
+
+	return byte_cntr_data;
+}
+
+/*
+ * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
+				      size_t len, char **bufpp)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct device *dev = &etr_drvdata->csdev->dev;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct etr_buf *sysfs_buf;
+	atomic_t *irq_cnt;
+	ssize_t actual;
+	int ret;
+
+	/* No byte-cntr read session, let the caller use the generic read */
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
+	    !byte_cntr_data->reading)
+		return -EINVAL;
+
+	irq_cnt = &byte_cntr_data->irq_cnt;
+
+wait_buffer:
+	if (!byte_cntr_data->buf_node) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				(atomic_read(irq_cnt) >= MAX_IRQ_CNT - 1) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			byte_cntr_data->buf_node =
+				tmc_etr_switch_buf_node(etr_drvdata);
+			if (!byte_cntr_data->buf_node) {
+				/*
+				 * The sink has stopped, let the generic read
+				 * handle the last etr_buf.
+				 */
+				if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
+					return 0;
+
+				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
+				return -ENOMEM;
+			}
+
+			/*
+			 * Get the interrupt count of the switched out etr_buf
+			 * and reset it for the next etr_buf.
+			 */
+			if (atomic_xchg(irq_cnt, 0) >= MAX_IRQ_CNT)
+				dev_warn(dev, "Data overwrite happened\n");
+		} else {
+			/* Exit byte-cntr reading */
+			return 0;
+		}
+	}
+
+	pos = byte_cntr_data->buf_node->pos;
+	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
+	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
+	if (actual <= 0) {
+		/* Reset buf_node upon reading is finished or failed */
+		byte_cntr_data->buf_node->reading = false;
+		byte_cntr_data->buf_node = NULL;
+
+		/*
+		 * Nothing in the buffer, waiting for the next buffer
+		 * to be filled.
+		 */
+		if (actual == 0)
+			goto wait_buffer;
+	}
+
+	return actual;
+}
+
+static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int ret = 0;
+
+	/* byte-cntr is operating with SYSFS mode being enabled only */
+	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+	/*
+	 * irq_enabled can only be changed with the lock held and reading
+	 * cleared, so check it here to keep it stable once reading is set.
+	 */
+	if (!byte_cntr_data->irq_enabled) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -EINVAL;
+	}
+
+	if (byte_cntr_data->reading) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -EBUSY;
+	}
+
+	/* byte_cntr_data->enable may race with ctcu_platform_remove() */
+	if (!byte_cntr_data->enable) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -ENODEV;
+	}
+
+	/*
+	 * Pin the module for the whole read session, so that rmmod fails with
+	 * -EBUSY instead of blocking in ctcu_platform_remove() until the file
+	 * is closed.
+	 */
+	if (!try_module_get(THIS_MODULE)) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -ENODEV;
+	}
+
+	reinit_completion(&byte_cntr_data->session_done);
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+
+	/* Setup an available etr_buf_list for byte-cntr */
+	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
+	if (ret)
+		goto err_reading;
+
+	/*
+	 * The byte-cntr register is configured and the interrupts are counted
+	 * since the path was enabled, so irq_cnt is not reset here.
+	 */
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock)
+		byte_cntr_data->buf_node = NULL;
+	/* enable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
+	enable_irq_wake(byte_cntr_data->irq);
+
+	return 0;
+
+err_reading:
+	/*
+	 * reading was set before the sleeping allocations, so
+	 * ctcu_platform_remove() may be waiting for the session to end. Complete
+	 * the session with reading cleared in one critical section, so that a
+	 * new session can't start in between.
+	 */
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		byte_cntr_data->reading = false;
+		complete_all(&byte_cntr_data->session_done);
+	}
+
+	module_put(THIS_MODULE);
+	return ret;
+}
+
+static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	/*
+	 * Do the unprepare operation only when the byte_cntr_data->reading
+	 * is truly set
+	 */
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
+	    !byte_cntr_data->reading)
+		return -EINVAL;
+
+	tmc_clean_etr_buf_list(etr_drvdata);
+
+	/* disable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
+	disable_irq_wake(byte_cntr_data->irq);
+
+	/*
+	 * The byte-cntr register is not accessed here: the trace path, which
+	 * keeps the CTCU powered, may have been released already. It is reset
+	 * when the path is disabled.
+	 */
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		byte_cntr_data->buf_node = NULL;
+		byte_cntr_data->reading = false;
+		/*
+		 * Complete the session with reading cleared in one critical
+		 * section, so that a new session can't start in between.
+		 * ctcu_platform_remove() may free byte_cntr_data after this,
+		 * don't use it anymore.
+		 */
+		complete_all(&byte_cntr_data->session_done);
+	}
+
+	module_put(THIS_MODULE);
+
+	return 0;
+}
+
+static const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_byte_cntr,
+	.read_unprepare	= tmc_read_unprepare_byte_cntr,
+	.get_trace_data	= tmc_byte_cntr_get_data,
+};
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct tmc_drvdata *etr_drvdata;
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	etr_drvdata = dev_get_drvdata(sink->dev.parent);
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	/*
+	 * Don't start byte-cntr function when irq_enabled is not set, or when
+	 * the CTCU device is being removed.
+	 */
+	if (!byte_cntr_data->irq_enabled || byte_cntr_data->removing)
+		return;
+
+	/*
+	 * A new trace starts with an empty etr_buf. Don't reset the count if
+	 * the byte-cntr is already started by another path of the same sink.
+	 */
+	if (!byte_cntr_data->enable)
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+
+	/*
+	 * Configure the byte-cntr register to enable IRQ while the path is
+	 * enabled, the CTCU is powered then. The configured size is 5% of the
+	 * buffer_size.
+	 */
+	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
+			       etr_drvdata->size / MAX_IRQ_CNT,
+			       byte_cntr_data->irq_ctrl_offset);
+	byte_cntr_data->enable = true;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
+		return;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		/*
+		 * Configure the byte-cntr register to disable IRQ before the
+		 * path is released, the CTCU is still powered.
+		 */
+		if (byte_cntr_data->enable)
+			ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata, 0,
+					       byte_cntr_data->irq_ctrl_offset);
+		byte_cntr_data->enable = false;
+	}
+
+	/* Wake up the blocked reader, which exits the byte-cntr reading */
+	wake_up(&byte_cntr_data->wq);
+}
+
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int irq_num, ret, i, irq_registered = 0;
+
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		/*
+		 * Initialize the lock and the waitqueue before requesting the
+		 * IRQ, and for every port as ctcu_platform_remove() uses them
+		 * even if the IRQ of the port is not registered.
+		 */
+		byte_cntr_data->ctcu_drvdata = drvdata;
+		init_waitqueue_head(&byte_cntr_data->wq);
+		raw_spin_lock_init(&byte_cntr_data->spin_lock);
+		init_completion(&byte_cntr_data->session_done);
+		/* No read session in progress */
+		complete_all(&byte_cntr_data->session_done);
+
+		irq_num = of_irq_get(nd, i);
+		if (irq_num <= 0) {
+			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for port%d\n", i);
+			continue;
+		}
+
+		byte_cntr_data->irq = irq_num;
+		irq_registered++;
+	}
+
+	if (!irq_registered)
+		return;
+
+	scoped_guard(mutex, &byte_cntr_ops_lock) {
+		tmc_etr_set_byte_cntr_sysfs_ops(&byte_cntr_sysfs_ops);
+		byte_cntr_ops_users++;
+	}
+
+	/* Drop the ops user when the CTCU device is removed or probe fails */
+	if (devm_add_action_or_reset(dev, ctcu_byte_cntr_put_ops, NULL))
+		dev_err(dev, "Failed to add the byte-cntr devm action\n");
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 739105acb0a1..cce4e4d76da0 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -18,6 +19,7 @@
 
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
+#include "coresight-tmc.h"
 
 #define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
 #define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
@@ -43,17 +45,21 @@
 
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_IRQCTRL               0x6c
+#define CTCU_ETR1_IRQCTRL               0x70
 #define CTCU_ETR0_ATID0			0xf8
 #define CTCU_ETR1_ATID0			0x108
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.port_num		= 1,
 	},
 };
 
@@ -62,6 +68,93 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+/*
+ * The register access is unlocked and locked in the same way as the ATID
+ * register, so serialise them with drvdata->spin_lock. Otherwise one side may
+ * lock the registers between the unlock and the write of the other side.
+ */
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
+{
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	CS_UNLOCK(drvdata->base);
+	ctcu_writel(drvdata, val, offset);
+	CS_LOCK(drvdata->base);
+}
+
+static ssize_t irq_enabled_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n",
+			(unsigned int)drvdata->byte_cntr_data[port].irq_enabled);
+}
+
+static ssize_t irq_enabled_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&drvdata->byte_cntr_data[port].spin_lock);
+	if (drvdata->byte_cntr_data[port].reading)
+		return -EBUSY;
+	else if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		drvdata->byte_cntr_data[port].irq_enabled = !!val;
+
+	return size;
+}
+
+static umode_t irq_enabled_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct device *dev = kobj_to_dev(kobj);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	/* Expose irq_enabled only for the ports with a registered IRQ */
+	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset &&
+	    drvdata->byte_cntr_data[port].irq)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute *ctcu_attrs[] = {
+	ctcu_byte_cntr_irq_rw(0),
+	ctcu_byte_cntr_irq_rw(1),
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+	.is_visible = irq_enabled_is_visible,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -140,11 +233,23 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       struct coresight_path *path)
 {
-	return ctcu_set_etr_traceid(csdev, path, true);
+	int ret;
+
+	ret = ctcu_set_etr_traceid(csdev, path, true);
+	/*
+	 * Byte-cntr works in sysfs mode only. Start it once the trace ID is set,
+	 * as ctcu_disable() won't be called to stop it if the enabling failed.
+	 */
+	if (!ret && mode == CS_MODE_SYSFS)
+		ctcu_byte_cntr_start(csdev, path);
+
+	return ret;
 }
 
 static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -195,7 +300,10 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
 		}
 	}
 
@@ -209,6 +317,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.groups = ctcu_attr_grps;
 	raw_spin_lock_init(&drvdata->spin_lock);
 
 	drvdata->csdev = coresight_register(&desc);
@@ -244,10 +353,52 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 static void ctcu_platform_remove(struct platform_device *pdev)
 {
 	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int i;
 
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Signal all active byte-cntr readers to exit, then wait for them to
+	 * finish before resetting the ops pointer and freeing driver data.
+	 * Without this, a reader blocked in wait_event_interruptible_timeout()
+	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
+	 *
+	 * The wait ends only when the userspace closes the tmc_etr file, so an
+	 * unbind with the file left open blocks until then. Unloading the module
+	 * is rejected with -EBUSY while a read session is open, so only a manual
+	 * unbind can block here.
+	 */
+	for (i = 0; i < ETR_MAX_NUM; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		/* The port was not initialized by ctcu_byte_cntr_init() */
+		if (!byte_cntr_data->irq)
+			continue;
+
+		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+		/*
+		 * Set enable=false to signal teardown to racing readers, and
+		 * removing=true to keep a new path from enabling byte-cntr again.
+		 */
+		byte_cntr_data->enable = false;
+		byte_cntr_data->removing = true;
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+
+		/* Wake up the blocked reader, then wait for the session to end */
+		wake_up_all(&byte_cntr_data->wq);
+		wait_for_completion(&byte_cntr_data->session_done);
+
+		/*
+		 * The ending session completes it with the lock held. Take the
+		 * lock once more, to be sure that it has released the lock
+		 * before byte_cntr_data is freed.
+		 */
+		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+	}
+
 	ctcu_remove(pdev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..60dded125ece 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -1,23 +1,32 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
+#include <linux/completion.h>
+#include <linux/time.h>
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
 #define ETR_MAX_NUM	2
 
+#define BYTE_CNTR_TIMEOUT	(3 * HZ)
+#define MAX_IRQ_CNT		20
+
 /**
- * struct ctcu_etr_config
+ * struct ctcu_etr_config - ETR specific configuration of the CTCU device
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
+ * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
 	const u32 port_num;
+	const u32 irq_ctrl_offset;
 };
 
 struct ctcu_config {
@@ -25,15 +34,72 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
-struct ctcu_drvdata {
-	void __iomem		*base;
-	struct clk		*apb_clk;
-	struct device		*dev;
-	struct coresight_device	*csdev;
+/**
+ * struct ctcu_byte_cntr - byte-cntr data of a port of the CTCU device
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @irq_enabled:	indicates that the interruption is enabled.
+ * @reading:		indicates that byte_cntr is reading.
+ * @removing:		indicates that the CTCU device is being removed.
+ * @irq:		allocated number of the IRQ.
+ * @irq_cnt:		IRQ count number of the triggered interruptions.
+ * @wq:			waitqueue for reading data from ETR buffer.
+ * @spin_lock:		spinlock of the byte_cntr_data.
+ * @session_done:	completed when there is no read session in progress.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ * @ctcu_drvdata:	drvdata of the CTCU device.
+ * @buf_node:		etr_buf_node for reading.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool			irq_enabled;
+	bool			reading;
+	bool			removing;
+	int			irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
 	raw_spinlock_t		spin_lock;
-	u32			atid_offset[ETR_MAX_NUM];
-	/* refcnt for each traceid of each sink */
-	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	struct completion	session_done;
+	u32			irq_ctrl_offset;
+	struct ctcu_drvdata	*ctcu_drvdata;
+	struct etr_buf_node	*buf_node;
 };
 
+struct ctcu_drvdata {
+	void __iomem			*base;
+	struct clk			*apb_clk;
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
+	raw_spinlock_t			spin_lock;
+	u32				atid_offset[ETR_MAX_NUM];
+	/* refcnt for each traceid of each sink */
+	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+};
+
+/**
+ * struct ctcu_byte_cntr_irq_attribute - sysfs attribute of the byte-cntr IRQ
+ * @attr:	The device attribute.
+ * @port:	port number.
+ */
+struct ctcu_byte_cntr_irq_attribute {
+	struct device_attribute	attr;
+	u8			port;
+};
+
+#define ctcu_byte_cntr_irq_rw(port)					\
+	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
+	   {								\
+		__ATTR(irq_enabled##port, 0644, irq_enabled_show,	\
+		irq_enabled_store),					\
+		port,							\
+	   }								\
+	})[0].attr.attr)
+
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4b40b692be4d..6ad09995ba87 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
+		*ppos += actual;
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index bf4c1d8f7b2e..20d6bc60a446 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1168,6 +1168,9 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 	return rc;
 }
 
+/* Shared by the CTCU devices, set by the first one and reset by the last one. */
+static const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
 /*
  * Return the available trace data in the buffer (starts at etr_buf->offset,
  * limited by etr_buf->len) from @pos, with a maximum limit of @len,
@@ -1178,23 +1181,44 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
  * We are protected here by drvdata->reading != 0, which ensures the
  * sysfs_buf stays alive.
  */
-ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
-				loff_t pos, size_t len, char **bufpp)
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp)
 {
 	s64 offset;
 	ssize_t actual = len;
-	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
-	if (pos + actual > etr_buf->len)
-		actual = etr_buf->len - pos;
+	if (pos + actual > sysfs_buf->len)
+		actual = sysfs_buf->len - pos;
 	if (actual <= 0)
 		return actual;
 
 	/* Compute the offset from which we read the data */
-	offset = etr_buf->offset + pos;
-	if (offset >= etr_buf->size)
-		offset -= etr_buf->size;
-	return tmc_etr_buf_get_data(etr_buf, offset, actual, bufpp);
+	offset = sysfs_buf->offset + pos;
+	if (offset >= sysfs_buf->size)
+		offset -= sysfs_buf->size;
+	return tmc_etr_buf_get_data(sysfs_buf, offset, actual, bufpp);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_read_sysfs_buf);
+
+ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp)
+{
+	ssize_t ret;
+	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+
+	if (byte_cntr_ops) {
+		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
+		/*
+		 * -EINVAL means byte-cntr has no active read session. 0 means
+		 * byte-cntr has no more data because the sink has stopped, the
+		 * last etr_buf is read by the generic read. Anything else is
+		 * the result of the byte-cntr session.
+		 */
+		if (ret != -EINVAL && ret != 0)
+			return ret;
+	}
+
+	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
 }
 
 static struct etr_buf *
@@ -2170,15 +2194,54 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
 }
 EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
 
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops)
+{
+	WRITE_ONCE(byte_cntr_sysfs_ops, sysfs_ops);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_set_byte_cntr_sysfs_ops);
+
+void tmc_etr_reset_byte_cntr_sysfs_ops(void)
+{
+	WRITE_ONCE(byte_cntr_sysfs_ops, NULL);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_reset_byte_cntr_sysfs_ops);
+
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size)
+{
+	struct etr_buf_node *nd, *next;
+
+	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
+		return false;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd && nd->reading) {
+			nd->pos += size;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 	unsigned long flags;
+	const struct tmc_sysfs_ops *byte_cntr_ops;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
+	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+	if (byte_cntr_ops) {
+		ret = byte_cntr_ops->read_prepare(drvdata);
+		if (!ret || ret == -EBUSY)
+			return ret;
+
+		ret = 0;
+	}
+
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	/* The sysfs_buf is owned by the etr_buf_list */
 	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
@@ -2211,11 +2274,17 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 {
 	unsigned long flags;
 	struct etr_buf *sysfs_buf = NULL;
+	const struct tmc_sysfs_ops *byte_cntr_ops;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
+	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+	if (byte_cntr_ops)
+		if (!byte_cntr_ops->read_unprepare(drvdata))
+			return 0;
+
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
 	/* RE-enable the TMC if need be */
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2345bdbb0b9d..af89825ec041 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -484,6 +484,11 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops);
+void tmc_etr_reset_byte_cntr_sysfs_ops(void);
 struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size);
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp);
 
 #endif

-- 
2.34.1


