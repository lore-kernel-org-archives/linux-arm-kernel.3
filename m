Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0094C106ACDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=771mNE44sHQhC5rmXckx2CaBH1T0oXxmMruW/wkQt0o=; b=1n6Rh3G1v9/gQLyKHCz5cGzE1N
	7nsIQhEMspBAvQayFjOKM6QpFjGnCn4/LKbFZMwbTAC1CkQzciSCN21QY1E+ydJoqHTm0jeJzga2R
	MkMPT9ClDXc/Ejr0Uz8vC04uKYjxxcAv4BJ2AvniNiGVgElyMVqvWY5c19K9Yl2OzhcGHmU30i112
	yGwkXaD6t3IJbhwpBc4qyOpCFRqT5J7ADa5DGp2RnRxhGw201I2FlhVVNZzSysd44oqzS/XLjPoT5
	kTgExdhZZNHbWKFZ6ejngV9/uU/XpEqcCaP3Dzib6O7hcfFTR+XTXD3M3K3kOtPkx1qQuJAaD26jj
	Vwcl5NOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kNT-0000000EpLk-44BC;
	Thu, 12 Mar 2026 18:03:19 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kNP-0000000EpId-0B0X;
	Thu, 12 Mar 2026 18:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:subject:date:message-id:reply-to;
	bh=771mNE44sHQhC5rmXckx2CaBH1T0oXxmMruW/wkQt0o=; b=UMh1lMPjQBQYsTSLf3MUG0Xw4x
	WRhhPsI3rPMDOqRsYjnSOjN1wY1GO/fVEVqIK8Vk6t5VNYQy+p16cQWyypzfq3sfP7xwhG4qBC8DH
	utCIax06mi4t97EmuCLymZIm4W3nY39hFod7MYvy2E+ni6WsY/EDQkG2oGoNuSPeoStg=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0kNL-000000008Fl-0QLo;
	Thu, 12 Mar 2026 14:03:11 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: robin@protonic.nl,
	andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	alexander.sverdlin@gmail.com,
	marek.vasut@gmail.com,
	akurz@blala.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hugo@hugovil.com
Subject: [PATCH v5 2/4] dt-bindings: input: add settling-time-us common property
Date: Thu, 12 Mar 2026 14:00:56 -0400
Message-ID: <20260312180304.3865850-3-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312180304.3865850-1-hugo@hugovil.com>
References: <20260312180304.3865850-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_bar: -
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_110315_081622_50D408B7 
X-CRM114-Status: UNSURE (   8.20  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add common property that can be reused by other bindings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 Documentation/devicetree/bindings/input/input.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
index 502e0b7eb500a..64d1c46cb2f2a 100644
--- a/Documentation/devicetree/bindings/input/input.yaml
+++ b/Documentation/devicetree/bindings/input/input.yaml
@@ -66,6 +66,14 @@ properties:
       reset automatically. Device with key pressed reset feature can specify
       this property.
 
+  settling-time-us:
+    description:
+      Delay, in microseconds, when activating an output line/col/row before
+      we can reliably read other input lines that maybe affected by this
+      output. This can be the case for an output with a RC circuit that affects
+      ramp-up/down times.
+    default: 0
+
 dependencies:
   linux,input-type: [ "linux,code" ]
 
-- 
2.47.3


