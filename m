Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122F3C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB6XsHy8r+i6IAvkX7X085TB7ho/0b/vlulO2Z1TZSA=; b=wjVEIcpNz4RBt21rdXhjwe/+NY
	rX/Rr11JI7Y6cR1bOyj8hOJzIwZZWc0JWz+xRpO6B19H2emJx9u9PwQa9hAYgOSZmozJq6dDtQxoI
	gknBKy+0kmNOOYa0ldugc2Ibag2C4ZWmt5bAix5uF5sGnRvmmTU0TwYq7vWkRhAPP4dZBpEUxOIKE
	h5rKO7lfOo9zi5MZVH04S2hy7C7zKIQnFleDlZsAhwtMkQDKANudFYNUHaaS+JDSzooR4m/5t4p55
	wc+WqG8JOLDN8mIAyNsuFJAzI0FgdrqjUi8vZitd5s0JT0tng6telhe9P8SWd0x1D1fR0RebraE1L
	s3/hA/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOat2-000000042hi-3aDJ;
	Mon, 09 Jun 2025 11:41:56 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOala-000000042Br-24BI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 11:34:16 +0000
X-QQ-mid: zesmtpgz1t1749468653t1fe4a133
X-QQ-Originating-IP: Uamw/6x5U8w0+kK0fNriFhILhiB88ys8AygX1uwiwqY=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Jun 2025 19:30:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5652948970939848094
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
Subject: [RESEND PATCH v5 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon,  9 Jun 2025 19:30:43 +0800
Message-Id: <20250609113044.8846-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609113044.8846-1-i@chainsx.cn>
References: <20250609113044.8846-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N+ZDtxwW2zb5ikshhfMsrlyHYRW+PjCy6q6qQzE1JxmMpUMQspruBAoU
	c+C3EYzKmvSbE/lFyV4AcqpPhoKdKSxucQ+/cF6noc0ldmlgZGy40Kd6YJEVUHA2Ju/qoLG
	P7Hn7z5iDf+6MAYrS7ijTHBTlpynrMPbBJJcyobRXTcAgYY2oennuXdmwAuU8cnO4pkkTFZ
	+P4YnYc+C6WtWYwFfLhH4XoJtW4bUWFRCvqlhciKTVYDvrgSQYR1uG6v8awz34hTSrfemYo
	gtBJdKIe8mzKDrg/4t9GeATjj3r/kQjS69yTIOcARlxsCVi6N4NKKcf7lV1eycAbzxolnsU
	lVSWWyfViX7+sIjCmXstZfaL4FTUbyDGM7j9Ea9oCbQraq+hMYU65DpTZl2r1FTgtPRVwzJ
	S7tL47OW8O72ycOThPH09cSevcR8SV3HsGjtSDvQzgl7btzYTGP5b333Ww1DdACyagJO426
	AqxEkxQa23yga+0hiAf2nFifBwG8W9+Rz//qQ8SHZuxvUHmv+wdv9lVUNoFJg8X8lVnNDPm
	eBM/WMgud98EYcukmnSKKJjIYoJkAg1FzS1fQqByYDeHk6RALBL/iJuurBs9B/Za0uxG71m
	FIpMVfBE9nAY0zAGklmWFzG65nNqnp51kpcVmWT0Zhi267qtg8L7CIGOc6VhinBCerSbXn3
	PpnYvX2EriKOa7Jeb2MN0vvkGsM3l6UWCF+NCPUVTmMpeqC3eP11yofkoTyUVkNa9HVA6Ml
	2Ou78okyBp9va5Oy3DU/C5qWjJAopQ0xruN8DjmtB1wIQkacEKFqbBxBKwP6OzlD7Xh/oKW
	d9evW0YJ/wKAvHyVcPOs9b7HqbFfeA3X7e5GxdPiOlfwSy/7jcmwVUfPgTB+YjG/6Jh7N+P
	8WU0LEPs8mmu4eslBB7K94I4fWqO2xupUUKFNHcDihbWV03SiZtQb71E5ZG8Iq/4tNlohDp
	MyBSAUdmQ0JZRFKpRo0Q7yJ/ujPJkZyQSB45D6Z4/tDIwvPb/AwnnzADB2ezr49USGqVWxw
	nZxSOf1wgVAGRKDJqYJXI0SWea3XOmYPG+OYxX1g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_043414_947697_17A7423F 
X-CRM114-Status: UNSURE (   7.40  )
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

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <i@chainsx.cn>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..701d68aca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1


