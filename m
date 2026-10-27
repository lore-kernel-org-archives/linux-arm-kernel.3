Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA0F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xjk8rvkD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ca6+0FZ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j8dTWWd+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=; b=Xjk8rvkDpZk060
	MkhKzc9Ey/xcSlUjBZaWzm1OZoXgiqbUm+tR7zL/Iu/7g4LVVA7zS0hGKoPiSFpPd/+M7Bb43fK8B
	545Olx+K0KHgvaOlQqfP5cdsCPvIsYBMPelqHb9WtEPjUkFIKVtO70ombs1dCgEvl1cTMgT0AJJP3
	Ta5kZvO+iKVi2ZPtebPlD0ErHUafFoHF7jwPcFM3e2AGTb+xHKaR56yuEVgKbtbr1csAgEtTGs7eK
	CiW2qKsaQT3BqmpsKVp16FsiRdMQY2gSXKYRLK+P1F/++t91praoqlDtJo1lryiwfC5kBsTVqo377
	Ua00jdHV00WBewsXNARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyx-00000004kwg-07EA;
	Tue, 27 Oct 2026 13:12:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgyp-00000004kun-3pGc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:12:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RCOCZ11125023
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=; b=ca6+0FZ2ppaUgxtp
	qcouJXUDvv8HdbSis00zffytYt3AYzLQqN7iNpGVvxTtOc3C8XAhsNEWDJWoqAoc
	/Hn7fmNkj9yYqMkhdFM2wY32iUYFIeEHU+lnePniAv/xWlpRaA4+/WryNIe3iH2E
	OO7VYGCBHqAK2EFG7PeyYCllVHGwtEbo5fFGiph3RzVqVWt8uwHc7fE2h4RLGItd
	4VTnEGonkkNrRaUG2VYqGB1Bqb8HrrDzYSfzq22t1kskS96AIqTY/ysaOELjwK9m
	itdfZo7FWy6q1tRovRByw8WokH4QBbV4uxFrxjAzkRUbuQpB2rO3hxEQApnEG+uf
	TBf8bA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9864q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:12:42 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836c9f68dcbso64757107b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106762; x=1793711562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
        b=j8dTWWd+iqHCQjL3m+St26gm11oWzYQlEJq487CYozxKoufNt9tPdowSs9C+I3MVu4
         lX+b6T12WzzA0lCE2QOLjha2YijVCYsQaOX0d7y2N0Z47ZxvoZFcNm3vbJPUPFwbEOl5
         FetSgVeHphjgwBX+o9tMC7T3PHCME5gJBRjfqnKTlwo1P+n4JOL9zHCJfrIoshG5x7fg
         bDeaKLRevPsQ0f2U0GFdE009SA3zrjt3UPSngzmadqrVjfgRwqwqVQoEX1EDurDPNrbJ
         CZ5cb8nASCAxUxq4sd3ED6Gyclj7g02Mbu2CiaFMnO8c8FKbtkX54JULr/8qLXnTaFBf
         Oe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106762; x=1793711562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8o+1XFzXUCnG37HF5JVO5wDUVAXWp1GsACw0tTcQsk=;
        b=kLYqVhdQjCAtJ2aYCw/mXh5QRkSzMPC5S9VoCEl5bwpucMV70l41NuTniQvtcdh8hb
         ZKJ22Alaeyzb/Ii638Cn8Sf7/FiJis78mPRfKzypcu9PFRKnKD9Gl1ImB0b+/AN0lQAU
         gjgFy/QmhP6LZZ+/JRaZCCCiosmCoJtN/jCDBILIAvCOtzm6QPSYsOg+LE0PB3h/cmua
         z0vXVfXNK+O+SxUNV4+5LpDRq3O5nf8WByGMlovaOi+VTNAgR6DWhrPQ9rrdKnNSY5Ye
         hnah+f6dA8E8b7DeXi9KAkg5CnPVbfvcF828FRYy5SqM64s9E3Y0RuPggFkaJbqtHDzF
         5GOw==
X-Forwarded-Encrypted: i=1; AKwUvBytaJH0pQ1gc27nMfAv8le9H2egLB+zM/3f9EmEHfDQshMPd4Kp0Ry0FX94o44+llK1C6tRSkWTy+4O9tKi+R2Y@lists.infradead.org
X-Gm-Message-State: AFq9FYIEPgPWaUMogTGgTu8U8fFb5HMo05JVdo2zaiSlgkR9gL+CvRb8
	SRg9uPbMk3XCnz+aCF9q8Howe7/M0Zt4v6gWFbeimm0gicOg87HpBOMf5yqAI4ed3AMnhQQstim
	k7Rd7NPMqNTnttTwYgZ9Zq2RJKPOHtWn2Kk5JrZLOP8d009KI+u/ehQPMjcq2QNBzBZ8+IQo1O5
	LB/w==
X-Gm-Gg: AYBFou0lFDrIi71m9Mu5Ka0JTl/1NzrXXGgvv2bJSsC6CYX2zLthWpa4EJVI2E9MnNh
	fuJnnhYJa8Y+K7qoTUz6OE5b5Zm4hADun6v22l/gADiwmiTx6QDxea8CJqAgS4x8Fmy4QpLsptW
	nQGpgVazlkGzF+HY+srw5u2FZzWB7bXXHps+Tr7nvQ9aJ3UFRPXBzHBNsiFWBZcososhGzO9M4s
	XY1fwdWz/B0GZf1BzvyRfIURFe+FcQ1pm8qIPYk8dwM/pImZnuJfCgDbRtQJTW9CMsTupaDyneE
	3bNxphRwNDWvGFf259zZEO8noxZ45dFcocmyW4TDmyM9zBw0kERdsGVrUTvHYJzR1D7TCP2p87t
	LB6IrNnB0qWyG4Xpd86/k0NdK3cIJ
X-Received: by 2002:a05:690c:660b:b0:8b0:ea15:fb61 with SMTP id 00721157ae682-8b166c4cec7mr58168557b3.71.1793106762140;
        Tue, 27 Oct 2026 06:12:42 -0700 (PDT)
X-Received: by 2002:a05:690c:660b:b0:8b0:ea15:fb61 with SMTP id 00721157ae682-8b166c4cec7mr58168437b3.71.1793106761634;
        Tue, 27 Oct 2026 06:12:41 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ea7b9sm10743547b3.32.2026.10.27.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:41 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:41:09 +0530
Subject: [PATCH v3 1/2] irqchip: irq-qcom-mpm: Register MPM with cpu_pm for
 RPM notification
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793106749; l=6732;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B2aw8nOLksP/v4UrXDlB3J3clvj0LTblXgAVl4nQhYc=;
 b=8r7GMgNARmMKCP7BrzhVEKlMvq+X1jK6HAV27ijgwbGiHeGozq+Bjl3yiccR06SC0Zrmg4NXX
 flKAt7sOzQdBYfWuCUBzpJ8/nHjrCALlvkkogadejIqKIkC6R/r6XMz
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0a34a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=lt-0Ylhkz4Il63NEeiEA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: O_R5u7Ot-kr5cPGo-itGQCTF6AbEWpCS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX8Fk1z0XaX53l
 goYtSB+jovCUOQOO1PTznn0S1n9pZK5gfcCT285sy6US754ginf2D7YUA69Nj5S9fJkmJ1EE5d2
 VmHTxSYF+YAGu7nGQgRISdlRiHy8VmCPy5oEMhvzbCnKsaRs4Rz0//RRAKi2NVsxDF6YDnfNLpb
 X2qjb3cLYhp80KPawzci2u+PoZ7HpOgI9SX/6WFFMXtErp/HH4LLimRnxRjVwGZmkyTN7nI3ksh
 F4UPoG82NiLEwQsdkfB7PVpsMWol1fhmxIEvo3QGVsibY51yT45XtrJprC/qhdaX/+cns3QL+BT
 SnEuMLSXrG0o5dexHmrS2IkcumQw+rAZ5IFJdO+p7ANKdN6Y//TqLVqQuN2LggoBOU7lgNPhGLF
 UavHMsj9FcIVoHPLubmQQ+edgOJA+/Ws3fLPkRH7DCGH2bgRZGvPm7DZ1f6DcqSlzGG9UIMqpBW
 IP0lATE6EfDuT+Df6/Q==
X-Proofpoint-GUID: O_R5u7Ot-kr5cPGo-itGQCTF6AbEWpCS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX+cnMnyeJGvGS
 prJ5PJ5ceiwhREu/lUL+M4LEQ6ZN053aEw19rM2e36OVeQ9r2zrETrXLc/EKB5oHg19A8hHcG+P
 LMoDQJcCU0q69fNfPGnI73hFzYVaUZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_061244_085188_2E52C5AF 
X-CRM114-Status: GOOD (  31.68  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 104 ++++++++++++++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..136d126f0ea24bb10b5183d6ce47b630aa77b0cf 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -85,6 +86,8 @@ struct qcom_mpm_priv {
 	unsigned int reg_stride;
 	struct irq_domain *domain;
 	struct generic_pm_domain genpd;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +295,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	mbox_client_txdone(priv->mbox_chan, 0);
-
 	return 0;
 }
 
+static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
+						  genpd);
+
+	return handle_rpm_notification(priv);
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv))
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -415,26 +458,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
-
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
-
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
-
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
-	}
-
 	priv->mbox_client.dev = dev;
 	priv->mbox_client.knows_txdone = true;
 	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
@@ -444,6 +467,35 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 		return ret;
 	}
 
+	if (of_find_property(np, "#power-domain-cells", NULL)) {
+		genpd = &priv->genpd;
+		genpd->flags = GENPD_FLAG_IRQ_SAFE;
+		genpd->power_off = mpm_pd_power_off;
+
+		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+		if (!genpd->name)
+			return -ENOMEM;
+
+		ret = pm_genpd_init(genpd, NULL, false);
+		if (ret) {
+			dev_err(dev, "failed to init genpd: %d\n", ret);
+			return ret;
+		}
+
+		ret = of_genpd_add_provider_simple(np, genpd);
+		if (ret) {
+			dev_err(dev, "failed to add genpd provider: %d\n", ret);
+			goto remove_genpd;
+		}
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+		if (ret) {
+			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
+			return ret;
+		}
+	}
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		dev_err(dev, "failed to find MPM parent domain\n");
@@ -473,10 +525,10 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 
 remove_domain:
 	irq_domain_remove(priv->domain);
-free_mbox:
-	mbox_free_channel(priv->mbox_chan);
 remove_genpd:
 	pm_genpd_remove(genpd);
+free_mbox:
+	mbox_free_channel(priv->mbox_chan);
 	return ret;
 }
 

-- 
2.34.1


