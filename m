Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7F606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBeXYh3n;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST/EoVRP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=; b=WBeXYh3nowzW18Vx2yDi2UEddk
	Hj0u1F9eZMGNVvMa+8fj4WhhRGkt1H5LqF2mdLZSVdY/UVEy5sZxjJlyOT+MctRINdnVD7UKy78Ea
	NjU5Ed7Z1ECcRkyaIF9Il4o/JUZ4ymSP7RaHnrd94ArJsnkTCP5uPxDLbQTtlF6qjmgJ8nF/JMsjg
	1IJdLShjlGD364On2Rc3lpfNVYeYn4FCuljNBn/qTivLVcJ4DzAlill3PmpZbu81RMrqxux8+Qcfs
	M6WzOyaJopTO1DbiRqZ4QdsFmlNo1Sef5PTfrWyDnE+sM4fanAxZjpBVNOabSU+ZTFCyfjUicMb5p
	4FRxrrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFV8-0000000Bc7N-1R9e;
	Fri, 06 Nov 2026 08:40:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFV5-0000000Bc6p-2eKq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:40:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RQY33301544
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Nov 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0J
	V95jdOhY=; b=Y6WAJTZd1u/Qf+XFrIvyqrGeuo2yDlYMsDHmlXYf+5EyYBDyOtB
	NRvOvt6gIA1UEqyrDvmUGOoHBU+zqFZcP68cg+hMiSX0y1Tk8fkwJx/xY/5JFHVL
	Bdzs7Sk4OZFW+j+huWxv48H9kfx+q9B0+JdIXzEsGf2o1Dcfo8aElV0OcdLwSjEX
	alGvU4L3CciY5s7lMS6y26b1jCGdFDycoso7PhN55cwEOFIUh+yuy+gcL0ar1mNP
	AYPk8kE1XyTJVdrxnmLsaM8ZWIts9Xp+TmptqgBC2vxvuIT1M+TWOCZQ2di3D4Kn
	b6d62YkDUNJtl9QYNr31+PBMbd+uYG9trqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1yjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 08:40:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso375093a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954441; x=1794559241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=ST/EoVRPMpK0mWNPxUrWoaDAUu4jhadOZ7NjQEycJTaynSbX/T3f3kxQjL4NBGuEYi
         HxNfcrPHY11fUIHPVt1bX2d4vLZYuZ64hxE2PYYOfYBq5SlTK1vLa7OqNifmZzedipU+
         ZYKkp5ynPClJGbgzwLkmThdmir5LXYq2QWs2mb0OOxgecAKWkiJ8rxp9HCgNzkfgLQ6E
         PWN9FN7iqzzi/zLSlghHMB7S4olp5nJZnKyfb5FMBonwuES/Rm+M+lOBV+7mSXrT8y/V
         owSR1amRFEqkj2hToKpPCoBrV+nOdstlRcozmOZ46t6oRdltDzhlojbdbE5Vz9JLBeKS
         3kRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954441; x=1794559241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=0sg5VNBR3cFXBNM7F5NiJbGyX6wilkhsHvnCKFcdektgaTyN45AKk02iIwaiABSEt7
         UZlfMJqA9e7hzSXuh+axVroGKWYmyzxWbHGNIlIR6DGaFCXTwud30FevoeJcCinCwOG8
         WXxoHa0wM1dnqxVNthT5jLFKMcAQKS/9lCrIuSwdjNxBYZ0n7vcQg6Slx6D9jzzvJtH6
         4nEwKs30hiCVAd7KoOo0+jOkzj+es+vleazmRcb1v92w4oZjtTviN5LIJcEeYsY4KLnN
         JmDMZsZ9+3yjq7foanobF4E7mOlcNR61/sXo7a/hvAgFBFoAVl19truSgdwLjtAb7yAM
         syxg==
X-Forwarded-Encrypted: i=1; AL+hErE1aOaDDQkx49JiwLtzJ4rsEs4s1DSqkY0qjpPsdjNGKs74p+7Fqj7N0KBhENKsW+hWPda99cJDMh5Mtwgs4thL@lists.infradead.org
X-Gm-Message-State: APuU4Z9OtClq/2VPuyM2LxyweXQvbpbM7BeYJgd4KlR+vDkXJc6AXaMD
	tJcQvHeTHwpTaAquhuqzshNdef2kYCq78ThgQFOS96G3f6m+cJMZx10h4y5y4mwUwuYv5Y9X6Mr
	8uh49lQjjDgV9XhwWTdrid0BvIwiAtWIOEdTDSKPhaPHoxMEn28Pm6TDVpf3nIiEfj+Ks3P7app
	02HQ==
X-Gm-Gg: AYBFou0xhhNvrVtD7f7fyK1lB/Td6EPlI5bUlCe+vlx7p+SbR+mlmjUtLLLJw47yuLa
	0vKa85En+d8KwuccbVtztao0n9Ta1KMcFTxQwIWmRimJFF9yQa//8LRz7fLD8JmzZQ2wRG+XZSq
	rwgw5G9B6xmg00swdnO6kh3e4aC2EJez2fO+FOjruaPrfV2/ku82RtnqaPjmJlZAF6ekccHspuS
	wO50FWvPM14AbVJGRzE1fNca6Pzsq/Hzbqm+IXkkBtJorY6mAIpQmworXPvMpXVo7LlU/iAEHqF
	ngncwKN3aNCR/NUSeNG/To6yZUl/jtr2qrkrw6rw6DGqs1O8O0y662Dt4jVcSFnPjvH1oc2fhZV
	3+yf9As6JNeJFSgZfLtUJSpRJsjsFoLvK78hun9rRKkhMCzt/9NvwR+gssOmK/Wu2JSQX88agtT
	KouMHNCjc=
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894990a91.11.1793954441486;
        Fri, 06 Nov 2026 00:40:41 -0800 (PST)
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894959a91.11.1793954440903;
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e253e9bbsm683947a91.0.2026.11.06.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, songchai@qti.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)" message to debug level
Date: Fri,  6 Nov 2026 16:40:34 +0800
Message-Id: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX7TvrS3QeK/Sa
 KiXqBPWS93IYzkFnqX8UKPjjqq6qpUZWwsoQX20OFbOZR1HrSwCVObqkt7HXSdmEQHH/NVfJXF0
 pjwICB4jLnauAYLKamCGWRSz7ceb2GQEeL6dqWbz2hBAZqKgejwYqShqQ9qBIHNJr1FIddPL+9s
 Qy6nww4gjTa3Q5JUVf74WwMKiJVPZlxLWneRAfLNOyKzWvEoDntfTLdT6o1UoUC66HDRfxqh05g
 ueemgS4tDB+V+IrUo4MhAdpwFDQ5jW/Sx3T3AnEfmdfHtSdwCnPQjFR3VxxrFzeeIPvbcMPgEst
 0TI/M6GuxrtE6gzgPmV9+YHIEDVu6CjurnvgMwTJB9t+VngxETlNRGgC/nrqDibOSXNZmdg7yPl
 q4WnemDf6Iw719xHbEnIEV3nYP4H6wzsx0pPgmR8Q/ueCytogYaCkK7+6mHZed/WvfCFChbaW22
 HhMG6JidJVqtwNAJniw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfXxd7FCTgyObo9
 T6MfF1cA4NepwaUjyVdxkK5OEawS9i7172K1xt1Lz2Xj4QFRLpKLjxCVjU+Qv0Ejt1u9wV4tB0S
 n4qt0JY8jznXzTw/qrm6NKcxzEY4+BI=
X-Proofpoint-ORIG-GUID: BjhttSEODRbRzJh0hpvXHWPWycSScx8j
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed928a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EJ-oiV5rZAYrcyJa4SwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: BjhttSEODRbRzJh0hpvXHWPWycSScx8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_004043_782955_D18415BB 
X-CRM114-Status: GOOD (  15.37  )
X-Spam-Score: -1.6 (-)
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

fw_devlink detects and relaxes dependency cycles automatically, so this
is not an error condition requiring user action. On complex DT
topologies (e.g. CoreSight), this message can fire for many node
pairs and adds noise to the boot log, even though it's primarily
useful for debugging. Switch pr_info() to pr_debug() so it stays
available via dynamic debug when actually needed, without cluttering
default boot logs.

For example, on sm8750 this produces 125 such lines in the boot log in
total, 80 of which are CoreSight-related, e.g.:

[    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
[    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..da4f7ff2ebcb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -132,7 +132,7 @@ static void __fwnode_link_cycle(struct fwnode_link *link)
 		return;
 
 	link->flags |= FWLINK_FLAG_CYCLE;
-	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
+	pr_debug("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
 		link->consumer, link->supplier);
 }
 


