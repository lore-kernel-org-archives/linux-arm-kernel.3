Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A71CD7832E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/linIpDwAkwkan+Yysve2wGVQnV5LqzZoYTfQue0f4=; b=JhVmbspfWwT32Vifj2v9KUDSgD
	7faA5ebPkT//BA68Z0FD4ZqfJOgYEoR00vZ4BUF4zi6Dvn9nyXY2iU4LgIgdIIhts6hUbbfEwp6OG
	W2Vf1ZNqr/AHoE+iFjuk1kVU8FPQXbC0fzJi9SFpUBz1swkoAqyMgdoSsZeLt6/0l3AMLEEVuXMc8
	RCjwp88Y+ojFJTILTRQjdOFx0wN5q40RsZB4W6CMgBlfFBv3OEF0QoWOouQiIQEaCEWtEEOEHuqk0
	t169L5ZwT1zS2wnugZzVxiVUEcGYKAYi135kpT2LQTnqOuQ4wvS/2+llHszYl3zf8pRD2zXRuM1c7
	PcpVCrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7ui-00000006Yd9-0CCR;
	Mon, 02 Dec 2024 15:00:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7rq-00000006Y0y-2cPG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 232585C65A9;
	Mon,  2 Dec 2024 14:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB9DC4CED2;
	Mon,  2 Dec 2024 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733151461;
	bh=3l3BzPOctAjYjepmJZHiyoJUkuIlK/Rj4bRZJmv0vtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=POhGW8GqlpqXbdxrefLK4v1y1mb/IyymXYpX0AcUoIwM6fFe6F6mUl2Vax9h3HmVy
	 FaGrH8xMqMs1QD35Wvgbu68Dg2t9cdsBsDEJafIr4VhEx7RBeEY4moklRXJQGxMwvk
	 VYMW6ZNrZQ7VXdyITQGh4zGQWrXf+Yax0LNlxtyh+yhBrfGrf1ph+ld3Zx1JxVkJQ/
	 LvqfU5/7bWX21avA/clr+V63DmGO41Xxzqq5BTr8TGZF2otHkjip7fhzIiDv0/BaD0
	 qRT1bBTpzh7xWj4/DeZ+3nzOGeBfrRJSxDzm5Mlp3Twa5/XoszEjza5Bn9cC/tKiri
	 SYbzOSCfCPpVQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Keir Fraser <keirf@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 2/2] MAINTAINERS: Add CCA and pKVM CoCO guest support to the ARM64 entry
Date: Mon,  2 Dec 2024 14:57:30 +0000
Message-Id: <20241202145731.6422-3-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241202145731.6422-1-will@kernel.org>
References: <20241202145731.6422-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_065742_705081_34B2FF4C 
X-CRM114-Status: GOOD (  11.37  )
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

Commits 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for
realm") and a06c3fad49a5 ("drivers/virt: pkvm: Add initial support for
running as a protected guest") added arm64 guest-side support for
running in CCA and pKVM confidential computing environments
respectively.

Unfortunately, these changes were not accompanied by a MAINTAINERS
entry and so aren't automatically picked up by the get_maintainer.pl
script. Since the initial support was merged via the arm64 tree, extend
the ARM64 entry to cover the two new directories.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..9378c0c4bbc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3376,6 +3376,8 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 F:	Documentation/arch/arm64/
 F:	arch/arm64/
+F:	drivers/virt/coco/arm-cca-guest/
+F:	drivers/virt/coco/pkvm-guest/
 F:	tools/testing/selftests/arm64/
 X:	arch/arm64/boot/dts/
 
-- 
2.47.0.338.g60cca15819-goog


