Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE47EB363C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuT9+IZBmOU7LoCdw4jCeOXKPiPtgxTWNH/6b85tP/0=; b=0Ts55i/rd0e/5zPgkanBhr3Tbf
	I8dBZKAdNzdNvVQ9fBNJpeKo0n7L9PJ4OIw3xAPvX72cVSAMm4PGMKe5BLYUYFKyXCowSPLqy/Ht7
	gDGcrCQHvSI4wtswj8qJ5U+vE/eo0tEJD8i8oHRsNen1X8cAWsKupd780gsVyOi3WiPZ7ply6l+VC
	lwSQh6LT+JMKF4PpgwmBtcrULGsuorLFtwnKaSM8jUu33xyPynS2/MpTzkLGr2znv6CfJNDg8EItF
	Pi4qnP4w58/WCe0wLZje//xsmbLltT25Lsqr3YcrZ0PuAVxvlmrtUsAM4HTlOMjZFCXVvqZ2WfSiC
	72ZITvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEt-0000000EA7V-2Wy0;
	Mon, 02 Mar 2026 22:59:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEs-0000000EA64-17ps
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1F6560180;
	Mon,  2 Mar 2026 22:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B89C19423;
	Mon,  2 Mar 2026 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492385;
	bh=gOV19KPEmG6qQjPLN5UxzzlwQ7VoUg11/tTDEq/4rOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XKSdAYZ6nP2hHf6ghUqepYMXUEKxLNCG8XH2xFzmt6MEVgrOb122213v2kZKfY+DH
	 sWDf/ChUsjMgcKifFS1bLIQalKB4cXe/4THWbOvo1c48qncpbiTpL3q8BmVssU+yty
	 BahPs/KkxMOKRuw04wZS7WY2wYZ665Rxsjg8twnK5zapPl/aOILFVJxyVC1FL9X+OP
	 qCS1MByaE8C7wmDVcsWOGPryAhfBsw4g4VP5T7I6/cQBkRLqTEhOVbIjNkVZYPib7o
	 x7QDjsAaPvoagn05jyRLDmGDQL5A7Wk02sxrsqXLx9k3FExL8FmILYxL6Zhg3366yK
	 JYoDYy4CXrlYA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:20 +0000
Subject: [PATCH 5/8] arm64/sysreg: Update ID_AA64ZFR0_EL1 description to
 DDI0601 2025-12
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-5-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=660; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gOV19KPEmG6qQjPLN5UxzzlwQ7VoUg11/tTDEq/4rOs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZSiXUQ68jk0LvIbAWxVLEe80A/d0CuDUHsp
 uAP2Qs1K8qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUgAKCRAk1otyXVSH
 0HFSB/4qJmd27YIhHKwPZXYNA6Gld6nKMyla+tcVWxPLysOcB/tfjs5YE5mjQj6o2Yh1nQ1zBgZ
 Ht7To8zg4LDFn1X+BeL5YdZsoL65oiytQlvmEAdbr2VX6PLxhnCwINEoDObEajjRgwbatWDidFe
 W2JlwyAnhQKoT9H/VTODSL5VDk+YPNu18969M8rWllEyCicB9YUSAQHQ4wVaF48ZjcUZOvoTLj0
 qY4HHfNnhwJ/cUU/ZOdHofM059BnI7at+TZCNw2jANNixlH5AxDsYtMiyi6vtkDOgezFjk4VrbZ
 hX+xsxEJLOGIMIfEnf7RtJ5VLkb1PFYuCFv4Al5TUmX92pTa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The 2025 extensions add FEAT_SVE2P3 and FEAT_SVE_B16MM.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 451ad312dc78..75b8644c4753 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1496,6 +1496,7 @@ UnsignedEnum	27:24	B16B16
 	0b0000	NI
 	0b0001	IMP
 	0b0010	BFSCALE
+	0b0011	B16MM
 EndEnum
 UnsignedEnum	23:20	BF16
 	0b0000	NI
@@ -1522,6 +1523,7 @@ UnsignedEnum	3:0	SVEver
 	0b0001	SVE2
 	0b0010	SVE2p1
 	0b0011	SVE2p2
+	0b0100	SVE2p3
 EndEnum
 EndSysreg
 

-- 
2.47.3


