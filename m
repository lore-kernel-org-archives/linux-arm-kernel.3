Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6837D2AB15
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Grz4baRT2sYO7m+zBvvsdW+98xo8S5dFJc3y5JnSN5Y=; b=nO7ZswDHjvcaHOkNcWi9OUVhE+
	QDH6wMyKD6XtIvE0vislqFxRaZcAL+NX9X9Tz4FOQY2Iw4qdBG0UXn7YF7M3rtTejZrdEH+aozNuv
	H7e80GYcCRUqG9cm0KCPLeAOWc5hEEzWrxX9MhOresSiiz1CE6kq3ZUMpPs62iWMxJH40JdzOtgBk
	8L1teH2kAC14Aru/XB99lt1MggYOTLb8lKIrRFCoVR880OZqCOq/t8DPiofz1H6A+lkpCJUOwWKPk
	TaNZYzugWYyuOGLkl8hbwHoNT41VoBGk8VpW3NzvKAwrD1Wr4ekz8a0Huv6Y0S0Wv9VhAEFiqB9Y4
	rtTUIj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ArT-00000000vLA-2qQB;
	Wed, 30 Oct 2024 15:43:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AoC-00000000uOj-2TgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC4605C5FAD;
	Wed, 30 Oct 2024 15:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13301C4CED0;
	Wed, 30 Oct 2024 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302831;
	bh=d5RZlEZoZQWLA36Igji31xBn/i/cyogK0e7bQd2Qjxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LE6kC9Vp2diILokcnUpRlsrwDQfPQsstBugzooc4phd5BgpKs4mkQopLR6PPwqivF
	 AlumbnwM4FSLSN/+MCgf9q2b0+zIZaZDgPzvwPe3FBzbmqK5iguHllzHGL947EIVUh
	 x/TkslrdbSUB84l0sOQVTI3/tNuT5C0JHUNILf5ng88o0JyrZyvOaVJtEfqbEbw2nG
	 nM10jDiswl4yla5Kl63z5DTpO/qJZz+LctKHyYAizsP6eUGdMf7wo88Yox3autSBBb
	 CwB+6Tbf72XOH2qPIDMkBCFkzatlvNfGd4u+lBUUziSYSCLRlSCShBw+PnmqHKszcn
	 1W6YZiTQfUUrg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 15:34:46 +0000
Subject: [PATCH v2 1/9] arm64/sysreg: Update ID_AA64PFR2_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-2024-dpisa-v2-1-b6601a15d2a5@kernel.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=771; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d5RZlEZoZQWLA36Igji31xBn/i/cyogK0e7bQd2Qjxc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNiwTEdbvvxdZNjtG17B+qexUFd/zK+1LTG2Pf0
 uEcgQ/+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTYgAKCRAk1otyXVSH0GmcB/
 4827Rw0eDqCZ+AaDtQjKU7piurbwTC77SJNfsazBehLVWhz5BdvY32a/+MFqwXh88hslkBGVDsWYNx
 zbcpgOTGqCS0049vdVFyaKiOHWN5jEKc4dDQAm1Kzw6t3aHkf69Ve1JcGUxCEt6S/mzOvrHauCujTZ
 mZDmWr5gqOLIlygP/RKq+ukcecLeSf7nSAFyPtk/lYQBFHvo80DlgpT91jc5qn2IGUeJJj9XbFbSxg
 ZTqSzwU9vyjgluDBUtC0dsqaEN2p60+ovsfgzTSp0vB2QxiFoCG7nM4HgKQYXQ0rk0siDCR502stwL
 r7v5J96I1dUYV9KKPHALHtNbFyLari
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084032_753766_809E88E2 
X-CRM114-Status: UNSURE (   8.97  )
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

DDI0601 2024-09 defines a new feature flags in ID_AA64PFR2_EL1
describing support for injecting UNDEF exceptions, update sysreg to
include this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8d637ac4b7c6b9c266156b4a8518d8d64c555461..72d6ff1a9c7588dc4894ec6d673791fde108a857 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1010,7 +1010,12 @@ UnsignedEnum	35:32	FPMR
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	31:12
+Res0	31:20
+UnsignedEnum	19:16	UINJ
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	15:12
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.39.2


