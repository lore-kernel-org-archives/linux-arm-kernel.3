Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FACC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5aL9xiFeyTvSORT0lwy0cZ020BuHmC4opJbIgNSM9Q=; b=JJnHLJpTxAmnYMO2Eb06th1bPl
	RYGZB5noaAxcOYXJswha1sHWRBjHXh8rqbKXZ48DwIK9wckE/8VyYe7x2qQXzGAfkVmhtAeWYn1wH
	39XrPeWMcJI8BW9soSisOZyLgZ4GXwHOMvBP27eueJKGrfpj3OrHMsCsprZ/ebZXYFGPzsCmSFNoF
	YD98qCnyx+JsIEh/h9yvhDVMunjekSuI8OrwNL7syMYkQcd+Rz6AeNb0OCMMAzHwdWh0CP3+VNzQS
	F1WTiLd62rJQhroZoOZZNG0MHxBGhYnNhaWAY5Zo+L1ZerHGAwbffBYhMcXNST/NQSfHABp+dVDTI
	FyQQMFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwRb-00000008TCg-2cM0;
	Mon, 19 May 2025 09:05:59 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwJu-00000008S28-1z02
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 08:58:04 +0000
X-QQ-mid: esmtpsz19t1747644981t575a3957
X-QQ-Originating-IP: pCj0VqU38uxtKMOih4dtpbkZZpPgbevf1huby6Q/fnE=
Received: from localhost.localdomain ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 16:56:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3928078300355608272
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Mon, 19 May 2025 16:56:12 +0800
Message-Id: <20250519085614.2245892-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519085614.2245892-1-i@chainsx.cn>
References: <20250519085614.2245892-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N4xNDYS0Y2xMphm81jZAdhqXE9xoNPhXJCZKjkbSMJaNvjtudRsqF4nM
	3YU2b3BtfC5VPdwPqPyXobySAXu1viX+4KU4UXQYSF3O5C5T0MuzOlTb8o3pEulp2QsyyOT
	0qOMSOjfM1o3MF+lp0dyZojqWihyvt4HH5cHPhlFuKMuaeA3UE0dXqlI84aG7Gn9iPJxqme
	gcH4LmA0elqj8alBEevAlOb9nI22NT22v7OeBofqm3oFc/K3VAaicBxZi2tYYRckYABRUIy
	Q/Mhwehpd1u94RoLKM8QqRrCaNBIRsv8PNHj0NllakaRLVR7DlzTzOQv4oeBAqabJqx2a63
	jk4mn6ZfFeWOQDQtIH+dPtpQYlyG31JWDjiRKx9MowP1fCz3AvleemjnB4Q3iKgqLgZmpHU
	Nh2T6SA6ArBrBeyiSoPgK5TgFZZ3pQPc3Y0QxlpfdozmhQjFlgd9E5LdDGdErvbsMel4ZtD
	8cz+KwPElRXKi88Tzg2XZU95wCIMjbw7tKr6J9Zn43w3TK42OXEaloHOWw5T5ds/OKdUJxJ
	xgfgcSjFdaoOpJVZrgQnobMIMtaToVC48ZPFEySpfI5qteeJfIyt/LNUdMvrigvpc5Wl2yq
	mfhoMo5MSFdw/EmJKf29iqIdSe/Gd8coJI8oirwibhbKT33Uf6ACyPw+vmQ+jmKwFV1nRS8
	u89gaid5l0OjDSQkkvnbKcEhr/2Ek4I4XF34vevtOn6YqfUofUl61HAZQC2IngppDo4AtIa
	vdGPfGhelC4i5QuAiYvX/8PyP5qFfvxtVeY4sUctlmkiaKyJOVlaVH6EIDGBMiGvR+E5vUO
	8VCdMwuRpUTgnHvM2W3FkGzlY8V2q4LRz+GRCD5kKy4A/rA4D+zse+VQ75onizBBVxrm9L3
	n0FI/PpDNJLkAl9Uk9TOtIvcWejXcn35SvO/+jONdyOgTPNOTrl0h2c74hg7bMhMFuRSaAl
	O8ZT1yrHMbWkVZ1hjhkdi0n3EVgxVRewBUFz0O5bQs5SooUM2y6XDh1SRjuv+sXSTSMY5/I
	UZaWLUI1Jhpeu0awT38BEPwI4HCU7woBdoqz7+NQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_015803_336648_A1EADA8F 
X-CRM114-Status: UNSURE (   8.29  )
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

Add vendor prefix for SakuraPi.org, which produces
development boards like the SakuraPi-RK3308B.

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

(no changes since v1)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 3e7450c3f..744d01a76 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1299,6 +1299,8 @@ patternProperties:
   "^rve,.*":
     description: Recharge Véhicule Électrique (RVE) inc.
   "^saef,.*":
+    description: SakuraPi.org
+  "^sakurapi,.*":
     description: Saef Technology Limited
   "^samsung,.*":
     description: Samsung Semiconductor
-- 
2.34.1


