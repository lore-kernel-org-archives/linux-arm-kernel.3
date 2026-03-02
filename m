Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8A5EB3641
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEAL3Ele7tkvIzCL2+h0etpr/IFhhQxCBgrBuvMqhhg=; b=gOzbnqOfIn/WZkKron498F66Yq
	ypTWJZrunkszOOoztL1Z7fNH96Se1ufyNIkvJKFSZhj0MVO21w6RQSH4HBKPpKljkdUJ8F9gza5Sa
	jj9tx+XMHjSN9zzWE490MAVVci1UGCk6I1XyxgFLlKEkn/EmlWkMyYF/dcXFca03PS2vNWHYGQXtd
	zL2gO9vXZku7K8oypr97+TU2yVMrHyrv9OVYZJNDtOoOc7e3MtJjozQ5Luv+5pZMbDyA37WOPMijS
	1rIENVPAzuzPEeUMJTlsn83sawkGCCMziCcamuSvkOe4Zq1QXiWsRrETQuriX5FAq7wvV1jeKp6Ci
	zERLuisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEn-0000000EA39-0vSr;
	Mon, 02 Mar 2026 22:59:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCEm-0000000EA2F-03zm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 22:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7495E60128;
	Mon,  2 Mar 2026 22:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13B3C2BCB0;
	Mon,  2 Mar 2026 22:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492379;
	bh=1Y2Bq9RZnh/y+WhW+nbmbBevrPdJ+64IRYiYABDxDkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BJU2ylMchmveFvOo8jidxLebv0z5YW5nBMKZwbc84IXP2HjyMqSRM1qV11WktDpKb
	 ZMmElVmX79x8NOSoLHk6HVxw+1yNzrMFa0Xwl2yG112Af3/6Gz91pfaRUomkbGR66u
	 XBrGTG3O2jncVZzwxfH3P+e2bkQLAKhheH5NmaSAQGPPLk1RfanQv+4v/T4Yri605S
	 pEB+bKLAaQhHz15RbLev+eoPP5m1q2L9k0xP7uG4w12vkR65/neEc2Mb73zAXKuRFv
	 YOI3GDSp6ENDA7efTPmwJRTHZmUNR7peITj5N0S5H15Nf+OhZWBT3jfTKkuCUon8Dc
	 hjALaGoHIso8Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:17 +0000
Subject: [PATCH 2/8] arm64/sysreg: Update ID_AA64ISAR0_EL1 description to
 DDI0601 2025-12
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-2-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=534; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1Y2Bq9RZnh/y+WhW+nbmbBevrPdJ+64IRYiYABDxDkQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZPOQKIFjhY6njCjprG3IPtIaVhniJ04UQA7
 BeR9yCsQxKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWTwAKCRAk1otyXVSH
 0DsuB/9AS2b1JoJ/2zrQoyeNO9LuorbifIHkLRQ2CtvP6CY6n1UtqkdpEdO6icM7sR/oLmQjrjh
 4QtLiE95mL6G0AMHSgQjVFLpnBFsarwkjeOcGK9ieU5rQ2/K28Yf84xCcMuoWt66HGoJWJFpObY
 M4Q/9rSx11OFXHnEdIXBBZo9SY3nqQGnOkFNCKrgVKmUl2dlJCPOM8gWaUnhUOoJ5HUbhQqybNJ
 xDpiebYqf1mXIyvMfI6gXsmCyBxq6VG83JVYAmO7X2JQB1iGh6XyULJe9PeuOCVfeU2pXMZVC7E
 CoTtFMxg3P2zf9VPiYNyZkS/BAcqoH2HfXfU1xG5qZCpoZKR
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

The 2025 extensions add FEAT_F16F32DOT and FEAT_F16F32MM.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9d1c21108057..623577b7554b 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1835,6 +1835,8 @@ EndEnum
 UnsignedEnum	51:48	FHM
 	0b0000	NI
 	0b0001	IMP
+	0b0010	F16F32DOT
+	0b0011	F16F32MM
 EndEnum
 UnsignedEnum	47:44	DP
 	0b0000	NI

-- 
2.47.3


