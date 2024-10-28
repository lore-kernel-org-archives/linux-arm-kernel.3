Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C91D5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUzm3iOgGmyjFGkOgYhiwc8Vi6QzfsnUah2xeQSmRA8=; b=1TmoZVzxw86PNTcYhBi9tAdWWe
	Q4g8hDd1xfiwncPCYyWstD385w0nU/vPTZTKjQHRg4wlECb3EJ8iVfE1hQ54Q/ik3Ywg7BJ8EOG19
	+Pw+uC+CP0uX805TCUfk/XXIeFJHnJzjKD5SBXPtKG4K3Qe9xu5Q3DB+L6+pu9DlUcEFRi83s54vs
	wQ1XQJd+sX+Ex8Z0qMQbFOW40rdsglHYALoPxREhlQZ8SnIn8HEMFnP6Fwpr+N2N6q3VfJbDsZkR5
	6fkLhAuFKmLJO/S6IV4qeVck9Ytx56buwOB58CFbtmmM6xNPSBRBqieAo4FT/6MIyO37vpfY5Sw2L
	YFLSocsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wsr-0000000CHSe-1sSK;
	Mon, 28 Oct 2024 21:02:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WJw-0000000C9YK-42iC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F81A5C53C8;
	Mon, 28 Oct 2024 20:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E4EC4CEE4;
	Mon, 28 Oct 2024 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147196;
	bh=FN01wAAM5D8ZMfrYQkBkqRMg6r+p3qmFRREh7tSlgYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P3C0ddgp4phz7rTiKtrn+fbmvzltuGLSD+3p+Au18P72iXatX5ce7fvsRnFjBbYqj
	 QipLXVvqhMxyL9mFgsi4y1qU1u7xgFRKZmJaDSJezL0IFf2s5j1IHM2exEhd8mkCHz
	 uOv5WokY6qtcIi+cfa9LMoMBaf3nU9+Bm9QcQItDxhPG1iJJwseN5Bm5zWNJZSgTkf
	 PKmSp3T+COJUc3f4cwSdMMGvuqDAU89JrkkoTbYHO1TJlQzOPoqMPNrVyVGx4s4wsG
	 kXplxAixT1Thq+rH2uzki76Wufh0CjMVp4rCVwXUyJlDKwuzF7ZNfDFkcoji57A0/q
	 yeIdarDR0v6Hw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 28 Oct 2024 20:24:13 +0000
Subject: [PATCH 4/9] arm64/sysreg: Update ID_AA64ZFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-arm64-2024-dpisa-v1-4-a38d08b008a8@kernel.org>
References: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
In-Reply-To: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
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
 h=from:subject:message-id; bh=FN01wAAM5D8ZMfrYQkBkqRMg6r+p3qmFRREh7tSlgYo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnH/NoFqkcnBz5GKBfDodahpIRTDaaf4zSQp/88sVI
 r9TS7PyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZx/zaAAKCRAk1otyXVSH0FzMB/
 96ysFmW6P71QjtffhaS+xwXkOmBCPFj+RfWbn6KXXPQ0pqf5VxBamOOlh0hjvifAHQ8DClaDeupO5H
 9/qXOFxmb9tJLD8pC5OxDdCJT2tRBIzEwP9fOJW4h1kD9N5ZczGGiOYsSrScvrKqO3WUZPij2pd4ks
 j0n8HTPMWOlZXhtNk7OHlaFdQrvjEVjnCY1A0kzAusHYnImNGMAuXrV1/aHcGoiT8sWWBftSNo6FFr
 BlsTWLMYWf5sopFeNA5y/iVHffBe0QLCxCo3HfzdwghVYvbJ6HVCp23aARQfFC43L4+4I0hkvgHJHu
 uY1EesCMNi9sjo1Qf+JXtkFkM+jlHS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132637_075824_0E641BA7 
X-CRM114-Status: UNSURE (   8.27  )
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
index 26f1350c9d2e3baf39ac3bdcc96fc1e6deb5a5c6..d487c78520b97c8f96c70181e39eccb91d6fe1af 100644
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
2.39.2


