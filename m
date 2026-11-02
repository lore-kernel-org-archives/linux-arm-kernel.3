Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3712606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VdPRtgJc;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm3QIn4f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHYTcnwY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=VdPRtgJcABgZsf
	zPCJCsYcpplY9ITYyfoZpwdhumGk/Sd+e3lLfS8nmDUC/Y7kmpdKzYeaxkKFhr+d9I0WmXRnjO1kU
	tRA6FA079koDDPtbcJaCVUSqVcziMnzF26UsUHVtFKkGDc6pM3Y0iZp3fAlkA9WLobSBgxIID2orb
	CpgpyXS308jQFOLLZljkKLaLa7fgAC+lsRE67nqJzjn3Ei+6XvdK5sgRA8mM0bAGQL5VmA5cvKtx0
	kPP4S34QhGcxKCu5Jac46mJveRX6Yq2HUbmllwZisZYFqkX0OSpoBrSuXJtZgfw9OYxstTwc9r5Pz
	cAmsSGT344MyG4XQ7J5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodU-0000000G3vP-3VOg;
	Mon, 02 Nov 2026 09:47:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNodR-0000000G3sJ-008X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:47:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMOX1821203
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 09:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=Wm3QIn4frgFE+1bs
	qRJ6VpTVrvD6xXIAbqfeIgJYWopTXPhXjjyAQi6QRVMtcZNnvyUtIqYw32N0YG4u
	Whc4M2Jv3Hl5RqaT7Suh27/0ijSoYWfXWiEqvjBGE+y26E46NS5PyG/+umL3fNzT
	LT+27sc06bzvGmPdb52W6gnaPWdU/Ii4RanNX77fqAX7WdHY1PrSzzuFmwv3t+PL
	SF76ka8kLJIFFUuJvV7/4mj32d/K80DOSAyvaNNJEoNMWUh2p9upYTNaC1L3DU2y
	089/sz8ACIQDnnGkQ1mpFTcT/zPoyTn0YJIHc5LJ3JYNCEMjPq7gdV151HnCQdVw
	Q9ty5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h25j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:47:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adad90c894so3094094a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612844; x=1794217644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=YHYTcnwYfgAFA7gr/2xe5gK5qSw5yD06If7ASKeJrnYjaCmNvDnZGERmIiGVddWwHD
         kZr8WGXb6yzu5V3wmJByEpXKKoqSopPdS0pqT3mp7bi8N9KgJvyEeyHMwMhICVx9RM74
         q6cbfEE0m//2L2wrbTnshqy0potnKIqbulgzpWNtAPUSEXyvkomMtO/DVw4bj8+vQqbu
         Qj8vlE6lD5vkC4RY8Unb/9ZOTOLhmEUpl1AbGQVE6RaNPQipEqkPZHSlKBthctDhvcfa
         egAyjZlI3ammiE/UYvUxLfuMHndNOayQSAfBtATC6llCtaYlRPVzc2azOcMySq7hvaHD
         o09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612844; x=1794217644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=SZX7Nond/LpPBJtbYdY7cUht4ICH5EB4gbR2B8FleMX0FphKb7amgw+y5RFMGa98Nk
         bCj2mLISMkjq3ekWzaIlJ/KaXswxiPCR8B12deDSbe8qQONJKGO3bvM16xvCyhKdTcRG
         5i8qjNeY1Jg2tbJtkmOmUCH+turwO/8kPg0CRz0VsQveet7vRLC3+mFjQiSlCWiJGg3l
         dXVRTvwotEqOYafHEf+DAET26stn0IRN3zbkFkjwDjNtZAuZdtbHwh77WfktqPDOmEY5
         61m0TqzTm3PtPzQ2eJYTS1U6D0UK+MMJ7arP6yd+63L8dIwFy7ELQYC77swrarzW8u2Y
         381A==
X-Forwarded-Encrypted: i=1; AKwUvBwSNqRvm/MR1fsUxz7sfrEsYZvrQ+9qCeoNylUsusKHsXtd+b1FsZBt5BEeesmq378zphlNdxRq41iN7LEP6al6@lists.infradead.org
X-Gm-Message-State: APuU4Z/CakEVpWODCYUPvUVE6D+b5AxqK9vQ7k3I1k/8F3QPHYYbvfw5
	3UDv3CKHx5imCEp+Z8fWatRWoI4rQGZ1yCgtR04mmK8jw6X23+gCnrlGRgUxpT6aU9iR8srnwsj
	TTvf62tP80QVil8CR9FAYKBR4F2HJ/hvNEMl/jhw/44IKCvZpF68umOxVqMxN85sCO6FoOfmI18
	ZRIw==
X-Gm-Gg: AYBFou3QMjm1dEzF3zYbFn2CDZKLNZwEZ9f3Yw3km/PGLDIh9G+REZX3LF1JOElmghW
	m0VjG05onv5EzMiTsyJfNhHLC2t+IN06Ojm5TcOG6LpLcBd2id7mY8eayUPxZYgaA3oac0w0jAN
	nhFDPAFA39MixfRk6T84vsWRy/f4oh3zok5+TDQ7gpGfvyhZ8i2EgzokCP80lmB458MEb/UHp4D
	FlNPEIchb1YDx8IdAtI7HsE+wl6WWadBvug5FwUACrYP0lOChnm9RGL4QNMWpMWJZQqXWlmfuU6
	xvehdtq63QcTSkamegiOsmfsvgUU/NdZQ1/zQ5AmseYNTtePCLo+axz75oI6Vw/6qZdRuqjYknR
	ogFPNIh6xZKc506T9ZJ0tQZ9lKH+nDWzalYmpIK1MXtl7xdhUW30h+dVXZ5bhmWSk2FeveKaC63
	yB/mVUCSbXT7hxaSNs4I/SJ4zosb+cWw4SbH8=
X-Received: by 2002:a17:90b:268d:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ae895a5c65mr7491740a91.2.1793612843737;
        Mon, 02 Nov 2026 01:47:23 -0800 (PST)
X-Received: by 2002:a17:90b:268d:b0:3ac:762d:79ae with SMTP id 98e67ed59e1d1-3ae895a5c65mr7491729a91.2.1793612843324;
        Mon, 02 Nov 2026 01:47:23 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:22 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:29 +0800
Subject: [PATCH v21 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-1-231e069b7853@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612828; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=RghL7vHLQ2LLWPeyClO5kOMvn0TiqRKkbIQ8KwYjaEdz6XIdZ5rR8t9NMisjNHMkl6xdUkz9v
 l862wx1cR2IBqXWU77fiZ9kSzs17FnpwmcgZCzxTJNYUQv3jmOCe9N7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: tbswfO4yrvHlZPJnzCRg1H2DU3M5amfj
X-Proofpoint-GUID: tbswfO4yrvHlZPJnzCRg1H2DU3M5amfj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX5Xe3LVooDdkj
 5rP7nrQT1kTxORp7FmDcwPdj9uo7GgRyeOocneGxmCV6ytNgGvDL0HR/iRzl/Wul4ei/DRhowGI
 VbQvsmMZhUN4fnRv5wh2Bxlk+MNab4g=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae85c2c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+x07LKPaOMIi
 ujVcFvsXz1gaHVL7hkuNeNHRvnkNjMpmreNUdRFenCnDpuSBU/fxzook5HPexMuLl6nPZ8QPzV5
 9zAdkIZCghSGjL8IcmtKgFR13b4dJufKJc2LPVtXk1Yn6buBNpGpwybAnF947aaTF662vDoLGKo
 GuJf13OabhbrYpU38BtozT62i4RSWXPYHwXw5P1dypUTtr+A1fQbkyE6j54C4kZHix5SVolCR2O
 q3E4YbLXD6Njf81vPeUV9a+IybOGZaGB+y4L2oSAmLTm3yjzE2CqdlkEFqjtiGQaMgkdOCtdETi
 SpKrm87og+uXJLkrp0Fs9xATy+NikpGh4GPZuKK9jS9Zzwfu216J5sQe6IutxpGFZbdlicqxxmN
 3AIYwm289mSODcikN7h6cFVOrtPHCnt3NpJn15xvhKH0p7DkLqEEQOr1YnzbqyVjeACZarX2+R/
 XEgtMdh2ivw49tajbAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014726_001933_92EAFA38 
X-CRM114-Status: GOOD (  23.14  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


