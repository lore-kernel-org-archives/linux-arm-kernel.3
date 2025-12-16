Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AC4D5E12A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wcUyEG3tq9jplmDr3xg/e4tWvi63cR6O702KvrscDs=; b=wTIVKYzz8C8/0RBM20QF3Tb8Z9
	YmXY33tkmeFcAMjneYbxG7vp998ncYKJM1mVN24Dp4/ANaR93Zz/2ZCeikuiThdGLJmNjfb0LhWWp
	/mwP11NKepQFt/XH20fT0pb8WKAh9vPu3KZq+knu/Dv2Wm70KRZo/ievdz2QCOFx/SdhU+YB6ltNt
	jGQ1KTpwDEbwOqw3IBh0FrVeyioRR+kU+oT3QlumNPvdJX4PENpnZnGfGAzbKjDgYZHk/JCiNxUka
	bHF87Ga3Ys+yMlKfXfaXKRtc66V9xmIKcb3vBeFxW5QTPcvRlZIRu7SsmaFIi5T1a41UzrFRwdZs6
	ycRhMfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSo1-0000000552s-1zu9;
	Tue, 16 Dec 2025 11:01:25 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSny-0000000552Y-1HGN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:01:23 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 16 Dec 2025 20:01:19 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id A4C982091499;
	Tue, 16 Dec 2025 20:01:19 +0900 (JST)
Received: from kinkan3.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 20:01:19 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan3.css.socionext.com (Postfix) with ESMTP id 0EB291C52;
	Tue, 16 Dec 2025 20:01:19 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/5] Update UniPhier devicetree
Date: Tue, 16 Dec 2025 20:01:08 +0900
Message-Id: <20251216110113.1801245-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_030122_472953_E36A6AD2 
X-CRM114-Status: UNSURE (   9.97  )
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

Add missing nodes for devices implemented in each SoC, and fix warnings
from dtbs_check.

Kunihiko Hayashi (5):
  ARM: dts: uniphier: Add missing watchdog nodes
  ARM: dts: uniphier: Add missing thermal-sensor node for Pro5
  ARM: dts: uniphier: Drop unit-address from port node of wm8960
  ARM: dts: uniphier: Remove "smpctrl" nodes
  arm64: dts: uniphier: Remove smpctrl nodes

 arch/arm/boot/dts/socionext/uniphier-ld4.dtsi    |  5 -----
 arch/arm/boot/dts/socionext/uniphier-pro4.dtsi   |  9 ++++-----
 arch/arm/boot/dts/socionext/uniphier-pro5.dtsi   | 16 +++++++++++-----
 .../boot/dts/socionext/uniphier-pxs2-gentil.dts  |  2 +-
 arch/arm/boot/dts/socionext/uniphier-pxs2.dtsi   |  9 ++++-----
 arch/arm/boot/dts/socionext/uniphier-sld8.dtsi   |  9 ++++-----
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi |  5 -----
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi |  5 -----
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi |  5 -----
 9 files changed, 24 insertions(+), 41 deletions(-)

-- 
2.34.1


