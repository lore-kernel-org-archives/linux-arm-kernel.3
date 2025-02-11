Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05154C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS3+WBOH9iyEpjerNGRf7Al3k6+T0JtwrHnhVuZNi1Q=; b=kGww6zcw7waiFoJYCl7C6cT375
	Ao+q8Yj1TJvMl2aNer6uev5H+3l2mGHWc1mhNmmLlrXyymFmbc3WYdISKE+XOBVEZCvG4opkLDHeb
	FuI6qISqemBgghphGCHTUQqlP30028/cmG6UvS0iP47asYLgkQbkZDj0TQaCad8vYfF5HSVt2ycfl
	tLuA7ZYtRnPdfkghkftcsyLLQP6QXPsLZQ67prq44moYJPsCeEBd9wZ66N/SpV6+QFNn+KxLHm/NZ
	2FRlWLK33j2kFgba9Cr9pYjkjYTO0ukTQb/TSwjW19uuWtelArqKXpXherQk4mz0bp9gv/ULXfH2E
	en7NOjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjii-00000002hT1-3Tlp;
	Tue, 11 Feb 2025 06:26:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjfv-00000002geD-3khQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D9445C196E;
	Tue, 11 Feb 2025 06:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924D9C4CEE8;
	Tue, 11 Feb 2025 06:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254994;
	bh=70CpwTFUuUr0ZBQHvWnlxclVDHf464oJy3CMyyAPe6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t4QwFvCuFNBkd8ieLaQ/6s/TkWAFdurcyaPHENdXyoZjkcCWDSZHyY6Rql9/m4SnK
	 X0uPU4IEQ6wH1i8AHJNUCpLB+fBy+TZ1M4vl7qXQt0rRhKf3gbdKv9EcW3kLvzoNI7
	 wbnWBIvHCO9TmZPS3auqvLF4iWlmOliTDwEcRozQjGq1E4y4e/r5jIn3PPjHtCd2rT
	 fh5Gy6CoWhtEyNzHqsYaaKHECaXndzELHI+FiOmY/DzPPp/uS5ioCtqkTOsUig28bB
	 qZeXe8sPO1TxoMpcDUy+fGKzbeEaf8eBNrRaisf/yeG/J2agMYZfeH+QMl1CESSp+B
	 Yf9lhiakCc9qg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjfs-00000008YBT-3QKt;
	Tue, 11 Feb 2025 07:23:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] docs: arm: asymmetric-32bit: Allow creating cross-references for ABI
Date: Tue, 11 Feb 2025 07:22:58 +0100
Message-ID: <0a989eea90e5d03a36a07760f8b505e074e85c03.1739254867.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739254867.git.mchehab+huawei@kernel.org>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_222315_980868_C0484AB6 
X-CRM114-Status: GOOD (  13.00  )
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

Now that Documentation/ABI is processed by automarkup, let it
generate cross-references for the corresponding ABI file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/arch/arm64/asymmetric-32bit.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/asymmetric-32bit.rst b/Documentation/arch/arm64/asymmetric-32bit.rst
index 1ca2b359a907..57b8d7476f71 100644
--- a/Documentation/arch/arm64/asymmetric-32bit.rst
+++ b/Documentation/arch/arm64/asymmetric-32bit.rst
@@ -55,7 +55,7 @@ sysfs
 
 The subset of CPUs capable of running 32-bit tasks is described in
 ``/sys/devices/system/cpu/aarch32_el0`` and is documented further in
-``Documentation/ABI/testing/sysfs-devices-system-cpu``.
+Documentation/ABI/testing/sysfs-devices-system-cpu.
 
 **Note:** CPUs are advertised by this file as they are detected and so
 late-onlining of 32-bit-capable CPUs can result in the file contents
-- 
2.48.1


