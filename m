Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B3CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzQ/I+NCNl4TzDKMxFcAIOhk0fzCZDdLZdA3AnA2C94=; b=e65ZXO4phYufeqfhpEuqbcEKpT
	z2hkahwdzPdixTY84rocHkElPsh5zqjdFCXyldKO7t5Q5jsdBHFEHmfshoD5gBLK7O0PBLyPNgx+t
	hkIdAHQzyzeOaqVGaZVkvn3C86tyVaGN522JT05mdvbwA2FOh4gWMp2cCEr9lFQt72ldbKglDhzHx
	1j3W+A27mXSn9E/+kzKn03uvOrYLxbnD367P1VeubAyw6DJ5A6ldBw3E0Ktv8yHspVruseLuqit8b
	0nsNXsHVVu55hfL/1aR5WlFNVaGs5OnJwQA0BsJT+ow5EWO8224+YRlmaEEmb8xmSMN7epBCUbIZN
	nYvDXxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyix-0000000AT7u-35lH;
	Mon, 01 Jun 2026 09:14:19 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyiw-0000000AT68-00FS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:14:19 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Jun
 2026 17:14:10 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Jun 2026 17:14:10 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
Date: Mon, 1 Jun 2026 17:14:06 +0800
Subject: [PATCH 1/2] dt-bindings: rtc: add ASPEED AST2700 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260601-ast2700-rtc-v1-1-15d4ca46500a@aspeedtech.com>
References: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
In-Reply-To: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, Tommy Huang <tommy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780305250; l=941;
 i=tommy_huang@aspeedtech.com; s=20260601; h=from:subject:message-id;
 bh=UUmiTipKkk9DzmFJKj37uR0bOtljZyyou0W0KGxbwxs=;
 b=S2E+CuVxKUPTFq2pQv7dQ/0/iNQ1rOOPtB8ZU9f6U0eVWMrT9w0OOm0wpiwFPzrdUIDU9wizE
 WIbbp+tpOKrCmHViQy3Rb512Xyx5DIrrGybwr9Loek522/E8nMYWYCg
X-Developer-Key: i=tommy_huang@aspeedtech.com; a=ed25519;
 pk=/SRU8iPtlyPCtlX7hXjYJhOTpCUdfEZ9pIVVyCQOjLE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_021418_045508_31238449 
X-CRM114-Status: UNSURE (   7.82  )
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

Document the compatible string for the RTC controller found on
ASPEED AST2700 SoCs.

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 722176c831aa..f4d0eed98a08 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -30,6 +30,8 @@ properties:
       - aspeed,ast2500-rtc
       # ASPEED BMC ast2600 Real-time Clock
       - aspeed,ast2600-rtc
+      # ASPEED BMC ast2700 Real-time Clock
+      - aspeed,ast2700-rtc
       # Conexant Digicolor Real Time Clock Controller
       - cnxt,cx92755-rtc
       # I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output

-- 
2.34.1


