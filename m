Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FA7D29DE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDRwp38A0CEq4xLd20SdXV/iQTb6zIBb7TvLV9q5TGc=; b=QeiK9cj0zFP6orBcJidqjO/9z/
	FL9G1R6isfxKEJomhB5njf2PdxUXkN4asMxn430sjVNOu9ASeyF44aMRqyR61qOTcbdcl1W+TTe9V
	9tjQmSKnwELinkZ06NfMNC/l7Xzjd+Qt38JtT+TbJSzTcAlWiZgfEZ+Fr1d0vWBQloc3IuRkd38Sy
	o6djm1r4R+wqVPoYuTk17Wipyie+qHhbRS/4pEuQKDEZvfXsUL/EtB93o6p8r92cOeboSiYF9HU5F
	+EfHsRGdOvNNSbyROkQdgiEI8Qah5vrlKmBuK19E2JrBczC+FriJHx7JUAIDLBV8yo2fOETwiK6Ic
	+6RKknwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZe3-00000006iwl-1zqs;
	Tue, 13 Jan 2026 08:20:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZe2-00000006ivn-01wk;
	Tue, 13 Jan 2026 08:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A71960051;
	Tue, 13 Jan 2026 08:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714DFC116C6;
	Tue, 13 Jan 2026 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292452;
	bh=NkL8q4Yk+gfVa/p6lSMEFG57URm0Jf2mxlxlnYGDoi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QMiyeAvuRCNNpFhlaxt0Hxu4VcXt49tYwTD/JaULda3VZxT33/RTrdOmVcDR9v2iu
	 1P4kNYDOcz0X1Mih+2xfFmP5EgbotXMIWAthZ/Fd2IvUYj95aAHpd1vg56AF13dWiN
	 /wbd546sk2JYee1tYkJpL2X9LYdFQs4bb0x72J4EawIXhxWW1O0SEYkT/gS4DD0U0L
	 8tEPh+cGUUT9uzeL8RnbxiEgDan7+mg/f8KA7dYYXJdQwEJJF5mi5QyePXsyEHzioC
	 twAulFRnoj6Pp7HLVj7Pw9vYYTXzcHvX/Pbow2JHuUFmOJpd+4IbW2RwYErr7rwzYK
	 mFKEfKYwrBC3A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 13 Jan 2026 09:20:27 +0100
Subject: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
In-Reply-To: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Introduce en7581-npu-7996 compatible string in order to enable MT76 NPU
offloading for MT7996 (Eagle) chipset since it requires different
binaries with respect to the ones used for MT7992 on the EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754885c1362b9603349a6353 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - airoha,en7581-npu
+      - airoha,en7581-npu-7996
       - airoha,an7583-npu
 
   reg:

-- 
2.52.0


