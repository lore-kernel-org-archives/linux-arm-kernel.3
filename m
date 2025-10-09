Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D54CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEWZwuNxwi4xbSw/K/OFuJ/1LmcrPXq1huXZyeD605k=; b=HCCquCdW2N9K1RZEg/kapWgTPL
	HCizqXIQvS1pYL2w2FkG5z19Nn8/+/k9NnJ+7CyyDRdBH8wq4qvzGkYKBEf7rIJ2zUt1SDx0VRzaw
	7Mbq5dNB+bOt6gsfY411Zyw1u3CqmUunY1F+FT/Zxrl3EWqzXzKCcygTxx5B5Q7pEwDbubdyyHaEE
	5T5KMNccuxCa7OBUD07j4LXVgYD2g7qTBjfd6dqJCLqjEl8ieIToW3Q7ndGPYy8iX8kXNvyW9Xqey
	E3sxY8FwpWE8MYMh203J3Z0EPg6DRN2LQi5w5JImxZSJu17pMlQ+q5vJ25xKSO91LFg+0Em3pDdf7
	Wua6Fi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oHv-00000005qEm-3Dmk;
	Thu, 09 Oct 2025 10:54:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oHt-00000005qCs-1VRU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:54:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB46148CED;
	Thu,  9 Oct 2025 10:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 912EAC4CEF9;
	Thu,  9 Oct 2025 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760007260;
	bh=WJGC3xsX+N06n8UEa1fPxLlGi8484pc+qISN079PghU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N2PyAJ3/JjTkmUQhAP2yeKClFUn50o5SsrRw5rgaLTl3tyy/L86hN/jHSSWzPG5OF
	 YJSiInIFHsCEAlf+FdrYr+8cukCLzF14KAE95+qPgZ9LrkIelRhmMvOEY+I+nS73xl
	 LFXgpGoLz2l4FgmDmBgS2h60M8/Z37bz37Uh9oTYDyl+PvNUzKyBdexp2fK8KOrdx4
	 6r9O46XBYo884SBZMmqLz+eCL8v1yBiNqrwtVaEaWjIfOEg0cO9OiPCR/fo/cRnQab
	 G6/e2JHJOocTIF5lOeFQ5IsmRNssYKCBy61sVbhQHgbNb1hOzG5Fo0/CLKXddfvz8G
	 JE3ai31qc6RQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8078ACCD187;
	Thu,  9 Oct 2025 10:54:20 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 09 Oct 2025 12:54:17 +0200
Subject: [PATCH 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-mini_iv-v1-1-f3889c492457@gocontroll.com>
References: <20251009-mini_iv-v1-0-f3889c492457@gocontroll.com>
In-Reply-To: <20251009-mini_iv-v1-0-f3889c492457@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760007259; l=1035;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=YdrnHfiDG3B0bwOljviUk0FaT/LUxjf/C85CSrfJE3s=;
 b=p6e/cI8s74gDArLUc9ZfZeMa2Z13mKMWv5y8MtX41NjmGh7J/JuTcLDgUI/X9PFKvIlKB8Y2n
 kvvhw9jZ+qDBkEt8tsFZ+NIOICP9simjsWcYWrIqM4lQEh2Ltvbc0Lx
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_035421_446144_937D32CD 
X-CRM114-Status: UNSURE (   8.68  )
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

Document the compatible strings for the Moduline IV and Mini.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..41eb19e3530da 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -963,6 +963,8 @@ properties:
               - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
               - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks Board
               - gateworks,imx8mm-gw7904
+              - gocontroll,moduline-iv
+              - gocontroll,moduline-mini
               - gw,imx8mm-gw71xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw72xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw73xx-0x       # i.MX8MM Gateworks Development Kit

-- 
2.51.0



