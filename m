Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC55C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WQR24aA1+zpILZ24E2nmmO9FJh3/tkJD7MuOSXMJkc=; b=Bsneac8gGCSosyvtJObq/fpRKR
	nX9Dzn356bChql9IKVeOhiJFi+rxGs2fN+OxsWqOa+cjoPtcj3kViycrgtUa/dF9ma6URJbTfmn6b
	AiBjumo5XTqFvVTftm12Lh1+9iM+E9p5vRWyY2oFEpOw60OLuWjCHo7R32UbNiL9UBxwEFT2NvfJN
	ulB4p65Tg2KVLQTsZxjpcJaS4juttfJL1CjG8n37mA5WzGQ1A1gVkagKw0b3sQWDDKVNE/9HITFNT
	IownO/GhXfYdd3yXWKTXRf3gDpNHK48RTIcNA/SQPa24tMqbAomcoeDeNpZ58LSaH90Ub+xG8YY/G
	Cn8GAi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Gr-00000003OY8-09Er;
	Mon, 14 Sep 2026 11:54:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Gn-00000003OWj-3VxO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:54:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FF52403F3;
	Mon, 14 Sep 2026 11:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F0C1F000FF;
	Mon, 14 Sep 2026 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386885;
	bh=0WQR24aA1+zpILZ24E2nmmO9FJh3/tkJD7MuOSXMJkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BuRSVoGTDJ5b6ZWeoUYUn/0++Uuw4qeo8slDYh69a9IWsCFCAou4v3xMJFeegq0v3
	 tTzetCMiDtySzL6cZnzaJSXvZXx82jLxblY/Uc/zkeRXSoBrYFtlVvbSsHmF3klHsn
	 +MiAajbLsVRYi4a4qoNEZsbyjc9TVwdsNrlB5MVASKYfow6LsGX2Dtzls9qPvgvTL/
	 0Z5PfwBuTvQUMbXCuOqcYszuYqwF83K6MemtvrcN/KZvxK8x7NCZklknEKKeTO4YbR
	 RR2Lva4n5YJQ++nqoTJSBKcNqUsKLN+L5YTB2rjsRy3bhd88ic2/bFdoPzXS5UMUWk
	 vLYOikbQd2k1g==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:30 +0200
Subject: [PATCH v2 02/20] dt-bindings: arm: ux500: Drop NR_DOMAINS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-2-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
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

Keep the internal Ux500 PM domain count local to the only driver
that uses it.

Do not expose this implementation detail through the DT binding header.

Assisted-by: LLM
Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Closes: https://lore.kernel.org/linux-devicetree/20260623-just-grinning-peccary-d661ca@quoll/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pmdomain/st/ste-ux500-pm-domain.c  | 2 ++
 include/dt-bindings/arm/ux500_pm_domains.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/st/ste-ux500-pm-domain.c b/drivers/pmdomain/st/ste-ux500-pm-domain.c
index 6896cb4a7b71..c9129a3b1805 100644
--- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
+++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
@@ -17,6 +17,8 @@
 
 #include <dt-bindings/arm/ux500_pm_domains.h>
 
+#define NR_DOMAINS		(DOMAIN_VAPE + 1)
+
 static int pd_power_off(struct generic_pm_domain *domain)
 {
 	/*
diff --git a/include/dt-bindings/arm/ux500_pm_domains.h b/include/dt-bindings/arm/ux500_pm_domains.h
index 9bd764f0c9e6..9d94801d8b89 100644
--- a/include/dt-bindings/arm/ux500_pm_domains.h
+++ b/include/dt-bindings/arm/ux500_pm_domains.h
@@ -9,7 +9,5 @@
 
 #define DOMAIN_VAPE		0
 
-/* Number of PM domains. */
-#define NR_DOMAINS		(DOMAIN_VAPE + 1)
 
 #endif

-- 
2.55.0


