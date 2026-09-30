Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FD0CA5FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eo41M0OGWINv912n8F8el4zJ67a1d/ef0RqO8tHY7Y=; b=QgaV9Yf2TNnbVaG20A863ApZdN
	aV6EqAyw6BmHUH8QPZsDNLKB/Ew+yLuMOFionR8JunGN0H9FUbNIUhSQDWDHGFw+P07hnSG2MKgap
	vppFhUjAHJqEofluki8Pztb+ekWm1hR1jpZTVOHd2jsI/3tbp37DboVxCUJibCn7gXFQAYGMRsmY8
	ZTbygik5xmczozfF/vmkPwJUTBUpB6Hq68ZlVQXhope33c0odiDsuKvmUKcD4d5qzS6s6iZgUQl2q
	QNZJu52eeen1Jb8eVKVKuyuIkcA60EnZcOiQ+/oKgWcR8inH9TpCy38eO2PjucKKwK5qvUUN31j2P
	UQSCOLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByDD-00000006rFM-3FFo;
	Wed, 30 Sep 2026 17:35:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByD1-00000006r05-2VlI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9eo41M0OGWINv912n8F8el4zJ67a1d/ef0RqO8tHY7Y=; b=jTrWsrPDtFCjF4M6vTPQ1jZ/JA
	2N36KU545Bc0CX1/pYkIB3vYBQGoL2vAcfeSMVxaBHl3Jur4705rT+zCUiwUCeg7Wpapsu+AmjnLB
	m7fGnwcemx0Kotlfr/E3PjSYRvlxeH50XiikU9/LWe4ErxT5sqR47rQXGtxy0g0LiRAxQqibDb3JG
	Al9yiGDT0T0Efew6inloXI2Ry2LbJAkEyJYg3uspnFh7EJLCC+kDsvuP9tfWt43njaEbnmTd0Lay/
	b9s0RgHKttJOjEghvx6VKpn3WLN6CLPm5Lj+i186MRIGwiv20bTtoqyVvCXINZOXf/YbQ2O6wuwOr
	Ut1D+YAw==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xByCx-000000049Aq-2yuW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:35:10 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE5bI22986541;
	Wed, 30 Sep 2026 17:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9eo41M0OGWINv912n
	8F8el4zJ67a1d/ef0RqO8tHY7Y=; b=gI6Iyqj/qOUBPaNbF5X6Tucf1uFW9sGNY
	GQqVxDHQrgGuLW7TiZRR3n++i2kNEpAr4pFR8I0l35QpR+6VOzLiqA5XvhUc4oHV
	w3U+Ff2B99LNDYNnZ2gmQPthUlwdeLQ3y9zlhiBw//VWXNxsdCuTDdYAIIlg/Bkp
	TblMPcWVfLe/W9mX7busD7Glq1w3VB3QjeiRhOPz/20PHCz5bnn15iYBAGy4wDVP
	KWin8eR22M7uLLzkrpDVqBk0GeXNzb7fZCMnlsDfudSvH25iZCvurB/HMSmIt4ZT
	i7LURTmvnxNdvd5ennWtKEsKZQIsplx6tuvB8XDpOxdqTZ8fcP+hQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx3fkdx6t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE34DF3583561;
	Wed, 30 Sep 2026 17:34:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0g8e59rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68UHYkpa31523260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 17:34:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F33020049;
	Wed, 30 Sep 2026 17:34:46 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 120892004D;
	Wed, 30 Sep 2026 17:34:46 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 17:34:46 +0000 (GMT)
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
Subject: [PATCH v9 12/24] s390/Kconfig: remove PCI dependency from HAS_IOMEM
Date: Wed, 30 Sep 2026 19:34:27 +0200
Message-ID: <20260930173441.66762-13-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: WqMZL_ewua6yYDQFkj1r3LrZT0vmgz-o
X-Proofpoint-GUID: lfozc8ptU2Qw5eR1GQlFIfUtd9tSX2IO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXzGT7paS0XBVZ
 pDHNgkFiD5BIDCiHQvIJ5R6FViWyOtbIUSic0ZrPLwHfPraidfmWsYf6kCVnIikHN5O40X1NqIe
 IqxCLMRqh+MQl3m+bd8fO6ZvR6WY30E=
X-Authority-Analysis: v=2.4 cv=Vv62kO2n c=1 sm=1 tr=0 ts=6abd483c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=gheBiaLQa-rhSO1pLzwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX5wSaikf4lZAp
 r1r6vWcAxV/woEeCuUE9qoCE32o+yTxdqOQkOy5RKPVxM+9GqUqL13LuzWYLgtpkL6D6Io7H3ps
 rH+060B2juryzmOLP6O7k1H5ISF6CHK9skHzXJYxWjtpb2rqdVBo6gODxF66dLmgRNqqjIidBaa
 AajZsWT3hsad7bcJcV1KZnS4cRtPP5ggtCzAqG0hCQwuEMNjXoxFlGG/5anRhuHThWfF3yiytRS
 mvkbl+LUuf07tlhgs2Vfx+FFVavC4nyIGAEQ10Svne46kQC0HHaUZn8ah3mZ0mT1QqbBO+6G3PA
 9Wk7CI6tZ94glwbdVrDRNNooyo1Kn3Fr1fc7fIaJTo4V7s0z+Y6dLx0U6MWY2aI2+Knj+26drua
 iDKE+6FfCKMhBj8rCp7o5F3cU4aQFz07hYmlV60XaRh+HVdq+DuiT3G8NX2KJ+Wg6FRS1FOwyX4
 z03seaj2HPZPzjKGfXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_183508_033333_8B5A8DAC 
X-CRM114-Status: GOOD (  17.73  )
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

HAS_IOMEM was defined as def_bool PCI on s390, making it false on kernels
built without PCI support. This made sense until now as the IOMEM code
was only required if PCI was enabled. This will change as KVM will
require IOMEM in the future. To simplify the config space, turn
HAS_IOMEM on unconditionally by default.

All other architectures either do not override HAS_IOMEM or set it
unconditionally. s390 was the only architecture where HAS_IOMEM could be
false on a real system.

Since HAS_IOMEM=y now causes kernel/iomem.o and lib/devres.o to be built
unconditionally, ioremap()/iounmap() must always be available.
Select GENERIC_IOREMAP unconditionally to provide the generic
implementations for the PCI=n case.

Previously GENERIC_IOREMAP was conditioned on CONFIG_PCI in lockstep
with HAS_IOMEM, so mm/ioremap.c was never built without PCI. Therefore,
guard the PCI override macros ioremap_prot, iounmap, and ioremap_wc with
CONFIG_PCI.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/Kconfig          |  5 +----
 arch/s390/include/asm/io.h | 12 ++++++------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 4b51bc6e8948..5a01fbd8e32b 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -181,7 +181,7 @@ config S390
 	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_IOREMAP if PCI
+	select GENERIC_IOREMAP
 	select GLOB
 	select HAVE_ALIGNED_STRUCT_PAGE
 	select HAVE_ARCH_AUDITSYSCALL
@@ -768,9 +768,6 @@ config PCI_NR_FUNCTIONS
 
 endif # PCI
 
-config HAS_IOMEM
-	def_bool PCI
-
 config CHSC_SCH
 	def_tristate m
 	prompt "Support for CHSC subchannels"
diff --git a/arch/s390/include/asm/io.h b/arch/s390/include/asm/io.h
index faddb9aef3b8..ef0490edeccd 100644
--- a/arch/s390/include/asm/io.h
+++ b/arch/s390/include/asm/io.h
@@ -27,14 +27,8 @@ void unxlate_dev_mem_ptr(phys_addr_t phys, void *addr);
 /*
  * I/O memory mapping functions.
  */
-#define ioremap_prot ioremap_prot
-#define iounmap iounmap
-
 #define _PAGE_IOREMAP pgprot_val(PAGE_KERNEL)
 
-#define ioremap_wc(addr, size)  \
-	ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
-
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
 	return NULL;
@@ -46,6 +40,12 @@ static inline void ioport_unmap(void __iomem *p)
 
 #ifdef CONFIG_PCI
 
+#define ioremap_prot ioremap_prot
+#define iounmap iounmap
+
+#define ioremap_wc(addr, size)  \
+	ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
+
 /*
  * s390 needs a private implementation of pci_iomap since ioremap with its
  * offset parameter isn't sufficient. That's because BAR spaces are not
-- 
2.53.0


