Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFF8E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5G8l6uISjGX4JalG3k0wxBKl63QcKXpkCMWjBHZEmZU=; b=Evmcj+fx+c4Qg2N72JCtswUcOj
	PO/i8XC3HOkTv9hDXm10Ka3ZDS3jfJJyM+1Z8Soo1NMl3XtD4AxOXne4rH87iFdAETH8C+gM5cfyI
	7UovQ0ei9+mYXjv7DtqSF6Z3Bh5FzWR1wTZu4gudU7rK8OAT6FeXxet4lVscn2ak0X8SiqHuqFl6W
	SUEYWvD6LuI78yeKCshZAvM9ZUgqUALdR7VwVsr+XUqDR3es/ClHy9lCYt2b5uYQiohlK3Fa1zROg
	L+t70J8y0AaYVVwfQOcAWk47Ed7cnHNmKEepMN2t6YQbKNMKutTg+4xh7dcJVD1DXxGjwMhR0Ldu2
	juTIg/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AW5-00000009OQ6-2JJQ;
	Sat, 02 Nov 2024 09:33:57 +0000
Received: from smtp-70.smtpout.orange.fr ([80.12.242.70] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AUL-00000009OBV-34Mg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:32:11 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 7AUHtgS0WmZVQ7AUItwjdI; Sat, 02 Nov 2024 10:32:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730539927;
	bh=5G8l6uISjGX4JalG3k0wxBKl63QcKXpkCMWjBHZEmZU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jyroBerktCqh+z7jnXCldQgaNVGooCi0y13c9w+P6yoRHq0iM+BE1VJ+nCV7hfVkL
	 21YZAZciwqwajHUl9gR0ylgvTH6/4G5+X+S38ZvfqDSC82t+dGaFnm4nDfD6sK8a9B
	 6lYTEeuayGvnj1ZbE/f4sUPF8EuNfKCidrTuaCU8bYQGorNObjl0igQULmzDXMIFhE
	 NJhi7uMkZL+GkagIDo+U9sIWwrYVt+PMSOFLXqm/X4FhcASmnJ0cSUm9FDUW9bF1+2
	 QykMA6SM7mFj7V3XzLUGlVVvs9pXhBfFkZj0AJVTuP3j9q4N7yNUrMHcQMZTfZYo1e
	 k+JPI91u6GM3A==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Nov 2024 10:32:07 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64/fpsimd: Fix a typo
Date: Sat,  2 Nov 2024 10:31:54 +0100
Message-ID: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_023209_925595_5CCEF02A 
X-CRM114-Status: GOOD (  10.65  )
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

s/FPSMID/FPSIMD/
M and I inversted. Fix it

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm64/kernel/fpsimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 77006df20a75..cd7d71fe1fda 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -386,7 +386,7 @@ static void task_fpsimd_load(void)
 			 * fpsimd_save_user_state() or memory corruption, we
 			 * should always record an explicit format
 			 * when we save. We always at least have the
-			 * memory allocated for FPSMID registers so
+			 * memory allocated for FPSIMD registers so
 			 * try that and hope for the best.
 			 */
 			WARN_ON_ONCE(1);
-- 
2.47.0


