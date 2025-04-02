Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69654C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33FXtp/V8Zuwf8pGyne24jvXVQ4f14uf1PjEuqaKDSI=; b=0XNZPUfrseYJHQG98d5TMnn1ka
	oMcC2FQ1s5V5jJLtAno7wKIwOfq/bsEIFbwJkoLHVIIEUnsdqhuqGrRGJ/sT8J+st5npoOJAPt/Nz
	3E3dTwaM8cQrQuVEdQFUceiKpvBmpLj54IuV3ZnWvn7Ke2IX3WKOlxXoWAki6ZRJcMWAP321olJko
	rNn2Ze/Z5xgWpdUHMkB3cJ0Gn/GQU9WBpkwB4jrdy5j6APowWvS4p0Mp3q/uFDIypM7ICfv7hn0Un
	Xku0EPlpS7EyEDe7SJO/J2Zli2RXzRKwpoblVIIlCBzjKZWbHbXOiz0E5qEd/fa5k2uxvqkPc8UhB
	yaxo99JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsMq-00000005LeA-44ls;
	Wed, 02 Apr 2025 07:18:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsC3-00000005JUN-1jjm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:07:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0211340BF9;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25DA6C4CEE9;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=jpdQ9x2KB6YU1AdE5ize9x+hCIPQdl1FPElgQUnDaVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e5IM2iILJMP6eYQQhyNs8kWB2XCEY97JvdjqEr4zIk3EYJ2Z5jolZs746Ktczy6iO
	 ndCh9ZqWLevFAmHUijV6SGgkmV5FjpgfEoDE8LGvm8ZtUiyVEYdQWBnN1zXMcrCCJn
	 kWIu0w7eNsZIP2hSt63ZG8eNh7+wn2yrWwSMdLCXlQ8yaMDbNeXhHDGgUsczP9UF6Y
	 aps328FgvZwfjbJhlKYjflUXNOSldRMEMoB68a788tcQ3VQt04XxCIrOLaCEyYDP6c
	 BUYQtGWv1gp4PSJbAJXRV7+BAlzYCpApGDh95+5u/CjLMnrjy9AHU3ASe2+kLP471c
	 bQlW0rj0lrE2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD4BC28B20;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:06 +0200
Subject: [PATCH v4 3/9] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-initial_display-v4-3-9f898838a864@gocontroll.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
In-Reply-To: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=964;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=zHAL4M9Ap2CnMpPrredehNxGxgNHYTNlXYI4S4RtDVc=;
 b=fqr88wOkEHIfZheKBwhiLf5mu0oT8rOHpAlk9ZwFlEK0GsvQjRInjHjKBzfNm/ttaSVaGggvr
 pgsmlKQ1DGAD628fds+fRZMoTYgf9ybR4N9/9YP9VdN9qBlJnmA1Y9t
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000723_726070_4797122C 
X-CRM114-Status: UNSURE (   9.67  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
module bindings.

This support is not officially done by Ka-Ro electronics, if they at
some point will supporting mainline, this should be changed to them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..4b3864a9852f9fca2be48987d383c0671e668336 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12752,6 +12752,13 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	devicetree@vger.kernel.org
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0



