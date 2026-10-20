Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1vkeoG1h;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N9weUZMr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i3aDr0M8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JHq2L56t//wbyoO+11weOskejxecAUIHbZU7bhxKdLc=; b=1vkeoG1hv83UMEEaomclPmxLwp
	f43P8EHn/XDewTLsiZxTrAh2ZFH/xZOooRPL69tucfWyTkXIKTFkkRQ4ASgnCCtl99jXv/HFwkGVy
	ACv/myKFg97Tmg8c23rz7be+dZSGygqsOKGB9/lxFMBvtqvh7FiShETEqDm9m3RFVL53U+bSsL04D
	SstBKgv7dZJUnuQiimv4XWslGxopC+Z3OoQmUBab316LcL84v1Cnrg3E9SMMOHG3mIBcX4Nl3MEXx
	w5WJ2r+q/X/OLYHbSPweUUfJeiYzM/5hPQ0VjurOT/frTaiCifyyupuXlmDlbi6YGx4ddiLXJAq3v
	tsjVxUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAnh-00000009w8L-1H41;
	Tue, 20 Oct 2026 14:26:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAnU-00000009w4F-3hmM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:26:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAA6L702626
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JHq2L56t//wbyoO+11weOs
	kejxecAUIHbZU7bhxKdLc=; b=N9weUZMrBc3yK8X3ExRyuRwmah+yiMPm7GU4s4
	r+cK8x84bovh/jFQYKlkP9tzmuQ7r/SIYqplKE38v5Ai5MQ/a0T+Fc8VkMUeusCX
	2QdbMNrn4fyWdaf3qVpqKCAdy4SHvl1Yg4X8b4eWF4spL8AXOPfljHgGrDjm10BE
	wFtNjiiIpvU8XL/HepXHsVjCnWpzAyGDGw6Oj4ctkdVybzRDP5WYHqQ2a7cngSsp
	C+TFgZ4/2C1EH8pdnEiQyZA/g3tUvPh41/s2jG4K1UzYkXjMqRawOGZPoSfCt+S6
	kQMU2e6IhEyxYX3JshE/FklRQ733jhqCddA3tH4i2XDSJhog==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stuaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 14:26:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so182606241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506395; x=1793111195; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JHq2L56t//wbyoO+11weOskejxecAUIHbZU7bhxKdLc=;
        b=i3aDr0M88ZKSsxXU1wUbCeSZdlRXcnY6qfVaSlcq7eCi8FFyeXkd5WnlbckTvZjHHS
         I7VzBc97t6lUau1/wK98WkCFkikS3r23j0NHfQr4oSKNe50bTqv6HtLfDduzZj9LDUrX
         ul76fuPsTJIoU4ciKDgKHyCmRwHu/6Ds9PQoJQ/cM7r5Qv/RAFtsVJ+dWOUZBpG/DjCN
         v/RX95uKuYdLm7IZAqoNfvY63Zr40FeUXnxMLJtQ3ylqBLmsGrmbd6rTFjqol2yr3mPb
         439W7HTHzIFgLHcTt+HhvTQEj59mVeUvvRiGbQshl5jHyI7SaSki8lMPDIyt+C33dGXo
         a+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506395; x=1793111195;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JHq2L56t//wbyoO+11weOskejxecAUIHbZU7bhxKdLc=;
        b=igijXUL3rg+3obzDWZ+9Cni54cF6Rq7UhmX+fSV3QEQfiAZmPNwZQvyyxm9inCkwm2
         ie410omxNkeXCvvBz5dAiCxJPg5mjcCaEzq+qfVlbdRcUULs6xWGRUovu798J/s7eVTD
         AtZQdxa29b5NJTw8EBxWCrKgHVyByAL8EdCha3sD8gMJp+g/tgrhIQOss2jHAk1YIy4U
         06HVq/Qf2lQKqXhpg8PsadWPYUAYhWJvJ1VGCLfyGwAx5s4liLqpxIR3f/jQ6v950tYh
         lUuDj9AInd2Zrqh0wrzNZhJkJXclVoFtGQgxQOxZlDxIlYFE63u33HqShiRZsfcsw1kE
         ujVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyovlct24clqWbPDCJO/NGblt2Qgs429zLGrqOtpmICnR1O61PhK/Dd2SfR7sdotzIeO79uMtaJuSaQT2g8BRM@lists.infradead.org
X-Gm-Message-State: AFq9FYJ73sbmbXjHRmLutjBlANppfyrQ27P72SVrVQAfFUU25qk8BUzT
	EeRsiXR9CpalAapUtcIyrWqiprtbXRYnvsugPlssiKCKeq/0h5S7P28wTH4Oa4RtLIGyn/O72zn
	qUVSSmdgxpUh/x/Soa4tyhuybpTtOuZZdSrRRr3Ny7wrkDkTa7GbyREpsYjDY9PVRaFTxCDlTbU
	GEow==
X-Gm-Gg: AYBFou3kBGkHJ+/VCGvKH82PjX+dCJAkhFDZ5yXJpNIgwwTQ1Q7lkY4DSczpHIRhj/h
	BXwRHcITXRkmkWpts6f8iOEEwslfg1C7SQN7IJVm4RB/5j3T5+RthhDySVHeHs/c0fafqHCNY5p
	XsWdtTkffp6fCPiExQn6R5dR8pQ6zeoF+Eb0rN+sSmJCLLWAuOdiPjr5wZBtzR8h7l3T4OT9n+N
	ORM/cNRBrP6K8rM795k6anRKgw/1LRsmUoEkzyBwxo6HWB/ebktohPBcSP3waFHse7cvFEpn2mf
	fDrCNpP5+QXkJNrNRnDqDSRRLDctaf+xJStqZ0hPEw49OATkPuRNwWfTbvRkWJDLXbxLabIuJrI
	59gXZjETUIHCY8Yv/gso67tWPkSTg8qqDn6k8lrFHdLhg8e3O53lbqzFfw/H1LoExZvCBjkT3KQ
	KHVYVrnoWtlfqugbk3lO+k69xDtJSeLcWdrudfxNX+VEVbC3Y6Jrc=
X-Received: by 2002:a05:6102:e06:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7cc3691d1femr2646885137.12.1792506395083;
        Tue, 20 Oct 2026 07:26:35 -0700 (PDT)
X-Received: by 2002:a05:6102:e06:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7cc3691d1femr2646872137.12.1792506394517;
        Tue, 20 Oct 2026 07:26:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb8d5csm80483915e9.6.2026.10.20.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:26:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:26:30 +0200
Subject: [PATCH] cpuidle: psci: Do not log probe deferral as an error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABV612oC/x3MQQqAIBBG4avErBN0koiuEi1Kf2sgLJQiiO6et
 PwW7z2UkQSZ+uqhhEuy7LHA1BW5dYoLlPhiYs2t0ayVO07xG5RHQFIWrensjMDcUGmOhCD3/xv
 G9/0Ab4IH7V8AAAA=
X-Change-ID: 20261020-cpuidle-defer-4e6184bef223
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX6h84ngndFV1K
 M5gyOpqkAOfcHHh1mi54xiJA2iAJUS5HHcbNECbRyKJRhq8mcj1Xf4LkgGZHLAIsb6p/EX2WsCL
 Xtf0E09ygslNmXgYkLS3kqMHBhArGcuhQkICXkjip2fl/GtdPJL7XaS8rIR5yEq2tUhla5pUFH8
 sKZoNDoMIo4uG8WPIGU5mc+l7AA5+KbuKn4h9ICZuZdKB7PznKiVtrtbtkUG3ub0/7qPqtfS2C/
 4jPd/g1jQTdVP/GPrcR5/8kFI+RNf0fQMr5QEOfMNXmbkg+RXlaXtrbthKgVCwLQs8CTzmxIfT0
 6CtwtRc3AS79mIjJYKDW9bmk6ZMLxfwW/RgPrcNl/tdzrHkfp/s8hv42D5WnsGqib2aDB0Urd77
 Qq1wfvdn6BHU3TOsZ06aeB8BiOsqZB5jfNHF0dobjcjiaewLnf2766VKv5Q8iNs/L0D5A5ecuFl
 owfmBgR0E/2OdgCQ77Q==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad77a1b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=kuKeJkFhgiUoOUCgA38A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: EC6Eo8xD56vsEC1kful94QaxGj7_fM26
X-Proofpoint-ORIG-GUID: EC6Eo8xD56vsEC1kful94QaxGj7_fM26
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX1AKC5NK0ruIz
 DsRoVipEUjyK7CI56PL94u9SGFHwAaG8K1qNTJeg+y66CLPPiJN+k9A1bwLx1VufkZMSLsU6MHY
 W+1GBkSYvJ++q2hubQIQoipwi+3NWZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_072637_046365_177A6080 
X-CRM114-Status: GOOD (  14.16  )
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

psci_cpuidle_domain_probe() reports every failure with pr_err(),
including -EPROBE_DEFER. dt_idle_pd_init_topology() returns that
whenever a parent domain is not registered yet, which is a normal and
recoverable condition, so an otherwise successful boot still logs an
error:

  CPUidle PSCI: failed to create CPU PM domains ret=-517

Report the failure with dev_err_probe() instead, which downgrade
-EPROBE_DEFER to a debug message while still logging genuine errors.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..aa73a2fa14b3af4d1e3edd607e058ba96132bad7 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -173,8 +173,7 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	dt_idle_pd_remove_topology(np);
 	psci_pd_remove();
 exit:
-	pr_err("failed to create CPU PM domains ret=%d\n", ret);
-	return ret;
+	return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM domains\n");
 }
 
 static struct platform_driver psci_cpuidle_domain_driver = {

---
base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
change-id: 20261020-cpuidle-defer-4e6184bef223

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


