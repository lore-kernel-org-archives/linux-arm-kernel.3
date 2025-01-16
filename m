Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CB3C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7P+v3T+nrQTMibupPu9ktHQrDK2ERVyoiAaGUmlwr34=; b=qduL2kHrxUCxDRNfgIYUav0iv7
	mVufnVnTIbGXhAhfxTCvObXHGBk+EBewZKLsBIDbBwOt2uGsEel0QFZ1f2fbo3umsaIH3Tc3D7oxk
	DCTwC3OGcGKV27SFYHsXL75dFc63i2mizzutxfQ9zbmtbKL1k4ksnFcHwLFfHTdCsW7rynTeReaCz
	1vOYDkQmcNFff+l1tUWwR6anVaF7N0YT+w/0714/h/wguOQ1HDQNRaw0fvJRc45inU8hknuH29w1E
	tyltfU4WWgOWjAu3NxW98BQisa3QDhvXthEBlyNE1T6n0DF1NVUP4B0LZ5gIOQBp8Gz9dmfvM80/s
	pWqmAJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPc7-0000000Ey5w-07Bq;
	Thu, 16 Jan 2025 13:08:47 +0000
Received: from mail-ed1-x563.google.com ([2a00:1450:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPap-0000000ExpB-1ukG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 13:07:29 +0000
Received: by mail-ed1-x563.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so1867868a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737032843; x=1737637643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7P+v3T+nrQTMibupPu9ktHQrDK2ERVyoiAaGUmlwr34=;
        b=ebOHIUA61zBzQp1T18tK07G0+0IBaAByD78Ndk69/jdGmQnrPz57h87R2B71knVmxB
         l/QscBTHLCnf3eVGbVRzfymuNB8D33VFg4YUZ185RHyggfWH05ZLVepnuoaTnVIyo1AC
         b//Xb548TswzdsgQJSCH123EYS2/48cK5F3N2eJM17ICbi2j4R5pskX//SgVc2K8OhCh
         hARnMELJdvHG28FMEq5i+6CGTo9T5hhwbeisGRHUTCDTF7zBj1mLjah2DdfhkVNKvih/
         84WfsBkQc6lbCIlqA7QMZWwL3Z8fiTXjVYfF/4KEGYNqnG65uWn6HAVd+AiDMo5UVuzD
         JXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737032843; x=1737637643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P+v3T+nrQTMibupPu9ktHQrDK2ERVyoiAaGUmlwr34=;
        b=IHEnHxvb0UkUrjlm409SS8tkH00rn2grXHPO4lHk9qHhy5yALimao70ZIgCXMoWa8I
         xDPQtKlV1Tvtm2oFFDfhg9R9VpK1OOdb93PSOfKJcaXVdozYNzfdowxWQKhzq6vsNJfs
         sxQyHLIKR0TzKUbwUnjv48vctwzIK9uYFHO2ZlqrrITueEybo/CkegxBLDahdNv9Mfid
         JX4JnumGdNL5DZn41zFvSdr5cqea82vj9RKm7LNwzn6FcngcKQXiEc62y4OqhQeFyexM
         ERhY2W80oNvt93NtWwUIrf728274x27N0WvfOcQvGQlRkPjs5c4owwTlJmOht7tAuHhM
         pMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLVu7SuQ16ru3TdO7Bnidef8/gxww50U6uwiB7eIpCPOX0eJP2TE9oBoW/BSP+ywyKqUJ+/uieAYZDPCutAbNB@lists.infradead.org
X-Gm-Message-State: AOJu0YyuHAhNaKHlMq/pTt7ApvTT/q1oHJV6zHO1X3RvBHfZcz1HEKZO
	dmvJLJIHBtepam6ZFLO2mnrzo2MW50m9rQmI9UpbLLS9ht4uffYvwZrp1nliZblYrmgo1BdcIQT
	rW8CoGp9XHDwY09PvSgSnsiXrrwIF2iuh
X-Gm-Gg: ASbGncv7hNsWPwYTgnN7b9xf7v9IGQ322WPs4Z5a8KN4JCt3hpdFE6ojSKxsjL6cH96
	bdSa/wA/erDyEvXOxY961Yxl6b3yxJzd4Kg4GAZc9LR5U30gcDYXSKS98HuWmUtp+g8lPk8HZYV
	WANwdODGJo6IefbZeldjpDfYZlgIsDR2Hsv/OFVonKMcEeu9QtjCK7uXanIBbOwaj+AUcdASZQd
	OhlEB11LgMrl8PdpguSORm5nTNk3i9ra432CEu1Ex8tNjYoHyhiFWAEABmZTS2JOurcy96e
X-Google-Smtp-Source: AGHT+IGViDPhV57wZ6b9jVwuuHeCZhjQncFp1lN6cuhdiqlXIycDF1nRHxi+kNX1Yeo7TN1wCIAeIuZIX8jO
X-Received: by 2002:a05:6402:3514:b0:5da:105b:86c2 with SMTP id 4fb4d7f45d1cf-5da105b87d5mr4665682a12.20.1737032843068;
        Thu, 16 Jan 2025 05:07:23 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-5d99efc9b94sm660964a12.28.2025.01.16.05.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 05:07:23 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1] media: uapi: pisp_be_config: Remove unused config fields
Date: Thu, 16 Jan 2025 13:07:21 +0000
Message-Id: <20250116130721.3354550-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_050727_666447_66274CA0 
X-CRM114-Status: GOOD (  11.46  )
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

These fields should not be set by either the user or the kernel driver
so remove them. Replace them with padding bytes to maintain uapi
compatibility.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../linux/media/raspberrypi/pisp_be_config.h  | 42 ++-----------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index cbeb714f4d61..82560db4da61 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -716,13 +716,6 @@ struct pisp_be_hog_buffer_config {
 /**
  * struct pisp_be_config - RaspberryPi PiSP Back End Processing configuration
  *
- * @input_buffer:		Input buffer addresses
- * @tdn_input_buffer:		TDN input buffer addresses
- * @stitch_input_buffer:	Stitch input buffer addresses
- * @tdn_output_buffer:		TDN output buffer addresses
- * @stitch_output_buffer:	Stitch output buffer addresses
- * @output_buffer:		Output buffers addresses
- * @hog_buffer:			HOG buffer addresses
  * @global:			Global PiSP configuration
  * @input_format:		Input image format
  * @decompress:			Decompress configuration
@@ -761,28 +754,10 @@ struct pisp_be_hog_buffer_config {
  * @output_format:		Output format configuration
  * @hog:			HOG configuration
  * @axi:			AXI bus configuration
- * @lsc_extra:			LSC extra info
- * @cac_extra:			CAC extra info
- * @downscale_extra:		Downscaler extra info
- * @resample_extra:		Resample extra info
- * @crop:			Crop configuration
- * @hog_format:			HOG format info
- * @dirty_flags_bayer:		Bayer enable dirty flags
- *				(:c:type:`pisp_be_bayer_enable`)
- * @dirty_flags_rgb:		RGB enable dirty flags
- *				(:c:type:`pisp_be_rgb_enable`)
- * @dirty_flags_extra:		Extra dirty flags
  */
 struct pisp_be_config {
-	/* I/O configuration: */
-	struct pisp_be_input_buffer_config input_buffer;
-	struct pisp_be_tdn_input_buffer_config tdn_input_buffer;
-	struct pisp_be_stitch_input_buffer_config stitch_input_buffer;
-	struct pisp_be_tdn_output_buffer_config tdn_output_buffer;
-	struct pisp_be_stitch_output_buffer_config stitch_output_buffer;
-	struct pisp_be_output_buffer_config
-				output_buffer[PISP_BACK_END_NUM_OUTPUTS];
-	struct pisp_be_hog_buffer_config hog_buffer;
+	/* For backward compatibility */
+	uint8_t pad0[112];
 	/* Processing configuration: */
 	struct pisp_be_global_config global;
 	struct pisp_image_format_config input_format;
@@ -823,17 +798,8 @@ struct pisp_be_config {
 				output_format[PISP_BACK_END_NUM_OUTPUTS];
 	struct pisp_be_hog_config hog;
 	struct pisp_be_axi_config axi;
-	/* Non-register fields: */
-	struct pisp_be_lsc_extra lsc_extra;
-	struct pisp_be_cac_extra cac_extra;
-	struct pisp_be_downscale_extra
-				downscale_extra[PISP_BACK_END_NUM_OUTPUTS];
-	struct pisp_be_resample_extra resample_extra[PISP_BACK_END_NUM_OUTPUTS];
-	struct pisp_be_crop_config crop;
-	struct pisp_image_format_config hog_format;
-	__u32 dirty_flags_bayer; /* these use pisp_be_bayer_enable */
-	__u32 dirty_flags_rgb; /* use pisp_be_rgb_enable */
-	__u32 dirty_flags_extra; /* these use pisp_be_dirty_t */
+	/* For backward compatibility */
+	uint8_t pad1[84];
 } __attribute__((packed));
 
 /**
-- 
2.34.1


