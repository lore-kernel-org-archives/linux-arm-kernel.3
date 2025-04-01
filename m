Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC416C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHW22eCdo2pNR/pgYLghzdxqm5ADG0ieP//MIrKy+YI=; b=D+EhPHvj4wgTxH8Mb5E18oFEf4
	9Qax7iXBPw5k5uYvVh5LK/8FxpJA0OQsx/2r+4PbU5q6mJwTA1LmmIec7Ys0nS+F5peDvMG0hF0F3
	w5LxJB6Mn86plNeZQMqs5hpwSBnYAP6TBNvm1S/UnWxHX065tUkcSUvOdrF7vG3EpY8M0aAPvCyjZ
	9WhE2ktHc/L1EDYVUV2mXBatykfu31RV2Nwm3GHROy2BixKwiAI6zFjCUIBeLwV6dj8CwKJYuxgeW
	yXS3jCQEQtWMqu72VmcbSCh8TaVJ18jSHXeVg/OMJYIQXFGBqBmlCX6CIVlK+VUNCe3nAFcWiiXvz
	u5EJVukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzY1h-00000002Ujz-2WdS;
	Tue, 01 Apr 2025 09:35:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXkY-00000002RdF-1zxx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABA4744DF8;
	Tue,  1 Apr 2025 09:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40C4C4CEEF;
	Tue,  1 Apr 2025 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499057;
	bh=hY7d5l/jzCYASueLws6Rz29Q9HtgzeMl7jBFbrlIdNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORx/WcXpgEBwhh0nSpDDQpENeE+uxDM7FwEXObBLzzjGDpc6GdlwD2j6Kkk3ayZml
	 7o4JCFr2t713RmSFpGFBTjzVYPRVEtO/9N0N1RceRQZHylYs1V8MK5dAkd20vE8MQW
	 6OYidH92Vuv3QLr7NJthrMdgDlgnF2FZBfrwEBa/BRzSlxcgUloRt3GxDHhbbjbOoo
	 UQdQSvSHWXHxZ4ISfYdE0GlN/iI1/D9wVIHtwjhwBN4ybw6y+qZvMvTwIlDftZaB5U
	 9qPhcUdvFcD0Zkn1TY1qmuxxbiGJVXCRZ6UtxqjD4LFPnE+yNSNxFCuIcD2f7p3mE4
	 6ud/22QNq8dQw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tzXkV-001GqU-Mt;
	Tue, 01 Apr 2025 10:17:35 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: [PATCH v3 04/13] PCI: ecam: Allow cfg->priv to be pre-populated from the root port device
Date: Tue,  1 Apr 2025 10:17:04 +0100
Message-Id: <20250401091713.2765724-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021738_537939_AB0EC049 
X-CRM114-Status: GOOD (  12.59  )
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

In order to decouple ecam config space creation from probing via
pci_host_common_probe(), allow the private pointer to be populated
via the device drvdata pointer.

Crucially, this is set before calling ops->init(), allowing that
particular callback to have access to probe data.

This should have no impact on existing code which ignores the
current value of cfg->priv.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/ecam.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index 260b7de2dbd57..2c5e6446e00ee 100644
--- a/drivers/pci/ecam.c
+++ b/drivers/pci/ecam.c
@@ -84,6 +84,8 @@ struct pci_config_window *pci_ecam_create(struct device *dev,
 			goto err_exit_iomap;
 	}
 
+	cfg->priv = dev_get_drvdata(dev);
+
 	if (ops->init) {
 		err = ops->init(cfg);
 		if (err)
-- 
2.39.2


