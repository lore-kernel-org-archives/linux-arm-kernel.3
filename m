Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDD2606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SMse7BMa;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mP/rB8jM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3ymnrBNdKiljDdwgY6MK3mYj3Z4/pYbQqDBb8t0BJco=; b=SMse7BMapEmjFr2SnoBXfmgTxJ
	ufQnNu2Dg+V6/HsodpMvHTkcjJLH6/J9mJS/0QHT+JqqbGVRLIn3T0pGVH1d/nd1oqluKKDJ5oldD
	Dza9STTrdwZp05XhNPkF08uS2t0JsHX2uuNop6Ipim/ABRppBPrNyGQZ3+d58D4fFapeJJxJVjj0b
	Jc2CaBy4rydsMtj2qCaRWm81q2UUHQAoN4BVqeZoOFAFvmM46qwUzPPWSAvsp3W4KkkppX7oXzt2O
	1Kom4ar3nE3nYQuNko0sDq5MYBE+htyBxDD0NeDEuSDG7qkoZ4TRqcbd++47yrmSQQk9J0mP0i2aS
	NOD2e6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8b-00000002oIj-1ImS;
	Mon, 26 Oct 2026 16:01:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8Z-00000002oGq-0IOz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c498e2d623bso133825766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030484; x=1793635284; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ymnrBNdKiljDdwgY6MK3mYj3Z4/pYbQqDBb8t0BJco=;
        b=mP/rB8jMbsGT9iVoB67+mGJPrJaNUbL5ZK3b+ttwwQ9JGVAXujxJqNSQjo9tO7YCar
         9r3zKlE9C4GmwNFX3TocruYx8LUlVIKNjPwkVUFAQld+GPEjE6q6dR72y77TtRF2iwOi
         g7y1+/42D5L+QY6BqB+wNflynLztc8cs2ZDeT0jq+E3b3G+Am6XxR4/i8rgw8lIlgrav
         5XJOAUenah3wRn2EucGQ4ehVrYWGfvZ7DJZP1cU0J7MCdP6vFUTyrpgdyyuycONQnnNl
         2pyv3j8SocROHVYXyrnItIXVVtY47sTXYzxBD78TlZGl5+nJz4NAF8ADpy0pJyO+Ks7s
         3v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030484; x=1793635284;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ymnrBNdKiljDdwgY6MK3mYj3Z4/pYbQqDBb8t0BJco=;
        b=b25iRGPzDlwmauab4ONOf0BptoN7NO/qP/kaskh4xAIKYzd9+6dtjfn2VlE3Rp8MEx
         38A8cm61gTX9uKhEKlFAIM8DUKRDRZX4juKt1qV2MQC+8gDnaib7x+esqE/8gr0SbuS1
         w4NRXUlqd7eQ0WyjDSv7lQowBV2kkAliH6iqAbKgg5FEnsZMu7t3gp2/vmBIxgsNmtZo
         rn0X9fsmzeNDe3DsLjrPJEAesBt9qoVcquGBcMQUS0DQK8245C82RYizcKBWI4J0c0Fe
         EudK6y05rAcgFevB6g+5cu0crsdGoMz0sCvajDEZlbNNItHhUnLf1OWQxS4+/plRza6a
         PXaw==
X-Forwarded-Encrypted: i=1; AKwUvBwz3adrqE0T/57R1Q/c+2RuyA43yVzDGCB4TPRtnpooPXpA96y0gvmJmgBf6fJOaIkMx0I8pD8WqQ1wdpX/4OE7@lists.infradead.org
X-Gm-Message-State: AFq9FYIaDR2zI+pvRYboZ0sxas4S8jSWyeAVHcDfmv3OHDpo9V2TnP7u
	giFkrQeuYSGgyIyGLGgHoWo/lxh4PR20/JKx56yX5phhUoOqd00vx923G8UDSmxe1j0=
X-Gm-Gg: AYBFou1bvq1fQ+9Oy2U5TjB/SSfHN38tS/S6mxIuB03AVDqvt+BHK1Hi2bYi5Y+XdGz
	LSs4HU+4bTIGcbuqV5G5ztUdkQsK58VV8OBncnbhtt6mRF28aDz3lLmB5A4LKSR7rpIHVqXsunz
	uMtJIY95qs5lRM/ElatE2i3WX+pZKDV1QYE93zvJHUzo2+UNNOfvH/4lohLXrxixCtXhB0sJPy2
	bhWNdnf/YxKCimw3emaFcbOWxJDaquAbRtyy+6ItYTSK7k+9uFCL0dFKpiA9g8lIA7FYFSNLPce
	lsVOfXHIQcXzMgldljyyErHJU8OPd5D4oNUssr9d8DzY2k2H0KWVlogpGTXqcAKzHKUoqKqSxUv
	C+Vo4WDz1WXLOfiW4FzW0hrAhE1xOyw9sD3w2ETMtuxxWS75jdp+oc+6QUDM+h3hTWK8sUb//vN
	kZHRPQoLgVo3zFafKAk+/qAcvbI9k8rN28DN0DxXDgui9PjdVeSixG0pM+JhAS+zmgkEhExE7z+
	3K3+GJycB2bY3dbxd+iD9O8g1hpRmr08e3eRBUHUpzBlvBx7i+xbWZzf4myiNEE7pt58Rn3Bkdq
	Siw4M1VeC7iI2b4GVHToosrHCY2dub+d4lAX
X-Received: by 2002:a17:907:100c:b0:c49:4450:6248 with SMTP id a640c23a62f3a-c4944507cccmr269354066b.16.1793030484097;
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 00/15] thermal/drivers/samsung: acpm-tmu: Fixes and
 cleanups for GS101 TMU
Date: Mon, 26 Oct 2026 16:01:17 +0000
Message-Id: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5532oC/x3LQQqAIBBA0avErBtwJEq6SrSwHGsWVmhFEN49a
 fn4/BcSR+EEffVC5FuS7FsB1RXMq90WRnHFoJVuSVGDdj4CnuFCLw8nNJ0xjrSePDGU6Yj8h/I
 MY84f25NX02AAAAA=
X-Change-ID: 20261014-acpm-tmu-fixes-8788d122bf1e
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=2074;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=I/JMyWiRNIubE6cFu1pbLVDJyCCuA18f15y27xl2iK0=;
 b=R0jk61V3qMv0AjCuKodXZM/4F7Skr+tAD9gSsK7jMggcOhEIu3b3xJNKfFwX7jqgduBv21Dbv
 o2MrKlbxi1ZCgdxkUO6i50DEVapod3/A/6gmjJSXeigOqsylkvVv8Z2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090127_158037_A0CABF12 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The series is structured with fixes first (patches 1-10) followed by
cleanups (patches 11-15), so the fixes can be picked up for the -rc
phase if desired. Patches 11-12 are placed immediately after the fixes
in case it is also preferred to take the driver and module renames
before v7.4 is released.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (15):
      thermal/drivers/samsung: Select REGMAP_MMIO for EXYNOS_ACPM_THERMAL
      thermal/drivers/samsung: Depend on PM for EXYNOS_ACPM_THERMAL
      thermal/drivers/samsung: acpm-tmu: Fix acpm_tmu_resume() error handling
      thermal/drivers/samsung: acpm-tmu: Disable IRQ across system suspend/resume
      thermal/drivers/samsung: acpm-tmu: Implement .change_mode() callback
      thermal/drivers/samsung: acpm-tmu: Rely on devres for probe error and remove teardown
      thermal/drivers/samsung: acpm-tmu: Return -ENODATA when sensor is disabled
      thermal/drivers/samsung: acpm-tmu: Annotate lockless sensor->enabled access
      thermal/drivers/samsung: acpm-tmu: Fix IRQ locking and error handling
      MAINTAINERS: Use linux-pm mailing list for Samsung Exynos ACPM thermal driver
      thermal/drivers/samsung: acpm-tmu: Rename platform driver to "exynos-acpm-tmu"
      thermal/drivers/samsung: Drop redundant composite object in Makefile
      thermal/drivers/samsung: acpm-tmu: Disable regmap locking for MMIO INTPEND reads
      thermal/drivers/samsung: acpm-tmu: Clean up probe error logging
      thermal/drivers/samsung: acpm-tmu: Simplify pm_runtime_resume_and_get() error checks

 MAINTAINERS                        |   2 +-
 drivers/thermal/samsung/Kconfig    |   2 +
 drivers/thermal/samsung/Makefile   |   3 +-
 drivers/thermal/samsung/acpm-tmu.c | 232 +++++++++++++++----------------------
 4 files changed, 98 insertions(+), 141 deletions(-)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261014-acpm-tmu-fixes-8788d122bf1e

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


