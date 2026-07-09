Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E667C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfbtgZL65NQ/aP4ZZPYW7iWf1i9y1+/TRa7DmydT0W4=; b=t8BNei8W7GjHhO9w80VsWCGUiG
	3LcEcFECLl1a7gHQuNycOl3/9FzUXSNjt3U+CWTN+wMbgt3wO1itQdEzuDmOx6dSNKb7W8cIVwjUT
	t+qbMdM4OoNS18YAo9fB+/Oslya5a9XFNc+/K8RJjBhfPrjF8+83wjM7DA35vIRr0ixuRuzYfiV1U
	hWC0EdLwOiKBsJy6sm5CIf+ro1mu3zi/Me6AHz2m4PnQzkrOK5DBvqq2K2KLvwW+cvMPTMc5eAfBn
	mB5tbTxnrTRlVU60fFOP70Pag2Y5bwWq00rv8dKYNmBKzghNWFeYAGlbYy8Qcyped7lXF2D0cjFSu
	sJzHcY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1n-00000003N0P-2aH6;
	Thu, 09 Jul 2026 19:03:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1K-00000003Ljd-25ou;
	Thu, 09 Jul 2026 19:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xfbtgZL65NQ/aP4ZZPYW7iWf1i9y1+/TRa7DmydT0W4=; b=Cx85ewiG15VZpUP6UbfC7d1hGf
	MXwYrdIzcco4Vhlc7qK3FrdyUy8I1i0e3jeFA1smqdprixkabKl/ySNbhsGw6hAuoZRvLvBh2+bpC
	1ShBVSJ2UJw0dRfRpdXFgD0WP5BuIVq1iw7LXjfDl6HrVwry5w+P0u9Zo6CSO/Y5Q7HxuwDoq8Aj0
	aeW9bbzefXKBVN+9Vaa5MihdCPgq2fv+QK51LTankpn6+C391ETuNFkcbjNVBNNBQrmKllEeiDYNs
	fN8ROOLDeumtOdoyjJsaMxVDbUBe1FTcQa+9FUc0JfZbqKzzKWFI4L3hwid41QxmpHdcnKT6F5KI5
	kspql84Q==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu1A-00000009TLv-2kXx;
	Thu, 09 Jul 2026 19:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m/9CFizStOD1UWne/qUFguTGE51YfW03w5rOAVki2A8ZUVdg9UbdR3JoMCM4mRWny
	 u6yyvjJeULXajmm/iPo0iAuAMQ5QPNsIKbpsxrx1IsIKG4sMaGdQ1Pl9p8Sivd9ayf
	 omxRn86158WQzcD/9iiDjUt3XtZA4KPfwT9YqB1BA+h/oQZNTB6uCCwXhTwPPl45oc
	 P81iXqkZpToER9X9ANcptJvLiEbr5cuUGrXjF02vf/W/QWdfh6eKg+G8XeblIhXR1+
	 tz8ECPRC0uIBYxwZL02k2mLZfkUUj+WUoY3li10FY80xXv7ZoFzkeVeI+JTHAiKrOf
	 xfeGPb1wKVyyA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE5A917E1054;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C691748006A; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:47 +0200
Subject: [PATCH v11 24/36] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-24-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R+wp4a0ifl4hTuF+Ym4MsLuNqY2BgKTHqs8rQ855wZ8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EXGZA3MrORiANWLjqcqc8KRqt4e7TfAG
 vVcKzi1ybwvwYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaywYP/1l6A6xG9VcJx+r6WDprElYlHRjkkmXzHaMPfOO35nexVoUFVOstmKSIqG6i3Ad0/Pp
 mbzDVP/CJAezMTbXMlAO3qLLglmodZOjnYhejl7BpsQkvpQvUUvXpRVbUH6MWzQLJsSn0kUjqNF
 7HW8fBNXCpsEJ9UAKgtxFJQCblLcCZ5TObgSLeEsKMb+QMENNJa2MUj31Jb8L8ffoWD0lH/rEiH
 fc4KI7NDyJ/a5hmk8LdiR6gAyxDyHGRPIr0Jt3vBBCOGLecFNeiE5WJgPDMO1VqhtPdj2WJg6p9
 eHX9/fiy9hDo2iLvAzr/mAM5a6dyCaAh4j05ydeiB5DHOursIrW8NCAHKR041LxX3qjA/WVtsq3
 DE9EWIqVKGoNd+N/M1iaQSkQHjOhIOnhovvcR4J5cETCCdJv/iLpS9HWIBK3WS/rc+r+jKlEqOn
 CCQjqSvOoYj0UnLV3J4M7uPapm3V3cDoBONwTTOvSp3X2a00Q2G2VJ12ihOpesBgr6FLcNbjFVb
 7av7tEpGBTFG265PygWfDHM8jHaJDMvJXagjWS2dlWzQQZRU8RTUQzcnunmgN9l6rQv73l0cfv0
 P5rluYRDsHJoAAN6Z/BA6x6B1cwlozkYmujrxvPNrHEFWG9rJVjc+uISE+cX/VZ6palEp+snJN1
 srnElBK7ZpPCwp+72GgAw1A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200241_196743_FD6056F4 
X-CRM114-Status: GOOD (  10.68  )
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

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a742bde7155b..cd79c5da566a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1154,6 +1154,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0


