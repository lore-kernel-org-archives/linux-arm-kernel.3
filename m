Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53708C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7B6UIkO254PUv1plzHv7rGKSayu+Z7IxuUaC7WPjJNc=; b=H3dVrz45x4txvYTzSXMYMXCp9G
	cBsHq0CLjL3TKx/o/oxIhusQuhm/JdEFYlYyCjAZaMo7g30+TLMXDuutkI7l+j93aOywnzZ01LCH8
	TppwNa1abexVKOmBOO9Enh2ECBkAhLqBjLSUHLQF+Rj6Z6EwpZt0CvS1j5LeC2bZwfocMnlgIOSLn
	5/u9jA79H9h8NjZ8FB/WjWR++/HAL5PX84NEGrsGLkvEe/yQ5AWiMPILmavi6uxBJNbLyyev5KEgR
	+EFobQkkl2Bfja0OplIJQLUsm+JUl14y/SREOBPrVbcJvBjeD3qDDgT7WPwvno1Hp7rZdanafFZn8
	faO7miTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3nQ-0000000GdMP-3nOr;
	Mon, 03 Feb 2025 21:15:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf2mo-0000000GW5m-4AOB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97B3EA41D36;
	Mon,  3 Feb 2025 20:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78068C4CED2;
	Mon,  3 Feb 2025 20:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738613473;
	bh=FB57IEbWzju1Rk6ayDCdRihbkwNQBLLPE0g18vk9tXU=;
	h=From:Date:Subject:To:Cc:From;
	b=bxHlDqRCFDg5NHXyoWxcz8mfkDYOiZB93ET0ZS13s1JRIgfJjwYBnsb2xJWRXH3hJ
	 qKxY46hQmwtXf/N2WU8vUnF9P7A8JrSdswvsQMqHfKwM5L2v3Nvy4h50dqKZzYTYcH
	 REyvebFvoyfBSsoaaDPWe2HIOzNGZ7JUxuZ9gGAbd8iRZRni+7gv7N06p9hWbpn89o
	 nKD7J/gqlY4INqq+3FJye2ai/vcOYPiozNYdTE7oDQuQikp+T8qx8p9MfALh+3a8ej
	 EdqpfLsqMurSWBFID9q6D4WTyXR102G/714OF23a55Kh8r5tredovpPsXvTIUrbx/3
	 /1HUFhudfBXsw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Feb 2025 20:11:04 +0000
Subject: [PATCH] arm64/hwcap: Remove stray references to SF8MMx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-arm64-remove-sf8mmx-v1-1-6f1da3dbff82@kernel.org>
X-B4-Tracking: v=1; b=H4sIANcioWcC/x3MPQqAMAxA4atIZgM1/qBeRRyippqhKimIIN7d4
 vgN7z0QxVQi9NkDJpdGPfaEIs9g3nhfBXVJBnJUO3IlsoWmQpNwXILRtyHcONVMLKWfuSNI5Wn
 i9f6vw/i+H+Xkv79lAAAA
X-Change-ID: 20250203-arm64-remove-sf8mmx-b5a2ae3fca92
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FB57IEbWzju1Rk6ayDCdRihbkwNQBLLPE0g18vk9tXU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnoSLfKn5D8d9Avb+6HBGREZl0x6rINfpJjx1I5fzc
 1/0NnzSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6Ei3wAKCRAk1otyXVSH0BSwB/
 9ONZ6vLdH7IyzwkEIfOdXpK2b+F4MrbsycZwtIahcAOrjm5NpqG5M03JjV5diKy09WCRmFjizsTLB9
 NpH2xT6rOhzvL7ZKdZdX5paafWpycAO2JeJtjK0UQ9jqhEt8GOzRmo4Vys2ytbKbH7Gbw+mAjT9iz5
 thnDMxAz8GneeJQdGygsgOL3v9W3CYRu+wMXgKEa5PcVCBlX31yHn55/1f1Lr5HH8NwNw+C+JCJNaJ
 dLkab67zO911n5dBsv8RT7ddPXgpWeW9YXm2lDuW5Sxw9922YjRy5yWpLawAVfDrCn8olmU+X5mq7v
 mOuAQumXbZt1cKiKJOjWEHJvSAAKuo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_121115_100595_EB0D9AD4 
X-CRM114-Status: UNSURE (   8.90  )
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

Due to SME currently being disabled when removing the SF8MMx support it
wasn't noticed that there were some stray references in the hwcap table,
delete them.

Fixes: 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to userspace")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4eb7c6698ae43da2384970a655f12f266e3c337e..f0910f20fbf8c18fbeb63bcee18abf13371b1d5e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3180,8 +3180,6 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8FMA, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8FMA),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP4),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8DP2, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8DP2),
-	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM8, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM8),
-	HWCAP_CAP(ID_AA64SMFR0_EL1, SF8MM4, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SF8MM4),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SBitPerm, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SBITPERM),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, AES, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_AES),
 	HWCAP_CAP(ID_AA64SMFR0_EL1, SFEXPA, IMP, CAP_HWCAP, KERNEL_HWCAP_SME_SFEXPA),

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-arm64-remove-sf8mmx-b5a2ae3fca92

Best regards,
-- 
Mark Brown <broonie@kernel.org>


