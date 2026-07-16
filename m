Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CB3C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KhL0KmzcFeARmVX8+nTR6jjKXcjGEypB7mMIckaDGw=; b=lSnxOtdoz6F4D0GvAwW0lGp2i3
	eFjwXYV8vClfu4s3tB8F7kiIFantAoeVGViNOtQjmWKPK4oUAl9zorGZa/tQUcdsMnp9qh8Z/obOl
	51mwR28QuGEUaVNoYwg3JKDoR2jTkl3YUD+O7z3dNdFejO9Q/4ETh1jz+t5P/mHUOHodTx1gWEiEw
	nYlzVBfH+blhWUNY9y6VsbwRaN2JWr0rUNJ6oKZ0YLUyC4wIpfZpiXQlYLOM+527Sn96YxdQi8nJg
	MBnsTQfjXC7IxflwzSvkNiup+q5Ub1/hgB3Yj47RSTBfY6cjgTPY2WJgWrxwCaJZKamkQ7abOClcM
	48JL2+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP7G-00000000Bgy-3syM;
	Thu, 16 Jul 2026 16:39:18 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP7B-00000000Bct-0mGU;
	Thu, 16 Jul 2026 16:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784219949; bh=4KhL0KmzcFeARmVX8+nTR6jjKXcjGEypB7mMIckaDGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tGl3+RRBkwzBRO88UhZdLJ+igH6zCHOCQL68ARU+DsYnjTmnUNfmC28sfaRaDSCQf
	 HSE6X8/ghUtsfjo0En8E6liPzavyRffrkSK3RSnIWR8r0lUWiv9HVXR+8VSmojtsHu
	 MtxLUoP/btTGoFKJbqLwQ1T7Wl6/nSADOiJOjIfs=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 9B93789D; Fri, 17 Jul 2026 00:38:57 +0800
X-QQ-mid: xmsmtpt1784219939trq21joq2
Message-ID: <tencent_0DA92AE62C08A802ACC4FE9E47A0192C8E05@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb56NOAWwgtaM106BhHiYbXKGj5x0k15zUEYwl2jP3QC05B/DPRlf
	 v8xk/Rds3t6Oixc8Qx9CMph6z9Rcw/+nBHqIaWXycI0j70VMjdgSSZZv655t/pMD7kOrqAqiYju0
	 695HbvwgytCG9CBH0mTj4segZsHX5wY5Jhs2URDUb/dHQRLTQmfLG0KYoglbezKQd4/CBN+SeBAM
	 HWnqcPtj3Y9zHNuLI9lZ36i2pe8B+z7doZBP9RLly8JqNN6VpZBEbINXQW/L4UesOudZCtBKuDQf
	 kTgEmb2T138zH87NxWZC6rzFQ/tBY1cfkhqAI2g0Bwa9yL03CzU7+vd0XkyIqrnb8lxaMjgD3w3K
	 2GN/mUk+g7IxU22hhEK8nWKlDh8Mi7zRm/PJQFaEnFC/0YhwLHSQ9ZSpDRYMiMPkmsd5JPt0i4pR
	 joTiqQE1fQvNd00VFnG0ZIQ2peyYzhQiKsdh0kmZ+XCOANfTKKqY9y1o1y98uYwhshrzYpTRbWqq
	 O8qv13yaRP9hC/rEpHa5mw9g1mAvkoX+GdFLcVW+jGXLb8v3k5T7p8ObQX9iQUQzBVZ/fpVF7zzT
	 M0j/2kkeWSvop11Bih3Vv16SZF2a11x4fpCzmWlMj3JUTAvJqK+lBinD0DFzmUM2lfCBVdKA6pso
	 HmaFIx1xH5jVseoJyJt5Yn51YX14q6cn3GwV2HwjT3la7mk7eFVdjMYS8Qc8pQRwhLfgxxXkNTQR
	 4tVbhnXqd8fDiru0aT7c7bT5/d9F2gZD+hjkkFC39qJ0KMJ867fk8f077vsZhBpQwQ+vIzP9VzGk
	 idEumq9GD5ZxqLGuBI9zqGpbwoVvABjWXzlYP7TbZr2ui7FXbr+dNwliuInQ+sO1GePCqt+X8F+V
	 GAMt5HM4YIH6Pkujba9x8ZJOMUcxpS+jn/LICf7Hm016scKckz6RjoQbT2AAWMYlWnX17VsagOOk
	 vfTXlXjmGPC3JjIPvTs1UPPxyBR7p9vq6UazeQrfo/s/v8u9gtOdZITlQNh5iv1coCzJYjLjp2Yc
	 W5Ze7PTJRGSKv7dwXVLUnUua47+15PJ9VdUmIs8EzWCQZUvpUV2kws5vrMR3g=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
Date: Fri, 17 Jul 2026 00:36:31 +0800
X-OQ-MSGID: <20260716163632.418500-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705135014.1004166-1-2254650260@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_093913_534988_A80954A5 
X-CRM114-Status: UNSURE (   8.38  )
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

Add compatible string for the EmbedFire LubanCat 4 single board
computer based on the Rockchip RK3588S SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index aa66a15be233..44b005bc709a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -191,6 +191,11 @@ properties:
           - const: embedfire,lubancat-2
           - const: rockchip,rk3568
 
+      - description: EmbedFire LubanCat 4
+        items:
+          - const: embedfire,lubancat-4
+          - const: rockchip,rk3588s
+
       - description: Engicam PX30.Core C.TOUCH 2.0
         items:
           - const: engicam,px30-core-ctouch2
-- 
2.55.0


