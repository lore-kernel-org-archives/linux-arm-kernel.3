Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E681C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvvdDodrLnIavxk43AjnGgAOmbOYW9Z/Zj0W0n2gWow=; b=w8cB/mPzJZStzdM6zvDXIdvFT4
	g88LBq0JLo4zkPBI0cY23zBSu7ILd9cfm+37nCR3Xaiv7wqmHus5f561lGYX5DB2Y95FIqafXGACq
	zqQjCVeXkOkvzLVAYYZEVkECzcViB9DovAEfxQlEmwEMt/aZf7K2Yncma0ujeKRtGDxgz4KXscqHG
	D9rV4RLihfitKUpNR1k+K4Ke3fJtJbBg/PYAmNVJ563eiPvWwCQcsGLWlehdMGgrysGN8rGCApY8V
	GcJijAkQeJbaFVbpfK/FKUBluOBd0B6vbNGk5drloSiMgknreN49HGH3NSaBOLRZr4sggg4UomX+n
	7Ogbj3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvP-0000000Biyd-0f3Q;
	Mon, 10 Aug 2026 12:16:15 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvG-0000000Bijj-2zrw;
	Mon, 10 Aug 2026 12:16:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3AE4C0518;
	Mon, 10 Aug 2026 15:16:02 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364164; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GvvdDodrLnIavxk43AjnGgAOmbOYW9Z/Zj0W0n2gWow=;
	b=Kod5Do550IVo7LWhEaB8L2sfV2wNaEScyjaGkk0HvDWI+D2Nwn9PG2gA+CsjT6oacLEh/d
	wf40NxixC9QkyWCb7h09712kDvNPdbL3HEcUMjoDCzpC2JZ/1TV0hq3R2kuA5ZsePXarYF
	SLvui/daxQaezMenAriTQI+WhhrUabxiPmvY41/MrSyiiRQunVBcnT1PJ8ZvrxznY2+Rvn
	vGMDUaCUY+BKXmJK2PDu6sF3bw/gRN0oaRvBcFKoXQ3sSnC0W11E5GK9ZKNT5gubmRHe2q
	trhbT0mH5yJ+d9kIceiVnyAk54bW59dHYJ2CHrbjHrX0Ad1mYuvG2zk7sPEIvQ==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 11/25] dt-bindings: i2c: rk3x: Add RV1106 compatible
Date: Mon, 10 Aug 2026 15:11:02 +0300
Message-ID: <20260810121121.210040-12-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051609_617711_26E22971 
X-CRM114-Status: UNSURE (   9.40  )
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

The RV1106 I2C controller is compatible with the one found on RK3399,
so add the "rockchip,rv1106-i2c" compatible to the list of variants
that fall back to "rockchip,rk3399-i2c".

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 91805fe8f393..725a58a35df7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -43,6 +43,7 @@ properties:
               - rockchip,rk3568-i2c
               - rockchip,rk3576-i2c
               - rockchip,rk3588-i2c
+              - rockchip,rv1106-i2c
               - rockchip,rv1126-i2c
           - const: rockchip,rk3399-i2c
 
-- 
2.47.3


