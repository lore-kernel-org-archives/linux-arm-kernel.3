Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA76C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGPgAnjtKT6ftTAM6aOkUfJetBSRY7Y8hfEs8FIUvWE=; b=Bjm9XEqslWeqbBitXtL1Hy49en
	YDvOgUV5wOXchi4SyZIdU35bGwwHCo7XgjU/Pi8uQgoovlJDq46iPfRvTqCcSZ9wE3Yaz9uxGXakY
	5mqykabmC2bKGv5qBQuXkcTBa63bj29ZpP0QPXew0tmTdm2EyGpkJcKS1x6GOX44+t3JSOJAsO1q0
	PWB555YrwTxCJbj8r4ftxO9nzWykG4KHKW/kxw2dn37K10Fnj8nW4YBFdsTW8hiH9W+W8TpSDhOqt
	+pB06SBUx5Y0qWlmPLUezEMYaBppvvSqCWLTz6lszBN1qODIGWQQR/AXoSsjI9T8pI1PZWE+NXxFF
	b1+G8Euw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB19-0000000GUVi-49X5;
	Wed, 12 Aug 2026 15:37:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB0r-0000000GU7o-1Xw6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Aug 2026 15:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eGPgAnjtKT6ftTAM6aOkUfJetBSRY7Y8hfEs8FIUvWE=; b=IUe6ma0poNxPerfyCHaXmMrpaQ
	zTaTkILfx5EGPFOP3FzkborDxKLM/WZPRVsfuYzBnXnoIliLm6F0b3MpaXc3ph8D8x+sYDS2zJWYl
	70Z6PMzQ3e/7zAXkAsa4KPjL4ogWdBdxZFwUGdyK+XaR9b/kCG7Iept4/yq/Hj/9nRqh/3U+zWbBN
	kLyM6Jf8YKsChbjxBrm/mdK4fDyjRI2i4graTdGoGLuNFmpr0Wa8LynWT3g5iXq4x8aSWY0DwvIhr
	czCR/+VsebVIO5I2Uw7ltCAcwSmPNpk8myS9cEyzW9VoC2vxPk0RPA3K39Gnk/gmltIZcOVbl5/PT
	thzAtVWg==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuB0n-0000000FZAm-0sVy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:37:04 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CE1mmH3717448;
	Wed, 12 Aug 2026 15:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eGPgAnjtKT6ftTAM6
	aOkUfJetBSRY7Y8hfEs8FIUvWE=; b=c/UNId0hpEOA58rnxwOmyntRiuISlwrDT
	FiZh4n6pQ1CpXnj0eux/G2tuDsHBEo/8Me1UTJV1UCzQsI1IK8/L0cI/L9bmjxzt
	/o3c24i1XAkfiT7O5uzYgOVupWIrVZ/m1qcsVwHMPXfw7dpgie2Pu7xsIOBiFsl1
	w+F2MUpLaIQVKR6jm00JYCfGAV6WQr6p48VFxcLwTTl2Q3Etfm8tXGO05C7yCtTw
	EuNu9WFaUn1Ic7pyuOJ/8cDSlHx4rluywr5aQaDRVN0iV7omkilOkSEXqrE2sODL
	U37qOxjzO8vBIirJd4zDkb77B5GJDrHcmNYnnj7ktHv1/ANO3BgpQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvnwads8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CFQHri024761;
	Wed, 12 Aug 2026 15:36:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxfsjxpj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CFaYrf48693682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 15:36:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E92C720049;
	Wed, 12 Aug 2026 15:36:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97B192005A;
	Wed, 12 Aug 2026 15:36:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 15:36:33 +0000 (GMT)
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
Subject: [PATCH v6 04/33] arm64: Use proper include variant
Date: Wed, 12 Aug 2026 17:36:00 +0200
Message-ID: <20260812153631.3376090-5-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812153631.3376090-1-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RsP16imK c=1 sm=1 tr=0 ts=6a7c9307 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=d3WjOe2bLlXSZPWdUOEA:9
X-Proofpoint-GUID: P6gFbGSDggD4L-zZXBOItFsSrc5gX5tC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX6gr+77HpB1d6
 En16SZVNMJQwSeEHCRyYKjjjz0E5vjNOJeQVSNTW1jDHKnZLqDXwFoTurRdVH9Ls2xckIC04U3A
 IOC/idlGzKGOE6F6uv15feSJT0tRHr3sls/b/dyyMOgvhYUjlOWxPbeZl1sNYuiOgiLNK/6+OK2
 xi5TTYTRMCZ9J7xkoaIw7w3E+jnWzKg8YaXX9F8Kyv7f6ma4Kj9pBxEr0cLsTaBNaK4dduFM8il
 b2e0U8xPZMsQAWWzk6il+EHquGlnnJHTY+KkBhF3fWvQXFFAfBcVQSoF1wm+DxWCgaxE/xlT7GB
 K9hRYDYgsT8KMTt2jSIZ97JdPim9yEOx3JnmTi6/o5rvbVWVnf95bD0mscyVBvq86bOtCq0cI5Q
 2e/l7gBdm+mCbYuwIgZQtdPu+uxqRLakEkleFA3nfCgNJjrtFEG7D6nluTTdx2iSh3FO4b8LseR
 jEvU+mNpNOHfKEoICgA==
X-Proofpoint-ORIG-GUID: peK-E1XwVJ35p7lF-ahfEIF6XNutEUJr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX9MB+Ec1YYNIS
 dK4Cn6GUYAgzdaakqy06b088+y+upwIVb+xJ4CnytLWdf4Tu5uHSSlYbakjaMeuBmiSjM9F5mvT
 CSvXeSzcxRTQ87e0Due9prEpa56IyI4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163701_522134_61B6A878 
X-CRM114-Status: GOOD (  15.49  )
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

Fixes: c07d8017bceb ("arm64/sysreg: Enable automatic generation of system register definitions")
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


