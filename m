Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A560A260C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=US0yvpSw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+ubSU34;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBSI2QGZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=US0yvpSwYxkfJk
	qQKkBv612al8e9Xy4T/Xr0S0nz4JOwccJhlnGKeHK9PBvO0vaDEi6vXbszZH6o/V3UAwrh1Nobk4G
	cb/B53xAYLqwcqXiiQHsclK3Pf/QE46k6vr0AVvuf3bUZPS9UDv5zmxJFwmUA/S8gAw0p9aq1TWn8
	yM6GjIIz5fjrFLsS374ZL8qlb+7J8m6oqooy0K6dlIv60WZl5N/hCAgkfBaohFtKNixDTbRIObllm
	+O54j6mzU1k1IHn/2RxBp8J3WT4Mmuaiy5rEoLWLcRP7HqDgStsOPwy9qE4oXWHwBcm9FcCJ7EYi3
	sSEczGWMaKgGpoqMKbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM0o-00000008mmA-3Tlf;
	Thu, 29 Oct 2026 09:01:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM0m-00000008ml3-0T9l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:01:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vHKq3766082
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=B+ubSU34TnQmuqRf
	jUXoP6JgBr03nskbsZWwAdWWZq9rE9HnL8IdPQhFieB8jO4nLxj+z3SjdEgYg3rf
	Zbm/1TlJN38AuDcQ3nG+SdmrdvFDUoS/hdtYMU1JUihyMbbKiC8c4vv0CSgezLeK
	OVSHeDstB7ytpTB/VuklL9JHWoA+xCa5faXM0NPaync6ur05YARM1rEda8628Y5y
	TWxy9ZWMNt3mSngWoe8goa8ZSBazScNs5XetO7eSCCjyY3u4aePg5IKH5Rnr58p/
	gAIdrrcCHKAyVEDmM4sx3hnlxzVsK4rFK67J4g4uQuHbRJ/fMq+1aEJho4A3ZNKC
	uDHmnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgptsqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:01:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso1215301a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264482; x=1793869282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=XBSI2QGZYao72I0rgSXyF+ohFr1rI148By35vDCTFaOCBOskxG3QLQoUBGoCBEr+Jb
         ksrKBGfeSao9B+Px8/KS2p1CM6UmKkTskxIsGJ4a61RD9muCHwtQq5lhQ3Lpy37XkQDZ
         h4MHTldJ6OdZsWbCDlNwzPoQjwQvSWNe7F5pkHUh6lngvw+1V5kuRUkF1ZGRCosMokX5
         U+9WR7eaUmtSW+qLrO58zug/hA5pg3D1DQbLjZrYyls5eITpfH0teimAZBQfu/FPCaRA
         f+mUx5sIW6+ew4kpS1mBs85BMAlYnE1zCHtG9+/tmYRbgFqsxtfY5G4aQ1RKSZ0IeI7o
         Mfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264482; x=1793869282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=IU5X2LXDR0TnbC+AV8H/lBunvmo8PTsjhqreSOrGzowACtxnqNy7/hH5r71ycEpgkF
         rerygkJzdMbHnQOjPyPIG1YuVX/Qt/uuU45Qs4/tuH+0sUQ4ecEamDN6EAibiEkYLGO5
         wttrYbAdVdwjN9iy9V2vj4lCuB08NE9NsGiwAn9YpRH+x8xZ262+xQvKxy1iIYof6R8Y
         1kpNTVpW1k1nuOyYftBqRQCQsGW/6VQccup5jNFNgxzpstSCyBzoKOECFQnr5e7dW9P2
         JICbtD5GRhtAB/Qsd0p17tW4QK6YNC43nqaViVaPa7iKMypMaQpQP8Eb01AIvN37n5ox
         2+KQ==
X-Forwarded-Encrypted: i=1; AKwUvByBU8lZRKxRti7Tgk8dboxIVpHr850LCdZe3QSsQYiCUp+uSnIKjg3pFeY5M1FFAly2PitwelwzjuxerVOeFezx@lists.infradead.org
X-Gm-Message-State: AFq9FYIevmo61tk9VneepC/uKnbP8NQvRRdHs6tbe0LiWQdXrqnzPi0L
	qpWIcpoOlSYQg1yzM+d1ioxOtinqnb9XmvZknire9P+CBw0yhQhOSnl/KJRhVDLgyEHlRBkWVMW
	EvnsqQN4Inj/4iNv10Q/pyH09qgm24820D6dZfrs3Y5ZrUDZWc2H5G/1WTVQq90C6FKl/6Rv53v
	+4/A==
X-Gm-Gg: AYBFou2eljI2PaivAFkYnCJj2ZdJshK6l7bNZsSAuGo4/v+DSIbBGXAdqLHJB+8L2jp
	3wtZirLO2e9JRT/D+l70tUDSM//KSZNSrzbPG9uszbEbIaOiPARDUAni5jeFVDuNyCbb3HnRWEm
	KIIyxLaogrOx7FBHGttgYfddT3OZz3to8cXYJvd5yxQBBy7j+v8LjCIMxwYEKjR8KM94Rtxn7b1
	vGNa/OrHsP8BXVwhmRkY/y9kJVE9Guh6NGXlc/Dq/FJS1+lqxoe/kYuIAJonqm13N8sQsQSOnRe
	5Rd2SFIQOPfoZV2PPu8o/CsMj+1EnSdEEPaXGdxaDbsOQDu+k+8EnpWa8SI54Djpb19+H1GFIT/
	mxK9OTOcyYeqV0A2MDNWlmL/AWd+8saKPf2xCJ+3g1d4iJBb58U87YiFsvz5wLOrHk9UtdG+mdU
	cAwKpS7TJ3
X-Received: by 2002:a17:90a:c886:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae57e2b795mr3492900a91.7.1793264481729;
        Thu, 29 Oct 2026 02:01:21 -0700 (PDT)
X-Received: by 2002:a17:90a:c886:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae57e2b795mr3492841a91.7.1793264480794;
        Thu, 29 Oct 2026 02:01:20 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:20 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:55 +0530
Subject: [PATCH v27 01/10] power: reset: reboot-mode: Support up to 3 magic
 values per mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-1-fa4b3ff1359b@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=4572;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3jZJCDBmdKair7R/qKaAWXxKmatvkMOd5u4ong8jp54=;
 b=pwt0UJhchuo9nRGpdPR4BB+yIn09z57FaxDRxlb2ix4AAxBac4tXKc6+sgbl7Lmrp1t16D/Mb
 l1rXyaHrrKtDBUIJR68JnHgXfn60pn9DJIDCO7wBnMbX2W5pYeUyOhd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9f4GT9NKzvbu
 fE9v1ym7JkSyfFYmZvFg12gSKlRc1OUHjwHjJuJGIrj7kedNKEYAjUp3eS6PTBjSr8zgNU+Myip
 5cmLTPZHHb8Li1kHvrtp0kOMpnA/ga+EdIgmSkRHl1izZpBym3e0rbZf6IlLE1gI/o+gvemzBNQ
 Z659iLckWafUMd4jAmC9LKoqi8IVqt3XAYPwB4Iq2CoaikcQWw70b98FtGDEVHlsZuMG1wq1MBV
 SDXnsXhhCMQtoGnBDbZH0AjSdEkvjHHUPvw6TsCSLH/rjYNKTiMVF4pofW/jCwY2s0IM+bgtNhR
 eEAD4AfuMIEnSPV34+NAIqLpOgZFmFaLakZIJZmIUM4iCJDgodIBQaPfQB2OxzAuy0aFcFrTmyu
 p22y9BZ65lREX+ou6WTtYzM3aizf7IQ775OLIZrDgebKhEIM33VzkC6Iu41Y+0MXLMhM03lCGVQ
 dHOGHVRdmsUnr7cWotg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX4W/XLAwo81sl
 hTrtCe1ir+1u1k1zUTWLjaOFzhBbKfnlow18iX/UaW0rKzrTr8cpSf1Q6m5DLpGj7SXMZkL54nw
 7o0cne2tC68j/hyFcU56DT76F7qRXGY=
X-Proofpoint-ORIG-GUID: HU4j-OF6xIkXBk5c_f0j2imcgPgXeRRA
X-Proofpoint-GUID: HU4j-OF6xIkXBk5c_f0j2imcgPgXeRRA
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae30b66 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_usNffLPL2KliZ4tEdwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_020128_447938_B9483476 
X-CRM114-Status: GOOD (  22.90  )
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

ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
cookie as arguments. This cannot be implemented via the reboot-mode
framework, which supports a single 32-bit argument as magic value.

Extend the reboot-mode framework to support up to three 32-bit arguments
as magic, per reboot-mode.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 46 +++++++++++++++++++++++++++------------
 include/linux/reboot-mode.h       |  3 +++
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 3611bed341e1..328fa37598df 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -20,7 +20,8 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u32 magic[3];
+	u32 count;
 	struct list_head list;
 };
 
@@ -72,8 +73,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -84,11 +84,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd))
-			return info->magic;
+			return info;
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
-		return 0;
+		return NULL;
 
 	strreplace(cmd_, ' ', '-');
 	strreplace(cmd_, ',', '-');
@@ -96,21 +96,25 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+			return info;
 
-	return 0;
+	return NULL;
 }
 
 static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	struct mode_info *info;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
-	magic = get_reboot_mode_magic(reboot, cmd);
-	if (magic)
-		reboot->write(reboot, magic);
+	info = get_reboot_mode_info(reboot, cmd);
+	if (info && info->count) {
+		if (reboot->write_array)
+			reboot->write_array(reboot, info->magic, info->count);
+		else if (reboot->write && info->magic[0])
+			reboot->write(reboot, info->magic[0]);
+	}
 
 	return NOTIFY_DONE;
 }
@@ -173,16 +177,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic[3];
+	int count;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (count <= 0 || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
 				prop->name);
 			continue;
@@ -194,7 +204,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+			dev_dbg(reboot->dev, "reboot mode %s with zero magic values\n",
+				prop->name);
+			info->count = 0;
+		} else {
+			memcpy(info->magic, magic, count * sizeof(u32));
+			info->count = count;
+		}
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret = -ENOMEM;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d6..29ae39935d69 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,13 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


