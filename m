Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA13CD4F3F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=854/eXsALxJ18ewbtIIwMKgvSfbFXYO9CoA+nOypuhg=; b=KO7Cq0mXb/BXWyWUr93UP1C53w
	yon/6tdQDkqxcBvlhvg1BQ+hILS43JyGpscv9iWnQndnbSsbIRbjJQ0z7xaNP776PJ79rq3F17qaO
	fivQpIy2EyyVVIbQYOBCqOxM3TmAL6zjhn/xKuaU0sM1QiOJ5vq0bF5Yr75Qk27dlL54iy3P4VpUc
	TGg5mwopRHJdJdyUy5+Rk6QFviBllloGSKmIMw5WH9MMHE7uevdckIWiVxgbPhNLNBpkQlNqoRA9l
	mZ5ZMPE5Sbr8/AwT8MzIBkM4PvcqkuKGfItnZ+qIUjWZ9D66AxLsGb0KsZzDTDqg+Wx/vd+YSSSS6
	T6CMznnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TV-00000002dXi-3dU5;
	Wed, 13 May 2026 13:18:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TR-00000002dS0-0Gv4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:18:06 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 737B02E4F;
	Wed, 13 May 2026 15:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678275;
	bh=bSJ25hdhRUWRW/tt7xLdkj0tLeAfFpTuwryHocg6FPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KWYq6mDKn3YTBmsrpB+gmpADSvAEOqMRdYIoxsDrCZpEooPq+q4N+hau/Mxdg9v8d
	 D4bcnmlCwGIBQfvmP88AHvjRG7OX6Qf+CzZ3VBPhxYW/cg2pblEzOEgF/xhSNCK9Hr
	 zJoJWmvqTlnEGykIXbLBFTkCH2CK6xPXh02+H878=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:29 +0300
Subject: [PATCH v2 07/16] drm/tidss: oldi: Remove define for unused
 register OLDI_LB_CTRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-7-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bSJ25hdhRUWRW/tt7xLdkj0tLeAfFpTuwryHocg6FPM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHn+2YNXZZ8aN7zUh1BcDJWnr/httpnHSfxdC
 cui6qEUcaCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR5/gAKCRD6PaqMvJYe
 9SiqD/92c2VScAUTj8GGdabM+26DMx/WnaEAeKL7Xr0dK0X766sGDIr+pltCP7TpbKRVBk48LX8
 UVOeX6UMs8i6Gv8EI94LABG54BXMBDZX8LEjV5q3jdiV+3U7OKu5xTnN+qugSHlXwI8J9RN5/HV
 JDdam/oFzvnDu9fnjqTTkYHHUYtTWYh5xYeH9Ocnyop4bEVdVx87a6KLyl/I/RI8entf1JwlMC9
 2xyg/SBt7ib3koWQJZsESSqvaaw5dNNd3p75kFFtMXVssoeaeJY+GJbRnQDR3ONVoJmZSWvZfrc
 vQhCc8SKk5rAYK31mJg6cPp+BDKOcEqqP+jy3FhYXiZ3aeGttksrR28c0Rhw6npgFtvn9zCsCYO
 D9IszvVqi3RVGGP2t5CblnrZQnCn6M0v7yJb595Ogc0Hxb/HpsIt1oYF7m8D6y7vSIUs00KCVO9
 PnSWlDzdVIflD6Cb9RoNX4Ygnvkxhzb4w93t+78QA2uuxsmhQMYmA6KGmrK2uZ/MmR81ZsyUC0S
 54G6i1FMLlDWujFD+Az/Gqs2SN5+FTD2jKR1/hnQsONUNk7cqUGMGnybQYVnH23CYETJdcG0HuM
 Ee5NxS2HUMlmzpxxOZMfzQrL3tc4vI5f28BbIhBFRy6ELLrGeQX7n2lTxcs2ljHBUOiwHY8sps5
 vRzPI3e0rqvR0bg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061805_273826_74D2A0EE 
X-CRM114-Status: UNSURE (   8.70  )
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

OLDI_LB_CTRL define is not used, and doesn't seem to exist at least on
some SoCs. Let's remove the define.

Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
index 8cd535c5ee65..a361e6dbfce3 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.h
+++ b/drivers/gpu/drm/tidss/tidss_oldi.h
@@ -20,7 +20,6 @@ struct tidss_oldi;
 
 /* Register offsets */
 #define OLDI_PD_CTRL            0x100
-#define OLDI_LB_CTRL            0x104
 
 /* Power control bits */
 #define OLDI_PWRDOWN_TX(n)	BIT(n)

-- 
2.43.0


