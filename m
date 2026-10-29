Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE3606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gN3C+pO1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BL/ohZZe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bX+utGzm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O9tE0VhLdA02J4VPxVQaUCiXLFk5PSSXEe9PuZp3B6Y=; b=gN3C+pO1jPCbNi
	IC0d49KlD0KEkUtR6Ni+F65cCARBOeoQBj/UmcCgHxEjqabzPv7gl92oyLHHqkURRDllGtQ2ZxHr4
	1kvL1lmcqXWWwBE8cT4JYsr8rrWLZzZI+RDdcQ47WznkFs4Rm/MF7r+DsYOqwcxYj4HhdEI56Iitq
	fQr/AZjnlAQBvRvb4bJtpn7C8+RM4xDhzLw1WCXC5kfr2oYjrFqRJl6P34XvaEt3uI7M0bH4cN9At
	fk7OAT8TDvMkk8/H8nKKXRkdOqCufvTivr+c9e0Ksxz3qhEqIRlgMEFeWl7oYD7HakPKNw96/is2m
	8mwLWwdpXCsqdH6wrmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM1d-00000008nAw-1WiJ;
	Thu, 29 Oct 2026 09:02:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM1Y-00000008n7a-2n2p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:02:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vABo2273159
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9tE0VhLdA02J4VPxVQaUCiXLFk5PSSXEe9PuZp3B6Y=; b=BL/ohZZeT2Ub1L8i
	Q85twEiv+1skouGeATcwuvx7eQgdv/Xtq8jI1dokM0g45a70s4F+qfhG2j9fldrQ
	JU6ia8H2W0b80zUxArcf4NnA1W1/CLQZP9mfZu7G89CPP3DueE3hDngSF+GJudna
	qTfxxvxvzQolFMXvOxo4Q9GPfwGXRxhci3hvvZU1TtilW+eJ8AOLruxDL1tMWD0F
	EsREAtsxnkDxAQ0wEm2AvI5CVEDgpNCJ7ZQtEupyx2H0PGRjPmMTibG9Uyn2ivsN
	mKtKA/lQzSu8XMx6TON8t1FOwkfBnG+wmaMgvZCKd8eKQgY9Sw6mSOB7qKctK/nv
	3CgOUQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b01bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1589730a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264535; x=1793869335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9tE0VhLdA02J4VPxVQaUCiXLFk5PSSXEe9PuZp3B6Y=;
        b=bX+utGzmgc5Y9fE+Yg0GwYLHEvpQo9YB7EW8tEyl9yAoNx0lF295/D5aDNvuldQ6gD
         wlnK7CoEFZ6SSNLaSfBunDmw1/6N+dx9Dw6jAajnWcNfCeq6zmyA5vIbQQ9/IPAxbjGB
         ptf1hZv/p0BZKMcSuiyIgC+7UDagNjBjLpoDXNIl2jZmvwFuhOeNxvEg76lOnWPtLoSn
         UwQGG77dGLWdtMugnZT94cUqXrQ5xs9YZAKTvrB1/kiLMemPOPb3Wgm5t1ZCPmsEdcUG
         EPSAGTa0KAA/oqaVhEZe6uz2CdQz2BkVzKXgjWzgGJ+qUkZwLbSMC6QvajXclcqgK72I
         fHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264535; x=1793869335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9tE0VhLdA02J4VPxVQaUCiXLFk5PSSXEe9PuZp3B6Y=;
        b=QAv2RfXhNrRlR3y+cUaG1xvywecGVfteTYwM9y+VVT78mQCIdhXHQi7kQ0oYk/wQC3
         t7exRhCTCqLzXm4D5M6CHASv96+x1aVqR5i4WRxgHzAguN8FuM/IGyH1OyX4UKuGeN7v
         /LhrQrFD0An7ljqm+1x8JYpChOww/1eGsrH/2u9Bn0hoI9N1y3e7t/mOjR0hUcqwknET
         9WBN49Uu1p/T4u1us6usL67HJ7sLA/2mbDa/VCTZcoxMDdwvMuJVmkz0xyZ7ExiDq5xi
         HtFYwkWApI5SZZYRpHhOgIv1GM6wz22muO5kozlDrJaWotwLcNxFxvxPCpaumPUUlMB3
         F9iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhXDtMySng+WhzHMN0lSknxBZIDH00wk+PhZeJfAsmfrBvdR4eNYOI977R4RsjfpWAwz2MTHpeP3LnyRV+YtEG@lists.infradead.org
X-Gm-Message-State: AFq9FYI4JiMlFh8uP8zxhSXvNSGXn7aWaYPtg4ZCjAa2tlDJZIv8BnDJ
	AKnCjUFYcgW2iwfUT/xdDn2ORQUhFUD1HcuEefAjPB+8nWY96IyTJENprLqTv5GviI1hV5veXA6
	Q4j8iQF+UZzdmtFNHeCPKTetW0pFFea083r1V207fODX/njShBEgpTqPdWkGXioR2bOaUZyXFK1
	Wr5g==
X-Gm-Gg: AYBFou1LjDFrk7ezGuElTybAVUw0zafzXoJi3x7881VCnhBuvFLoQ21WLBiG2rYqeBn
	TpHB+5baPSMAPFP0iKlmTyykQttP6YA0HfdJ3iysPNbqtnnZkcPDPz7vXd2QID6koq21vHDXbMb
	dYNlAFpR5NQMzgpGXyZ1tORnJluU0VRzRIKKxfd2qYqG0dvGck7ZAHCZFntVLi2BiNumO5bE0/a
	ITPA/WIs5mLL2f3qrsimLNK9g0IZNKiSNLODJjD9hdK59ezx1FUcxzThLGpqqxiwWsytx7YVumS
	Ivi4fPQOhjLrn0q1i1g61rbQLtK/Yo7rMwRlYwxAJl2tIdmbGTNZBLJPrEEv6SUMv/rtWK7bAuX
	CPpbmGCmls/7xsJ3e2hyEoBkZvdpSB8iclDp85ikQ+NId2QUjs4VuyBwq9fr8bG2ncSa7il7Hso
	qMgOldgE7E
X-Received: by 2002:a17:90b:4b89:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3ae581e1959mr3770235a91.47.1793264534946;
        Thu, 29 Oct 2026 02:02:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4b89:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3ae581e1959mr3770169a91.47.1793264534432;
        Thu, 29 Oct 2026 02:02:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:14 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:00 +0530
Subject: [PATCH v27 06/10] power: reset: Add psci-reboot-mode driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-6-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=7058;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zAebzMok6MKL21880n9O4CoUq9888Knlr3p3nNPuBa0=;
 b=A+v7i4iLM+vZC5KFPyNk4BIQswY5X5kvCg4cn7yWdhSuFVWy4Xdy5OybTMAUZne9NeTpJGB/C
 szcw2tYRimCDkGLYvzdoiYvqPrlrwqy0FlZrdLVVkNqV/q0ranqRKAx
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX4SKhMk4YCQ9N
 b1xovr7bNUyVDW6EOARxA6l5GAzp4RSncscVFkQV9Z4uoFc+MVGxZF7K5EPkAcSQOiE0P7oFrWs
 gjCMEQNU5um6nGzoJ7MvEZvmTjgKG7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX6fdvxKpKK/wA
 hgxNIC1HFOaVWuGwFVcPzs2XD1WzGAcCOLNWRdBMGmdllQsR5Se0F1Iw0JFYnyuDrTVkrq7oNvE
 wV6N7qcYYnpa9D0Y9G2UMniSg7Z+YMmFS8L+G3gSkm4tB4HAwBWWL0NfjE2yFXi8Fsm7mTb3NM3
 Q8XJ/q8zpNrggnsVAayAnv0/crLMJ7Ipp5DLA0T00Q6uyk7MUDaMrBCD0YEbl/TwUPlfL/Bd2+8
 tteKN+A6xQJb5dzecd9+HNXfld4m4qIIsVcWDI4IZ1SQ163uU6/kggGYdV68olxmm2heirzW5Ed
 GCLfS8hbIEYIZhttGtCDnyai7nFE172Nge2FPJ1H04G1i0aHVCR3YsQ0C5n7d1CKPTYQbkJVMgG
 a20+xbZHLNMCvevtdilgTFFeBUdGPdC8hcMflLr1LBVFPNXTwhNZNgqCZEmBN33zp21KzXa6pC+
 HGKHLFUPQ8NNXqQ5M2Q==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae30b97 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=OTBdipT0aglEIzt2I9sA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: mSLrX2-44CWeF7lL-dX9FZIUQFSBQkw5
X-Proofpoint-ORIG-GUID: mSLrX2-44CWeF7lL-dX9FZIUQFSBQkw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_020216_728556_59569B15 
X-CRM114-Status: GOOD (  30.33  )
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

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add psci-reboot-mode as an auxiliary device created by the psci-devices
driver. Define two types of PSCI resets, predefined-resets and
vendor-specific resets. Predefined-resets are defined by psci driver
and vendor-specific resets are defined by SoC vendors, under the
psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |   1 +
 drivers/firmware/psci/psci-devices.c   |   4 ++
 drivers/power/reset/Kconfig            |  11 ++++
 drivers/power/reset/Makefile           |   1 +
 drivers/power/reset/psci-reboot-mode.c | 101 +++++++++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4ca41cdd872..0e03826eec48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22292,6 +22292,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
index d23befc490ed..04f24b8d9943 100644
--- a/drivers/firmware/psci/psci-devices.c
+++ b/drivers/firmware/psci/psci-devices.c
@@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devices[] = {
 	{
 		.name = "psci-cpuidle-domain",
 	},
+	{
+		.name = "psci-reboot-mode",
+		.of_node_name = "reboot-mode",
+	},
 };
 
 static void arm_psci_auxiliary_device_release(struct device *dev)
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..f165a41d40ed 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on ARM_PSCI_DEVICES
+	select AUXILIARY_BUS
+	select REBOOT_MODE
+	help
+	  Say y here to enable the PSCI reboot mode driver. The driver
+	  registers with the reboot-mode framework to configure PSCI
+	  reset commands, which are executed by the PSCI driver during
+	  psci_sys_reset().
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78e..45d8aaaffaa1 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 000000000000..c5dcfc40392a
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/*
+ * Predefined modes use two arguments. arg1/magic[0] is always zero and
+ * arg2/magic[1] is one of the values defined by enum psci_standard_resets.
+ */
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/*
+	 * For a 3-cell magic, arg2 is the high 32 bits and arg3 is the low 32 bits.
+	 * For a 2-cell magic, arg2 is the low 32 bits.
+	 */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  const u32 *magic, u32 count)
+{
+	if (count < 2 || count > 3)
+		return -EINVAL;
+
+	/* Unexpected value at magic[1]/arg2 on a 32-bit system. */
+	if (!IS_ENABLED(CONFIG_64BIT) && count == 3 && magic[1])
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0],
+				  psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct auxiliary_device *auxdev,
+				  const struct auxiliary_device_id *id)
+{
+	struct reboot_mode_driver *reboot;
+	struct device *dev = &auxdev->dev;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported. */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+
+	ret = reboot_mode_driver_init(reboot, dev, NULL,
+				      psci_reboot_mode_write, psci_resets,
+				      count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(dev, reboot);
+}
+
+static const struct auxiliary_device_id psci_reboot_mode_id_table[] = {
+	{ .name = "arm-psci.psci-reboot-mode" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_reboot_mode_id_table);
+
+static struct auxiliary_driver psci_reboot_mode_driver = {
+	.probe = psci_reboot_mode_probe,
+	.id_table = psci_reboot_mode_id_table,
+};
+
+static int __init psci_reboot_mode_init(void)
+{
+	return __auxiliary_driver_register(&psci_reboot_mode_driver, THIS_MODULE,
+					   "psci-reboot-mode");
+}
+subsys_initcall(psci_reboot_mode_init);

-- 
2.34.1


