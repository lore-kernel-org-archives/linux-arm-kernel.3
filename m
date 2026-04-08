Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC2210FC464
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq6TmnrR7Ef3Tvsh0k9fofGPjr1Ma2be3M/ze9tPBAw=; b=APb4juLz/ZBzyxWQYUkjwslcro
	3MQpI4nBsPqdQhcWgj6B/sRTi3n45QAIM0P050+7NHavr8hnUh07/k5vEC/EvL7emD0wKJA4G/iu7
	e5eHyfMBMIKrJK7PU6u8ai34dl5UyvETeNSaIc0TWaEjFhg/fcXaCfn0uZb/cHwNOa4mchl33bkwy
	0W7HLkacSeJ0eGDbLmp8fil2f0FYWV6QgyCeI4P5Fe/6A6bqKXVlRdYJnFvOMkY2RNNk643vKxOTy
	IbteqMRyGhMDRHgrHJd5lF4wZe1/PtrLs7BnUFv7sViKGieI72033wbWKSyP+MxmtuFUSlwvDffPh
	EIEmdB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBo-00000009TGT-1Git;
	Wed, 08 Apr 2026 22:16:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbBi-00000009TAa-0A7g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 538674457C;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B7DCC2BCB0;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=htLSa/pFYIGLX2V/bgi6ZPOMIyGWL50VFCX7LC8EdCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AsoKgq3l4qG2R9BpXaj8Ed0eyWn5uFLGOWCXpzxxJqEcRmBgPazn3Tdyr0qgYxdzu
	 1abMDWTUowTlv2E+nnQIeX6xOQIA/H3AtAjk5veNqWW4sy6SrlYKX7x9WxzljhaLuu
	 SGAN3Gplt1KC6NKmwxEqaAeQmSZYS30y95QN5xOWXY0SYQbntN7zay2XM5/GvaKaFz
	 +fPzh8O2uLMNwIx+yxydg0ykNDloMrzRlW8zjAeafZOhhcHpzqvpi+qhSpZAnQ5I9i
	 hlzEGXaflEwhVz7jGh6pQAkHi49fEg4l4ZRd7IT6I1ROjRrKJlkdJ758Ea+RbbpDRX
	 5ZD5Xc2qX5N+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D2410FC45A;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:52 +0200
Subject: [PATCH v4 09/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-9-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ghceD3FEXE+XcrRARnEBBTznzq4UXU11eu6mo0R07f4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSgCz7jjy058wzeL7LEkYevCLbVWdEmzY1J
 Rkf7VMNi46JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cpX5D/oCsqGXfeV1fdW/6kPezRfYNu5hhWyw2cIJv2dQySwVh3VIq/lGZPocjSySj/ZqaaOV+c+
 QJTF4ztbrpockeRkdSjn1jAiitpI6pRMmmZrgFooZXmWRW4nbnKeU/KduTJESeV+/87YHWAAhZW
 J/3BBXIoNOz8UJWO74AtUzniMZLLg3d6UEyuHq6SoWAHvk+mcD0L0To0/V2/CjY4Focrw0b7MdW
 kVezi/67hyObLSWoAb17K0Y5YHlKSac3hN8qZfdVxJrIelIDV7yVmI2zfBIvfyTOxFv3eQW2q6A
 ujJ0o3qvv/2w+Q6STHp/UEn2+bUHxn/rrCQt79Ey9NvIDTp+gwzYxBpglNAYo9NJjgd/ioxTSd6
 ukaEOGEq97o5BV8DbYRLH5ZH2PHpWm/dfKjEiFdjCzGV5XnhY58+6yx8YxyGebQpJMadkGByr5Q
 oZvXvM0JEQcdmW0rcNpyvZBiYARyDo3wuwevv1EF+1NBF3vgiWnrm/2BRYVSh3H4lzOiPOO2tdd
 ZKbIc3XhChBKg90OO2g35xjLR7p8+Yl9ykvdAvH30xxEWZmqx28jXrW33XHYEsoe2EE9H3u6XHq
 Vrcp+m10PE00u0oVk8dwKd+hIzWNRuhU79eKzTcapUzO5fUBIddcmrG1TU870LA6t7Kzxevfvdl
 A3sh9vK8HMeppZw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_151554_110870_A27C984A 
X-CRM114-Status: UNSURE (   8.57  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/input/touchscreen/st,stmfts.yaml  | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..441fc92b9a4ed 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -16,10 +16,19 @@ description:
 
 allOf:
   - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      required:
+        - mode-switch-gpios
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
@@ -40,6 +49,10 @@ properties:
   vdd-supply:
     description: Power supply
 
+  mode-switch-gpios:
+    description: Switch between touchscreen SLPI and AP mode.
+    maxItems: 1
+
   reset-gpios:
     description: Reset GPIO (active-low)
     maxItems: 1

-- 
2.53.0



