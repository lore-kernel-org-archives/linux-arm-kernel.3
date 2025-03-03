Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D7BC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 03:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5wpqKJUmSg4bQV96jwM4c9cPSXvq7N01GUYeXUKlfk=; b=v38r7XaBI+9R1yDBkhEHdrPXri
	ZdLqeNB8g39oryxIo0nTqq2irYDCdHBJBsZb3MYckEcdM6QFRHXjjNh5jHUE7LO+eK7iBmV8SjZCa
	4nx+cre1LUWGcc27pVD4B8le/ucfRkHxoEKTtUtq513boK5sWPoQVXwwbtbbX1yyFYH0BrVEOy0k8
	DugG9usgrfFrWbDCj+qurqMmssFfpCqnb7YIaMhPO52pqoopJgHCWKWXa5Z9MZn84oS9idVCc4Fk0
	XP1f2Z9YwBMDrT6xtv8usJ2s+WxMcwo55PzHHfN6tSKFriwMqmIHcDYxq9di5z1ylgCQ4lSxdJyTW
	zXoiNpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towpY-0000000H74R-0rnp;
	Mon, 03 Mar 2025 03:51:00 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towjp-0000000H63N-084E;
	Mon, 03 Mar 2025 03:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=x5wpq
	KJUmSg4bQV96jwM4c9cPSXvq7N01GUYeXUKlfk=; b=CA7EffsLWpedAONWrpiKw
	EGFJh76138yfLmZ3tK1S4h7TKKMsE6zWfHm/znJ5gFtpUYZKuc9R5GUdm5RzivDz
	MbLgduQXrf33Abzsuwc1UHGEMqJAvBtq+gtHSlt6AQydtxt2H/LHUiBNkZWJ9IzQ
	QPADEAYo4KweVp1pWWGjKo=
Received: from ProDesk.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC3Oc2lJcVnaJliJg--.43523S7;
	Mon, 03 Mar 2025 11:44:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v16 5/7] dt-bindings: display: vop2: Add missing rockchip,grf property for rk3566/8
Date: Mon,  3 Mar 2025 11:44:19 +0800
Message-ID: <20250303034436.192400-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303034436.192400-1-andyshrk@163.com>
References: <20250303034436.192400-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgC3Oc2lJcVnaJliJg--.43523S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4fZw43KFWxury3JF43KFg_yoW8Gr43pa
	93CFWDWay0gr12qw1DtFn5Cr4v9F97Ca1UJFs3G3WIywnIgFn8Ka4agrn8XF4UGF4xZFWf
	ua1Ygry5trs2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jz0PfUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gMFXmfFIit2JAAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_194505_404440_CB308BBA 
X-CRM114-Status: UNSURE (   8.76  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The clock polarity of RGB signal output is controlled by GRF, this
property is already being used in the current device tree, but
forgot to describe it as a required property in the binding file.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v13)

Changes in v13:
- typo fix
- Explain the function of this property.

Changes in v12:
- Split from patch 10/13

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index a5771edd83b5..083eadcf0588 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -146,6 +146,9 @@ allOf:
         rockchip,vop-grf: false
         rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -200,6 +203,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1


