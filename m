Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B37E9B372
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXKzKPnNo79mUYkdJiep3JLHoQq9ak9QxiFmJzyZrYk=; b=LTkzwHyLvnX268GU6BxpcSLNRl
	tjEOnzH+NbUGEjBMiO6L6FM2Y6IgCD1lqvwvGjv68CoVBuNzI2ohsuznRi4Tpv05eXNItluYg0Wox
	FoqOViEzwQgpUPwNwlWv4nkbn6tR720MQtmZt4XcwdJSxjdkR/D2VRcLkzRgS53m3CbpXatS7oLcr
	CglpLMZErclRJXR3CVrIf+HHLS0V7ldh1Qgy1lKoVlE0zOkrm4qxvPzG66/tmWtNRgfbo5su+hJ9W
	fTa3JvGVsP1hMRkOlP7cqdaSRoWAifiJxILAUh2Ezm7lnp81ZGhXqmjar1rwgq82brPtOVkvOQC2q
	D0qTSLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2MA-0000000CxEO-0UGC;
	Mon, 02 Mar 2026 12:26:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Ln-0000000CwX7-32gm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:26:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 937E74434F;
	Mon,  2 Mar 2026 12:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA306C2BCB1;
	Mon,  2 Mar 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454374;
	bh=LpVDGZDugMWkrHcC6TYLAjdQro/fa60SFAmlKmoBr9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8VfU45c3f5inRo7+HH8001lgbHiti8EhUZNfZS0Rv6nEHFELs5Uw3cvuQnf+E4HW
	 UOVFDWa6+kbunr5GVxFckdQ5C6UdllN82Bgb2bwFvtW+OLuaX9J5/2VIIowWEB/uuG
	 3ud9Gx40gO8ID43qBOYMAwBFOwkHcWYw6lcXABq3lOHOmbFNXYVpx7Ev1yIjYU7PZ1
	 9jZ9FywiQHDLArs5SL1elFLN5Hi9cDxsW29+MCdmMgRld1EnqX4uE2h7zoNhzlQgP1
	 2w8YPTsIAOY2tbyCGF0mDVjX891Lkb5mYBIiitRZBAVsmJgDi3lOi7nFyOZUst8ahq
	 GNxP7C9gcBwhg==
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
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 4/7] dt-bindings: arm: ti: Drop Kontron SMARC-sAM67 module
Date: Mon,  2 Mar 2026 13:24:49 +0100
Message-ID: <20260302122540.1377444-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042615_854387_8F7AC0BE 
X-CRM114-Status: GOOD (  10.54  )
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

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time and revert commit 22e1d0d8cda7 ("dt-bindings: arm: ti:
Add Kontron SMARC-sAM67 module").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 85deda6d4292..adda61e06173 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -208,7 +208,6 @@ properties:
         items:
           - enum:
               - beagle,am67a-beagley-ai
-              - kontron,sa67             # Kontron SMARC-sAM67 board
               - ti,j722s-evm
           - const: ti,j722s
 
-- 
2.47.3


