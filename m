Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F94C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy41rL2C99WwqbzsGdokIDAJtd++SsNXJlNToXkn2/E=; b=NKM17lGitSM7OVqyxurEVGiPTZ
	vPruD04SxSIpg4BYXTy0Ps3Xj/yLVFG87sZ8DQ04mBa56AedsqarzCpEWMiQXO+mcUj+9FSLXKY5y
	4pBaPXZF0p0J3r/SM67HHUrRFqxuX1uPjf/bnbA8TfCKQc4VZu6WaIVBovMSHnSQ98iFDOQI6ypeG
	zE9DJL86NG/ahKGIxd9LAgPcQ5hyHlaE0HK9QmGWrLOmJJXEK2JX4y54ZtZ67fLFFyZS9xEZqYNM0
	RmKSTJc0A7sE1niPojoOrQPn+Xzl6YQgAeKsSzO7msNvv1cfVUhJeKhsZjsaPAM29SkXYx/pz9g2s
	lcmefxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6aAD-00000007wdZ-1s0L;
	Tue, 15 Sep 2026 20:54:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6aAC-00000007wcw-2mQF;
	Tue, 15 Sep 2026 20:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jy41rL2C99WwqbzsGdokIDAJtd++SsNXJlNToXkn2/E=; b=TZ00tv4XFmR7I4kIPFoClMMbWb
	BCOUcanvNPQP/rf0wwDJj1nRCrL0EhpHCdvTAk3WJiBMyT+vvUa+69slXbD18tOTiTVPEdYz9oa77
	G1Wl/Ovw5wIcvYfAtLz1u1lyD/+rJL+qxeINe4NCeOQGQpf6KoWc9kYLC9mE1k0Ns0fmAbd36Re96
	6QIAkT+h/WHwg8x8hZIg9gQNH4Z4CYe8lt1qHEUX2aqjF6k83EOPYn3C9U2s+SlF1tc8R8LPGK580
	Y6csHkgLDhVAd/P1wd3/QrpVlpQjecgylkbFFfAI5WWqe5lEQL21GJZLYN0OKv1uHhhE+UyRgEVtd
	N4PyDbyQ==;
Received: from fanzine2.igalia.com ([213.97.179.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6a8K-00000007FOx-1vJy;
	Tue, 15 Sep 2026 20:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=jy41rL2C99WwqbzsGdokIDAJtd++SsNXJlNToXkn2/E=; b=p/3+iy6RKWR4fabVY+veX2qDX5
	3M6Mi0mDKUOLqJpVxavXxhT5TUBzoqRyOBfPQSvY9OdS4qwKr81ni24bLEnwzYXfgYygDKrEGxJct
	25nzHXBtAe13aaGZhgGt5jgwgS7x90RNlwXd/UpsHT1dIQLgP/wC2cUGVU53dCEEPhxaF1KqyqXLX
	u2BmjNKSXeEIUK6BqBQzN0mReXSRbLFLqkHhV0/r29t1bb9OyT7mOQNC4pec9leyev8TTRi6zDXWj
	X/N9ocs9CoBcGaoE7mgLkJby8uxt66PizPofzNZ6JU07/9Lan+z1NGmfX3bKwLh1cA9885wBBviaY
	wqxBE33Q==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6a89-002dV8-2I; Tue, 15 Sep 2026 22:51:53 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 15 Sep 2026 17:51:27 -0300
Subject: [PATCH v2 4/4] ARM: dts: bcm2835: Add the V3D reset line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260915-vc4-reset-control-v2-4-cb3a25b07822@igalia.com>
References: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
In-Reply-To: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=dlVUl7bzR8j4uxgKwkmLFvf4+0M2KU8ullpBi92dtio=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBqqa/Q000cUx/ZW8mpeb8DDfkPFYfpnTN4W9XSh
 LhU6EWLAtqJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaqmv0AAKCRA/8w6Kdoj6
 qqJeB/oCNt+zDr+CHDkq0/Srg7hMhDTiOysPGHI+za99lJDZgxABoGypT7fK8AxOghIgr6pqnTr
 Xa0OH1TzG5NWGyhNo2/h4SS0ExyFkj/y8nzmx5lLGRvEfrQVDZGJp2SeRBFa2if/ie7H/3MupzD
 g2Cbb8ryaLzl3gsNJcC6cACX+bIpSXjXlHrNxhj+n1GEREMQij5jBbLBeprKPXQIIYNFsoyicMa
 ao/wfPVPBR3aX5oGL1ZbnD3pIZacL7PBzO4f/u5Hs1gairAfoz5/W+VC91PQybMuSjwMs/clFI4
 JltT9I2ZkdYQCyfOUgl9Jf5Gk5P10y8zlQGGC6jMrE7wlCk6
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_215205_625387_389D7A74 
X-CRM114-Status: UNSURE (   8.96  )
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

The PM block exposes a reset line for the V3D block, which the vc4 driver
uses to reset the GPU when recovering from a hang instead of forcing its
power domain down. Wire it up in the shared V3D node, covering BCM2835,
BCM2836 and BCM2837.

BCM2711 already describes the same reset line for its V3D node.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 1e76b290510d..39eea8ce1058 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
 			compatible = "brcm,bcm2835-v3d";
 			reg = <0x7ec00000 0x1000>;
 			interrupts = <1 10>;
+			resets = <&pm BCM2835_RESET_V3D>;
 		};
 
 	};

-- 
2.55.0


