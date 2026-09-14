Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E13DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljn68BpLZOIPWJhOK7gS4Gz3i4EqTwf8PO6PyoXZ994=; b=vjvPWXoBEN2eiriMkc0doJdPEJ
	3m26xnx/zfA+5wf+DiIvToHr8tizMWoITX4q18MGeNlnYvROdPeii/CSHsaKhc3A+n0TQxtJ38xy2
	WnfmvyEQ5xXU5Inpi8bxfiya/19pTyUlUZ/6GDgASSxHoQf3S65isPoZTMPs8vfKal7e5z1dudfPA
	Dyf5X+ZYsqk0I8tDmWe3TgGLLuWXQYaLhVCScRuT+REddHgyju32Fc5KRX3et9I6n8yNIn1amGzLu
	TuSdeowksLP0kspYYBK3uaDjKKCA89y+fCng/YEGrdAkJp778dMQj/fjngX6JMe1H3FCRYnJP/74w
	HjOSJ3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695X-00000004Ezd-1GED;
	Mon, 14 Sep 2026 15:59:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695U-00000004EyF-1JnE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 15:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ljn68BpLZOIPWJhOK7gS4Gz3i4EqTwf8PO6PyoXZ994=; b=gTkn6Tk+JFusPVz9cvnYGMaeU+
	SWjZwE/vYZgMXxZkLn9nUTIwH72gvQkT2rJ9tPaTNsbetKaZO/NUxL+zQa3uhC7GsGcJj5sVQSd0R
	JNJCJK5xYlou2ngNLSDTddXUy5bD0viuvTj+IKfBugnSyKiZkG2NEuWfpByvh/FS5uMTnpsMpuSFy
	wl1fEGhxOCEGdwG8hqRHV1U+iItyDo7mVu+ruJDTBuXGvZUO9pfDPHDkAhYx1w/wtQzHd6bV7OFYK
	E9xk46GdbWu8lV00d8TJuc+YZZSweYKj9bsx0NidJaDXdDNBggY5ctiPr4JD/C1+DlrCCH+n4Uale
	hKewq7ug==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x695R-00000005oNc-1KP8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:59:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76884152B;
	Mon, 14 Sep 2026 08:59:11 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 859763F882;
	Mon, 14 Sep 2026 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401555; bh=nf7aM7RWUWkbd8XIYhO1XB0fiyBZip9G05NFlle9HYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvVDu1BoMMSuMenLStj/36AwF5Pq0lFr8NvXaTn99VE0i+x/Q2Cz85jVnzovOMXG+
	 RWGWVLrO4vLU48yvCC1GOQm0Db6gLgR6M9ZSHwU4bbZzEA1us4DiTuZ7nLgOT1ajLE
	 4krx6FbtuEiqOpsm0LFJsBwv7AKi+vZtCp+e2yPQ=
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
Subject: [PATCH 2/3] arm64: dts: fvp: Add EL2 Generic watchdog
Date: Mon, 14 Sep 2026 17:58:52 +0200
Message-ID: <20260914155854.123341-3-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155854.123341-1-pierre.gondois@arm.com>
References: <20260914155854.123341-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_165917_543019_B96536F4 
X-CRM114-Status: UNSURE (   8.34  )
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

Add EL2 Generic watchdog to fvp revc, describing:
- Watchdog control frame
- Refresh frame

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 5c4dd1cf0daf..c84796438a83 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -294,6 +294,13 @@ frame@2a830000 {
 		};
 	};
 
+	watchdog@2a440000 {
+		compatible = "arm,sbsa-gwdt";
+		reg = <0x0 0x2a440000 0 0x1000>,	// Watchdog control frame
+		      <0x0 0x2a450000 0 0x1000>;	// Refresh frame
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


