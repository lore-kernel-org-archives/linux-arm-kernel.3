Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AA0D78336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE9fm0BoN6PJP/Uod09n21Itfqjmpgneyl9iagTHkow=; b=419QVFfOj14TqLW8N8NpqV6WQn
	+r7Y2JRFaFcNuLE3PyT5Xn5QfuXF4QP3/JOidpPdjyAeSLkG2J1yVRvJaRg3n6Yu18k40QxrUoi4c
	XeDE6TTOyQlYWt+qGTKjtRFyMmqjf5JCyJAXIV2F2shwNNtMIjZ4mtgQjkRcwI8bgkl/Um0r0SFwv
	OzCpsX6TxbrzcYywbbijFJZerzYPTqUhHxyTwWm5XDzGkeoY+wABpHIqxrUJ8zvdV2tRf2VBlpI8+
	wiOhXFdZruq+XYYBjVJc1wmN9260h69Ed9gLsaDPQINCYKnWo6ieuMMpyJmGtf+nIyuhouZWh5zCb
	PsMcKIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9L0-00000006rQd-1zAx;
	Mon, 02 Dec 2024 16:31:54 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Bv-00000006pUU-23NX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:22:32 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y28FZ6nGnz4wHX;
	Mon, 02 Dec 2024 16:22:26 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y28FQ4Vwwz6tkM;
	Mon,  2 Dec 2024 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733156541;
	bh=bleGnqFW/nojxtVk6PiL3yVMjQJYewvoq2RILsSbpZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbC+QJwJsZEgxKRvcBKZ/dtuZIGsADG1JKUb82opxWYmvWFhaPH7ujnNmS33ZTUoe
	 Zz0y5/6dBL0GhQS/QDFdXNXFj0JJZjfkAiabZC/J5mGpKiF+U40aijxrP3ai72oiYb
	 zUdyLmI7GIzn8KuoBzXa74ZpWFd9Wy+QVLk65mkA5uVxjKsLfkUiHZAV0S5uaUEpxA
	 Q5ol5bdcvlUbLxnlCxlHAfqBcvl7Leq/ekd39iEM2bOFFxYOBW+NOzE34shfhTUMSE
	 Ow2/pSjX0rQxm93lGNFaFYJQ+2gmvy17GXpekp0PtahrAQpLlw6rib/723Q/6UesSk
	 NAp8JC2MR3QMg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v3 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Mon,  2 Dec 2024 16:21:55 +0000
Message-ID: <20241202162158.5208-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
References: <20241202162158.5208-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_082231_550525_BFA07FBD 
X-CRM114-Status: UNSURE (   9.23  )
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

Add devicetree bindings for Samsung Galaxy S20 5G
and Samsung Galaxy S20 board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..f15228d5c 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,8 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.1


