Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1005C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S49K85j/ZvrK/W5tbsPgMaqf5HArl0WY8MgmXfqSjYE=; b=c8GHXF59mpgFeDnvl7y2z8ebUk
	SA6u/eTyQmSyIVHeeddR3ioLR+aJmOOyAUBYo5ABXDWptztTMj104P40WAE9SypgU/ablWmIWe0p4
	x/HjwJrub7bEQ1PXK+F/VPNPzZMivrtlopie5ke4x0HvgshBT4iJ+rAwgPaYu469o6edk3wM/J5oD
	9cWw7yojNKbuXAgXzrf6f4UeObbFnzXxwUahFUtzZWpwhHHuq5U5L2uvrzJ3gN6l6ZpFAGuMSAIrt
	vlY28KJl4+qyBkE7NhSlhkQQoT0vns7lyasjON51RJamhxKgtQabSljnhYWZ/WXXzaRJyQlxHDUZk
	FPNhSA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4DJ-0000000DDNW-1Fa0;
	Fri, 25 Sep 2026 11:35:37 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4Cr-0000000DD8w-2BXr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:35:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260925113507euoutp01daa730f0f39de6635fc518f4b4a9ec40~YjTRcSGhe2944729447euoutp01C;
	Fri, 25 Sep 2026 11:35:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260925113507euoutp01daa730f0f39de6635fc518f4b4a9ec40~YjTRcSGhe2944729447euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790336107;
	bh=S49K85j/ZvrK/W5tbsPgMaqf5HArl0WY8MgmXfqSjYE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=mOt3qitjpj5pAxYRQizgylohI0e3mwvMe2vxW5GemZrsIgDOkny7DVQgMgE2nlp4x
	 G/O9NRejnVg0SqDGGQrZYqyBbW5rAzrhVCHUywIPaow8V7utrMWzIW/xwATgRhbWSc
	 iJXJhvUDH9ECfm89ZNpb+APjWq7dqgOMxgyN4WRY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260925113507eucas1p2ddb94f2077b679426aa86dd1d492eaf3~YjTRMNxi41965119651eucas1p2n;
	Fri, 25 Sep 2026 11:35:07 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260925113506eusmtip26a2ad976a305cfdc747b2ef9e46e892a~YjTPrStlK2286422864eusmtip2H;
	Fri, 25 Sep 2026 11:35:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 25 Sep 2026 13:27:39 +0200
Subject: [PATCH RFC 9/9] MAINTAINERS: add an entry for the LZ4 compression
 library
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-lz4-vendor-upstream-v1-9-1c7ffbe21c4b@samsung.com>
In-Reply-To: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Nathan Chancellor
	<nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
	Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,  Russell
	King <linux@armlinux.org.uk>,  Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
	Heiko Carstens <hca@linux.ibm.com>,  Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>,  Christian Borntraeger
	<borntraeger@linux.ibm.com>,  Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>,  Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,  Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,  Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,  Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,  Herbert Xu
	<herbert@gondor.apana.org.au>,  Phillip Lougher <phillip@squashfs.org.uk>,
	Sungguk <sungguk.na@samsung.com>,  Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=rt909YVEPZ1UzsHEaHIBCQOzoDoXGfBwWN+W1Qjdjtg=;
	b=owEBbQGS/pANAwAKASw99I2nQptuAcsmYgBqtlxYQawZhtBMyHWo2fdtM9WSyTI6z7blyltQp
	5LXrnGur1+JATMEAAEKAB0WIQR2xBTdTO5XfoUTSOYsPfSNp0KbbgUCarZcWAAKCRAsPfSNp0Kb
	bkpbB/9W0LpEYkAF2WtEHR5F5L42+TTJZheHrKkTPNZapbxsmraB8fMMa3y8IMNzeHXU64R2/O0
	ROnewWnk2qtWN2ubm5vjY6PhzHk70+TcKirHYz2I/IIcE2z62ecej4Vwvzo0/uhDppFR6sMshd4
	zvuOEWMTRqp7ezgsWBdyyRKQMh94et9vNy9sHcu22idrG1QEPsUOTcER/zHCthL4sos6Ea9kT1p
	mioJSPJcZw8CH/0cxXUdWZ3ZZBLb2vRp5q53LdWH6E2ghNJ1p1j9ngRNKkfnRGX8KapYsKo+I9U
	pW3Q527eJAb5U3+mj0ahPudBOVHo/aZ9sKrtOnkpntW/Xwy9
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=76C414DD4CEE577E851348E62C3DF48DA7429B6E
X-CMS-MailID: 20260925113507eucas1p2ddb94f2077b679426aa86dd1d492eaf3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260925113507eucas1p2ddb94f2077b679426aa86dd1d492eaf3
X-EPHeader: CA
X-CMS-RootMailID: 20260925113507eucas1p2ddb94f2077b679426aa86dd1d492eaf3
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113507eucas1p2ddb94f2077b679426aa86dd1d492eaf3@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_043509_836245_A87B3161 
X-CRM114-Status: GOOD (  12.50  )
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

lib/lz4/ has never had one: get_maintainer.pl returns only the LKML
fallback for every file in it, including include/linux/lz4.h, which eight
subsystems build against.

This matters more now than it did. With the previous patches lib/lz4 is
vendored upstream sources, and someone has to bump them to new upstream
releases and decide what the kernel-side glue may do. I am willing to do
that, so add myself as its maintainer.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b34aeb705cef654c720ca9f2ba223..989e1b5fab21432dd7042d1e60c4bbad85beb925 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15606,6 +15606,12 @@ S:	Supported
 F:	drivers/net/pcs/pcs-lynx.c
 F:	include/linux/pcs-lynx.h
 
+LZ4 COMPRESSION LIBRARY
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+S:	Maintained
+F:	include/linux/lz4.h
+F:	lib/lz4/
+
 M68K ARCHITECTURE
 M:	Geert Uytterhoeven <geert@linux-m68k.org>
 L:	linux-m68k@lists.linux-m68k.org

-- 
2.34.1


