Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945BFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfROJALEd3NXDEp9TYst8vSTkshsswluXONGgHTxzq4=; b=Y40eXyO6tTxvVw5G11GDSLNh8w
	EyVc05cFbxDmETVB/yreJviH6XP59oAZoezuNwe3QiQTvNx9TETqBGy2Z5yT7fRlchi5ut6+1fLVU
	kSM1Ma6ssAfzzH/cTu/3t8iKIucPBc3gWLg/JZ/Hnr88elUys+e8+6d7ZeHXzg1AlnC1yVhJzheeK
	UqnmKS5wXtiDEhJWWrbbA3mxiyIxJkcAUpKZo88Mq31pYGZ2yT9uJt6Gn7YJ44/z3LHnfHbVq4/Mw
	yHQsA/9uJ6XNeMx8ipM80a2P7ldqfMEq6fgmRFx2IO/3ezOQgK7OZCF1jZWYeBKmihXNplaMI8kqU
	+8JErMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBk-00000000Off-0BM0;
	Thu, 13 Aug 2026 09:57:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBU-00000000OT9-0dj1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9653260120;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35484C2BCF5;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=ZRtgythNUWuTKkqjsOPQzdBTM5sRjHcbFE1i7TFqLZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LqV1zZOhynyWbDZWJ4jcEe9Kk0eTXNf4DW5NBwuEGzjqFa2JEmr9tA5H1b/CBqGJO
	 htIaAJ5PU3Q67iEb+XlqnCQdlfM6B4OGuPuXvcehqGTpSI9qrxMf/JMMiity5CjAqV
	 uG8Xv6YT8B43D7yocFCVT3CMUH/ysLUA7ZI9iiSjLJvaI8CEq0l/75fj+hLZHDhQTN
	 tA6om1ttnNLdXP6K2KFjhHAYZJbWw4MD6CyQO7zIQxSEdcoqMAvdDixNoo9nb4BX8r
	 NEpscYnkfCw/zaUJ/rGOEOMX2hyPm6nobjrL63iPXZXeaNIMzdZNIn9zYXOrFKxXq6
	 3dMjlHEdJwTkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16597C5DF66;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:13 +0800
Subject: [PATCH v3 2/6] dt-bindings: mfd: syscon: add Ambarella CV75 secure
 scratchpad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-2-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=887;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=7UUWM+HfbNQWDCef0OWKCQrG2Or9h9Cimqi3CyH0cqU=;
 b=B423N+54XHdjRnfbecFiazdfTgyW8mpLgkE4sCs9bmJOzhzyjTV6tukI2rcgCtP2596aLXAn1
 Ozas4RbMAmnBCZuLhbeJqO6PiEQgVC722bDWBGL8ViNJb8llFo0pDKp
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Allow ambarella,cv75-sec-scratchpad with syscon for shared secure
scratchpad registers used by pinctrl pull configuration.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index fe882d3f828b..9ebf702c06f1 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -32,6 +32,7 @@ properties:
               - allwinner,sun50i-a64-system-controller
               - altr,l3regs
               - altr,sdr-ctl
+              - ambarella,cv75-sec-scratchpad
               - amd,pensando-elba-syscon
               - amlogic,meson-mx-assist
               - amlogic,meson-mx-bootrom

-- 
2.34.1



