Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BD9C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B+uHXpSZG46rBURy5ACalMl5LLiXGZH/jrnw58pSYEw=; b=r0KcK8YowgYFA3
	aNigz9S6iVvPO06XDwqNQ/29BHjCO1V+WVri1Qdg0wVPNQK/++cq721VHsNGdf8HUwE+QAuABRs7r
	dZVT8qZeL2KTGgYxObjLTPAtln+ZYwy8HeL9SqxPe/Fmff2vmHKWAjy2++oH/qxesECtvZMCUR8Hz
	/zskAQ36u/+W9OplVU82vwXzGWP59++5GQ4RA06mKskuYYo4opmsaoJWgareSMUilHG7CnNCTEGOm
	qczFYuoO0QxS91G34nC6nNk0j+JLlRP6T+PCVFhjmhQ2Ay0Dr7csyy58nlNBI5wcr4YwQwpym8V+Z
	vG1/teXa+3HHnG4VayhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90dN-00000005XPM-05ww;
	Tue, 22 Sep 2026 13:34:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90dL-00000005XPB-19Fn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:34:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D83660A82;
	Tue, 22 Sep 2026 13:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E62C1F008A2;
	Tue, 22 Sep 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084046;
	bh=B+uHXpSZG46rBURy5ACalMl5LLiXGZH/jrnw58pSYEw=;
	h=From:Subject:Date:To:Cc;
	b=XNWe5axZK3PN+gJ0x3zlwYD+ZBL5Y+unloQ/5Z35Fbhwiyxle7f073O+LaIVIuYXe
	 yHIRda0w3FPEpJRjjMYKcyOSZRgquMSp3jIodPI8Ps+LTrID1Kz5JgP2mJy2H43hJj
	 7XK04ow/x7Zf5K9Msy/tLFErKaXD99CA041MY11P+mNWknJKprIssP0oBfES6HAb9Z
	 /81zTYxh5/jXE/h+62sp+KPOMoC3KV22u24ubKQ4ekGH+tYbFYm9aNLFslGiVn5cHA
	 KORAI3j8pCBfsKTqtGRp7iqR3BD5YemCeyaSCd4pttd9oD6Dl7VKinnRghFMNZIV9s
	 I15TYpI0xK5mQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
Date: Tue, 22 Sep 2026 15:33:59 +0200
Message-Id: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTtQh8ZQryIuYvJXRzRKppVC6
 d0bdfkt3lvIUBRGx2ahgo+avnLFftdQvIV8BWuqJmnl0PYi/AwP5egcF2RYME6jse9S58UProe
 jmr4LBp1/29P5b5sud8Tx+6J13QDlpfSzeAAAAA==
X-Change-ID: 20260922-mali-c55-renesas-dts-74d4727f59e5
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect their video
endpoints, and enable both blocks on the RZ/V2H EVK.

After these patches, and enabling the right Linux drivers, we get
this in the console:
mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0

This was done in order to enable booting mainline with mainline
device trees.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Daniel Scally (2):
      arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP and IVC nodes

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 52 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 ++++
 2 files changed, 60 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5

Best regards,
--  
Linus Walleij <linusw@kernel.org>


