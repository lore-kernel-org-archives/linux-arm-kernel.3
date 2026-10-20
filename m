Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A8F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qz2oJrtt;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=FUEPu2am
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ed5LLARE1oEpDNdKMvECE32HDwk9thX5ocTriX9n4fg=; b=Qz2oJrttgfiqR8NED1cB28c9TO
	oFWKOiMIQ3GZbtekDc/NFDP4KJjP6iyQvjPIRvmVs+l7VPrsDexU/R6YyEn8T+vhqhqtXZNfpWdQ9
	yij3dugvVAMDlMHEASqPTE9sUr6Ew0mI8KwxjKm0gMGUNo5pZ2dadeRxrDQChwCB6rH26gNntCBds
	gV6qNqD0Wnf1u9FIYHx7vDwhhW9xUYGsW8e8D6N8R28BJa8Epg2LOUgKfUUtlVatRocmmkgS71s03
	ihTnTudsoi4EG7RGTSyEyRJwuLQqEz7twsZINlEla5LpUqN4lglW2pMsPwdOtrYafCm1EeuSErHAD
	I5cl8Iow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5bM-00000009EYq-1U8G;
	Tue, 20 Oct 2026 08:53:44 +0000
Received: from forward103e.mail.yandex.net ([93.77.172.67])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5bF-00000009EVp-1S4h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:53:42 +0000
Received: from mail-nwsmtp-smtp-production-main-62.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-62.yp-c.yandex.net)
	by forward103e.mail.yandex.net (postfix) with ESMTPS id B69FDC034D;
	Tue, 20 Oct 2026 11:53:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-62 with ESMTPSA id HrVkYxfiaqM0-7VcNl6Km;
	Tue, 20 Oct 2026 11:53:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1792486408; bh=Ed5LLARE1oEpDNdKMvECE32HDwk9thX5ocTriX9n4fg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=FUEPu2am22tARY8fDQl5NaZw3JT5CoP1ptCPxojc/3/DGhufeYgU8FRDBaqdcgyzh
	 TvGWIlxydSvY7NAfaG47z8hqmeVxIj1bdVfmzKSQ5Mj8j51hCD4G9+JldCEy7uw4eu
	 VP/lrHg004UFE/Ri9mGt/VVER+g4+j/vDyrcRodY=
Authentication-Results: mail-nwsmtp-smtp-production-main-62; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] kselftest: arm64: fix README typo
Date: Tue, 20 Oct 2026 11:53:16 +0300
Message-ID: <20261020085316.1880320-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_015337_914940_E4C30FC0 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix trivial KFST -> KSFT typo.

Fixes: 313a4db7f338 ("kselftest: arm64: extend toplevel skeleton Makefile")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 tools/testing/selftests/arm64/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/README b/tools/testing/selftests/arm64/README
index a1badd882102..04e102d789e5 100644
--- a/tools/testing/selftests/arm64/README
+++ b/tools/testing/selftests/arm64/README
@@ -21,5 +21,5 @@ KSelfTest ARM64
       $ make -C tools/testing/selftests TARGETS=arm64 ARM64_SUBTARGETS="tags signal" \
 		INSTALL_PATH=<your-installation-path> install
 
-   Further details on building and running KFST can be found in:
+   Further details on building and running KSFT can be found in:
      Documentation/dev-tools/kselftest.rst
-- 
2.56.0


