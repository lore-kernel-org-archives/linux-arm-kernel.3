Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35F1C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlXiO3r5sfzIx3Xqv73ve4KoVoqUA+2PC09e+c2x20M=; b=w1KFx5RzG3jAKzSxWuaoveZ/uM
	nqhzhhNkNafNA/IxQa8n8zK2hh3rU+A7P30uYROMaRqcmcGnslz+ZkWEBOU3hn0oAHBbCLtMHRSZG
	kupWhduNNnPp56MF6gh0Z3hKvc69WOjZW8Lzn+SZhASMz/rkjBiiG5GoN9BtNa4hFCt0d9Ty58giS
	0tPkt8Jhplo0LLg5ITD+lc+kSe0oSRylnp0tVzZb+qwuVqYoy8jPi526138Zz1Txu+B4eOPF4Hxit
	4LkzrBZ6slpFhUubHmQtImtCumH5P1IjeVvXv4Aaxu61Aq6hNHo3oT93jXhPn5qt9FZ5yTTOrkHxD
	PJgIV7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W5R-0000000E8C5-1kXE;
	Fri, 18 Sep 2026 10:44:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W4z-0000000E7lK-3JM0;
	Fri, 18 Sep 2026 10:44:31 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A7564F07;
	Fri, 18 Sep 2026 12:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789728165;
	bh=F6TvpcEVosqVPYmYYk2zyN5vocsuBaY0vDUb/g4fM9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AnhH/oE2XOJ3Jhxmu7HdEKMMIjTcKMzZsrzIasIBLMSNJCv9a1rw2L1pXeSnEOMTp
	 n6mE/tLr3BZdQ0OVugoqrdxvGd3KB33cpBo8CdMP+6qZAiWZfztFctaBWT/KZeYnWa
	 X/ilA5/ogcWIMR7qu/AKEGD/uwbyfANa4JkzrXlY=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:44:18 +0100
Subject: [PATCH v6 6/6] dt-bindings: media: i2c: himax,hm1246: Use
 video-interface-devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v6-6-5e8b1f01be29@ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789728257; l=1278;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=zj0TRPd2r+l+CPw8KXOYUgmrO4GRMVVMAHrTLWUo4iY=;
 b=Hr6H/4uJ2Ofm5pjTJhZRU6jZzp9KXp8SsSLerp3e166U5M1d90/cFvvGs5guDRBlHx+joE/ec
 nf3mQVJ4lxnBPnrBMrnIqA9Yx+RgDsgC3UQc+I8me1Uv3ykqmv5j6Z/
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_034430_571358_70095C36 
X-CRM114-Status: GOOD (  10.49  )
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

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the example binding documentation.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v6:
 - Actually use the correct orientation!
---
 Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
index a65488fcc643..9994105552e7 100644
--- a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
@@ -86,6 +86,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -103,7 +104,7 @@ examples:
             iovdd-supply = <&hm1246_iovdd>;
             dvdd-supply = <&hm1246_dvdd>;
 
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             rotation = <0>;
 
             port {

-- 
2.52.0


