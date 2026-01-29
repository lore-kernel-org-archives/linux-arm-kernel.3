Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C13D358D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Puyqb4KlLw9Tw9YVBGXVL1lbSf9jM4gxR8qM3PJNjw=; b=tcBoUdkiFi1S68T44J/Fc+9Feh
	X3MDS7/TlulQODCYqqdEWJZ1BNis6AO/OtVai1QM2Hs4f4nQXATDApeEcISy62RGhCSY1ZpTf4mST
	AuqJRxaLtDPdYEY9NN+tQhrz/pOQPFK9No3bbGw8O21Qxk1AipW2l6yZNfW4IDkJmtovaS9GODlSY
	faEfzbX2LPYdEq69ohqhH0AntHwhuY1u2zkY9j813fm2gk9fisEdxJ4NimQrAgstpkyGPZceUzrer
	dkI+pY6EWfm9eycKFpMcFpdP4Kq6DNYzM4DAHVBEA008c3TweRqB5ZENnTr5kZxk12a7F33LlFg6f
	J52F+b4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVjw-00000000QDk-1ZiQ;
	Thu, 29 Jan 2026 17:23:32 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVjs-00000000QDO-45fw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:23:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769707401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Puyqb4KlLw9Tw9YVBGXVL1lbSf9jM4gxR8qM3PJNjw=;
	b=gUibd4dKPoVe/gk+34E+1BEgtE1x5UGgCa2Tc8KZCiiA26Yp/nX3+Od1EBm9s9c27qraxZ
	7qktT7InYMiJs/eDsEMHcHp0k08EBMeG1dXvD6Xr+F9hhvExGZ084O90gUbp1Vg5UGbylT
	892LahQ6dunQe5XkgWpgntqpyxJf51s=
From: Sean Anderson <sean.anderson@linux.dev>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: sound: xlnx,i2s: Make discoverable parameters optional
Date: Thu, 29 Jan 2026 12:23:14 -0500
Message-Id: <20260129172315.3871602-2-sean.anderson@linux.dev>
In-Reply-To: <20260129172315.3871602-1-sean.anderson@linux.dev>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_092329_400283_F4C1495B 
X-CRM114-Status: UNSURE (   9.50  )
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

These parameters can be discovered from a config register. As they will
not be used any more, mark them deprecated, make them optional, and
remove them from the example.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 Documentation/devicetree/bindings/sound/xlnx,i2s.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml b/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml
index 3c2b0be07c53..180f43f2b230 100644
--- a/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/xlnx,i2s.yaml
@@ -29,6 +29,7 @@ properties:
     enum:
       - 16
       - 24
+    deprecated: true
     description: |
       Sample data width.
 
@@ -36,14 +37,13 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 4
+    deprecated: true
     description: |
       Number of I2S streams.
 
 required:
   - compatible
   - reg
-  - xlnx,dwidth
-  - xlnx,num-channels
 
 additionalProperties: false
 
@@ -52,14 +52,10 @@ examples:
     i2s@a0080000 {
       compatible = "xlnx,i2s-receiver-1.0";
       reg = <0xa0080000 0x10000>;
-      xlnx,dwidth = <0x18>;
-      xlnx,num-channels = <1>;
     };
     i2s@a0090000 {
       compatible = "xlnx,i2s-transmitter-1.0";
       reg = <0xa0090000 0x10000>;
-      xlnx,dwidth = <0x18>;
-      xlnx,num-channels = <1>;
     };
 
 ...
-- 
2.35.1.1320.gc452695387.dirty


