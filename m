Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523F3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owmp13+PRVCZr2KaoeYEeTrebxFfw3J5vKLj7UHan04=; b=EwAg/E4RtJUP72XD2LzEDrUQQ/
	PFj/PZJCJ/MKYJ/KyfgPm/lKuK/vFwtqVsbjLmpUcYsY0dEHEFdxL+HDg5EuZ0Vx5/6l62zsQGiPm
	eFtA4SBS7tshfzhEPqG9jkuXSkYRq0keUkEIsTECVf4pR+JNd27ls8SK9h4SWjfEC1dAZHaLFJkSj
	dZAzTFBzBo+Pa5vty/X2Pfhr/sUfBnGSo45oyXp6Z55iltzMPQIdnqusUdXUrVyRQcpeItvJply5G
	FawyXWWNGPx4RpcS/HwpE6LxPiqpD3TXbIyXe3D2WgRSnbtJykrjORdz4a3Fhsi0bSEf1Ns8LAn5D
	FRI7GQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjb3R-00000001YR5-3z6B;
	Sun, 16 Feb 2025 09:35:13 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaUP-00000001U78-0Ywp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:59:02 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BCF3525400CE;
	Sun, 16 Feb 2025 03:58:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 03:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696339; x=
	1739782739; bh=owmp13+PRVCZr2KaoeYEeTrebxFfw3J5vKLj7UHan04=; b=s
	WmTcfZ/SsOfclXqbYUvfe4zWNtSZmjk7RMQWqZJ9Zu94zjKBNPUR72qYS07bGvJa
	sW7u4J6KvipTBMKs1ht9jOGh+2TZBLarnYWb9XFMHO33xmHy2qVCSQEGjA8mIXfh
	W5UQsa8YXJAFrPeTLNcU8HSo2Q+4yohpVtyPHihKNsRTXuPG2N6MkpdPCQr3HVxg
	Cxx8qv+yxB7l10JmR23fwivK0Slr6sHc+I1bE4ZpAk+DDSzTnb07od8XTOo1b8TO
	H7trhqNnYDWFwJq/cSGkZCIkh2yscnhoa4I//PdZ7X0Mfg2YscgzcT+XvHtx1J+/
	/u7QA28g+7iUrjBQjTpAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696339; x=1739782739; bh=o
	wmp13+PRVCZr2KaoeYEeTrebxFfw3J5vKLj7UHan04=; b=JoBJeP7/UhgDnU3I7
	4c6Z9oiZEA2MNqtwfb/mSoSMebDTTj2jZsKBu1srSBXowwY/Bl5Bflc2EQr/OcRJ
	bHSlRXwIRn/jewbGQdK+FVAUbC6Ow6avLKpyhCXmiRMKKDw96CLNlaBoqZA9tRPJ
	3n8nhKWrNM0A+yPFfUU63l/dY2Xkw/m0TTHO/lmm7xgpB/Ga+/HpYIqarb43puh+
	Q/qCWjzED6S8ZuHJFhircn+KEFioR/8INjvupxFGfwmyhmEG2R0jfHg2Li7X8Bdz
	W7xRJRLwJjIxCHmcypoqWQjcQRgEafKlMfrVyLDKa486R+SDMrGKqvPoHdOzMwjG
	lMwgA==
X-ME-Sender: <xms:06ixZ74J_ixMhdqEBgp7gQCtZA-IQn3XMq-DAd4uYakcBjPcdo9Tvw>
    <xme:06ixZw72CGybr_mTgxO4kCWVkCTSG-llzPdQTV-6BxJ4WLmYnUe99EISfWSEgEy2P
    0Tc0JwNKKOgvA9D6Q>
X-ME-Received: <xmr:06ixZyewKf0SRNqAcHYkIEuubtHQ9KEJpftekhWCCVVdQqLEsGpGg9SbjPTKQJoTHvcTX_cev7rMRp74UFDgfVMrSe9n17tPdnkoREi-J-qm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:06ixZ8J22rm261CcKnR8PDNAyIE2hc8_ZmzGRkXFTMahlkWsfVC1IQ>
    <xmx:06ixZ_Kg0lum0M2ohhQy63kR49yGS8iK6DqgZQkibS7KiAS_PD-ITg>
    <xmx:06ixZ1yPRhHCWS86FeoYXGZrKzyS0m4YPHdx01PveRqlskrGKi25iw>
    <xmx:06ixZ7JDRSO7oGmgdXMho5H5v3w9f_rwhz2EdeyC6Q8X1_Hzv1nGNw>
    <xmx:06ixZ86xxvXNiTqAdFRNR5IQ20qLQOEY-KqEWclsYotFi2Pv_Jsx0utW>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:53 -0500 (EST)
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
Subject: [PATCH v6 26/27] drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
Date: Sun, 16 Feb 2025 21:50:57 +1300
Message-ID: <20250216085432.6373-28-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005901_261594_560BA8B0 
X-CRM114-Status: GOOD (  13.08  )
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

Like the DE3, the DE33 has a FMT (formatter) module, which
provides YUV444 to YUV422/YUV420 conversion, format re-mapping and color
depth conversion, although the DE33 module appears significantly more
capable, including up to 4K video support.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun50i_fmt.c | 21 +++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun50i_fmt.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 376a3c9b993f4..03d5d7132d1aa 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -51,6 +51,19 @@ static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
 	}
 }
 
+static void sun50i_fmt_de33_limits(u32 *limits, u32 colorspace)
+{
+	if (colorspace == SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[1] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[2] = SUN50I_FMT_LIMIT(0, 4095);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[1] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[2] = SUN50I_FMT_LIMIT(256, 3840);
+	}
+}
+
 void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height)
 {
 	u32 colorspace, limit[3], base;
@@ -61,10 +74,14 @@ void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height)
 	format = mixer->color_model.format;
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
-	base = SUN50I_FMT_DE3;
+	base = mixer->cfg->de_type == sun8i_mixer_de3 ?
+		SUN50I_FMT_DE3 : SUN50I_FMT_DE33;
 	regs = sun8i_blender_regmap(mixer);
 
-	sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	else
+		sun50i_fmt_de33_limits(limit, colorspace);
 
 	regmap_write(regs, SUN50I_FMT_CTRL(base), 0);
 
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index dd6816c90dfcd..e15f9803b3574 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -9,6 +9,7 @@
 #include "sun8i_mixer.h"
 
 #define SUN50I_FMT_DE3 0xa8000
+#define SUN50I_FMT_DE33 0x5000
 
 #define SUN50I_FMT_CTRL(base)   ((base) + 0x00)
 #define SUN50I_FMT_SIZE(base)   ((base) + 0x04)
-- 
2.48.1


