Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7380C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w/N4U0476/E+l7JphB2fPMLJ2fvwYKVE3U1G+zS3Jwk=; b=WwSVFtCu4lP/2IvNVPouGWaAhc
	AlPwj3BMF3ME65vGovcmLkctxDGv2lUNSRRqzheuGoI+xKnPY8Yl7oW57O8gR1LeBUS9Cg1QsE4lF
	Y7KLRktra1bSRM1OOaWHhHOrNS8qXlpDVfcLtpGyKVChDXiQX/ZVfL1VeC2dd0ACkymptqiNG2K5b
	t5S5Z2BB6HsSOV3/gTKRM/YaudWE2IG/JdZgV1QvOwXvknTUEPVaQCnwWW/8qwvAMfMRMygXDQHoj
	dS7YrDDbqvAAscCSD7NlO2HI8BT3NlTh4GIBv4JwGveSvYGaxekxSNPlO+xtXMiKeWh6wjfEUYJi2
	tn9rwtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZDd-00000004ziu-2lXd;
	Wed, 23 Jul 2025 13:09:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYk7-00000004vfA-3b0Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31EEEA52851;
	Wed, 23 Jul 2025 12:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D940C4CEE7;
	Wed, 23 Jul 2025 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753274322;
	bh=OrTb+KcHqT4ajdsH1ypK8FaKVkgJa8ksvVRgB8HRm9Q=;
	h=From:Date:Subject:To:Cc:From;
	b=RDhmv4d0mUWTFu/k6l+UgHLvejZEHBBcCvuOIo8nKodYeCvy+R8vxIiOVsm1q5JOQ
	 UsrRTEdNNtnDr9n1eqkSUf95LHjki0r7NChsEJc37EiZPy3FZaXpOp1USxa78ZVWv0
	 tuyMocSaFBl7WcHl3c/07K9XCpnUq66Esftj/19hyYg68nLgz5Xp9QwZMsSCjS1E0N
	 5x0RUI3Igu7319Us20lfGHASKXT91o9pSK2yUANHXbKAU3KGRHreHXiuXbYKbbU2WU
	 ErW0ksZ+wacNF9oO4SiESQeC7UcafWUVHrfIo/8BWzh4d9dAcYVlXHWEwqxu05EHoB
	 QBF5TpoFQ+Wog==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Jul 2025 13:27:45 +0100
Subject: [PATCH] arm64/sme: Drop inaccurate documentation of streaming mode
 switches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-arm64-sme-mode-switch-doc-v1-1-702bb484b4f4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEDVgGgC/x3MQQ6CMBBG4auQWTMJTIsar0JcYPsjsyg1HaMmh
 LvTsPwW721kKAqje7NRwVdN81rRtw2FZVpfYI3VJJ0M3VWEp5Iuni2BU45g++knLBxz4Bt6J97
 5p0ek2r8LZv2f7/Gx7wfH5ah4awAAAA==
X-Change-ID: 20250722-arm64-sme-mode-switch-doc-8e132434b4ed
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OrTb+KcHqT4ajdsH1ypK8FaKVkgJa8ksvVRgB8HRm9Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBogNfQPuSRx5nolzVnWzO3f5C+iSWPt1ou4zVoV
 QuR7n/k3ZGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaIDX0AAKCRAk1otyXVSH
 0MvbB/oDMKFjJJgkmKz5aDIP9D9olw3VGOkisOZtq2L19yAa9LIBaPWqfS+u9NiffrlmpSi2adO
 Ome5zhPsryc5XH/0b+eDJIcu/BaqhePrwNg2u0IlIwjm4Wn3YrtR3cN+HjuobeHawVeLM48T5jS
 J2GPCXLn2yG81L7/hWfPqXfIqyEqUTYq6EmojjpfL9OKelTZi9MDwI2Bil9NC1I/WwQ+3vOXXho
 wajoW9rC37ZFRdXv0bzPkeZ01YcPaqUH1gaJAt9yMwhHkeHnil5+omwXdskK809wqSe2SypOlzh
 YyUqU4VVrdPAXYbic0RXO4NhuMJ7tIPmfvqvq3NNQtAhZnT7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_053844_032175_69B5CC41 
X-CRM114-Status: GOOD (  11.14  )
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

The SME ABI documentation contains an inaccurate description of the
architectural streaming mode entry/exit behaviour, just remove it since
this is better documented by the architecture or with the rest of the
documentation for the specific software interfaces concerned.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
The rest of the documentation needs more thorough review, but it seems
wise to remove the incorrect statement to avoid confusion.
---
 Documentation/arch/arm64/sme.rst | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/Documentation/arch/arm64/sme.rst b/Documentation/arch/arm64/sme.rst
index 4cb38330e704..583f2ee9cb97 100644
--- a/Documentation/arch/arm64/sme.rst
+++ b/Documentation/arch/arm64/sme.rst
@@ -81,17 +81,7 @@ The ZA matrix is square with each side having as many bytes as a streaming
 mode SVE vector.
 
 
-3.  Sharing of streaming and non-streaming mode SVE state
----------------------------------------------------------
-
-It is implementation defined which if any parts of the SVE state are shared
-between streaming and non-streaming modes.  When switching between modes
-via software interfaces such as ptrace if no register content is provided as
-part of switching no state will be assumed to be shared and everything will
-be zeroed.
-
-
-4.  System call behaviour
+3.  System call behaviour
 -------------------------
 
 * On syscall PSTATE.ZA is preserved, if PSTATE.ZA==1 then the contents of the
@@ -112,7 +102,7 @@ be zeroed.
   exceptions for execve() described in section 6.
 
 
-5.  Signal handling
+4.  Signal handling
 -------------------
 
 * Signal handlers are invoked with PSTATE.SM=0, PSTATE.ZA=0, and TPIDR2_EL0=0.

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250722-arm64-sme-mode-switch-doc-8e132434b4ed

Best regards,
--  
Mark Brown <broonie@kernel.org>


