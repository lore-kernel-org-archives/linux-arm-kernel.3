Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65A260A2601
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UEpu14hW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wme2lBLY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=frkiuxk1Rd/ojAV2wzD+GKDvqPPCD0QvXjwcP143p90=; b=UEpu14hW4iaqYf
	44yuenFaQf2l4K9QVPO5vlId8iobgiEf1/sqtZGhrzN7xTw68iwZQU7h1FvCody6TugzsOrh5gkwC
	QaCj/Yj8+myUgt806alqLT7W7FyewMrw0cwyHJqfFGVhQDJrVEJ5qfjt0y2Q4t0nakHWx3fi7Elqk
	1jLrUutzPpUY0ega6daRq6x3q0Gxqn4RmaOrYpMNE4U8W/8dwdMhmOXaS/BIOywy4ocbybTG8kW2y
	6vTDtZE/+VBGbWTlhcFsHZ4hF91rMI1yBBQ2XPNBUB3JaWGCUSe7dacdXkFEe2TuzeOqxdfcJ3vSw
	BwYJWeFCMjiVpbv9HVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe2o-00000004FNt-3jvp;
	Tue, 27 Oct 2026 10:04:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe2o-00000004FN7-0I8e;
	Tue, 27 Oct 2026 10:04:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2407F601FB;
	Tue, 27 Oct 2026 10:04:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793095476;
	b=125/8ojpWhl5rmTZYarE3NI/jY4cd+FI0w3WjXv1ZLWi3LmYUK73WS6UB3ko3RE4Ot8Q
	 KrV00h6RS2z03pxugpsTnu1VBit3l2BhmCwb4qwHfJKwkiy27TOG5w0zFmrVnB+y1X4W3
	 AjyaX1IV/cxi1TekIbaENDq2JcPiLjuIdCbs5H0+rTVkvbJp18HlP/1JbAC5k/3WgYv4f
	 lrzl1kgdD+NTWYBbqloCmuUJaWdLaajImpPvpWGe6mdV7EaxPyg89gcOXF3xpQznU5Pqy
	 f1BFCQLVA4fLxMDefoVWS1dJByvycN15AVPDwemckoe0n3QzUYqtbRpnZLdaXMgKKAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793095476;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=frkiuxk1Rd/ojAV2wzD+GKDvqPPCD0QvXjwcP143p90=;
	b=1P1dQytgz2S2GEosvTgAiIKidwejJcu4yFjptfYX64T/vAmeNv9KMmxAOqEBlLkc0Du7
	 74opiCAAtUW/QMPycY1zSJoBnJEIt6vfw/dsNmgPPh9SsbAeOaWm651HukYcCQxim5hP8
	 UrNXFU/2vPPZYbf9HV4LVBIZPOfuHub0YZEzv0AlbzwCwriV5fjwzF5QKy6q1j3h7U8kq
	 wYB0L9p+EckJhDq42fS5LpmKj0vHhnvsbtDEkO7wPgr7B51LXCY/2e8usR0maxY7jgpzr
	 Wv7sGH7dMen8gdFMM0CFsExYnudWqveTFZMF79aFSqu3ymV20nFoBUCi6OZYA6nhASQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3783E1F031E1;
	Tue, 27 Oct 2026 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095476;
	bh=frkiuxk1Rd/ojAV2wzD+GKDvqPPCD0QvXjwcP143p90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wme2lBLYtx+C2bBWEwERRtFpQ2fzu5FB71jqFBgrl1EhBVIogKstYcKwIS8G/1Hkn
	 TlF4D85+RChhiTXKESQ5RbEPJNBxmwC7NlfKsUeBqVLleFnAZZyCS43BAyA6iCazRR
	 JPS5917AxSXz6fY++3vZ1Ma58fmSjA2wVEFC0Z5DYCMeZmjZ+MmOvFjCiln8OCQd9L
	 KBGlFe/YpCzxjhWqQ1Omi6gY9QtAl9uFdOa3uFO5OZkh7Saln3Lo2IcwdZIC/5Btw2
	 UOR+v1/Pk3NF9qSb4X6uN7Aj3kk2KonT5UYbHPTQJZWEGz4sEWMFw6/AB9B/Q1iqCR
	 NEoMwR4V99cxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BE4AB4507C;
	Tue, 27 Oct 2026 10:04:35 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Tue, 27 Oct 2026 18:04:30 +0800
Subject: [PATCH v4 3/4] clk: rockchip: Add composite clock macro with mux
 table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-add-board-ok3572-c-clk-v4-3-d4152b4fedaa@qq.com>
References: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
In-Reply-To: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793095473; l=1536;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=5um5DvzGZ7NXY6308q7TLtQUZ+TSSmWq3dE0E24Czn4=;
 b=bRl9Yy/7ZVeWKnKmH5RLeILOIi1gf03Y4ApdDA1CLMKA0z313KKKXyiz/z6SCWvbrSNOMNi94
 6eItUdvSpvDANAu16aOwONZWduPFst+smzxpke9U0qPV1AEnw/LG4RV
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Elaine Zhang <zhangqing@rock-chips.com>

Some Rockchip composite clocks use mux selector values that do not
match the order of their parent clocks.

Add COMPOSITE_MUXTBL to describe the parent-to-selector mapping along
with the divider and gate. The RK3572 audio clocks use this layout.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v4:
- Split this helper out of the RK3572 driver patch.
---
 drivers/clk/rockchip/clk.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index dce4db3f67b0..bc3a1def679b 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -871,6 +871,28 @@ struct rockchip_clk_branch {
 		.gate_flags	= gf,				\
 	}
 
+#define COMPOSITE_MUXTBL(_id, cname, pnames, f, mo, ms, mw, mf,	\
+			 mt, ds, dw, df, go, gs, gf)		\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_composite,		\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.muxdiv_offset	= mo,				\
+		.mux_shift	= ms,				\
+		.mux_width	= mw,				\
+		.mux_flags	= mf,				\
+		.mux_table	= mt,				\
+		.div_shift	= ds,				\
+		.div_width	= dw,				\
+		.div_flags	= df,				\
+		.gate_offset	= go,				\
+		.gate_shift	= gs,				\
+		.gate_flags	= gf,				\
+	}
+
 #define COMPOSITE_DIV_OFFSET(_id, cname, pnames, f, mo, ms, mw,	\
 			     mf, do, ds, dw, df, go, gs, gf)	\
 	{							\

-- 
2.34.1



