Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00ABE98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDLEDP75uqRqnKIW1Hk2crh2ntc9rwWNAq2ohTd29ds=; b=vA1Bs+dcRDdCZvp3xgDXs5a/NJ
	IbdM1nBvozyH1HxxAo4pYMceFz4pLeL4G8dmnj3vuOeSLX/SP4miiQ7XsjIg7G+ofeuSFxFkZUVdp
	kASc8tPtRgsee/q9VxtCMbXFFceNYMSGGB2Iomiw0HWaA64W2SmhD4nJ/xTZCLPeNum4HuKT0KZJF
	z+0zQkVJqqGrN7aRMk2TsqNbbAsuPY6Uo6G14rp2bnE343n+Esb4ckGZ7e4DMcBkvuHzHtGW9Ole8
	jewOtHUDGi5ArngDYRN+VlAceB/YMG4vjFLDICShvxtWxWskMj6IZrsh1cj3FwnqIkDEe+5dwCPbl
	VMu/JG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoo-000000000NY-25kb;
	Mon, 23 Feb 2026 10:05:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSol-000000000Kg-0WJr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80A21600C4;
	Mon, 23 Feb 2026 10:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2942C116C6;
	Mon, 23 Feb 2026 10:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841130;
	bh=3ie0ZA5pNHuuMYiqJBlO4R/ou5Qo8K0jXmdQW6jxKo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLVNTJz33HW02gai2XloM51iY8aNpquMiGbGon0HtIrMA0OVN/fDX4Y/JevS6X3km
	 G85U6iWSb7deim+x5LCT0eb36Y2LoLGJ8KdXolY8htbVpcUzn9w6DaX1rmhsbsFROA
	 Z4DSN93HSGm21SZuiS4yUBKjSQ0NblRjgd3bdPsMR8ye5qGICZ6L9mDa0OmG1wmskY
	 mqOqBHWW+RAj4cCi6PO8JKm8lqQ8AsiiFnvDFG06IT1m9UgMVFMosTuBCfPzkMWyRp
	 f6QBltvjZSwE2qoPisFxuYADO1A3zhmM4dgU2zgXNefiTWdZhAsCcQIbj+tDIdVyR1
	 aGpA0hpEIZtNQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 6/8] Revert "dt-bindings: nvmem: sl28cpld: add sa67mcu compatible"
Date: Mon, 23 Feb 2026 11:04:51 +0100
Message-ID: <20260223100459.844967-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This reverts commit 4a9b344e90c7ca654d7a469d0a467f90ef2add64.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/nvmem/layouts/kontron,sl28-vpd.yaml           | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
index afd1919c6b1c..c713e23819f1 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
@@ -19,12 +19,7 @@ select: false
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67-vpd
-          - const: kontron,sl28-vpd
-      - const: kontron,sl28-vpd
+    const: kontron,sl28-vpd
 
   serial-number:
     type: object
-- 
2.47.3


