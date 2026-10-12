Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61044CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o+Wh8H2pwweiTuS3F6yQGK56k7KHqCuFGUKo3GwUZM=; b=SBFo5hsgZ7pSgI0lwsUiB/YmT8
	pHH+jNhcqgKq0OqSymor7dAr+Pu2zassqDjbAqdiuWPztgTEZOzWybuyrd/ojXhuO0hki9fRdiBtb
	CvSEVmWiR4XhbD8ez6XwWQmNJPKMtDJF5tOrrXPjwsal2x72EPxARtkFeSQdis48CeZHdXEsPItR5
	camun5hBVQuqGu6tgT+puMv98zKqSOZJqS6pxb+yUVplrYYOGgT9pBmtSERg7FWdhVBvAR4alURHv
	illQf7bUk6xkoa/X5h9c33IrrveRTBzy2HdCIVYii1MruqoFPARoUrDZE5f6auMSsXphLpjQNv/3A
	9T6sQq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaS-0000000ANmg-0oXh;
	Mon, 12 Oct 2026 11:53:00 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaE-0000000ANhK-3F0B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:52:49 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791805962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9o+Wh8H2pwweiTuS3F6yQGK56k7KHqCuFGUKo3GwUZM=;
	b=RbG02Kk868NtQmGAqNp8de6Qn5apIp6ZamXscVJCD9VqlhXDeE3K5juTqvoMNiTXIhhcpF
	TmhcNgHCOk5iuOavxmxbduHhUGCaw5ndvNKSsNo4r3YZYM/yf1Z0Jk3nSB86zooG6qvNre
	lPZ1dIDfH5Yc//sIvcNaNFsSwuceHMg=
Date: Mon, 12 Oct 2026 13:52:34 +0200
Subject: [PATCH 3/5] dt-bindings: i2c: apple,i2c: Add t8140-i2c compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-3-6c757966a99e@cyberchaos.dev>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_045247_078453_E0ADF0F5 
X-CRM114-Status: UNSURE (   7.28  )
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

The i2c block on the Apple Silicon T8140 (A18 Pro) SoC is compatible
with t8103. Add "apple,t8140-i2c" as SoC specific compatible under
"apple,t8103-i2c".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 641f24b0ef4b..ea4ddc838d86 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -28,6 +28,7 @@ properties:
               - apple,t6031-i2c
               - apple,t8122-i2c
               - apple,t8132-i2c
+              - apple,t8140-i2c
           - const: apple,t8103-i2c
       - items:
           - enum:

-- 
2.55.0


