Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E375EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ckhp/gzTMi2ZUGo+P0tgl5yB4DRhnm4KfUbhwmtfgbQ=; b=QMCm75liXhMk3x
	SD36z6geFsdCiE+4pE0Ani0NlxYpgkpjwjlAX1/J/YSYANtF3aDlEPsml+W0qFGkFJUQZS2Qv65vH
	b5f5kR8lSv7PnIEcuVBc11L4eYAvp3+jGsINy5xQ4lKQ4u+oAr+viaMv7nkF7Qo2RRRkifks3PFl5
	+lw9B3k3ZdNNJJO7cNqn16gGE9Ac0+LzNKuf/HNE1nQHzYMrrLPSPu1zRaAApRXC2Uxnni+6sdPyL
	eFc+VuhP/0JbTM27v0DtbpMH4ySTNvsA/P4IujE39iFURQbI0hIQ5FlhkKPgjAouCQwrzrcGkcaDs
	MzH8rsnoGXyV8a3G0Lxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7ns-0000000FKEi-1bI3;
	Tue, 07 Jul 2026 15:33:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7np-0000000FKDO-02Li
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:33:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47122683cf3so2831795f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783438419; x=1784043219; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ckhp/gzTMi2ZUGo+P0tgl5yB4DRhnm4KfUbhwmtfgbQ=;
        b=FYnV6UCd2uQ8roPWwBxNYj5+TZ1LC8dg6DeL0P9YEMF53yISheB9SkdrGd3KYRxiB8
         odoL0zMEykxX2q13a2BHC25hzEyNwhknXdPNe9JZboTqLiSZR+mq2ull8Dow+1KT7F1D
         Np1xBr+AQYtCM4S9e54G9a6Iv/sH0FV0ZAqAdF8s0qaZ5aQiKpOnTege1qa1hSxGtMwK
         JJXPmxvbVCZ06ZRgat1I53gZ7T3tobkj4NT5V0+mHQyt0S24eWNW+OxNfYJ5y5nJdupT
         9R883GaHMxR5vAt2gq2CbwJmEcRwujRWEsWx7MfjtlfWdXxoGN+2UJUy5RELzs01c1gi
         4uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438419; x=1784043219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ckhp/gzTMi2ZUGo+P0tgl5yB4DRhnm4KfUbhwmtfgbQ=;
        b=pxuED7o5E1SKArX3MriiLBJeQRyvE4XSgvJCaZv5XyF6/HCaWO1fruckb72l5+40SR
         Jq/5GHhbJDv5DeTSP+DUv3w1m3Ud8MX2gGeZ2rQeBg+/3ns8EyfoJAhiLVtA8xJh5+Cu
         urwIKiZYK8hTbmRTuNY2cPT76vF4vqZx5uHk91jqOWa9BW6pUfMAZfltdMXHsC4jjzN1
         aR10aajbUgLT/nC9T2BQ9vAJ5xAMiXfQp0sn+z4b5zVcg0J/xJE1JCSOEIAq+p/Mk0qc
         nOdsbVUTCyYGO2GaiUpqdM5G94kaZs+7riza4mlsrfcpp1Moo+qT4YQZBAbTyPIRYYmz
         4h3A==
X-Forwarded-Encrypted: i=1; AHgh+Rqvc7Ly9txe/h89HFUIygHGW1egXwXUL0B6xoMUsrYe6zbbmQ8TSxoiY//EIvvLogRUNrl4p/pYm+nJoUI4/dGQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe8PA7Bcsd1zFkiLoKSwRCirANprKfs+aUOCSN+65Wv76C6tSC
	bXZ2o95P1JOpLeIrpxkjbLfw8152RQizpzCu7IC3in9ptczUdw63z4h9
X-Gm-Gg: AfdE7ckpAehfSnDXoV4agDwoWSLGvdxsn8jKbS7fTsBA/A/v6IEya5VzDUtLIIQfOCl
	g5t1RakQ15JvwqpgHxP9AEWZK1oQ0zM2YdbJFqS0pE77sVXRUxcC6uUTpDPtb7N2XdjzPV2vsu6
	v+/dVHfyo+LZvJbuQMxPG7RRMXekSvQl1+8Ivn2hL05BG+ukC770tBjxqzpObmK/gRT+ipEcYw2
	XCqdy8lcrRjLKLGMG3TDA0S8s65vDOgicnbDtbb4Kmmql5fiTx6Nf7lLuM1wM85TMxjnI6VIMHb
	/KJLwEqpRxd6pkntA+HS/xspvistrK+gXBsP7QUcXpc11dyp1ssfwLQ8xf3HhBEzJ3v9NTD/hxb
	zQwYT3MiJ3EIVwNMgeZQxrVXxGHtU9vL3lGTsQGWaGXWLBVJkUMPT9uczf3BEKuBGNzzjvsLfTL
	NZEzCFT9vAzQ1EdDixEgXp
X-Received: by 2002:a05:600c:2d53:b0:493:b811:e549 with SMTP id 5b1f17b1804b1-493df093b48mr38127505e9.29.1783438418551;
        Tue, 07 Jul 2026 08:33:38 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm100622385e9.13.2026.07.07.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:33:38 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH 0/2] drm/xlnx/zynqmp_dpsub: improve usage of drm encoder
Date: Tue, 07 Jul 2026 17:33:25 +0200
Message-Id: <20260707-xlnx-simple-v1-0-df50c6665b02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEUcTWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNz3YqcvArd4szcgpxUXUOj5BQD02TDFHMTUyWgjoKi1LTMCrBp0bG
 1tQDtdrSIXQAAAA==
X-Change-ID: 20260707-xlnx-simple-12cd05c1d745
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_083341_104220_63FA693C 
X-CRM114-Status: UNSURE (   9.34  )
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

This series addresses two things:
 - Remove the usage of the deprecated drm_simple_encoder_init on the
   zynqmp_dpsub driver, substituting by drm_encoder_init
 - Add a return value check for the drm_encoder_init, preventing a
   potentially uninitialized encoder being cleaned up

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Diogo Silva (2):
      drm/xlnx/zynqmp_dpsub: remove dependency on DRM simple helpers
      drm/xlnx/zynqmp_dpsub: check return value on drm_encoder_init

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 7a8782fa5da551a92ada0aca6f7dbadfc4c36da3
change-id: 20260707-xlnx-simple-12cd05c1d745

Best regards,
-- 
Diogo Silva <diogompaissilva@gmail.com>


