Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11545606F73C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lb86l4rl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXJY8ES7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nkhheCwH9L+tBFyhGay7Do8wQju4PMsW+7y8pV5il6M=; b=lb86l4rlxS3fHqXonLatt4UzR9
	3eU8KmPKh0TycVjF/Urlv2pFe+l0YY7dWRNo1af3FK97xn+T6N2wfO0vI0at2DOYkvbSpTC9r/N8D
	z0UhGhpeA9geRj+Jv2iLBlz6oWlr4JC1B4Ad9HLhUCvC7E+ATMeaz9/eAtY/qnFfPswU0/1wZRhf6
	j3QUwnkp8QH45X9eEWyztAl0QqPKdMW+1MJ96pT/NJfoPzpXfBp/jf7ZsBuXCz2ZMkB0I/3XYk9Gn
	KBN7udggcRHiB9zG8pZOKo4wV5P5pYcnFClLRm3uiy5BCH8USJPo34fwCJrPkDfml30cc5qsles4c
	LqWEj0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlp3-0000000Fgww-09Uk;
	Mon, 02 Nov 2026 06:47:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlp1-0000000Fgwk-3tDq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 06:47:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15A0E60F05;
	Mon,  2 Nov 2026 06:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AC21F01804;
	Mon,  2 Nov 2026 06:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602030;
	bh=nkhheCwH9L+tBFyhGay7Do8wQju4PMsW+7y8pV5il6M=;
	h=From:To:Cc:Subject:Date;
	b=MXJY8ES7gUSMSqhE1AbpYrMtXVwsh4cC3DFQNxc+Efi72XLezAXCqXCXFnlQJp9IG
	 IlqBs4ZoDzrAIABwevuNn8Az+TPQg8zUNUnRsHxtfu+jHPgDkHqO1mD/ws2CZLtwXP
	 exlpI0MTBErXVAiR/4Q/is1AgJ6JDjpPA4AAbkTen8vo57oMy1BaepUe9yceQKsRwa
	 oZxmn/Gd85MFkWnEXJ4i54kpv+7Z6tBiVE+90Nk+zW4iCMEmY7XLaFIlvNwxKi4H+y
	 4m9IV6BZ/maJMuaETyYndNoxuzCvnxQynl91UBW98CQL6/TXjYcbwzp0QAikwwJkRp
	 GzgzkDKIiDd3A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	Scott Branden <scott.branden@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
Date: Mon,  2 Nov 2026 07:47:06 +0100
Message-ID: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both emails are bouncing like:
  Final-Recipient: rfc822; rjui@broadcom.com
  Action: failed
  Status: 5.1.3
  Diagnostic-Code: smtp; The email account that you tried to reach does
    not exist. Please try double-checking the recipient's email address
    for typos or unnecessary spaces.

According to Florian, it should be first.lastname@broadcom.com.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: Scott Branden <scott.branden@broadcom.com>
Cc: Ray Jui <ray.jui@broadcom.com>
---
[v3] just resend, noone picked it up yet
[v2] fix emails instead of their removal
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04f465490612..88e010e78eb4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5318,8 +5318,8 @@ F:	drivers/iommu/generic_pt/fmt/*bcm2712*
 
 BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Maintained
 T:	git https://github.com/broadcom/mach-bcm
@@ -5616,8 +5616,8 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 
 BROADCOM IPROC ARM ARCHITECTURE
-M:	Ray Jui <rjui@broadcom.com>
-M:	Scott Branden <sbranden@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
+M:	Scott Branden <scott.branden@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -5654,7 +5654,7 @@ F:	drivers/net/ethernet/broadcom/bgmac*
 F:	drivers/net/ethernet/broadcom/unimac.h
 
 BROADCOM KONA GPIO DRIVER
-M:	Ray Jui <rjui@broadcom.com>
+M:	Ray Jui <ray.jui@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,kona-gpio.yaml
-- 
2.56.0


