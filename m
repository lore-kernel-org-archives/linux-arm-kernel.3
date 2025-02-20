Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72CDC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgLCVi2eqi2umimuqd7r8m9jVOLKYJ0bYbbWZhjQWDg=; b=2QETJsSkNSwYLIwKbJxpml3P60
	iIcymVmjsF0zfGsNlXgCZ6JfqhjQChDzGDqKF8YsQY9kMKzD3S5N7u2H8C9AFLoNip/Bo7XItmlFg
	xcrCpmu8wMGEvJOnoKPYU9AXN6d5XxgunJRaaHUmpTV1ZEJirwkFznbFptauwmfHoy5uPZnUJfn+2
	SbMGD27tXRihEAbgLOJOmYEIo8bFmUaLYQBzUWwxnIDkoNkTRl1Ercd+j4DBupT02yI8/xfyGVFU6
	AkOfyQ0dpAPnHpVx/064PCiIh/5kCy20bdQ2X++YljgoPumSUTe9vPggnY4foHRcPHKViFBjGxjlG
	J/fr0JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFg7-00000003Fcd-0H2z;
	Thu, 20 Feb 2025 23:09:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFec-00000003FE3-1SdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:08:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so239397766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092904; x=1740697704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgLCVi2eqi2umimuqd7r8m9jVOLKYJ0bYbbWZhjQWDg=;
        b=fc59scpsxdh1OLFNYUYohBdeTq8H2CTVCpbJJ5m1nAY/ThfsKdUBudEWswEGhsC5R0
         m3m63r7Qx/zaYGvobILzcnkbyCfBvxNrYLz1eZAEFwEnVdeimJOSPZCoKaJGQSobVhlW
         ChIrf9fTOv1mrn0wkA9FonMuU8+UUZSizxTYAvNkNV6tT/v7zUpyBOki2UquocAYLQRQ
         5cGtO3fL8E6bDB9JEl148mr0sGvOvxzcUcRNCKiwOHv5Z7W1U2lOLJvJS4/D6bFALpz5
         lEu10oX/VM2dgrdzzXN4DsB1/E/7YKmEKzYY6ZSiXwP8OjfjMdv68c/PhlyKxHs0QZCR
         slyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092904; x=1740697704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgLCVi2eqi2umimuqd7r8m9jVOLKYJ0bYbbWZhjQWDg=;
        b=LhnQxv/yzTw761+R/JyHSV8zQzBBQQl+Rmqe2N9iv6RxtQ+E6nKaK32fBm0Y9n0475
         2m5XCemu7IrxF9Le/k6y6yReneyI6GLRXJYag3zur5zwdxk8WyeTkq08tfNwX7cXLEsl
         VLx106XGFFNfHHW7dkXQ6SsvsKvzH6cubABbdKcLIspai48hyIq8DJT/qi4fzwyZ9hMp
         3NtpYEAZCymRxSchVPCWGfhFG9ZqRs8ToyvDqrA54xp+Rq4X4kvj7Uzz729F2uTD+7Fg
         dhsSsDMn1yfx2RFsb7gLGQxeHFlSpTDlcBNIw5X/M5soct9SiORRTYKMq/JNr2wwHXlh
         Zdlg==
X-Forwarded-Encrypted: i=1; AJvYcCUAldLLF3jf5pNsKrmUFnNijs7pgFtDAlHnyhZS0ZcSaCK6prJKgBww3Ze2s5TyBY9auX8vAS720D3JJ79ixc22@lists.infradead.org
X-Gm-Message-State: AOJu0Yzogt8nJpAFe9g3l6geyTWTSsusKcE3Hegv79iWGwkLhzOgPZ4s
	fQ/JpUFtaTLM3FRclL9tS4mHnvkjG5VPhq+TTfgmox52mSrSegUBX154iw==
X-Gm-Gg: ASbGncsR9C8BM1JcVaQ58OK9Vhnt9qdfoGxy/X+T6Y3LvOH9wOSGp2qHF5onZ9oXPF2
	tG/WEAb51FgAshrEDJt7v/VcS8pdj+nNMid+tSLIgldcrmI2wX/CP6yP9TBLLMTRTKuOPEDh6Mn
	9an0XqtEO7hFlr9ol+PISxvLuAIkXdWiW1BO8Qa7nP0W+sxMGjgWSE7kCfBWTA0YbJFL//KE3CR
	DbcwNOqATD7lkB9kap1NumH8f9WbjjqcGqd6nBkaI2c3L+A4ftGLVlPiBT/AzxMUbUwYPCz+pU5
	RLpz12P1Q7hDORGihv4gMtq6lcPK
X-Google-Smtp-Source: AGHT+IEDvxSma402XTJDmRJ/JuNvt76UQM64+7z10txDsXDLl3qf7Mk9kk+qny/wDvwm+o3bDkamYw==
X-Received: by 2002:a17:906:3293:b0:abb:cdca:1c08 with SMTP id a640c23a62f3a-abc09a0bfcfmr94355266b.16.1740092904163;
        Thu, 20 Feb 2025 15:08:24 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:23 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 0/6] media: v4l: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:08 +0200
Message-ID: <20250220230818.275262-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_150826_403465_FE96C792 
X-CRM114-Status: GOOD (  15.35  )
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

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for specifying these Virtual Channel IDs in Video Interface
Endpoints.

Add support for parsing VC IDs in v4l2_fwnode_endpoint_parse().
This allows us to retrieve the specified VC IDs in camera drivers and
configure the hardware to use them.

The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

The driver must validate the number of VC IDs and the VC IDs
themselves.

Add an example implementation for IMX219.

V2:
 * goto err_rpm_put on failure to configure VC ID in imx219, and print
   error

Cosmin Tanislav (5):
  dt-bindings: media: video-interfaces: add support for Virtual Channel
    IDs
  media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
  dt-bindings: media: imx219: add support for Virtual Channel IDs
  media: i2c: imx219: pass format's code to imx219_get_format_bpp()
  media: i2c: imx219: implement configurable VC ID

Laurent Pinchart (1):
  media: i2c: imx219: Report streams using frame descriptors

 .../devicetree/bindings/media/i2c/imx219.yaml |  2 +
 .../bindings/media/video-interfaces.yaml      | 11 ++++
 drivers/media/i2c/imx219.c                    | 56 ++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c         | 15 +++++
 include/media/v4l2-mediabus.h                 |  5 ++
 5 files changed, 86 insertions(+), 3 deletions(-)

-- 
2.48.1


