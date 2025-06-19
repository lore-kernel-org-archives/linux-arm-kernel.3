Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C195C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxDQ3jR/+h+n67XLoWIayKPN0jU8tc4bO5K5PyY3GoA=; b=RpacWf3SHjXY9AxaNQ9pySYn1B
	EZXc28xQgMEydF7YKhY8LPunv0GbWxup8YEBwabgd/Qi4WR8tvco2F4zz3Om5cO/InU+htq9o91P4
	O/C1DhCGGFIMd4Hdo2qV32FAEzjDx203TKHsoK8ziBZHEyEdhWO0RQ6oHCBsMsFuusKbS4SSUzBGP
	n0BShDJsGwV2mK2hbvCNaCFiQd+rXtmjwBdsd4WTzRvCzsnzj+t9i9iayqqza8tFqg5+YkOZ58+5V
	0Tvte7QfCQKqs5trOshnurBhMCvu4IlkVdflpMMqWIiQckM8OKbto86x6e9w9a+F6K4h0i+o7N/yh
	/1GrrSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKyz-0000000E6d4-42gq;
	Thu, 19 Jun 2025 19:31:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmV-0000000E4Kw-1M6e
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jxDQ3jR/+h+n67XLoWIayKPN0jU8tc4bO5K5PyY3GoA=; b=oJF6uCZ6OdlRFVyz3fgEmz0RYh
	6bzk94SaCdr2sO/e9u3KyVcY0BKI8u8eWlYMrHjMgx6MpwfQV6MlAdp2Yl2N7uibhdx4JeMae/YC+
	I+PTFB3DqMjind4a66/acjAwUVSPWez4NwlRVIJJ7ZedHC+iymX2cY4Zp5eFiDVVwYyqTteyc6vBL
	aE7HoZy14UogcHvJExC57kBqVgBZl/dnIqLkaRZ40qbCibprJjmmc1uPOUOe6jyPfjOXiKfFqH0pO
	eezFlNmpEhx5LkULZ5wyQ5jV9Elxgar8GhlC0sEUaDPUQrviMv2uaBOEUDMoi7sS01dhl1zkc0OqB
	fh4mcrAA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmR-00000004Yct-23th
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxDQ3jR/+h+n67XLoWIayKPN0jU8tc4bO5K5PyY3GoA=;
	b=OO2v8P0YBJI9k2NkCNO1VhRqi9xQw+i1rkxmlCLgE88nGTAnJ7rFI/t2i/PKgC2lwFqOVh
	VC3Ud947pdSYO82ZN8Cu//iTL16aWLhefDH2s8qG3WR7e1b+ik2wpWraUHcBqV8UaHpkvW
	Z8yO7tZ1L21LU6TNR7mEZXQIacztlL4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxDQ3jR/+h+n67XLoWIayKPN0jU8tc4bO5K5PyY3GoA=;
	b=bmZOsgajsDKm/8vfXiE8GXB9Oz8i9xkOcX9CTMNlBoo5XtvUw8gajQkkJkmreup0cyhlr/
	jEKCA8/ocKAgXFnvfqB8TbvMunJ6jsFEj8xaEqdtfaeTZSQcDmdSl+onzRityiIG4cBnHq
	C57ZLghXeUtl/KhDO4EfeLIJ1A2M9BM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-nAKsXH1MOUuDhXf05kSPmw-1; Thu,
 19 Jun 2025 15:18:23 -0400
X-MC-Unique: nAKsXH1MOUuDhXf05kSPmw-1
X-Mimecast-MFC-AGG-ID: nAKsXH1MOUuDhXf05kSPmw_1750360698
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB97A19560B3;
	Thu, 19 Jun 2025 19:18:17 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 73D9D19560B3;
	Thu, 19 Jun 2025 19:18:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:57 -0500
Subject: [PATCH v2 05/16] drm/panel/exynos: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-5-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=776;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=XnZ4VdQSGCSbeK0k5QdLpsdKH75XYw09FKKV6TJegL8=;
 b=LK7e2E8NJMcgbXOaMpcRjP30A7Rw1UUvfZXliZN4uZDvWsCr669l/2mkqtxyUkVQ6m4+I+XU1
 58NTpKIkBpNCMRHGFQ862OVjsnCPFsoZQdWbjAyVXLfAUpljlbxxuyA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201837_057663_ADAD3169 
X-CRM114-Status: GOOD (  11.45  )
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

Put the panel reference back when driver is no
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: move drm_panel_put() inside the if()
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada34cd0d4544f14e616fe3c52dafc73..3a258c4623b92a5a7c9aea3371d11a6c2df1cc8c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -137,6 +137,7 @@ static void exynos_dpi_disable(struct drm_encoder *encoder)
 	if (ctx->panel) {
 		drm_panel_disable(ctx->panel);
 		drm_panel_unprepare(ctx->panel);
+		drm_panel_put(ctx->panel);
 	}
 }
 

-- 
2.48.1


