Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D8EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0xwzu+veZri83zkDBLfszqSKll3oYYnhUkQxu8kB9BI=; b=MRLzWXppag7KRHIOpotLNh8aR6
	gLB1sKVPSMJT4L2pWJ3y2SMVU5amCdqrWDZbvcw0bI1yZ3HbjdqwCW3zhj6qNLKIvtZtOhvAuPAEr
	CC47m/UoeLjCI3fqX8ZpQS3k5EHF/CWk5ndtLI+Xm4UL4E6DqkBJpYjDY7eOFlerbwbw5/WHo4WVY
	keDFs7DyCDbKzmlQQHkjg7XQQ2PXKIll5fXjEYMMowSiPgBqBNhiMOxjWlhoG/z3GcYVWoRP+vEf4
	WN5N9nMizLpOedAmFF9JYZ1NKmXNaWV6niG2RpfoJ0Oqu64xCzDvqpIkwdQ1dOI71MGPECV7rWiWd
	XH8cS2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9h92-0000000AnOB-0ufG;
	Thu, 24 Sep 2026 10:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9h91-0000000AnO3-21rW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 10:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=0xwzu+veZri83zkDBLfszqSKll3oYYnhUkQxu8kB9BI=; b=esUosRRsMZ3dJZA0gJ/gbMwaIg
	gsroeQCWxo6PAgiIB+KRq30jU+aonfBSsscjtyDe/ntrFAMuU8iBxTCWlc6mNDT0bCGBsSGgXERe5
	09oxscnG4aZfbaif3htL15eHnGpYiO82DZFZK+RjkQU5a2UoPFbSjBUlu6qORHcHdpU7tIYl93QtK
	3sNpgoCKNIAEZQ+hZPGcPEnooAR0n6000cTqpSJXCG1JbaQZkTublYl3p77SS/kRF8EDldlxdCBo5
	KGt8QDH2W/I3cn/skSFTSvgho+dZJMIG47YubqZgN91N2ERZveP4kwCSVWhq7vgpAz6nQyEbLmiRP
	ljKuVTfQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9h8y-0000000FsFI-0Mvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:57:38 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5cXRn1181139;
	Thu, 24 Sep 2026 10:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=0xwzu+veZri83zkDBLfszqSKll3o
	YYnhUkQxu8kB9BI=; b=TQ5jjoREWzuewzt6hEW+0ekG+QqtolDGzDks9K1oeepr
	E+gt7MsP9Sc2p/KfsgGm9nROEEUqNrgrqsJF/Z3KkN7jXMAYhWdIrMJMluY1ntCo
	VWjDGWJ5Feg+wMBvzBam7TlUomJC5saNP2C2lMoGvDV/vrwu51/Tg6cYPNDEoLw8
	4lmNav3YTCnTNyqLRlbPEJOr2I/Co3RR8il1xXxbyYCfF06q3J6KoE8dS3JjVdk/
	Vi1LF4+CDATu6o14V8OldkGfY2fqjJxxwsSUntwBS7JCLrZ9BQ8iclOTi1nO9DK1
	RDjMf+YOPYvSUAIqSzP7mSla3U4p1oDRRSEBL3lJAg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1qw47-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:57:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68OAB0RS1497550;
	Thu, 24 Sep 2026 10:57:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbu8w63h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:57:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68OAvMwn41615704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 10:57:22 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7272020043;
	Thu, 24 Sep 2026 10:57:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5224E20040;
	Thu, 24 Sep 2026 10:57:22 +0000 (GMT)
Received: from [127.0.1.1] (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Sep 2026 10:57:22 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
Date: Thu, 24 Sep 2026 12:57:18 +0200
Subject: [PATCH] arm64: Use proper include variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3eLKotR03cy85BzdNCOjFAtTU9MUUzMjJaCGgqLUtMwKsGHRsbW
 1AGbY9hZcAAAA
X-Change-ID: 20260924-syreg-incl-f22d8555d562
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.14.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8fjyX0uZLGl1K7oeBokdNDTmPasOnjHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwaKhA1bqkxLG
 bfWqS+n5lRrSmdiBEvs0mymLmd7YFKD7KW2HT1sFbdfwmpVd4K6nve8ubCMmNknaK1krVh04rhI
 iq6Gr9/Pxubkk76ruk6a5vdnB88esWsOXwl7A4wbkTVxihWxMz2Mds4Xv3YiG2+H5xmOPOwu2Xh
 ViE0ljtOVTeZWy9kTWRLWCIDEqzWmKPc6elzfCFxsmB32VgRUfszAnzuqqJWPBCqH8OL6p+whT1
 gMRwh6bDdXawbUEUYGMYYRd3AMx8h+8SjaS6hH+37KqR14D91FGs4CBOzE20DYNI9ICBngil/e9
 d05CpPC0LXs1D9o3eLzvCyG5xix9izv15gLbPVoP4btr3Yd2OsloiWYF40PoLV2pmsW+mbclg4j
 E9FppZV4eCZ3IBIvDFnMz4mo0PlamSJVVamgO1yvsG6xuosOBeeVcZfiqRdtqgH3BUDToov3gCK
 1C9L96TZXWyzx/ytkVQ==
X-Authority-Analysis: v=2.4 cv=O/KsLx9W c=1 sm=1 tr=0 ts=6ab50217 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=tLPIyUJEGWpIbh5-gX0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/Jzc70eXVoYJ
 rheCu1KwzLrbF9mN1OpD1eLgbdktDvPkftC8eBVa3FmiRD9C4+EYFhv3bofsURqZEm0CgpHZmpu
 4htuJjozUFa0yyuJCDzEXMNW3Z513Jw=
X-Proofpoint-GUID: 8fjyX0uZLGl1K7oeBokdNDTmPasOnjHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_115736_480976_E548E127 
X-CRM114-Status: GOOD (  17.97  )
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
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
This is just a spin off from [1]. There is no in-series dependency for
this patch and it fixes a minor issue. Using " for the include file does
not break anything (now) but it is not right as well. For [1] we need
this to correctly transform the includes to a new path for the
s390-generated version of this file.

	Steffen

[1] https://lore.kernel.org/all/20260918133107.1042730-1-seiden@linux.ibm.com/
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




