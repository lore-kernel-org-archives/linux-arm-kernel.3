Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D53C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 01:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tFITuuJDgutpEFJlerPyHHpSB0sfh/jbjTlG3FOcAgo=; b=falDLoiedHf4YL20Ygjk6B3yMT
	2cZQN2CoDLzmjUfrDKCOyhKsg+/ZKXkNEOR+kixUilw11xD/8iwhvDxEpCPBJRWZwlnz8xUUy2YeT
	JqeawfKa4pp5q6jD7mz/MZhgwuxPD81izpZR0PgPn2qnlHjsWrhgoFk+pK+XpeswtcBjV/gKn5deN
	AGzg+tlIvRtOj1e4xX5vBJeg3xhzNWHzSJgvz1/6wHbbH0KSQI8tm0KW9nIiRPfd1ysIV8mkT+RFu
	In1R75vLEkEK65VCPHl8brpszYBZS7MdCVNicOGZ86/c3s8gi92iJq00VqZhyqW1D1clUeU2K52rg
	y5UclVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf74f-00000008oJk-1OS4;
	Fri, 25 Jul 2025 01:18:13 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf728-00000008o6b-1rdg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 01:15:37 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-87c73fe3121so139396039f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 18:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753406135; x=1754010935; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tFITuuJDgutpEFJlerPyHHpSB0sfh/jbjTlG3FOcAgo=;
        b=ZizAOLJhvl5+vQzwLSeod3iIbgSHtkuDoa6hDHqMbFEJaLJZDwRe6xUOfjm6ZOPp9W
         /eM1axqxlr6+7aD2+QyGks/N/NaMnnNljD1gYwGLPbppep22xxhm8z0qSbFSQS3Gg27g
         7egowtzQclkQMjrccqim4HLpJjFw6LFXOhxveuPELwN5O+EAUM8k4xinnIn8GcjAjaUp
         UFdET3RYcNeKu09oo7HrRvI9huM5Z+Lkwc8+63hK5QJuXzZ7ooY2PfkHenf7wUF1vs9v
         Bt7OC3w7DpLUjcIaexCBNNIqqAtZzbqFluXi3d8w5iDs6LIslBBM13FnGjdvXsraqB5E
         ybow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753406135; x=1754010935;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFITuuJDgutpEFJlerPyHHpSB0sfh/jbjTlG3FOcAgo=;
        b=JDpWGsrVPl16LzhfgzNBG7cQsN4myXAztVjF7WMRZsmh8vMpGo8CcMjKshUhFROkVz
         lZWAfRecUBpcAiY/78vgk6Zbeo75nexX2wsaipXzJr+9LtAsBhfDV8IQH10wCAU5yhjZ
         gfeFr73GoJ90CeCe9FPH4+RAkQf5mfVlAPj/tQU6bxE/idgohjiRKYs8X+LnJHtalHvq
         buadoKt6Iuz3qqBw6pBj5T8q+6ycFkZ8mSGtByyLEfNraslNZniE1/9rCR7DOH3KXcSh
         4ghLs+132Y0y2zjGH5TGmuitHtWUsQ6Ory/T9jFj7oFg+qS2lPcpDQxUle7v0m0XCHzZ
         nLGw==
X-Gm-Message-State: AOJu0Yx05mjutlFjXOvmUvTX8AWXFYv3C5E1/RdR8UWLjvRwq32c00tr
	SaLjfyr0TcprMVNlgAodg0Ix+tcX2UJ3luduSNt9n5oxR7iSwm3C4d6Luxfok/JDdc85izR63Km
	zgPXAVSsCNgTgt2QxgkEPKSdbsw==
X-Google-Smtp-Source: AGHT+IGOtyjrWZUt4IHge1YVAFkDgbRkTc1qBa9LhfCId/pQ3L7S/vw2KQQqW8B0agIZPE8gkRvP90/rdal04fwoGg==
X-Received: from ior10.prod.google.com ([2002:a05:6602:a00a:b0:87c:359d:819])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:1689:b0:867:6680:cfd with SMTP id ca18e2360f4ac-87c64f87d98mr1663521139f.1.1753406135096;
 Thu, 24 Jul 2025 18:15:35 -0700 (PDT)
Date: Thu, 24 Jul 2025 18:15:28 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK/agmgC/x3MTQqEMAxA4atI1gY69Q/nKjIL20YNSJS0DoJ4d
 4vLb/HeBZGUKcK3uEDpz5E3yfiUBfhllJmQQzZYYxvT2RpdjX7loHgIS0K/SUy4J8WOgutb43z lAuR8V5r4fNfD774fh1uFv2oAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753406133; l=1391;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=9d2LgkAsER9qXvaUPfEoLgpaLUIRkRofct2D4FWudKI=; b=Az97+z18RNg38lLclau+LqNY25wUxs7AH7etlMkLkQAjtx4UrkJ/fucCvYO1m1JtsrhW59gi2
 O2QmudrpqmkA3awdm9rNP+my9CyxHVn9/w9CtSU5eSYTY9DSciiwM0N
X-Mailer: b4 0.12.3
Message-ID: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
Subject: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_181536_487366_B937FEC5 
X-CRM114-Status: GOOD (  11.15  )
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

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways.

Silence the warning by initializing the struct.

This patch won't apply to anything past v6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache configuration").

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f4a7c5abcbca..d7ebd7387221 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2948,7 +2948,7 @@ int kvm_sys_reg_table_init(void)
 {
 	bool valid = true;
 	unsigned int i;
-	struct sys_reg_desc clidr;
+	struct sys_reg_desc clidr = {0};
 
 	/* Make sure tables are unique and in order. */
 	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), false);

---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20250724-b4-clidr-unint-const-ptr-7edb960bc3bd

Best regards,
--
Justin Stitt <justinstitt@google.com>


