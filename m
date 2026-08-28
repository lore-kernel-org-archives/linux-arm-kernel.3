Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2768C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6U//SMUXKttZ6dq7phfLN3OMy+cbhaVE5LFNf2l4lvs=; b=G/U+XqwkkZIWGdwWlyFlA6sqIT
	R6X5eHCFgsI/u056sMzQ9J2M+gvgrqPgwISZw6nc2m/OqFe00+kC05+Rb00gV5JbVLrDjp+topBYX
	WKIQh/ie+5Uww7wbKnNveU2nJCCyTKsH3rOZ2NECf+jKXSUyGtQNBDindYFcVw5skNlyeGVch3SJM
	rsH4eZo+ZMe1Hvsdmg0il+Mc0zCc7L5uPegoOjG/k3C5CZ/Xwl/Wsu7Tobz8cxVbJlgMTwlNhG2gF
	ynVCCgBQmpSxsVKOGfLCeQu3zB8pP6YTLmiGEM8ZFfq3eiQiia1zHRbsD3gbzISTpDqgvPKIDt4/A
	ovYqdORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6b-000000062wI-2CpY;
	Fri, 28 Aug 2026 15:02:57 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy6Y-000000062u9-42Do
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:02:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BE9311C623;
	Fri, 28 Aug 2026 17:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929369; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6U//SMUXKttZ6dq7phfLN3OMy+cbhaVE5LFNf2l4lvs=;
	b=FZJm/uE0zRvCIMzy6elJyi+Xm5TX21j71THhWTJyAvmbrGTdS64Lr7UnAusScVmQ/iMsNO
	f35MKAl+mX/u8BdZG1EnSCcJIMZLXvdzLvwZEE2LFRjFvrmV10lhJlkz9JxngLqMWdtBwX
	boaTBZb9f+q1+ziyRBGpVwSaBXoEgBmPdb8rE4BXe061JGYACxrVZ+2jUCtdouydq9rzP4
	hhj9IeM2/SHKr2MBD1dxY/bVgCQDxfTuJzMuhwfInQpK2mOvTJvkc3BvgXJme8xWweCzGb
	PDjTzRoDzbZdf+6GhajBwMf6y+lqheM+4neF3xnyyd+7yVNRAAbRYGa+fPdcow==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
Date: Fri, 28 Aug 2026 17:02:25 +0200
Message-ID: <20260828150245.173147-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080255_151852_9595C2F5 
X-CRM114-Status: UNSURE (   9.02  )
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

Document SoC compatibles for ST STM32MP13xx and STM32MP15xx series of
SoC, so they can be used as more accurate compatible in SoC DTSI. The
SoC DTSI currently use plain "generic-ehci" which is not future proof.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212c..fb6d6b312ab2f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -54,6 +54,8 @@ properties:
               - qca,ar7100-ehci
               - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
+              - st,stm32mp13-ehci
+              - st,stm32mp15-ehci
               - socionext,uniphier-ehci
           - const: generic-ehci
       - items:
-- 
2.53.0


