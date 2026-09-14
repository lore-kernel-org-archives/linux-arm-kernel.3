Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA10C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fLWrC0CXaUarYQd6tnSNYcJiIOmoMSTMmac3A8KyjSQ=; b=ZgOHvGwFHESdL8H2hnbUjrJVqH
	NGe3QLWfjhmA7ITqhc/xSpSY28NeLC8ZdGg9z8HYYWV/i14hMbrtftUkGY2KBnGF8F+Th9H/KuBB+
	Zqzov0lsliTwMclobV7j8qzMyxFe536sXpCug6KmuBZNegr5HAMcdf5X96MetnZBfgNO2zxLdJ3ox
	I4MtO0thhmQTDFoJeaWbf2oN8jdURmlmKOS7HBATMXdAZg4TCl6R6KHAPj/a0T17p3bkR4I1ilWRC
	KpAPGD8aLW26xnJuuxOyLH+bM0Uv9t3MKP22pF/XnIBuAEVpBsvvamtYwRzNPNKZj358hB5/2k0xe
	t+VJ8X9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695P-00000004EwW-0PyO;
	Mon, 14 Sep 2026 15:59:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695O-00000004EwF-0jD5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 15:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fLWrC0CXaUarYQd6tnSNYcJiIOmoMSTMmac3A8KyjSQ=; b=NAIGY0h4TkNenckWYiYddltxrt
	vjqJafYF1I682wIvytkKN3T3YupKbelv+TOlftMK2s1EJWl/PG7TgO2f2Ozu+z8JIosCGC8eM2j/Z
	aNmmO1ZmlEIQUS813comemKIpuHoqUfCp1CvmeR5Js4ps381ffJ4Pzyyy5oDM2RlZ8BwcVnbw5b6u
	jNyNuwaPz7zlWsAQKI+x2lEuaHb25hnQYAs9KkMMh9D9L4pPMm/3dm/07qseBvYFKpQN50RSDW/wL
	yR1hILuj/KcJjmv0a9IAIjsapq+joaxPLWVxI57q/55SufJnArPDsLG00r/m5sCvjyiyztowCGO5O
	0zFwL2HQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x695L-00000005oMQ-090X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:59:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5467152B;
	Mon, 14 Sep 2026 08:59:04 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30A1B3F882;
	Mon, 14 Sep 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401548; bh=2JJYCeko3eqMrTvIniIMVGjbWBYkK9bljBFySlRMBr4=;
	h=From:To:Cc:Subject:Date:From;
	b=gkJ2bH97V9TiuX6JV/Eo3Q570wFVj9wPU6FbS060blf7nxkeeJrdyjMFfzpfsTI2x
	 K+vfyLDxOuWEDk4hUec4czkZ2Qy5qfv1Nm2l1dyH1rS0VtQkBieFh9jjtH4C5ppYjd
	 Of/MZYf7EHuLxqABgv1o8hjclpaHfmQ+99Xae9iw=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: fvp: Add missing properties
Date: Mon, 14 Sep 2026 17:58:50 +0200
Message-ID: <20260914155854.123341-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_165911_294029_7BBA1D9B 
X-CRM114-Status: UNSURE (   7.25  )
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

In order to align the Device-tree description with the ACPI description
currently available in the edk2-platforms repository:
- repo: https://github.com/tianocore/edk2-platforms/
- at: Platform/ARM/VExpressPkg/ConfigurationManager/ConfigurationManagerDxe
Add some missing properties to the Device-tree description
of the FVP RevC.

Pierre Gondois (3):
  arm64: dts: fvp: Add cpu-map property
  arm64: dts: fvp: Add EL2 Generic watchdog
  arm64: dts: fvp: Add additional PCIe memory region

 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 42 ++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

--
2.43.0

