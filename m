Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D25CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yNw2VQFllUqwsQMEjho1oEeA9dLcZL58dMEu60zY9u0=; b=0THgU/+Xw4k2wB
	Uk9cWfSGHn7T7hiUrQ9mG2EgSyZ36qtIxwRXoVFbZYCX7VO2FNomPt/QVU3k9Qdqop+3ItJRgz7iB
	nh6TVFwOTL3D3WvelcxrV0vs/JO7kXq5jvo8qr0tXYr9m1yTBdHPA4v2SNRYwcNd65/RFAeJeVhoQ
	fC4JmLqm8DV1tz4sUU8JaHZHDAS0a5UCt+ClKOm7MI/2VJlzrf2oP3UBRMkqaHvtxnjcwVc85n943
	cA+aqwoSJsQo2gqlz/JE+yMuQWMm3mGzxbeKbh+N0BFZW66gDzTiBhMCdcShEpnDTJEt/tKCdtMJX
	DQ73bGX8EYMy2rmpjVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC6i-000000089gy-0lXP;
	Thu, 01 Oct 2026 08:25:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC6g-000000089gL-2Nv5;
	Thu, 01 Oct 2026 08:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yNw2VQFllUqwsQMEjho1oEeA9dLcZL58dMEu60zY9u0=; b=Dziu/LAcXKx6c4zGXJXW3767M5
	rUOY3M0ZYmBnZbTzF5k0Thz6kEt+xOb6CA/INxc/pV+J1B5djdGISezaOGdAUowFGe63rKiEEtmWB
	qLafBSSFWKaDLiC6YHDIagHJXbbeC+K2qEdx187ZpYWh2wxuFbXRndJTruKtkJtbWTjjseC+pKJnx
	vdEC2pYtFVVlii6KsnWB1JsEoObyEsqLLL3x1G7G2vPrZD6+tW4uv/pjUCwDE55DGuNfxu14Z4OpD
	owXw028UQmJwOMpPf4QiJg5shUENGQScVc5Otz79DFEfvKjOygA8zl6sirpTWM+k5QCrm66Gu35vc
	HKXjS8dQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC6d-00000004jHT-0hy5;
	Thu, 01 Oct 2026 08:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790843129;
	bh=xj1dH1EQpKkGXXGlMtHjKJEtOVFI6kEk+gGhOxu6rqs=;
	h=From:Subject:Date:To:Cc:From;
	b=D6fjaMcbDPd57D/1W5bg6E9R2vYMKW8n/R6Sc1wSoQU4BBsiObGX8Fp5JHJ/iAprH
	 MIH22dKqdoGCdUT7EJS8ee3IFyxuGVyiNmuHm82OrC3/vFpZ3L+WfVEJ2BGjXaYSpN
	 qaaw5+BP3pKXnciksGnGaj7KZTvPyo2l2rmccvUpEQbg7llJLrmgg/ungrAYlFD7Or
	 o32E03ElAMGf53DsQjq582im5olF8V7ED3avprtqwekY3mG9JKNxMSc02wqwYG0xQG
	 6ICWm8ZqcsiIG02IvPr+Kkd0CRkV7FcRH3zWMyuFjxmwUZ4mC+u5wPE/GI+BTlIMD+
	 C7BJPAzkc6Fhw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9BD517E0371;
	Thu, 01 Oct 2026 10:25:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and cleanup
Date: Thu, 01 Oct 2026 11:25:10 +0300
Message-Id: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubbaWSFeRS5szjjSpg0peXfD5
 e+r739BpMAUockuCHRwZO8SMM/ATL0bSfCQDEqqEqVEoQMPae2XxRthvDuELbCytVaFQgvptwa
 yfH7Ntvsddz2T2d4Q3PcDibiebnUAAAA=
X-Change-ID: 20261001-bridge-alloc-conv-f517f9b2521f
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092531_625249_7396E949 
X-CRM114-Status: GOOD (  10.01  )
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

Bridge drivers are expected to allocate their private data via
devm_drm_bridge_alloc(), which also initializes the embedded struct
drm_bridge, including its funcs pointer.  Most drivers were converted by
commit 9c399719cfb9 ("drm: convert many bridge drivers from
devm_kzalloc() to devm_drm_bridge_alloc() API"), but a couple of
leftovers remain.

The first patch converts the rk3066_hdmi driver, which still uses
devm_kzalloc().  The second one removes a redundant manual assignment of
the bridge funcs pointer in the lontium-lt8713sx driver, which already
uses devm_drm_bridge_alloc().

Both changes are trivial and have no functional impact.  The series is
based on the latest drm-misc-next.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      drm/rockchip: rk3066_hdmi: Convert to devm_drm_bridge_alloc() API
      drm/bridge: lontium-lt8713sx: Drop redundant bridge funcs assignment

 drivers/gpu/drm/bridge/lontium-lt8713sx.c | 1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c    | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)
---
base-commit: 37b346eab23aead52d17a8fa687056bfc651a416
change-id: 20261001-bridge-alloc-conv-f517f9b2521f


