Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9820D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BS5FmWPL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j/0qPl8+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VhRlbpXx8Iat4T8my29ywJmXCK35kE4E4jvMl2k3ioY=; b=BS5FmWPLonY6jB1P7O9cqB4wUM
	eDKtvy1og6jrhuhL0P7JRqPEpJNTpb70I8P7vhMg5RgLwvBaMAjPA+7NVCYacb1wmUXaxKv3JgXb8
	sGFl8I+6duymfVKTVJYvCCzZFl6h5vN3PGbJmzryBqcExAUCl41Mi73OMqRntNLtGNJHbqwxxBtZX
	R4ZhoHybPxw7O05ACBub5mYllnhYywyFuVNjOjrbZ3sh1/mAIOo/RIxlEs+IFtZObEPCQ+uNq+JKO
	nMb0JuwYpsUqVKYC5lIBBkNONj9bPs7UqIY/dn2ecLlciFzmx4lGsFYTEFc7CENqA50F7SmnpkX2W
	R3EGD9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0ik-0000000F2Az-0X8w;
	Thu, 22 Oct 2026 21:53:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0ii-0000000F29C-2fj1;
	Thu, 22 Oct 2026 21:53:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE309602C3;
	Thu, 22 Oct 2026 21:53:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705987;
	b=2Llhf9kGFOKcR5pr0eipqK/lhxppnfkFeqkrrMB2y86kW3Em1erZ3oaQ32/JZpIe7qL9
	 9SNASWEU5z7Jrcf+Odm4UgEmulXVRUNARBpnAvN56TylCxvchLmIDlfq+RB09Q4z8ZjiI
	 sGMHBa10MDDUvpnJEunhIvAOGzrAT+s121OsTtIr3PHyn/WZDGV3mqCWuQL0pKESuv0ax
	 otoAqc4LxePDyF7BSK7otUO+Oq3dk6X6PHfErUOSQ3/XKt46wMjh0TqDDX8jhkqIqL+Yp
	 qohgcl5JaAc0Xo21KTghtW4s6Cr1Vc91P3wdtd3vDjy1KS7Q+tBqUOQlpe8Q5HGF/qA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705987;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VhRlbpXx8Iat4T8my29ywJmXCK35kE4E4jvMl2k3ioY=;
	b=YYBuqNHgN8xf2KwVQEnXFwzE2fdxn6B1Axru1IRORcrHoSyqxFbljrrHvVYj/gtpAdt1
	 eKWZlMIC3eVmoMz+00nVUDZ7uazCOp7DEkbkpYSPm+9m1Uzqr0Kx9CjmG/fOMt5FVz44e
	 4fOTUiDCiRoHGT2RMyzdi2Zn9yP6vOvdC2G0aO3EhS09EI/nuvy3C2S05AUip1XGodcuX
	 HUYziiQgPgAA/Rq/HhpHznhJ6eDbH/GyEGrBJy6imfWYyLtmPs92j78X+8EaRpUyhwiXh
	 bBhhKJPs7Qir1fXL5vBVWqbBeq/ctwhpT0rklOQIm5fSNTJ+gexMV35rs0GkDH88bdg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B2BE1F031E5;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705987;
	bh=VhRlbpXx8Iat4T8my29ywJmXCK35kE4E4jvMl2k3ioY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j/0qPl8+lPkvgaupVBWhyHl0+o2zC69HtzLsajis3Qv/7dz6SGLb+Iq/xSQTpH28m
	 HNtzYVz3D5lbIMIJ0BSJnhz1r0ekRsXLbDTyu7NZttE34jBdTEZrd9u0Se20aAUMPv
	 8nPV2g8joK99cXN8jSB3/b/JsR7AjSVEY1CTbtV5YarQP4VAx3ZipgXPMYIpIC87vQ
	 iLbPDmKpw/5YqiCZ9OSURyJy3i21bTLd9X6GEW97GbUej6qx8LY+qMekJSB3AF/ARL
	 SRpj0+ZknpV+ZVfKvcX1ARgI1h3agxQvkt7LgI/8J+t+QMio0EzFKorBq74EXGgyeo
	 KJvwVteJVwE1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D61BD41F9D;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 22 Oct 2026 23:52:42 +0200
Subject: [PATCH 4/4] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV
 clock ids for sm1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-fix-g12a-clk-v1-4-e2bd8f3f1afa@aliel.fr>
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
In-Reply-To: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=h5JtJvnbPtQe4PerBm4gkeO+nH6xIUrn66ppgc1aN8A=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1v2uJZNXTlttVcy4TEblF59a57Tb/z59M5wwpUfq2
 iRRtTkbOkpZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJ3JjJyLD/Icc9hjPx1dWB
 x2Mz93EVSKdtS07ue3DQ+kuh+74vvLcZ/jvXbhWyWR37PLly5rbJ64WfhkzYxOjkJHnNX/TQTH/
 XcmYA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

In sm1 onecell data table CLKID_VID_PLL points to g12a_vid_pll_div
and CLKID_VID_PLL_DIV points to g12a_vid_pll. So the ids are swapped.

Swap the ids back to their right entries.

Fixes: 3dd02b7334ec ("clk: meson: g12a: add support for SM1 GP1 PLL")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0a738c3c7fb5..e18cc151f4b6 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5117,9 +5117,9 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
 	[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
 	[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
-	[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
+	[CLKID_VID_PLL]			= &g12a_vid_pll.hw,
 	[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
-	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
+	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll_div.hw,
 	[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
 	[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 	[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,

-- 
2.43.0



