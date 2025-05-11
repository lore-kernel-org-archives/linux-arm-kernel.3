Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2922FC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtwvmT3ILxwmenRSwnAPhEfiZJxNC6NRedG1CH+5ZFg=; b=KNM2/+5DFXnFXoHD/TKcChD7QG
	guRS6M4VUSLQmLs8h4vP8dwwGd3BN4YgDPivLaUMgn6J8FmMIUWmmsk5kWnNnijsvoULMFMGNtOmM
	zjMKJBzOOSxV/zA5WjOhftEVfjPf9f6dukPSXk9c1dcmPxnKjlDDi34yirOpL5/s6/D/1pcVSyR6g
	CSImBX3fWRpJTwGOFIhMB9Bo52+Kx1zOM/1x4QvWHHsIEGQRqeizOCpZ9E1gUBMEQ7BcVe8f/uIF0
	1JBy7Ix2dclqlNzIlOJ8T7+iZ3hvAlrg8SmIf94eOpnD7U7grg8uxEK1iu3xgAI+Q1vbgvj+3vAP8
	rqqup++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE4FW-000000076zI-38QB;
	Sun, 11 May 2025 10:49:38 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE47u-000000075xA-3VI7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 10:41:47 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB96D2540073;
	Sun, 11 May 2025 06:41:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 11 May 2025 06:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1746960105; x=
	1747046505; bh=XtwvmT3ILxwmenRSwnAPhEfiZJxNC6NRedG1CH+5ZFg=; b=p
	vtqAqrBk4TkBe7Jx9Uk+0zLZXG+eBlB0STdmOzNu3XCKSNie0uJb7W5J8iSkHG2H
	FlUSEHKC+J6djLY54m08+PjOZFMnoSIZwgsS+WtZxRXjtQ44sxY/lTv/h2iT71Tc
	acZ9c+sR/lNZ/XM+dJjEepqOtOPf3KHHkUJISaMwfHVt3Zn3Y9nRTVGXK2bzTIOP
	Q+dMALZb2/reUOTuWhsk3NGzkkb/4P4cFa1OXt9Yt4WuDIRC81GMshsb32bL4tQQ
	utdfwtoFIprrAurGNuhdY6pw5oNxdqg06APppdyWapODI/kQLHbuUl3PF/JfqZtL
	+bkzrWtTdOsQ7D53M0pfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1746960105; x=1747046505; bh=X
	twvmT3ILxwmenRSwnAPhEfiZJxNC6NRedG1CH+5ZFg=; b=kkNLWRUNY99wPOtW+
	7BCPLAFzCiCRG9b0WRdFaXAZEguW4vBuIRBWHf+h77XDf6YPT2zaKMOFAJwSdqQ/
	E1bWRq6q1brRWFMPxj8txnz61wmbWIKDzRS81AOt9dAsagAbAZooy8hroNgzm4pP
	QhyqRLzol7H8pBIyz+JcU7ftxJYx/l9BoNuYbXToXPSj5d5fjI6wxbmY6sk2Plpz
	h4NLLk+PWxe9f+R9gcSOCwxEZxpyJlSGpoIhbn9oJJpGIyiRK5WFXXvn3+lD9EaS
	ufi6vkJeb4ZynXNy3wXajuIFk8SUodhQ4b+/AjqN+y+R188pHvWIGR/eo0AM9BLk
	0djxA==
X-ME-Sender: <xms:6X4gaNBt0XBGDJRuqA-YiDEzpdjikpk4BtE5lSNy33w2MdKi2wuVtw>
    <xme:6X4gaLi9ihWC65GRBycPTa1TCFtSjGy6HKSWqYDShbnTZmAWG9kGel9Msns00Hfb2
    6d2WmR85Aiz9hVOvg>
X-ME-Received: <xmr:6X4gaIlvhj_hQ3XJhdz93ifjYmb8CZgrBeNfP6q5UCs6WfCUoGUxgFm38dSzN6EZVnTN4XMWBTCLo8SxiXPyfCxHdqGmQzGiwVLxVx5IOWHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6X4gaHz_obla813hv5iDa_gQUC6OKRTmVVMJzK4-MWpC5kAKeJZNiw>
    <xmx:6X4gaCT0FuA0sWHqWP49O21EByBnbSi1wEdj7cMj-YpORngM03biZQ>
    <xmx:6X4gaKbnNNPdIgOWhoLcWAjau5EclRnQk4mbQg55I2W8vZijn2hAgg>
    <xmx:6X4gaDRXS2kp6wO-kfOnCMAoUq3F1ZwZd5p9gCRTTyI1iw4trKv0DQ>
    <xmx:6X4gaB4u3FHfWYH48uOkZPHQyZj2MtGW5x7whyBs33U-TBhRn_a5ewa3>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:41:38 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v10 03/11] drm: sun4i: de2/de3: add generic blender register reference function
Date: Sun, 11 May 2025 22:31:12 +1200
Message-ID: <20250511104042.24249-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_034146_927617_401D04A5 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group.

Prepare for this by adding a function to look the blender reference up,
with a subsequent patch to add a conditional based on the DE type.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 7fe5ce20082a..43c413052a22 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -217,6 +217,12 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == sun8i_mixer_de3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
+static inline struct regmap *
+sun8i_blender_regmap(struct sun8i_mixer *mixer)
+{
+	return mixer->engine.regs;
+}
+
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-- 
2.49.0


