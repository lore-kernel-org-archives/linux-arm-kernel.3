Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C1EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYBv/+i3GIk26MUmqPTSy24bLE4rucWAN4A5Ks9ALXs=; b=xpKl9GwTfrzC9Z07i5qscY3RW/
	jVK/a18IMQF/TzpzL9UvbEpSBW6fO6607RRCbT6UoFx7W3jrks2vY+uBUqDXVmUWWwF0y93LhiH1U
	ixUXipWA1ejzRqWIo4OJIoEIZQSDUUDI3TiPCa17xH1R4ElV7eNUYGZHiYjMOPxQBw8galqqLDkNH
	j6jv+4dQMB8E6x/xo9gJhmPchll8/9VpFmzvEW4+GeJfRdekqxTdsv7WQMx7CH+qsZ5GApIID+F7f
	gVgPfhuSb4xP171nA6E/WW9yDK0JsrPL9fQGVNWPOJqGXl+Uc7aUpAkQts/faiy8oRt2+tSHXv6t2
	uxKFpOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lOQ-00000003RpE-2zTk;
	Mon, 21 Sep 2026 21:17:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lOI-00000003Rmg-0y4c;
	Mon, 21 Sep 2026 21:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZYBv/+i3GIk26MUmqPTSy24bLE4rucWAN4A5Ks9ALXs=; b=WNuBixipo40rF9i91lU4zlRUgr
	I4bJDOhumHl8KugfCcJZDTqTX2YklzpPObiu/IwKwzKr/XC0TgSUereau7bTSpp9ObSv8cv8IKSdU
	nMXEeKJ50/BMsc4VDouRxbV88kSMIgN9OkMU4N8ILRLK2+jXKDWbUFQX94vDPEj49ZRCBTivLOhgL
	zGjNnsXX+8W5oFqGgD0ltL6oDkuA9HbKMh6ogwZ/Y70b+KqfFcmrPdDvk2aq1jK+Z0nf89IvwkYKZ
	T26goJ+GgeYNVY5PIwMcZMCeR9J/9ZWVHdo9W76wUL/SBgMrqsF2WQpXZmY74b9++6Z4szVyD1W0a
	Qbvkp00w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8lLz-0000000Cpoz-1MbI;
	Mon, 21 Sep 2026 21:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790025306;
	bh=+lY5BeFcwV5FB838TAcxY9ito2AIXwIBAsYU2ILeoMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mKqIvTJ/sugvQXhTC8/kxB6CBZ5I5cDM25m2Bf2hrBH7gmu4eFyohrMCaNGvDvLcB
	 cWhSMHTSQ1UPOVKyun6a0jj3+vxSdrvAEjZjyyjbLjuXVq/Xxb+BsLT4T9gi990zZs
	 6fG6umLpV1VsTfCSs7P79z/CYAJhArU3CJfJgEydqOnfCU8G4B1x7cvBfVXau9KzRn
	 91jHb6O6OHlRU+f2w9C1npyg6A5Q14J33KdpYMnxtAiBVYmi5jCVUurs8nanm/vTya
	 Uy0lIxnDaKlcoLsLgMZpqN9UXbd7n+j8sURCbuPaulLFqS1XFvD40Cxdk2WA7qcbOs
	 OYkTIL1XO6i1g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9715617E09ED;
	Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 52352480029; Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 21 Sep 2026 23:15:03 +0200
Subject: [PATCH v2 1/7] dt-bindings: clock: rk3576: add more DFI clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-rockchip-dfi-rk3576-support-v2-1-04f847016321@collabora.com>
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JMwGtADsjoZugYy5kca2WIyyIS8H1fB5ycX9ZpgOJ8Y=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxnloifqvy9AhQN26uetADWeyOqzmmP2Wct
 u4nYUBzLv1Iq4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZ5aAAoJENju1/PI
 O/qazIYP/R/VOsf7acYrt4KZ3ThXy8nO6Fl2wJznbO6viavpiKYsJWM/oDs2U9sgE6ZbgqVB9XG
 HDwSvtCrc3LwjThSoLBTBqbsSzaEztULRi88blqHTes/kbDQc1NAY4AILwIPH2V15i8dS9PDH5m
 Q5TgWrop00jdkqaDFBkIJ7wmWTx+FTtjpVWdKyp5c4XO/Oxy0jyilRljKaG/lGGTGgBmx7MxmaK
 oe70ovVfVBwWSq38OTsAkT/2+GGdaKRc4NzVmRgEjd8+Slifk4bZHbf90NmsC77iNdMdD/6PJr1
 GfRc/X/qSFxGpgFaGFdjo7kXK131hdBulYrpEy90jGNBhOEPbpQftnnjFTPAlIMZ9klZ3ze0Uhd
 01oOLNPTnfvE/eUxzTaqwGx4Z/raKo14qfhRnXrjX6QVXg27SR9/5OSOkffhffVG98iOXvbtemF
 fFqLqHt2ZiXi86sbdMrlgbOGbXv7DItWrRIDx8TVNk6r6KZtV2v5Y3K6F4nYEval46wS9oDcaqF
 d9PNxJYNuRPjTA3DSL+oxwbNRCcGpDW7uZu26wsFYe89+/V7CINujP3ogdWd7uzSgKk/eM5jFwb
 y9oVj8GmRG8NX15OdfDKfWcuaPeMs7I8Z4k9R6O7e6Xbh0sU/iPrupEvVElrd36BlnrzwJ/72h6
 9bXVwvvM6UbazdkMwOBkwuQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_221516_969756_256EF8E5 
X-CRM114-Status: GOOD (  10.09  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

When the RK3576 CRU DT binding got upstreamed, some DFI clocks
were missed. Add identifiers for them.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3576-cru.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
index ded5ce42e62a..c5b74f2d8926 100644
--- a/include/dt-bindings/clock/rockchip,rk3576-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -604,4 +604,10 @@
 #define CLK_FSPI0_TO_IO			576
 #define CLK_FSPI1_TO_IO			577
 
+/* Clocks that were missed initially */
+#define PCLK_DDR_MON_CH1		578
+#define TMCLK_DDR_MON_CH1		579
+#define CLK_DFI_CH0			580
+#define CLK_DFI_CH1			581
+
 #endif

-- 
2.53.0


