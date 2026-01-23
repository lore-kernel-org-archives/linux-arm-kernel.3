Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A7BD77899
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UsBD6EONLpTvjA5+WnC/V22AxRSFsGKT8//okOPHhW4=; b=udF//uze07ZL4C
	NLFENZ+0ObhIx/bcL91iKlSLKULE23BAx2Ypmkm0BUSvsclDr7wVoY3JgqOqJL0fuCLrd1pwGspXY
	0dHYJaSdFndrka3Wd0KJyNnDDmuXNcp0ctvCsZIncpFvJ1XDf7OZ4hrqmXT8uN9ufB+7E+/GlWblV
	tTy1oqUnK5eWsufjg/ypo9zw4aY4V7COWxkRHcWP1AYfeLyUHsUg19JJG6ubgtFZ5Rai5SVmyuWC9
	QmQi5v7pDNWZk90wPQTq47nd+oFHYUW2fmMX1gyQx/W2af6Bp2nQYZh9B+gqz+DtDpoQgKMBv421V
	3PWBRWkW5eccJtqiIdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL7v-00000009IRS-1nzA;
	Fri, 23 Jan 2026 17:39:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL7q-00000009IQS-3PAL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:39:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB6A11476;
	Fri, 23 Jan 2026 09:39:04 -0800 (PST)
Received: from e137876.arm.com (e137876.arm.com [10.33.10.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98FCA3F632;
	Fri, 23 Jan 2026 09:39:09 -0800 (PST)
From: Debbie Horsfall <debbie.horsfall@arm.com>
Subject: [PATCH 0/2] Add Arm Zena CSS support
Date: Fri, 23 Jan 2026 17:37:45 +0000
Message-Id: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOmxc2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3arUvETd5OJiXfMkU6M0gzSjREszcyWg8oKi1LTMCrBR0bG1tQA
 NGlfIWgAAAA==
X-Change-ID: 20260123-zena-css-7b52f0f2a967
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Debbie Horsfall <debbie.horsfall@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769189949; l=979;
 i=debbie.horsfall@arm.com; s=20260123; h=from:subject:message-id;
 bh=DOfzTvyIRF2VTYHjgObrvMlh3h8qSDmceDc/FvwRn3k=;
 b=dgdlFfyOQ1HipxyLtChvoshI285OEA8omy4ObYmT56leHgH/HONPgx8K4qdMtEKuuHj9Qzs92
 slm3EJ6WsU6BZfJZUlkmT0HCZNzwuf3FxVZrbPAly+aXCW2+LT+WxLc
X-Developer-Key: i=debbie.horsfall@arm.com; a=ed25519;
 pk=PHSQwhhwfluuPcWn1fk950OfqGxCy2cjbyQb7dfAcFY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_093914_917296_D7503DCD 
X-CRM114-Status: UNSURE (   6.39  )
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

This series adds the Arm Zena Compute Subsystem schemas and
Devicetree. Currently, the only platform variant is the Fixed
Virtual Platform. More information on Arm Zena CSS can be found
at https://www.arm.com/products/automotive/compute-subsystems/zena

Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
---
Debbie Horsfall (2):
      dt-bindings: arm: Add Zena CSS compatibility
      arm64: dts: zena: Add support for Zena CSS

 .../devicetree/bindings/arm/arm,zena-css.yaml      |  31 +
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/arm/Makefile                   |   1 +
 arch/arm64/boot/dts/arm/zena-css-fvp.dts           |  55 ++
 arch/arm64/boot/dts/arm/zena-css.dtsi              | 826 +++++++++++++++++++++
 5 files changed, 919 insertions(+)
---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-zena-css-7b52f0f2a967

Best regards,
-- 
Debbie Horsfall <debbie.horsfall@arm.com>


