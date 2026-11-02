Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F0606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TdZ79qEf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEPepWZx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQHnABNs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=; b=TdZ79qEfNZ+jdc
	0V9F+xqoqUMJ2jbzkbNr7NTYufTID7PDE4fB8ij/wyfv5QFt6d4GHQuKYlO9FxAaJHLhJxDYnZ7Zc
	FXG7RvZv5EDm01cSPIa+DaKlbS7aGvQphfi8mvTBQWweBmlJDkULeUis1bUYWRiUfjupCJjzW2R2p
	HgOymghlI6ZgGwONMsEl3VgxKGQucokn2TfceI9nuwBl3Al+iQYmWZnWCEVEjoxyaHcEpuZ16apGc
	66VUq4c3tVfL+rUA6UEPpU9P8edBBwv7ieQJbfyDLhSu6FvE3KGetC0Y1/A4cMwsYD8flSJjD8O6J
	hd6pmA7aRWVn61Oe88Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodh-0000000G44b-15D8;
	Mon, 02 Nov 2026 09:47:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodc-0000000G40p-1gDC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:47:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMsE2880846
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=; b=WEPepWZxd/63xx2w
	F0MpJibCuZhCCwg1qT1V9T6nrAZY3gflMGWIiUYSAuB9/C0NrV0Pnh5vACftEJ3R
	FoIMOHepfheD1h+FzYSfqsEthzGzgrKf9ROAz3ry8XhQZ1bfloQwNBrq3W/92ygU
	fYdRH3v6ry6J6s5hZNLBfl3HQLw+aqp9DcPVOFmKc9WFiVwm/63YLnAD+KVrftIT
	2JGcbszq2JqI3Eg9t3OLil0tdUX1Qsx8ohVE1pKsfLlT7mAsHcS5R26Fhdbt+ZJz
	1ez+VpaZPvojOoupTFTS6K/CXTcnohi5VRifP9RTPzXoRZWAKLaEfFKXNkJ3uI1y
	R8lHZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg6xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:47:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2407759a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612855; x=1794217655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=;
        b=YQHnABNsVclocj3eEgZC/Q9TwxZ704wgmUUGoSGMa4vNuxK5lecyV+89oFJnZQkVhw
         WnaAm1U5QnCcqJl56p6LENsPz5HU3v1eIwmYROSXdn6FkOh6sELqK918IFcbDImNsnUy
         1k4W2VhIS6hvOjJMMZA0YhqBUQXOAecBtiqwNcrGtWxaE8K7krp+HwLotm7AwD6dtKji
         cH04ejCXW4/AsP6wdFA9vuC9lBsdemo6F+O0Y0BA9N/4dTz7A+UODBy8iEPM4lgLjnK9
         owujww9O3n+ZgxDYhYLB9ij28p82kHqK120R2ko/zscJCDwizFtS+mdL/gV16PGGDRr/
         R0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612855; x=1794217655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=;
        b=bpIZnCPReJCYZKy58ODOu2LuFPsjkF4cd4Wpg2cl+6izwkoM3ZxbEtfxYHNfKHp8xb
         w2hU0/ZfZyhIGlEDfZHPQtHSTo/nambgQDKDOYawdvHPCeUcRNP78mNT5919NRGlFnSU
         blzhcvhabJPyNgbkWIgNTI68VfZVMn8mAMy9pFXxlVHS4SmRBeYvoqkoOhUNs+dmYPuq
         utEoeBD+QOGMnkHqkBsVDeb92TR1akor3JOtLmrVhUarmqbVK/DwFtPb6X2T0DycfeRe
         xam+3KtPS2oxD24XxskGLw9RU8uoOd2TbX9eqyV+V5kZEyPz2z4zxze+KSsK3hmslMbt
         viyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbvS+1c6Z7hUMozaIjVE6vzbPZFcHSEkMiEP3puC4SBnGdZTgP4fc5rBhqmGYEJh2Q+3k3K5wct2S0IL5IspcO@lists.infradead.org
X-Gm-Message-State: APuU4Z+OmrERUuF/utwKpo7zfdUVWM3Jt/0yPUJgTAVG+FUJx6REbZod
	n+YvyoupwcXcJY8iM3X95ZClP8eVodmAdPmhYrvq8t3n2QJisMMyCVa12QKiSxlop+m6S4KjReT
	bLCl1fl9ZGMjd5iKuEFtv2t9FxSM4Ud1Nmipt6asPnFvsIpPOpCQxnsOGNGvO2dXQJer7gQYtYV
	09kQ==
X-Gm-Gg: AYBFou3mGvCeuiJb+Ro4EKT/D/KU7Xw0869g5GSBVjLiqzaeqeq4ivKhLeXIEbrSQCc
	NhyiNiqI1LU3Y+WNU2vuti5+px8yD+EagzYHLciP5A+Qu7NRjB9ErOwwp14SKyfviyBSrDIPADV
	+BMSuVlVJk1IMWhSqL3LEVBtKynpfH/bjXjnh2T9NWDy+7WD90HMjqa0Bmmg9F0gD8VQESMIoLV
	mqS/9H39x6jJWdxTKNOEd+qqvCrwCkiCdULH0shIGoD5w0Zur/+OEwy/tAe1tLLyX0/fmVnJP5a
	M70w4Yl3vClbkH7xje+J6Vn70Q5qDrYsRI9EQ5pCbMi8p9qA+kP5GVNZT1TnEnc5e37kTJhppSm
	O7fmQgFhFW/uYPtTlLgac8YunbPWB80iPyqh2StIoThIslqnXjFD2O8wBfhtNjPw530nvodS42c
	EvkMjTWemIs0Z7HFpoJPNld5kNJXGw9ffAOcA=
X-Received: by 2002:a17:90b:2fc3:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3ae89771953mr7718869a91.37.1793612854919;
        Mon, 02 Nov 2026 01:47:34 -0800 (PST)
X-Received: by 2002:a17:90b:2fc3:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3ae89771953mr7718855a91.37.1793612854431;
        Mon, 02 Nov 2026 01:47:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:33 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:31 +0800
Subject: [PATCH v21 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-3-231e069b7853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612829; l=4491;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=e7qSmNkg1bJ9CuA5XfZ/wTAAZZTOW6tXZW1EGCi+WMY=;
 b=xcyDWk4tPPulZu+qTEV4TTf9k8ChipkC2MqSxxOK3fOjIHDtEQPzWqfqUCK3APffkY8SUjvOH
 AOPzBqxBOi3De8xgqdjlgRhtZ5zsasb5Lkh/Lt8FJRXkGrBro9ZQdgJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae85c37 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TPt5YZYWydgKV8fuSqQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: DUBx0Ou1WM7u27tBKnU4W6hZtDZH-u57
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX2knnJSXTnhjk
 k4XeXh6ucfEyCBmXUov7l6QClwTto9hAQup7aBic1HWG7BfFIWmKFlCPRXMKBjL1N8v9sKfAh6S
 Pw0BOFv0EiZvBJ59vK0rmDG483Pw6PE=
X-Proofpoint-ORIG-GUID: DUBx0Ou1WM7u27tBKnU4W6hZtDZH-u57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxGoVKhb1IpIK
 l1DubUjYThnYC0hgGJ15/CcTTsq0MOAWM+d9bVGb3iHssHgLUyegParNE0z9uGptWTRMyjmwMdl
 Qj69nBLoksl9DLVG4MSjs++uKaPucFwouQjuIEHM+fPSCWybsGGp/sDQjDjOnmSNb6q1lbdj2Mg
 WaQTLXSEDX2uxdduqUIKlT3vVr9nkL9tqRiilMXbu4TtgXMuIO2SVO+yorXIANNor+Hwy+mGBQN
 L8eTKc5CH3QgAszZsGU0prrDZBbk2PaC8DXjhvKa2ft2QJSk5F16ZNVAWocEAvuQtjBdwFvR3nw
 Mo7xox3geJAlGuh1f+pDQykJ/UpfLCgPLb6Cgj/2H2Rcd0FEEvlNfvBx28KULgE6vkLKB2gGFPT
 fqK77/sxPoi5U6UKuxSc6LYzBGLCTi2aNKop3hfXvAJR/HfwdZDTSa+CCNjiLx96gJD9E99fuQR
 hKfk5g6hV0cHFJI1bCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014736_457862_40696F2C 
X-CRM114-Status: GOOD (  26.02  )
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

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index eee98a9269df..2de31d73a4b4 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode or there is no free buffer. The ETR is left untouched in both
+ * cases.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->is_free)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->is_free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->is_free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	tmc_etr_reset_sysfs_buf(drvdata);
+	if (__tmc_etr_enable_hw(drvdata))
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 7c604b9f92e5..30b15c38b080 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1


