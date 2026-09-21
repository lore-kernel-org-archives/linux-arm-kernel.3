Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A9CC982F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=; b=aePcrpFAjIwPi7ayyBQuSuEwEK
	OXtjxZDeuRK8rrh5iUqGKESDcQq+11txeKARudm8kKYsSok6nJ+S5uhRfAW6TBa+5OnkbjjNVVVTW
	tQu8yo9TC9LZf2Hzji5FYF6uX1vuB9FGE8WmUgOddsIrwtD5N7Jz+7gmhtBfUE4FRvo2CBKysYCSP
	3V7LKUNv0XHRUO/FLMJTGcXuxZ0JevuiA5GedGGaIYSHHAfzRwqAAvjWa/wQARdtzDyt2512Dg7cR
	g4LFroodg+BClZonSb8VSa9eddG+yodZBAGUvZ72wv61+e8QTQ6NitaLftvLWKWxRzslV9303kWYH
	1k70SWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzb-00000002cXZ-04J6;
	Mon, 21 Sep 2026 15:31:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzX-00000002cUM-28yQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=; b=cQDlwXdaO9qm304KuLzfaarnUR
	THqBkJH5b/pHTZVWrPyxMuHCJU8HQHc2A5huookFmYab9xHllnyxv6fB8n6Kp8ihDOk39/0kWGjJN
	G+5cG4k0RjNv8WX0xRT+mvRrJkJFcLv4eQG/9A4TXC09yqWzIELFFW4xqJm1DqasSJj0/hv2dV9mO
	YpKmk6lIp0gMyrOMF0gjcvUHznyTpV9eebunoJXidKiWxxv6YV/Z2e/xQ1vMmB6uS1/n+RbCyHiUy
	zAIIsUmU7JeI8UwNFzW3BhHXNlODYcm5y7Pro4/whgxelKbX3qg6kLk0oJfKV7B9M1eyEHn4PHtvl
	DeR3c8HA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8fzU-0000000CTgc-2Wlx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:31:38 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633ecdeso2724378f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004695; x=1790609495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=;
        b=Ja6OeviSkMbcJMzfxSS+Z1e5ZnoQipHoWbcF33GIyvNXyHR3FI1TMzg/SM/mLr1/vS
         W5JNxYXK+Y9FmpsEBbvnOGqAeeipSphRjinJZ0FGJd7XcYMkinprSIuFpOZewzFJ1tW8
         JcByDuJxX1TRHpt/1zZW/VAJ9PZNobFB8+1e2RFTdVqT6ToiPfA0OXaAGFD6r1k9py9P
         9TrJ1r9fkE2iJoqRC6cG70v3ooRTVd0h7cDEnLd3m7PrqkFSxFT7kni02urE1uwLrkwk
         gZ+MnHTLBdIVUWjksmIwJDB3WJxY4Jqf4VIvstSJMZgW9TOVQgW+XF4wjDL3q/OQlgc9
         lKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004695; x=1790609495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=;
        b=XWfkq1jUrFzXTtqqO8Q501di+MW3RKpDzvk5sjBnec9ygmF0cLbmBAXAUg5s9NvO3t
         5Ba3BJ8dXidcQcmeFS7nEL989p61M/z009GDpGeXmTrwUJ/Hm75qsDGNvtKJVxqevkTN
         KcAkbi0URRpugXSI7oFgu8vaEF9UmE/tyLgtEv2L69/uoxYJIoNxYrcg2j0eJPLL5rIt
         ylXyW2up8dDiBhNvDxzAYoR1kZ4CWlOwxcTQWmq2Wh5UbZ17t6dt19CZheDwIAgMftKE
         ITxT2IG7wgrKhr/aWWfsAwaZ6/q21A+L2GzFfFcAJPZ3jWd0zMTOT64r/9bWbft6ZaTh
         1ukQ==
X-Forwarded-Encrypted: i=1; AKwUvBxffWQjQHmByuUlphEwi2Ajse+jV/JzKafrbASmn5DxEVtq9hngaTt1T7LVesZQ5niCFsa9D4iwHftNbQSMdA/u@lists.infradead.org
X-Gm-Message-State: AFuF++n9bNOhRh77pO/CAvGNuxgOw/VmfC6TaPvrpqqUlWsUls9D+aKm
	giTAP/J/pXBMlWJksXvunPedfLbZYaK1ee49X58ldk/cYdrTzYgttTyK
X-Gm-Gg: AYBFou0JqAWMgy17rRPK91LryqAhHMQUT1i8xFVY5XAL1h9nF0dqksPZlslIQCdl19/
	xOqyhEUcmyfEOO6Px96dwymcl64rTsuWVvidAOK3576cAfsvHgZW/yvT56dgwMNemRd7BkPhS5d
	UgZQSjCSwZIMHeookSu8pKaniukJz7nU3ooyZAqymBwpzxb5+ieZ79kqhY020W5nA6E0+vCtViG
	VTZ3CXASWO/mnxxIyKen9R/ZMc2+az3P0a2w/irMKZjwEiMek4o6EeNA+cY43tXXe8izFGJ0c6X
	wlYzmTx5nffoPkHn4wt7P3Gd5Q/om5ed0clMXFMA6mxhUtlGcuqM3ogq97jeJFmftfe1rC1zTIO
	RMmh9b1bIBuuphLa0SadvXO4PJOR2parAexCtxvLWqxMZcUVgBdU0UugFgS+bDXJ3mHgrhTZWeo
	i2cam+/NBp3vHKE5cKOQhlgHYf8eDwyQtfBb3t7gv2N9ggnEQBi5nBfip9RstzghUxviH7I9p0v
	Rzjhk6j28gp6Jtg7dYMKBesMlP5fnhqRcmpfM3Ksese2N8itnq+L4vGyg==
X-Received: by 2002:a05:6000:260d:b0:488:5d3e:becb with SMTP id ffacd0b85a97d-4885d3ec377mr3423054f8f.39.1790004694794;
        Mon, 21 Sep 2026 08:31:34 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:34 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:59 +0200
Subject: [PATCH v2 3/5] media: rockchip: rkcif: add a callback for the MIPI
 ID_CTRL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=2149;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=RarTNDU+cdrtiJCRKIjHK9/KtTW/V+grsr3mpwyd0ak=;
 b=AfnwiBUYc0Iwvv07IbNj4GLcQp3c8H7KT2SE4wJXU/4N3vJJhNOprP36ijMkFaowrAHFyv3c6
 vPvJjApEssmBBjgqwoobVr5BffVD1PUuu8Qebca+Cabc2NfcYXvyCnb
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_163136_793815_183CE3FD 
X-CRM114-Status: GOOD (  14.91  )
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

The contents of the MIPI ID_CTRL1 register differ between variants. The
RK3568 and RK3588 hold the capture size there, while the RK3576 uses it
for the virtual channel and data type filter.

Let each variant provide a callback that builds the register value, in
preparation for the RK3576 support. Variants that do not provide one
keep writing the capture size, so their behavior is unchanged.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 5 ++++-
 drivers/media/platform/rockchip/rkcif/rkcif-common.h       | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index e0acb9049ca1..432f47a1fc23 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -749,7 +749,10 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	if (match_data->mipi_ctrl0)
 		ctrl0 = match_data->mipi_ctrl0(stream, active_out_fmt);
 
-	ctrl1 = RKCIF_XY_COORD(width, height);
+	if (match_data->mipi_ctrl1)
+		ctrl1 = match_data->mipi_ctrl1(stream, active_out_fmt);
+	else
+		ctrl1 = RKCIF_XY_COORD(width, height);
 
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 4d9211ba9bda..f83c8099b78e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -207,6 +207,8 @@ struct rkcif_mipi_match_data {
 	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
 	u32 (*mipi_ctrl0)(struct rkcif_stream *stream,
 			  const struct rkcif_output_fmt *active_out_fmt);
+	u32 (*mipi_ctrl1)(struct rkcif_stream *stream,
+			  const struct rkcif_output_fmt *active_out_fmt);
 	struct {
 		unsigned int offset;
 	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];

-- 
2.43.0


