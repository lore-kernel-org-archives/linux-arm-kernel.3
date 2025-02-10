Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BCAC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=t+GVWXPaHoZPiaIsbjN7p1yEdd
	yrFSDYr3ZebJQ30Znyel+CqeAub1ZrZZuAfc7Mv9qoWdbyL4wrvYvTLp1XlBkR99Lz5NA1tH4QsBz
	pJQn6NYaguvZtDa2m1BVjlXj8pE8usZ7HnM/DsFt5zEryPCA+Q7lU508TibmSuMP+p0o2sF9B2Q7l
	aGogWQbJ0EuIPZqlPhQNMbbRlGEwrb4uzO2v49vkyf8vByY9ulRuoXOOC3Ias9r57OKYalaOQwrkG
	EZw6BQn9pPmk784j1BWcs9iSVsuqeWlgzMV5IOGna5sJYJyWtHZADVAy0GVbYZ7fsFK2Mnl9D5U1e
	4kUnVWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdd2-00000001u4s-1qUd;
	Mon, 10 Feb 2025 23:55:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKe-00000001fNg-05so;
	Mon, 10 Feb 2025 22:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=I+KJTZ72axCzrHqTNn4iHtTi+k
	nbuQAVbHt2lmbsB0EMD2ivKUCsamWQLJkdAhtZjvoDklpT0X16YkXWtkF03L1l1lKWtyUoyx5JyKK
	JZ/KNCbcy656nJLkYxbfcryOHZs2fyqt7tEgYVT+J59vvcN9AkC9DZCnIMayCj7pRkOl5PDWPlnCE
	XOK9G7xIpE5PCDXnx+iUaY4k3oQXe5iRWLDEMB7eR2K4LVoefkn4JvOnYgNDQojhJttoUsqORcSht
	aFNjVo6BK55DhCZQMYG8TwUOmh2uWncmyXiXhAnqlhMADE464yuylTnp9rDkin9Z/d+nMj7Cpn6qX
	Kg75SZig==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKa-00000000K5k-2GTN;
	Mon, 10 Feb 2025 22:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=jVJznroLLXwS8UOrupccZJB2qf
	I/0LaWZxs6cLc7Kq98/Tjiwa7wOp3fA83fF5CaEUrPu0JfMgT9MnqGnGy9ELf7W0T1bJLwFT947dQ
	afkAXNPRg0XFX7fd723sV5o45i9UiUwA0UFtOTEpi/VrcRemR/tFsoCSVxgpoutYFw+WAhpgqmw7a
	v70K7hWD9b8vR0cGGxlKq3ms/Mx6Vx+USZyPH7fT3u4Su8924fO43e8Jg4MpAQZftVSFq66acwcL3
	Dac+q5Nr/fg0YEVB0EMRbio4L1WPlbvyBmYqLD9J3DOTZ39PEFUOTbtvPKiLTEDb03EiQyUO9HzgK
	d19LYBVA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKZ-0008Cw-CH; Mon, 10 Feb 2025 23:32:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/6] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
Date: Mon, 10 Feb 2025 23:32:09 +0100
Message-ID: <20250210223219.1193346-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223245_058190_56DB1BF0 
X-CRM114-Status: GOOD (  10.46  )
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

The clocks property correctly declares minItems and maxItems for its
variants, but clock-names does not. Both properties are always used
together, so should declare the same limits.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..3201ff8f9334 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -62,6 +62,8 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          maxItems: 3
         resets:
           maxItems: 1
         reset-names:
@@ -78,6 +80,8 @@ allOf:
       properties:
         clocks:
           minItems: 4
+        clock-names:
+          minItems: 4
         resets:
           minItems: 3
         reset-names:
-- 
2.47.2


