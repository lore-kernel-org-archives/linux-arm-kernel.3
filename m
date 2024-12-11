Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89382E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb1DAJQegmdRUCzHe+WTgAnWBd/PIfck60Avi2bjBsI=; b=oI0qSmHBSxfed3GuIAX/u2tbIZ
	dvzuMVMkRuKctywUrz9vO4jUYKJLNq8Evqw/7Xmf3p5xKo3ncPctzV/wSvKPfbRDzW+xAEkFbCKre
	vTfuS3xGKoLB29fny0pnj8utvpmsO0eEkiYcz2vVDzMjj9XNrcvQ4f2gkoSgcdfWQI+jRu6vMHaTU
	EuJ4ddhnUCsETlTZ3ORv+WHdTslhqwbqgqOt3tjDCEgNhycXP/+WPdiDQPS0SFzY65uNlw7P3eDjC
	unMO99qBI70vRZLfsU9qoyUi9qaxZGxmYFHaaoCNa778WLL1NOy+mBBhj4ZpkdliLFMnlPbrT849T
	tFbtjFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBEZ-0000000DNWT-2fIc;
	Wed, 11 Dec 2024 01:09:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLB9Z-0000000DMRc-2dUQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A596D5C648E;
	Wed, 11 Dec 2024 01:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FBDC4CED6;
	Wed, 11 Dec 2024 01:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879077;
	bh=cqa9T0MNY7qNBa8+pChF2cmZR6wFtD7tZyVA8NOA6J4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qDiDvLosMAeoUxr9SihZ3ILKudU/BVJh4lLGBAugsc/KHPXGnx+G9DtCAg4R8vHPW
	 j88hA7fFwNEAG300xv32mQWoTRLHXmcfveTF+YIBzPecpdCI9C4WVbNlJ5OQ5VwCKD
	 haS28GDVs/x4GSfJy76lp0R1/w5qTTsbLhA46X1A0B2u2N7sxIJKWW0woWm7jjRWna
	 dxqHYnltFlZXKrHXIMzXF0btDPg8+QB1jFvVPNYosB3A1ZQ+9VGOjVAXLm++qW6O2X
	 uj9p2HxG9Sqy+JdV9SbrxxAGvxCzdHJLwWz86wThB2aqamlj5fsMC9yk9lbyIYOLJ8
	 Rw6b/DJOxMFRA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2024 01:02:49 +0000
Subject: [PATCH v4 4/9] arm64/sysreg: Update ID_AA64ZFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-arm64-2024-dpisa-v4-4-0fd403876df2@kernel.org>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
In-Reply-To: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cqa9T0MNY7qNBa8+pChF2cmZR6wFtD7tZyVA8NOA6J4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnWOURA0EIxA9EPjbiIzbTF6VFtD542aCt4lwFY1dz
 Hjf1NxuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1jlEQAKCRAk1otyXVSH0OyGB/
 9PoRZOcDRzdK5RkE64k95GMgMXaKq4noetvS+e48Gk5VG/GQ+go7FE4LWN2OwC4d0VckiFO2Ao2dJm
 uMyo9FPEEf8T1/Da6MrYnX4TeJCbb6h2kGB8sWf2WPY0csMfdlHrK/1ZAL1IWsoVxIADPFmMHpgkIa
 OGF3HnscxDl6pv7++vOj1cPoMP3ouKipg5YjQsqLdtYaO/F/Ubo1HAiOqtI+/x4PsSd3GNGozaORTX
 U6U36tdqpx32O6rlZ1GmYonRcnEXqosreEwZeSwT5oF5d8McPLT9vW3mXlNREZPJzWtz35SoZXt6Br
 7XMfsyvLJNWXTPDzGOdhPbN7PBT2I5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_170437_709463_3184A610 
X-CRM114-Status: UNSURE (   8.21  )
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

DDI0601 2024-09 introduces SVE 2.2 as well as a few new optional features,
update sysreg to reflect the changes in ID_AA64ZFR0_EL1 enumerating them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 14284a120a5796bb510a0382984236eba9bf73ab..c792bd3b0afbb5fb7e438a4d760d9f2d15621eee 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1040,7 +1040,10 @@ UnsignedEnum	55:52	F32MM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	51:48
+UnsignedEnum	51:48	F16MM
+	0b0000	NI
+	0b0001	IMP
+EndEnum
 UnsignedEnum	47:44	I8MM
 	0b0000	NI
 	0b0001	IMP
@@ -1058,6 +1061,7 @@ Res0	31:28
 UnsignedEnum	27:24	B16B16
 	0b0000	NI
 	0b0001	IMP
+	0b0010	BFSCALE
 EndEnum
 UnsignedEnum	23:20	BF16
 	0b0000	NI
@@ -1068,16 +1072,22 @@ UnsignedEnum	19:16	BitPerm
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	15:8
+UnsignedEnum	15:12	EltPerm
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	11:8
 UnsignedEnum	7:4	AES
 	0b0000	NI
 	0b0001	IMP
 	0b0010	PMULL128
+	0b0011	AES2
 EndEnum
 UnsignedEnum	3:0	SVEver
 	0b0000	IMP
 	0b0001	SVE2
 	0b0010	SVE2p1
+	0b0011	SVE2p2
 EndEnum
 EndSysreg
 

-- 
2.39.5


