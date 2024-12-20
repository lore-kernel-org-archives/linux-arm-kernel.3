Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4413BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 07:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oZBiaG60crzIRd6ktiqaR1l0GhCpxQ1Ic+19aSimK5Q=; b=H0Syy1QDhOsWAPKGpZuqGlU5F0
	m7KjgOK3psemwjO3LRZrQAfI1Sicocid7ZZC8/xocUkwZXh4+hXQT6pkn/hgO1d+WWbDkLX79wWwc
	t39nEFZwXH3RkZFWco4bim7EYfyaYQXDsVdNYuRx97HDh3UQkIgzyss9HMk/EWhDLVA55BZnUnsdU
	PiUjOw/jTGOak+9vc4sqiHHcKEicsOPL24ZC0N33LnNqhzTVh0WRKEjRNYS4G5VlMymUCfjRW66Pg
	QTrl5M1wXGCOWebQML5YdrCznMh0PaLJIpSRpPvqE8G0fbVWfHVk15Fkz0DlxTQsovFGi4CK5yshN
	1kW44F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXWj-00000004BRP-3xk5;
	Fri, 20 Dec 2024 07:34:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXSr-00000004AtY-3N46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 07:30:27 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B0DB4D4;
	Fri, 20 Dec 2024 08:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734679778;
	bh=fAT8ASg3ViXCQ79QuPRFMqvR1E5z2fvyF5UYulgSbrE=;
	h=From:Date:Subject:To:Cc:From;
	b=QElZ+k/5PGjLgZmmhrUEhvC/u1JCLUiiX1Yp/QuT4LQEDkz6kUByO+KSP6aYRl41q
	 qWKOnRCedDOleW0sW9ehbs8P/rbCYqAQPnb7uKALS/C6UU2wAhpHWxXb2wvQoL9Ed9
	 egKNlM8lEnmyFR7ndg4oYZO2+9DyJh81nrDP3+XU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 20 Dec 2024 09:29:40 +0200
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: Fix kernel doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-xilinx-dp-audio-doc-fix-v1-1-cc488996e463@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAOQcZWcC/x2MQQqAIBAAvxJ7bkGXMuor0SF0q4VQUQoh+nvSc
 QZmHsichDNMzQOJb8kSfAXdNmCP1e+M4ioDKeo0kcIip/iCLuJ6OQnogsVNCirTa0Wj0YYHqHV
 MXPV/npf3/QBudexDaQAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@amd.com>, 
 Vishal Sagar <vishal.sagar@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fAT8ASg3ViXCQ79QuPRFMqvR1E5z2fvyF5UYulgSbrE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnZR0EBS6sDhJBZMeydtixlq2kEKFKXkr/tY3uv
 A95KZPbT+KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2UdBAAKCRD6PaqMvJYe
 9bKrD/9ByB3EZ0lZNkh4O44fFwTO4Tr5XDSkcwNT+1Ep0NST2BlUgoNbQZvqYZSnkJpUAa2dpo6
 bGrjgAxRTkUJNmObLh4siTrPPCfzOuP0HPkWj20RPLIc3BsYFmh44PfrQWrZQH3JJwrR12Sim/r
 tGZBdo8luyqtJrCPThwN1U5pDVekzGSV2jtyuy1FL2dHlU91iczv7XCY8gV2Kt5OamUxXaz6wos
 ibtZ2040+bRH9udk7ffBWqAS/TyafYVhD4N9SUtEKzcMxkqLDUsLgNuWgxRaFdqo9VB7uemKBDT
 lp/uzccXvAF75Z4++mAgsxrhYZOyv77LHj8KTsu8U6NVLE8rTRjbecxmFWat1pXM9EtBdTjnjN6
 UlzevpvRche0r7LPQ5LUES/aquX/SFiK/Iqx7KfKkFzasjREY5NQW7fAxJRf2i2B16z0C7bRyuU
 X6XtUiffrdMqNg+EaMYhGucIA9rUoeiqjG66XEuD3LCRvusJvfczH5UWOiPfr1rr64RHmjp8jUu
 PUm8V9CJBfPwO4HNnjiHWIRGiLk2nPdOCGj7hoUCbrv88ZPFf1JMeGwelIwttO/0um63Uuo2N0C
 lysHSrcPbq+OhGIpS/hCwSVPmD6rttExjDcKa+JsWxX0LXt7bRT2VfGcw1hAv72/UUTrjMzMjCT
 7p8qGp3lUUCJbfw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_233025_978959_5C6D90A2 
X-CRM114-Status: GOOD (  10.50  )
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

Fix two kernel doc warnings introduced by the recent DP audio patch:

- Add a doc line for the new "audio" field
- Remove a reference to zynqmp_dpsub.c from zynqmp.rst, as the .c file
  no longer has structured comments

Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
Closes: https://lore.kernel.org/all/20241220154208.720d990b@canb.auug.org.au/
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/gpu/zynqmp.rst        | 2 --
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/zynqmp.rst b/Documentation/gpu/zynqmp.rst
index f57bfa0ad6ec..1a6f9193de22 100644
--- a/Documentation/gpu/zynqmp.rst
+++ b/Documentation/gpu/zynqmp.rst
@@ -144,6 +144,4 @@ Internals
 
 .. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_dp.c
 
-.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_dpsub.c
-
 .. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_kms.c
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 49875529c2a4..d771b8b199e0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -60,6 +60,7 @@ struct zynqmp_dpsub_audio;
  * @layers: Video and graphics layers
  * @dp: The DisplayPort controller
  * @dma_align: DMA alignment constraint (must be a power of 2)
+ * @audio: DP audio data
  */
 struct zynqmp_dpsub {
 	struct device *dev;

---
base-commit: 74ef9527bd87ead62deabe749a6d867af748d448
change-id: 20241220-xilinx-dp-audio-doc-fix-0651029616e7

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


