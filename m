Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42BBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 22:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foavY3NUBKwRVvv82vUPDlwf/CmqkiZ880rnbJW+UKY=; b=J+U2AxfRnhxSSyTVLEEEPiRu1G
	lRLe7XRA1LogdKNRaYbsqCVLZ7zOeEKPwYAfmCcdAxs6BBaKuaQfapzbXMmlj0v+eE3BUM4XeqtYZ
	YdFIYC9hWBzlDHnGd0dw+nmF9pjgrn0q1Qh+bVipRIRjRbyFmPc1UgG2ekCaCA8C63iP5syS1HaPi
	OoSBWmOUQg8m/pod0b2YZ6eYNEX511EiuW0ohutKkIA+X3bkf8uiHIdtaId1JLuf5IYm6ND4CH5yq
	lr9CWX4XTJf2Tb/S0/qU1fgybC9X0ha7fCGXcnB/aWxXz9auukux3wl6a0wUaysi1lJmbZIWg3768
	p20tIeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwpD-00000008XeE-2ev5;
	Sun, 15 Dec 2024 22:10:55 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwo6-00000008XXW-2rZn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 22:09:47 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BF2Ib3M000400;
	Sun, 15 Dec 2024 22:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=foavY3
	NUBKwRVvv82vUPDlwf/CmqkiZ880rnbJW+UKY=; b=HBmwOSY6M9KxGlnSUxzMVa
	+uskSUz7Xp637o3fcTYGypxlrA6hCVi96O74r4RqUd4ip9/TwNuqkLrpBfcyXdNh
	n0dn4nrqvXVH1Ocwa7Rvz67QvfChAdyXSnurqzfnc+S8O/FeaC1M4bjIrnda3S7i
	PuaZp0S0WXM4KUVruvPy83/7Q7Vb1LKihy+j3FWjkAAwb7E4wdhBykp8vHMVK7Cs
	3QVoL5AqHThIPWUUPqnAzDeFyIhoDDmvrgSmCZgv9boo0Udc7mTIbtqUelPCl9fk
	tnONbQDPgTXzdtq2KOJn33ZLx6V9bLEItBgm950ztrcBDktGnDzQ/lAz9n+pD08A
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43hm5gu78p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Dec 2024 22:09:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BFK6Tbr014397;
	Sun, 15 Dec 2024 22:09:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21ax5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Dec 2024 22:09:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BFM9VKp56099082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Dec 2024 22:09:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6F752005A;
	Sun, 15 Dec 2024 22:09:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D3C02004E;
	Sun, 15 Dec 2024 22:09:31 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 15 Dec 2024 22:09:31 +0000 (GMT)
Date: Sun, 15 Dec 2024 23:09:27 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, aruna.ramakrishna@oracle.com,
        catalin.marinas@arm.com, dave.hansen@linux.intel.com,
        joey.gouly@arm.com, keith.lucas@oracle.com, ryan.roberts@arm.com,
        shuah@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org, x86@kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH 11/14] selftests/mm: Use sys_pkey helpers consistently
Message-ID: <Z19Tl30BuKTfL629@tuxmaker.boeblingen.de.ibm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
 <20241209095019.1732120-12-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241209095019.1732120-12-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DFxHJAOykh2WDho1kMjZipalLMNewXsl
X-Proofpoint-GUID: DFxHJAOykh2WDho1kMjZipalLMNewXsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412150192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_140946_724216_620288E0 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, Dec 09, 2024 at 09:50:16AM +0000, Kevin Brodsky wrote:

Hi Kevin, Andrew,

> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 814b17a43385..1f0743d9459d 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -147,8 +147,8 @@ TEST_FILES += write_hugetlb_memory.sh
>  
>  include ../lib.mk
>  
> -$(TEST_GEN_PROGS): vm_util.c thp_settings.c
> -$(TEST_GEN_FILES): vm_util.c thp_settings.c
> +$(TEST_GEN_PROGS): vm_util.c thp_settings.c pkey_util.c
> +$(TEST_GEN_FILES): vm_util.c thp_settings.c pkey_util.c

This patch breaks s390 in -next with the below error messages:

In file included from pkey_util.c:5:
pkey-helpers.h:109:2: error: #error Architecture not supported
  109 | #error Architecture not supported
      |  ^~~~~
pkey-helpers.h: In function ‘set_pkey_bits’:
pkey-helpers.h:126:21: error: implicit declaration of function ‘pkey_bit_position’ [-Wimplicit-function-declaration]
  126 |         u32 shift = pkey_bit_position(pkey);
      |                     ^~~~~~~~~~~~~~~~~
pkey-helpers.h: In function ‘_read_pkey_reg’:
pkey-helpers.h:151:24: error: implicit declaration of function ‘__read_pkey_reg’; did you mean ‘_read_pkey_reg’? [-Wimplicit-function-declaration]
  151 |         u64 pkey_reg = __read_pkey_reg();
      |                        ^~~~~~~~~~~~~~~
      |                        _read_pkey_reg
pkey-helpers.h: In function ‘write_pkey_reg’:
pkey-helpers.h:165:18: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘int’ [-Wformat=]
  165 |         dprintf4("%s() changing %016llx to %016llx\n", __func__,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  166 |                         __read_pkey_reg(), pkey_reg);
      |                         ~~~~~~~~~~~~~~~~~
      |                         |
      |                         int
pkey-helpers.h:62:32: note: in definition of macro ‘dprintf_level’
   62 |                 sigsafe_printf(args);           \
      |                                ^~~~
pkey-helpers.h:165:9: note: in expansion of macro ‘dprintf4’
  165 |         dprintf4("%s() changing %016llx to %016llx\n", __func__,
      |         ^~~~~~~~
pkey-helpers.h:165:39: note: format string is defined here
  165 |         dprintf4("%s() changing %016llx to %016llx\n", __func__,
      |                                 ~~~~~~^
      |                                       |
      |                                       long long unsigned int
      |                                 %016x
pkey-helpers.h:169:9: error: implicit declaration of function ‘__write_pkey_reg’; did you mean ‘write_pkey_reg’? [-Wimplicit-function-declaration]
  169 |         __write_pkey_reg(pkey_reg);
      |         ^~~~~~~~~~~~~~~~
      |         write_pkey_reg
pkey-helpers.h:171:18: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘int’ [-Wformat=]
  171 |         dprintf4("%s(%016llx) pkey_reg: %016llx\n", __func__,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  172 |                         pkey_reg, __read_pkey_reg());
      |                                   ~~~~~~~~~~~~~~~~~
      |                                   |
      |                                   int
pkey-helpers.h:62:32: note: in definition of macro ‘dprintf_level’
   62 |                 sigsafe_printf(args);           \
      |                                ^~~~
pkey-helpers.h:171:9: note: in expansion of macro ‘dprintf4’
  171 |         dprintf4("%s(%016llx) pkey_reg: %016llx\n", __func__,
      |         ^~~~~~~~
pkey-helpers.h:171:47: note: format string is defined here
  171 |         dprintf4("%s(%016llx) pkey_reg: %016llx\n", __func__,
      |                                         ~~~~~~^
      |                                               |
      |                                               long long unsigned int
      |                                         %016x
pkey-helpers.h: In function ‘is_pkeys_supported’:
pkey-helpers.h:207:14: error: implicit declaration of function ‘cpu_has_pkeys’; did you mean ‘kernel_has_pkeys’? [-Wimplicit-function-declaration]
  207 |         if (!cpu_has_pkeys()) {
      |              ^~~~~~~~~~~~~
      |              kernel_has_pkeys

Please, let me know if I am missing something.

>  $(OUTPUT)/uffd-stress: uffd-common.c
>  $(OUTPUT)/uffd-unit-tests: uffd-common.c

Thanks!

