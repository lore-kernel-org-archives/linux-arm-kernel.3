Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C11C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18CvCCOW9u3135vP5hslDw+M7kt4S4StNE9p6qQLP6M=; b=pP75AkoJiwQ5F0GQeWxpzEqM+I
	6sBAbaDQIok6glYFxCuvnb433HqLvPDELR1z0tt3+HuV1UXqdCXMnZv7Dtv5vf9u67zIlBIQf16DX
	1VwW8NrAsV3W2pkNRz3mLq1bCPcLFJTFT5mbOg/RXwU9v/YuSuozVAXbwrmr5l7XI1UgYbEGsLxOV
	j+gJHQKmGsVth8FcrmvQOJvlx1sNSbgZDlURSZi+AaRasvoae9ePTXpQ7oH7ZDeFt5/CNwFpRlKLu
	o50DBAStDylmzBrmVGNgzrhfO2EDjOGDhRnAPHcZQrZye49Lh00Ko56vl+Nb9xGKEZDgdi3Yy1KDT
	wZMERoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twKdy-00000001CDJ-0mDI;
	Sun, 23 Mar 2025 12:41:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twKat-00000001Bm5-3Fus;
	Sun, 23 Mar 2025 12:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3B1B5C5D10;
	Sun, 23 Mar 2025 12:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D3E9C4CEED;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742733502;
	bh=qNL5zaQmZMh2NYS8anqdXQNeU2uo1FCGOXYyuJOoH/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jwGuvTTtJZ9m0jZO5Ew6Cdmj/L0ze5hTuRyFtU8DX7f/cgPEDVu0w5AwiHV/igIXO
	 64qKKIjzMPJ0cqrf7HAtHpiPmKkP+ED2VApK6CfTxOSa8U1Ul2X+VYlWSUYwaRt5Sd
	 WSnZb6thzX0q0JjLXSMAHRXWOmiB3xuPJsWdRhRa2uBLz2tOgf+DDrNWkBXCyTZsTL
	 ymvcJ0zEczgs9sAE4arjM+BASR0c1OnWG2uAb4KLM7zwCZBxafcqd6rjKzOeyp2Nno
	 b61pr7on2SiI6fXd74Zxtf/cPlXg1EpLc1aK8QpTfmo7yGvFSeQ/thl2Qd3neUNvah
	 wBrTHgK7aKpMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3CEC36005;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 23 Mar 2025 13:37:50 +0100
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TC
 Unterhaltungselektronik AG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-fernsehfee-v1-1-2621341cd37a@posteo.net>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742733500; l=959;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=uaz9m8VjNE4NEygLbUtmBG2+WbjOgy1rPMuQ4WTpnro=;
 b=XWEvZjys42PmDLa1n4FLTA9f2MmzxWu8uLr8Mzx4Mal4ZylyaFFdxjPKN+Az3yww8cB+aEWHj
 WpA+cD9U14/B0t2ta3oMhRBIPPX4SlIOX4/8AZbHcQA/4q2fxIr/B45
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_053823_875000_BBD60E20 
X-CRM114-Status: UNSURE (   6.75  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

TC Unterhaltungselektronik is the company behind Fernsehfee branded
set-top boxes.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1e9e2b52312439e4b1d48b262200c..0019f6131bbfc11ba55f5a15a238825abf665aaf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1484,6 +1484,8 @@ patternProperties:
     description: Toby Churchill Ltd.
   "^tcs,.*":
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
+  "^tcu,.*":
+    description: TC Unterhaltungselektronik AG
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.48.0.rc1.219.gb6b6757d772



