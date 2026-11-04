Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F10606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dsogySXq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L3Ni/6Jd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ECQTKAjZ9Np9eYCJw+nsz0GV09F+1r+fPvzJLI4eMC0=; b=dsogySXqQ66I4+ddPYSAPB5KDn
	n581bkBlcyNTrTqUr7nceC6i7fc5+oyNj+/XNBlX0VEWSeO9GVo4YJCezq9hoCVzRU4LWCugVQrFp
	nFNnPgy5TvRXNjGVXBZqb7pZYw5u4iXrnYmx2P0U7IQtQrO9kSDQwvB3TEnMWiQjUASkFEtzNdqOa
	jkk705rHI7SzRHJ0R+fgpZSP2Yn2NbM00fqkGxJW2IZYZqP1+kD0YHrAkZFtzkXNwshNRvNIfS1MG
	LOzuASb+WnHDaW1qqg4vuuaE0WMY4ldnrlw72lV3I9J3rh+b0UvIlq598qhvlbCM8L0FI/dn2h4+p
	Ud5a7qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObfk-00000005a9k-15DR;
	Wed, 04 Nov 2026 14:09:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObff-00000005a8o-0YFJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93B3A60D7D;
	Wed,  4 Nov 2026 14:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDBA1F00A1E;
	Wed,  4 Nov 2026 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801338;
	bh=ECQTKAjZ9Np9eYCJw+nsz0GV09F+1r+fPvzJLI4eMC0=;
	h=From:To:Cc:Subject:Date;
	b=L3Ni/6JdXLXkmWuWZP2wBbTTZHR/OlEjjRFmeW0CyvG2837XjCGJGlpU3pl6wCru7
	 0TdQTSg+pf2PLQ6BWMHJTZWZR5pQlQSJml4Mm4OKNgiD1fRlynLwpk4yn8Kc+s9r1b
	 sEvAVELNzytolETzkviGZuuZaT4t+vZvMvbjTYPF7U10kvTILRA0qcZKbacJvMc13z
	 5tH993qxLyTdviQi+jynYW6QMlF33FEPyEAnP4U7Twgm1jzcJyFz0RDUgrW8UfRmOi
	 5iepJcgHwBGQMxgvtpEv1s4+2mmkJ2vN3bdVD1huS+PJZkjwz60Ao6ZAWr65TEG2PC
	 pzwHVnPEg2AXQ==
From: Alexander Sverdlin <asv@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <asv@kernel.org>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH] MAINTAINERS: pinctrl-single: Add Alexander Sverdlin
Date: Wed,  4 Nov 2026 15:08:03 +0100
Message-ID: <20261104140820.65243-1-asv@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add myself as a co-maintainer of pinctrl-single driver.

Link: https://lore.kernel.org/all/CAD++jLn8yxh3LmUzbb2vZfJFJB=_mCZ+VeQhnZktfmuMiv5uEg@mail.gmail.com/
Cc: Tony Lindgren <tony@atomide.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>
Signed-off-by: Alexander Sverdlin <asv@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e42edddf8f0db..2dcf454589726 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20386,6 +20386,7 @@ F:	drivers/pinctrl/samsung/
 PIN CONTROLLER - SINGLE
 M:	Tony Lindgren <tony@atomide.com>
 M:	Haojian Zhuang <haojian.zhuang@linaro.org>
+M:	Alexander Sverdlin <asv@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-omap@vger.kernel.org
 S:	Maintained
-- 
2.56.0


