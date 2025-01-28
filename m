Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3A1C02188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUbqz6OX5pwk97pm6+yKUxlZ4KD4xMSVar/pFww3EZw=; b=coELiJwi7fDcUAYjyNCX78rhCc
	C/7b5aDWq+UwtaldTpBhgMihKknPc1ddt4LGkA+VaczN4NCCSZ6gUYPhB6z/S6W1fPw7PJXgoq1Zi
	Ts1E6jkjBgGJstVF2G1IteRlXyfHkYWDEkI3LR+6ccNa4rJuZgUEdmRw9tOpHK6fTnrqzl4JILbOO
	FAhNarndQb3mcmZY53JBPrB2Hka4nUknNHn0YFpILSYhu+7Lf7sz5Cj2hjc/v01nm7U91hCt04xdm
	oxYyNMiJs/r0f0WbyI4o5YWOB+alnEmHhF9Gj+NzllTEpQlTJI66ou3KfAfXP+Q/SCa9BJKhd+BcS
	4ptTLMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZBm-00000003jGj-1tOl;
	Tue, 28 Jan 2025 00:10:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZ7m-00000003h6j-0ZnF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 00:06:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48CDD5C5B1B;
	Tue, 28 Jan 2025 00:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2145DC19421;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=EIzss4+nVhmBM716ght5tv9bi2u8EXv+0cXIqsZnexs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djWGZdEGjm9gYcPBqwD1BId5hx3PKr9WOW/SdWmMGopvT/s9r4KPIaWYZ42P3QmPe
	 yiWYVC/WOebllm9+pH10GNUWQYEWSBHukz+fhipIlxuy8wfy5wjUHj55pYqSLMJiHR
	 38it1cy4s4Twd3lnlSiEODudYqo7BoRiU71oWMoRxmI+6tgdo45Khz+JyIDItTTozp
	 uu4NiDvv7EvlCluUpP5zkNUJgfjjsSrkg7Yz79PggptS2k01fSUiI1J29NqvfguhSc
	 zF0t8io4PvGctFMmRLaAEBXsNowUEk+0hA2ijqQNBgVn4escrv7N0DQATNRq6m1Mf0
	 UREfJZjywdwOA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRMJ-1ZDu;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 30/38] docs: arm: asymmetric-32bit: Allow creating cross-references for ABI
Date: Tue, 28 Jan 2025 01:06:19 +0100
Message-ID: <88b0601a8d6e6f23fc3ad2a68b552b66df190945.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_160638_215720_1A0A8574 
X-CRM114-Status: GOOD (  13.57  )
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
index 64a0b505da7d..f15061b1e020 100644
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


