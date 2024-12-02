Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BCAD49792
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 01:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbngkL2AAfbiqCWERdYqPYAG3kAI2Wm0NyNCB9YfUCo=; b=jR9XnxBUst08iqSIFfmqDD6W9y
	DUz28+zqeYSevIN/ANTBrXLJ+8TuqWaMpIkUB/iuYbZAiWR0ZodGRvpWgan/1U7WB8+NgoAU0JU/Q
	I8wxvPFRarhakwjdOjp/Bofsxkg7FYd2BOxiqW13hoy4xubxtaqaQvnWzLN8B5L5tktEFl31nj/1g
	zI93c8Fc411Hs5Mpa2oaOKBURCNkRHNFhK4N4HeIHkASiKQ91zMq/pu9Tl2WJhcXzRmnuqbYFI60P
	/Zw9iUzoVUMXRQUx4xSk+VuSjsbWX4fTY2GzViYYYRSOsof2RWcttp9FmnfeUHaJLtLswDRuU+Mb9
	09u+FwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvOF-00000004jkY-2ubH;
	Mon, 02 Dec 2024 01:38:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHv82-00000004hPG-1jnG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 01:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47C0BA40C19;
	Mon,  2 Dec 2024 01:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496B3C4CEE1;
	Mon,  2 Dec 2024 01:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102493;
	bh=tOkBM9OKj+QnnDmg3KXsNuWzGOUW1YaMaa8G27/37Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhYadkzk8Wpm1ITszh4LwCoo6RCymijkaws9sU9g/KGsy9DSpWRmbKngnVBniKYZv
	 ErPb16+qEvaUkykp4VtBfrvOfVTPr64cYgZw2glt62J0whPQAGvPo9CTqugNtHLf7c
	 bR6tfEyyt9k48DlViebHmXiT/K8l+bd6vLUVwdrY6vcmczq5K5kKDEUS4ny5en5mgQ
	 j5i62pwZxIzqgUh0vTPC6/rv0sbFcxGUkXFPlAfdlelqDdzIhTSlk643ODVxFPEpTW
	 UOUjKNwH5bTSyGAWLP2m00SXeKqdb65SxhRJUtEBjn+EfI5V1uAWfpK3gMgnUe3no5
	 t8LBK7cKrA3RA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 12/12] MAINTAINERS: add entry for CRC library
Date: Sun,  1 Dec 2024 17:20:56 -0800
Message-ID: <20241202012056.209768-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
References: <20241202012056.209768-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_172134_566912_4DEB3A8F 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

From: Eric Biggers <ebiggers@google.com>

I am volunteering to maintain the kernel's CRC library code.

Ard has volunteered to be a reviewer.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..b7eb0c0a9c1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6054,10 +6054,21 @@ CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
 F:	Documentation/filesystems/cramfs.rst
 F:	fs/cramfs/
 
+CRC LIBRARY
+M:	Eric Biggers <ebiggers@kernel.org>
+R:	Ard Biesheuvel <ardb@kernel.org>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
+F:	Documentation/staging/crc*
+F:	arch/*/lib/crc*
+F:	include/linux/crc*
+F:	lib/crc*
+
 CREATIVE SB0540
 M:	Bastien Nocera <hadess@hadess.net>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
-- 
2.47.1


