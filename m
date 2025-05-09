Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F171C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAxZmTGhij19hVGA0s3Xd2c8mFZU3bGvqR8ust1rwKY=; b=DWM5HL9xPDz6AGq8CAC7YWxiRR
	8e/2rF4QU8BFDURdOThJnljaa/cn/E8nsTw+SCBEuVLk/n0JjXl2J8/FZTJuz4P8pD7pT3z3HpId1
	HnJMZ1MWOM0GdQHSJvFuFwQkeGGyS0fZHflCInv66V6fYpCuZuvFyY2sVcexvlEcxDAc62/nWnvZZ
	lqQavWeWZmcBa/V9M+SU1Hvq1rqPNQFGGbc+mfmp1oxCSdOioMdKyyidE/SXkk8vmABCPY11+BUhV
	T8RLc25N3LGNdf3aW6pRbFF9/9n/kWve52ZW2fWvWurHEo8wgE260YomXDAszRn46g26KESOvbl7U
	k8ZcaKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIAB-00000002ke0-2Z3e;
	Fri, 09 May 2025 07:28:55 +0000
Received: from mail-m49202.qiye.163.com ([45.254.49.202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHzd-00000002ivs-3FbN;
	Fri, 09 May 2025 07:18:04 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 147bfe074;
	Fri, 9 May 2025 15:17:53 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Chris Morgan <macromorgan@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	linux-kernel@vger.kernel.org,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 3/5] dt-bindings: arm: rockchip: Add rk3562 evb2 board
Date: Fri,  9 May 2025 15:17:42 +0800
Message-Id: <20250509071744.732412-4-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509071744.732412-1-kever.yang@rock-chips.com>
References: <20250509071744.732412-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUNIVh1NSEJMTx1IS0keTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96b3e863b003afkunm147bfe074
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORA6Tzo*ETJCKwIMLSgDQzMY
	Aj0wFB5VSlVKTE9NTExOS0xOTElMVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlKQkg3Bg++
DKIM-Signature: a=rsa-sha256;
	b=kVARe9Jg69zIg9tmd9yIe5GT9vcgjv7oODN69lI23GFSM/N7YPFADf41mJsmrza8Thu0bB7FvgBP6DegSiYqPleGn6D8E43RcvUWeDJsHt9x+NEjeNNIlNISt0uK7X08gwneK4UCHAJtvlOG/D6uIQ+xmnMREQoYCwTWOC7Rf74=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=MAxZmTGhij19hVGA0s3Xd2c8mFZU3bGvqR8ust1rwKY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_001802_364246_72D160BB 
X-CRM114-Status: UNSURE (   7.00  )
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

Add device tree documentation for rk3562-evb2-v10.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- Collect the Acked-by tag

Changes in v2:
- Update in sort order

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..3372aff63e4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1057,6 +1057,11 @@ properties:
           - const: rockchip,rk3399-sapphire-excavator
           - const: rockchip,rk3399
 
+      - description: Rockchip RK3562 Evaluation board 2
+        items:
+          - const: rockchip,rk3562-evb2-v10
+          - const: rockchip,rk3562
+
       - description: Rockchip RK3566 BOX Evaluation Demo board
         items:
           - const: rockchip,rk3566-box-demo
-- 
2.25.1


