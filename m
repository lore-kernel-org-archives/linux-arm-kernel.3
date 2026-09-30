Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1899CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3Rrdv9vojepOq/T7NqUv54Q3n22kGW/AeeDox5tK0c=; b=t3vvUAlNGVsyegf7Q8BMMbWQKk
	8M+b7h76Q2FjnakpM9sDM1WgLOKZ5iEgDHAx2x/M77eylSCVc85r+5fnXisloomYMVpUDPvatCaUK
	QXBG+XSy/bSUuzfT8u2V7CVBoxSlEup6If5KMWjBesVpfiEK4ZuopC9jOJhd1Nedp5nR2oY/iiDUu
	ZIiWtiPQALjsDYewppYB7YJgKAQnWYdaGV+oRrj5hTLPgpNsckkKS4WkOu4Fl7oO8CR2MqqD7xN2S
	irkZMCdsQL5MCBEstbV4aLDzZF+DWzE68gLPS/UIFILhEnRa2v4/kGUtEAqHY5LjnoXJ4xr9JHaMY
	uHcCz+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByD8-00000006r90-1JiK;
	Wed, 30 Sep 2026 17:35:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByD1-00000006r04-2IJ2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=P3Rrdv9vojepOq/T7NqUv54Q3n22kGW/AeeDox5tK0c=; b=SoTHtxbQ36NoUyx3CefWH0Q8NR
	pgI1bNglyElSP3HnZNHjeWlpaUd5FJoMqB8qpkc221PIEb55HCEv2jM+Pww7d/QFqdiBkOoWy7FLc
	R5LiOIDfkgsMU1BVRYYDtPdB83VAwNKPYyNpJax4ICUXm8wmFwz6SRkMk1FsJvhJB2t1DYiWyKQBw
	N6QgrGHqGJMJBFOth4he5jjE42HFk9keI3rUKDURES2CIwtNL3YMvwjIU+rjdkzDiZoxy3O1Tr+A3
	uIkwjFN5Xn+69l5WjEDr5AWdTOtM4emcJBGQC89waBljQ+UgZ7V6q4E6aNHMpjvfO3ra9XsKWX0rR
	wbTc/Ahg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xByCx-000000049Ap-2o7g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:35:10 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE66Bq1337475;
	Wed, 30 Sep 2026 17:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=P3Rrdv9vojepOq/T7
	NqUv54Q3n22kGW/AeeDox5tK0c=; b=I8NZMsFI3rN6ACpRSg41Zm3CgrrCDXFpq
	9uKooseVeHdk8YharssZ6+8r/da8KsN51V33wk4TUQ6ub/552IkCviqqw9rekyg4
	bir7XG51z1hXVqmEXyBCLKxb0oYsvIhECUcdDV/7fuVw8OJY/sErK67Aj0FL8qeM
	a7acRjOnqbd0rdHIya/OTwrA/PgkaBAA2Ka9cJ5F2topHeXLGjUqXwm+CN1PALGm
	NWJAIo6EltEtQ4SIaCcXokZvIlwmfBV7aeEzuS6BDAZ+0ZGfV19UOA8Yoyw5VSqL
	dsdEuuFowes+BjFY/fVkyYhXsKQcjo6A/d0V3GDn6BAKlT8TJrT8g==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5qrehbk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UEI2J83569550;
	Wed, 30 Sep 2026 17:34:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h0xcsa66h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68UHYhHP43254194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 17:34:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F1892004D;
	Wed, 30 Sep 2026 17:34:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31F4E20063;
	Wed, 30 Sep 2026 17:34:43 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 17:34:43 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v9 04/24] arm64: Use proper include variant
Date: Wed, 30 Sep 2026 19:34:19 +0200
Message-ID: <20260930173441.66762-5-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX1zHk9XyMGpTR
 w9AMAy5FsNYaJ7AkUwm9afAfJfoDku1U+Vtund8h+jBxV5+xdlmYtFBgjbRzj8enIPZg1G3kgOI
 0oOkOC+HmkGez1ss7Z8HOfrzqkCPCgSNiJJmLyEV4asJFzf0kzs08Zi2VPrPSYBU6HESTVN6X6C
 iB8SpoiWzo3eO8Dc6AtJGYvtYRfJaT8AQ+AjL+1sDMAV0VqAjVU+X4iypNSSlxm0qISLKobKkWS
 V6BTbfRoOqeGHDS/NXCpuEZ/BQT/awWbpEP4zDJSYZVHuaWgDQCvyWjVgecKMTXcSwINfvSf7Ad
 BXXX81VWeT2t7rmymGuCpMnkRa1Mdh+/qi1Cb2tHBwq6HZeaLbwsd6sDfyI51ubIpNCk2Nk4kof
 X9F0TIcMs4XMiTkkf0JizuHlyJm+AcgEgSZMr2fn/eedCzlPAxcN3W00TH20oZWySgaUHmm6qsV
 KLvkIc7MxL9cUs3CkBQ==
X-Authority-Analysis: v=2.4 cv=SPbXx+vH c=1 sm=1 tr=0 ts=6abd483b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8
 a=d3WjOe2bLlXSZPWdUOEA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YzyEjD5xZCSCENweMMgLC2e4ZMTmi1Q6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX7Ydgm9XURzpt
 tMfhkcApjc06zPmlltSmIpUP6m6rO0mHtbCPy5539XR5GX41tgnzeCqA4RB9GOCWVkHAJnn3eMM
 Bg2MXXGZzJ88qYbVyP14SbEQnqr4Xrc=
X-Proofpoint-GUID: BaDAwfUB648X-ClFdhGmc30W2YmFpa52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_183508_042066_424127C5 
X-CRM114-Status: GOOD (  17.88  )
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

Use <> for including the sysreg header as it is not discoverable from
the current directory.

Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/sysreg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..4bfdac9401bd 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -173,7 +173,7 @@
  * come from here. The header relies on the definition of sys_reg()
  * earlier in this file.
  */
-#include "asm/sysreg-defs.h"
+#include <asm/sysreg-defs.h>
 
 /*
  * System registers, organised loosely by encoding but grouped together
-- 
2.53.0


