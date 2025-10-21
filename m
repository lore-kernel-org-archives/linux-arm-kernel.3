Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D53CCD1B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP5GZTY+6u3putkH9wiit+MCCXjcLlm9TffEsIJtyyg=; b=ge8IteQbIyL5q/s4DudDY/CrZ4
	UQcS5mzRwc0Z9QPI6eN5eGOFImoIflqlgFDpEcI9wa1anYTkKMCJ5fHj/+yDktMawDy3qj9iOYe5G
	UJtZtuejdduElj2SkhQGKIaiwYVQgWZVonbD3mgu5kjatLmuMgBKYASqeW7FTMlfhxxfkDIR4FBbl
	E0QUYVMj776dUkel68D6r3NEHtFkmyCVCfszT6S9qocNghxEOo7rIejPPPBm2/JEXqJ/crzMSeOW6
	VkVBxlUUqvVwuC8KbElPpnTduTHFGz27zX3oxeC+jVXk1/kRRB5foyBloI+RCI2brg4hTOZy4m6SW
	5XV1poZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71o-0000000G6wZ-1IP9;
	Tue, 21 Oct 2025 07:43:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71i-0000000G6nk-1PPB;
	Tue, 21 Oct 2025 07:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=AP5GZTY+6u3putkH9wiit+MCCXjcLlm9TffEsIJtyyg=; b=zzlF/GQwOQQvsH29acgbHn7dAx
	ACbGisNDNz3tl3h2hrkFyVvLWA7oGx+H+Mjp9DE5lsHALp/RE3JLcsKaUW0c41i9v1/4crFVVedG2
	AlMSHCTLWmg0ZUJiaGLcwNPRcaW+pIXnCMdDKCKMjz0bNglzD62Dy9PAE9AYVWanGk4uF3AsL08f9
	MCkKHHAX6WVwftxB2eModVhyUOeW9OlIqjeUIJljygAa8bS7J7I4H4CN8alGbp8VIRwOlTCk95b97
	GzbLFTjxfpAMAwe3p1gEhed5lRb6+VwZJGuv+dES2UvxABVI9HXUFrUFAevlrxM54coSPlW7qmrR/
	AecrvQkg==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB71M-0000uy-Mp; Tue, 21 Oct 2025 09:43:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/9] dt-bindings: display: rockchip: dw-hdmi: Add compatible for RK3368 HDMI
Date: Tue, 21 Oct 2025 09:42:46 +0200
Message-ID: <20251021074254.87065-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004326_386577_FFAAD755 
X-CRM114-Status: GOOD (  10.15  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Define a new compatible for RK3368 HDMI.

The RK3368 HDMI also uses a PHY internal to the controller, so works
similar to other controllers, with the exception that the RK3368
only has one VOP, so there is no source selection needed.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 9d096856a79a..29716764413a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -23,6 +23,7 @@ properties:
       - rockchip,rk3228-dw-hdmi
       - rockchip,rk3288-dw-hdmi
       - rockchip,rk3328-dw-hdmi
+      - rockchip,rk3368-dw-hdmi
       - rockchip,rk3399-dw-hdmi
       - rockchip,rk3568-dw-hdmi
 
-- 
2.47.2


