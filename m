Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A4EC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=; b=1UH1WC+Mw6okyPAeDMZiErUgsB
	aPmRRrvqx4+qONDWAgQSs2krn3DcCGt0xqr7yMyszk4W195oTo3oz4Quqc/W2SC/dDzPzx9BGwtRv
	265vbpDG6thsRyWoxVe318wLqZZdlFstT1X0shWDqxzG88azhYr29wdEhVXp8tRLfx51r8vFcWK5S
	LMPhtrSN2hfuw4qmV/Sl1t6fiXbHX9QbodyqYkqZuKgyk3nTLfILoaJYCERF6XdKtrGopxQ6euRwe
	4KJXrGW12xQTvxbLlxlukHItR45t6+hrxMq3iHyzO0OqaL2I6lomzZ8lozbV9HZDg8thDwHYX5COx
	Vi3Dlhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4E-00000005irb-2eNt;
	Tue, 15 Sep 2026 09:03:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4C-00000005imW-16wC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=; b=IC9XkApbIlHR9o36pwKmKOnLAN
	O6cYwXNqMVi/BnmhP0dAYu4HX/bljylj+1wAADEApRdRTnPLSPs3vZMkjBGuHNyTtlEnVJtaRCakf
	iT2q04500FPXzFfCmDzZt6Flz1n0Rf4HFmXlzkcXL7R4CqGb3gylN8ojLcpuZN7cYpaGfWZ+YhPlB
	8+rZ3l4KnicP6Egs0+5KG4jow2UBHuLe0oHZhET5/Ko+kLlUh5D1xjnj33QWHh2UXTm/h47rVw2lT
	hi56+b5UceqKqhd75Osx6+fvBead4EHg/WLo8DqcPC9pT71TXpaUT98oGHjsfySohPdhbqiTeLGL8
	zvEhFOCA==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P46-00000006TEc-0HJe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa663c1so398293666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462977; x=1790067777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=HO1pi73jCeCJaioMkRNLho8c+AwjVfSEpgSjKdG5iXJg6C29G0JBkSvrc/DVYhtqcz
         Iy+7s30CARpTBu0hC7JlAw2D0u4SD8FLYj6nDsX1TyWcQgmBq1TvbQO53bF8oZP9NKSE
         pa3m/0Sz726rKv3UbaosHirPJ+eGzXxU+BqfvNt8XWEp0dPbt/jDlcAVh50lZ7oZO1aB
         IBpeOG0nfyWJZkuWjB5ZI47gcXQiz86FuVeIu9x8A0xQ17aelCjAM1NINO4w5wSxuQNj
         r/CXVyasKSXciWjeCfNmaCfOKDlqTmC569zZWqzCcOkATF0EnUVMnRA4EJlpjIYRugcB
         LkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462977; x=1790067777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=Ho6dT94pwzLG8Sl7NKl+MnVRKKIjr3ZAxK7Z2dxjZ932FHtPerN36uWnWQ01JjnNeG
         LYqOgriOa/Zy5U2mqcHF5Du/YIz7x/N8RQDWgmch6OGuXI+FgPvwZ0MRPc/lUMCgwYaO
         4mY3cFLdKGO695MZYNRUt1cdoy8BF6sOHRAk/J5AjLDoi/mGHZpO7g4gKjSdFc+MDcZg
         Pnsdr9jJq5u7KMx3SjSD0lgxk8sROxteoxt2u5jLk8yQHzJKDrw2hEPEnmjeA7wdwq1N
         KqXWHw7uC/DBL47eaqBnFfq2VS9qiH6tLHWROumsxusjchiTCNmrLGCvEzz8SNzCNqTm
         TJIQ==
X-Forwarded-Encrypted: i=1; AKwUvByTFiz/Nc0R5A1NnIUmbZXnnjQ+9KnwSpBGifJalPfsB9XKvNE7MZXBodR85Ap93dsYNFCFqGQuYZMdr8zG6Fki@lists.infradead.org
X-Gm-Message-State: AFuF++l8+hMcqs+N9JtHWnVnodaiOI4RtvtHRRPFhWRFDm/aWpi+gLWy
	PHPdN4iUEjsFQTryap2QYkERs4rCL7h6z4ZWNXcNVQCpRiLRgIp+1kQA
X-Gm-Gg: AYBFou2f9hW3870A8+745Ui8aGSfZSUo+4iJGTBBkwd8PKwrDtaIKS9NJKdCteZ8GXR
	k68q8GVDswZCs8TjStBGSxjrRwBn8ojr4rOwQ+ODwnWfMvq08wf6/rmdzt1LOBw7z0KoBFISwDc
	leJH/Jonut8t/klNvn9/QiG3GZyx86cVssvQCtJN6WGB6tvHiOBRpfoMmlZnu6LbV+6ry5QJQ3r
	DWWMUR8fsOwryapft4haDEkcQ5aCoi9bbggNUrwuQiNPZ1IPYiwQYXIMO1AXm1t8AksQOeAdiYu
	v5TUbbgnXi+OpqQy0IYKShO7lZixrBfmGF7Be5aDhQX3De7ALbRkM73hhMHKFVOzrtbSPGn1cqg
	i/R+7hrU0gDDbVPLBvbdT3u3ZEQ7CHVwyZ2GWkyjB3tPy4s5vRqeRMxrNZ0z12LJHF9T9VB2Enf
	Y3C2KbMy3v8anIhYW5oPK0wDeNciYpKuVnCtp7GxjZyqwncuowCO7FihdbncMBpWrvXf/qGTRFh
	BY84+2vpNuPcpwULZmE3Q/UvSb/EHEK8P+aITkhr3wqnKJ+5Z//DmElHWbLbeHC3zjNlspPOeDO
	RNmedo/n/lUSwgwR86+sPK4j5jbt8APS13f4ByFJ2xuFCmwMC6ESBkDffH4EmktMVxujVTwI+Fw
	jIcq4LpcJU2A2RcZ0N71f/DtQo7XuOxFBWh5if2NZzLOsdoVKeNYDaV7as4Chg2e1qMynb6Qppv
	7Z5Jhv7NnJN7kB38Wl7oi98uuZ2Cuika2yEV2yIdiC2XGwdsQaCERVT1A/Nea9fSepQhWGVP6qa
	+985q8oUGk=
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id a640c23a62f3a-c29b839a057mr853572666b.2.1789462976636;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 3/6] usb: xhci: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:20 +0000
Message-ID: <20260915090223.1346-4-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100259_732222_4E95CEDB 
X-CRM114-Status: GOOD (  11.20  )
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

The disable_runtime label in xhci_plat_probe() and xhci_plat_remove() both
call pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: b0c69b4bace3 ("usb: host: plat: Enable xHCI plat runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..29e743d6868e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -388,6 +388,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 disable_runtime:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -461,6 +462,7 @@ void xhci_plat_remove(struct platform_device *dev)
 	usb_put_hcd(hcd);
 
 	pm_runtime_disable(&dev->dev);
+	pm_runtime_dont_use_autosuspend(&dev->dev);
 	pm_runtime_put_noidle(&dev->dev);
 	pm_runtime_set_suspended(&dev->dev);
 }
-- 
2.47.3


