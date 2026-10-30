Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3435B60A2607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kD3tTyEh;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1GUPYVa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a8d7aWu3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=; b=kD3tTyEhXeic0b
	mti+UtZOxsJ9ApzXl7jXcyzJhmMEd13/57xYlzrpESjga6lY968fCmYD+9FiKnVZcz6gB8DnVSW/S
	JJgdUiXUoOJW8PN/BkDYlkfwwecOiZv4/YMqSrlKshDhm4pGTGr9Ap0NMQsFM1gnUN0zu0pD4YanI
	QDZEIo5QtuqpVZmbvLMfhXHJ8trS1upom3iz6qVjP53NQo+5Ktzk3L48Sld/cVXylxnkyuSuPIq7v
	TeCqz0E8dbMi+Iw0oE/xBp+xPabLjLl7+vp9sYqx9ykm0Wr52wsN7O60PdpsPaV+u7b+xO5wsI1mI
	Tp8K4a3111jb3cpYNnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgd-0000000AsH4-1pSK;
	Fri, 30 Oct 2026 06:01:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfgT-0000000AsCd-21El
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 06:01:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F1ar1367115
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=; b=p1GUPYVaYt5x8Fsz
	9U6Mxmjhx3MccUJd+BBFhjIfoqgJhdbdtnA7caz7aaITIb6YuR9uHHJtqOWp8mtP
	pw03LDSf20pTjpHMJktId1q2KCbPMmXUjG0eM7KNhdF+jLjjtIdEyYXR9KsZCMNL
	XzcXthjfQlumz0fHxcLPbnEkGzG+sbjXa17x6WgRCIpwwd2AtPP09qA2d6DBb3At
	Jo3fF7K53Aklw57ZrUzR4F+v2EGdg5JfLK7PFsyqirn8DvBWC/UXsCOmu0fnz6Z/
	JnmXhDSVy7SLYwtdKAcUGPSzezSG4DCFFYdDYZSLjsZA7jBN5iUC5DlpSTgJl838
	z102XQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p9e71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 06:01:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so437099a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340107; x=1793944907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=a8d7aWu35aWvvpxFKhqjf6/r4gTLryJriTbHXwBeBsAilu/qbaRr3EnjCQNVzzgAoO
         MHIkfw977kNUnjAKLAjnc1p4TYVcGhCcVe8Io3LYj8416Y1Evwetji4o6ECicPdeu3Vy
         YaZ+doQs22/jLaXypf6MOSDBsey36INWRIdhUZCnrjVcONIvFpKbVVBGpJ+C8KkMV89n
         xQosewuBDM5MLn9Zgc+nVo/+kGCdRdVVpXNHJZrlDQBwhVafRKDV8XRrq1tBsKIPWgLm
         K691wUlpH9mLbBrmPGJJ2HWJPBG1mHJd6dyUT9IfycBkrTn052E6LYvMv5ix+hEW+m/7
         FA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340107; x=1793944907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=mAcdZ3w4RJ8EKeM96DNhV8pw9JtKZz6z8+58vaQ8UcEf9iDW0a7Fypj/rdKiL3HT3W
         ruBFe12plbS4dqGnSlidiPa4ylgIGZ9RFAXeOdRNOcptOyj1CX3qCNfgdjBDpAPf3eh9
         tli7vkCsLVpZ2b/WrimVVhexMsDEd1QslKKJHzU+cC4OyAFDuqRAVkLH9rypOSeIAGvF
         xaXOZKavyX08nLFwiV8bAgF5PzBDrVp+e9tKEYZ+0niE9SbpLkXc79Od1PhOpRTHm72A
         DyO09fg+UVZD/0AYL7TSuiDyCejZPh/ce/mWXthU/XcHTKXSASIxQH7mwUjFRHTj87oV
         WROQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsGdwfWQs2x6W075xeMIC3c5VsvNxi4OxDoTd4JhE4QLKnRU2pdtfhayEaGVAjeFLBa0nkAEqpYEsHLMHBym57@lists.infradead.org
X-Gm-Message-State: AFq9FYL4728tX9ZgVkAgflq1VrSkkTXwWe5pPi9qizXlb5P8QbjX1x7A
	73NP+u9s05xeomHAwxJ+7VUwjULwkiSsxfWWXJBfwwfmZJvNgVRw4Yfn+X3D6zIyyHspHjdhAxh
	pJXOkKKvt3x72/K2EPJwIT12Al1gpXZlxHkkENErRdsjjqsPStZgmXWRBdgrXEbz+Dg+I+rqcNN
	wVPQ==
X-Gm-Gg: AYBFou3lWAJBJ2xcJxIq3A4Uk5QhNaJYIEY2Q+lSiij/AW1jQEgF5+l6Z1ZvJcfwBaC
	g2IJ+JvrgWp24hBq3BN1fk7oydxS+nCzqDMc4Gt40rHX4/mGLPwrHlKhDiLqaIDAgvI+YGIMj21
	5jZI94vpURTUMohT8eVJTfJBDgmYipXfzJnnHLzXnOvT0GPLSSodNS7hocPTuAIakeN73W5qQee
	A0kjYz/q0YHhu4yuLtjH6rr6tMVjbEvs0g0l28fRebQKIx81rzjANmaMqtxXcx5x2RlhgzH9Zeu
	O1bRvSvrihUW7fiurFk5yIxtaT1Ku70vsSCx0eR4FYcy9HLZeTZdb7UMeGZd0mnYm9h5dEd8Akk
	B1KdO9DiPScMSWf+p/qpQH6AZBkIAqJ41m23T6w4hKQdCHeqZFZ3kioYsbgO7E12zb6+K7Dg80m
	DQHY+BpE5n8ysFKpc5XaPjfEDZZt61Ru7NBqqf
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382654a91.4.1793340107318;
        Thu, 29 Oct 2026 23:01:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382626a91.4.1793340106771;
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:28 +0800
Subject: [PATCH v20 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-4-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340076; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Ux/UFuXxomeyORdfFTzlVtMlH0joNUz+K5vYGMS8MOs=;
 b=zUuxdxhuBcLR8U3IQg3Iv054zxt9xGDwIBldKBF6CFaHA+ue0fpUG/4QbRrBHAyzjq3aGRwaz
 0/2iRE3l1MADNe8/cz0GsTnUlOawLNECCXvS+oE+fhoRK2QP984GRxq
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX8kKm6A4lvg/j
 VKBVZy7+rRR5dlE4sG/9SG7Pi2eli2h/xANxiAlI3gHxRRNeAZwlnxEumBIBuXz4P0CYWu/q+rB
 mjzTLI6+xscYnjmyDh2KOSNp3c/6YBLHFSO4vdzW9rhSC3uZ6HYlSFNEZpeQfelbyQ0Gy30/DMd
 a1g+LaUvaKQsE6gNlL58j+RWSd8Z8Itwb+Q5D/CmZp7cZOG1QN4dOKpxXd7u8ovjWprevTddndI
 +bAo49SOKbgDfgYFNSkW9GXge/wNQGX/aFE7qEgP9z6kAgseZpcAAjJ3Q6f+/76BCGHTegPbolV
 XXcz6F9GLGKJ7xAaBa4inax2VYKWKwbG20Tc+H8SyjsB/WuAg90H9ZqWadn75xU2SFH3R9mwrXL
 6u1219QMgm/qi3LwDDz4TC9HgWN6aGv7c52zwAu/CypAjjPUl5HUcGq2f4vkRMWNAU27dwnhtLr
 do6TYBDrRBGuxTyhiWg==
X-Proofpoint-GUID: 3vmmCFjZncFeZDrHwj3yMdPq8OpWLFEN
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae432cc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3vmmCFjZncFeZDrHwj3yMdPq8OpWLFEN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXycK3NFUwiw31
 W4m0aPKrb/Wyk8njagefPuFlW7T/8+qzgz0n0iwzQxw1fRRnKweVXedfMrBz81vxUAk5inthbQp
 6I3zYEWgYxRM+6645j0Bv5gbtE1DT+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_230149_533605_46DF709D 
X-CRM114-Status: GOOD (  17.32  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5981deb45d28..7d41fdf83c5b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


