Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FA4606C599
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1OpK00X8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEV+m+ov
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=slbcvBkl1N1XvphWa3NaesxkZw4MARBqy8uaxsbAIqU=; b=1OpK00X8jTVT5H
	N8P7RUcWgTSK54xS4s+ETC3xhKn4ob0n2r70E+q6e9LYeCIlYNc3WpW+h7Le7fxQbwvF7cogkaZr4
	3PY3LCzb0YtCyyoLCIxkWq3dBdijMkLUqzNrE+ds1FcFwgVm7WK0FADzKt3IxQhgYmGKhK7WBUqnS
	T+mr/TVjhzNIqLGMJ8hCvOvvbxCWZViaq7n8pCaYhgzMNHhKhtNXlorCbOIPVEm3iSPVeZ+x9+4bl
	oLgfLjcUoRrvCNRTcHRbTkGNxRXfkajqP9IsN6LLMOE+QcrCImQCLZWZsGZaf8xXdBYF34IvSlQF5
	drc0ZEGoZO/8wrxfduug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib8-000000072pd-0Cjh;
	Wed, 04 Nov 2026 21:32:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib3-000000072fk-30H2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AD4363D58;
	Wed,  4 Nov 2026 21:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5846B1F00A1B;
	Wed,  4 Nov 2026 21:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827961;
	bh=slbcvBkl1N1XvphWa3NaesxkZw4MARBqy8uaxsbAIqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EEV+m+ovf9QbNlI8XpC6phdkhuwKC/yew0k9VrYfVu1Ww4gOsdV8ES/2+xAj6dQo9
	 4d4PlSLK0B0FOsEtBM5wqL3Cgax1xLB/7uGzN8wCPGG4TsX3+b+MKnSgTavhs5Ykfd
	 LLnK9i+Z/gPyJF22wyVUOXH8GmacExsZnxscttVmf1GXeMCLJgDXCwGnFv0Ls7nlUQ
	 KdZRxFI02CpC4mKHOWU3ofB4W23DInvKTLcS5B2YHwyQBhFBDr9FibetIrf5Oh17fG
	 iWjdv1vfwX6GTSbvQXBCaI7nuFmcd+gWJyQobJMVsOwOxpIZ6g5u+mLXOIjPX/FDqR
	 BduuCpBcpjKKA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:32 +0100
Subject: [PATCH 16/16] ARM: configs: u8500: Enable compressed firmware
 loading
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-16-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Allow firmware requests to load XZ- and Zstd-compressed files, as used
by postmarketOS firmware packages. This lets the existing device drivers
use compressed firmware without requiring uncompressed copies.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index d4d9969c261e..b1356d6e497e 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -92,6 +92,9 @@ CONFIG_NFC_SHDLC=y
 CONFIG_NFC_PN544_I2C=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_COMPRESS=y
+CONFIG_FW_LOADER_COMPRESS_XZ=y
+CONFIG_FW_LOADER_COMPRESS_ZSTD=y
 CONFIG_GNSS=m
 CONFIG_GNSS_SIRF_SERIAL=m
 CONFIG_ZRAM=y

-- 
2.56.0


