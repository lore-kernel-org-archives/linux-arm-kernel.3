Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7D3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=; b=hNm27giuQxsCGHwMfpypQG+fdf
	F8j8WLdp9Kj5/VOcFSU2f+vmlNJ8aRcuR9V2sT43Rd6SC9VZxoOsHEYfGKPVpFOW5XPSlPKzRp/Yq
	Uo0qKMr/BrXGCVBga643SqlwqSPMBg2UlWQAnr1RdoS9tzasnQvKqq8LGoEnRG/SLYbV+OICVs3U/
	aUFJHE2bFAxICctDVJNie25zZazJnQoxQIFj7uw/nIKecoPvKdiAdqzRx41v478qiCF06hJXkYJjG
	HD5QOUPfZ/TCM8r1HIsSgX7MjhpIBaEDQEifaqIYJc1MXgVsMaczKd5rVsoQpTU7L6m2JVzLvuzd8
	Zjd6UvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4D-00000005ipL-3tZE;
	Tue, 15 Sep 2026 09:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4A-00000005il8-2PKn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=; b=VxtVt0bito96j7oxWrW51IqRWU
	s05HvNWuHf944v2DYvSqpMjW1qxEi6Xvy2suK8bk0Jg3OiWr7DPm5r3gvLQE+o7VIdKZikYX2wP3i
	jtAH8eDrFz2awUOSAeneEr/5rDIPmpKJBjwtPahbmZq27nw6C2DRn1o9J09jeqQgAZaZUoNAqtVMm
	qsD7lPWohoxFdbcNvGV4L4O+6Uk6jkOEbnb+ZvT1pBaAv86tYaNx19rpTaQ4ojmc89qwSNIPOh7l8
	QixbCPDs7yAuyNZ+wOqbPcPPo2WCY//cuJzCxZBsZZhKin/JgybjbjtkkwiRfCJkH25jdZb6Z5jzp
	/8B/k/cQ==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P46-00000006TEX-0Iju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:01 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so3871389a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462976; x=1790067776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=bNCkoKpjzA4UUJrBQtvjgiiUi7/Y+giTucWDv7FVdW1pRIbLBZCccIxYmcNxPapiI1
         PngViBUvC2DGSnyQMmGCrmiT5ziLMgT5BgubgnClzc/9/u9KpolvB34XcCeT7CB1k6TQ
         weADmHZ3m6DkMCBtmncg3+yAa+D6rpT/Npqyv9obP0cPqlJVOLo3cNHQY6vgtuGtFwKO
         ENsedxFT3si2YFNhW6BKAAOB23VFMrEfWW5/k98DKueeYczlUIbthQWDH/kTp/Q7Lcw6
         a+6uzIVVxVn0s1JKM4b+TsgbSRUcmwjHJzW5eRAwiKNiupf0WR/YS/alyEzSm+KyQSnS
         l6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462976; x=1790067776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=0kJ0Us8L5kKyulXZaiXgzq5fPuYjBA8tj71DIzMqKGXDSfbzuXRRFxRWZtLh03BDVT
         HhttI16i/r9zZ/PwsgJRGf+236LU3oMn09QG5OaGJRymFfxCDp5JgIBuVMnbK065wdHY
         F3rDfj8p+Wds3/ICz9npd8IpQr71f18leL6YtuPLgN/XfuAPICVvLMxdP/GT/WMKEKEM
         H/BKOtpc6NmDOCOLnyEn34+p8t8z9/vOAmhlzz9aQgLeel57DSqFbA9587ZF/VRkeJ+y
         pF77NxQ1ZP9GjP3tHwsu8yyQIWw0loHj2svewrDg4LqHE28O5b3WbGSZZpg5rQVxwkHi
         HTpg==
X-Forwarded-Encrypted: i=1; AKwUvBxg7w/HRSBl/q2cPL20sXRXjsG/r2XB7SdOPb5bhzUTd0nwFUN+st1q+K3SJsQ50HOvCPFptULdranY9iXtiA60@lists.infradead.org
X-Gm-Message-State: AFuF++lttSsMzFzkSYuGhFdvcQSEf2tPuVzwWEp4nW3wcNHazxcNbXDK
	HEIjhdQ4xpLRv/V9zVHxYPKMeKLY1jTtoiniUUlhof+4/O3UZylv3UPk
X-Gm-Gg: AYBFou21LtNXRY8FxLlHYjJSIPj3lKTXpDtABTKgtwDWtks2ZwohICubQDjaIJTmehU
	l2iJKRtum27C5BVoybilNG5ZR2CVp4s7I1zjQvZzz4K0DKgc4W/z5rYP6ccfYO/5oywGyseYFSv
	TWvvs+AGR3KOg/Kw8zUy9G8w3mofAk6q+tvQKHNpdemeI3ZzIunBV8xZMVyWk29s4MBkBDgPHwL
	NCU6kp4EQzM/r6atkad6mYsqWQHRAkBfe+IULvPV4pVAsLD83Rds9UOCzmNgeslbD81sfssCpzy
	vU1KWmRyVJMAS+ZeJBlHJLC9xoDFEKoy0CXVVuwVrLVaBlafWSfOxc054hKa/6UKHecRaUcSILL
	c/rczVb65C7B4SuKdVL3kTpH0wH7D/YDoJJ0oglq9z225Ux04ougXrMdcMYodRNb9Vh16Elnk0M
	ZRUzkr36oWIuHHc2/gg817kfw/WB+1t+9EZLeZ5DFJ9TwOMzDqO9ggSNlZt7VGkSwXvX5wyqgQT
	CvD463AcUlNqrmRQ1agX+nbb7hGKh52Auko2di957hfiDO+eZbk51bFasfTyysQ3OnOZbszXq9y
	m4fZxlUBU4FLY7gP14850KQiGDBEFQw1IOKDnJq/n6OvVKchQdTQPRQg3qW+sVdl9ebj+eTfRxR
	MvrSuRKTRsVgcMcw/e92TLJDlpHxQUNBKU7GUOGgRs7eneXwwvfgtw3c2qd4TslXGxQ+IpPb29Z
	yOgQOizAjZuGEe+7rZHn4UXn7XKXwoxFeYuh0xac8pizBc8yHnxpg4KN/dzBJ6VWbY4S4Tb1Gwm
	VYGqtbO1CQ=
X-Received: by 2002:a17:907:720d:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c29b87180e1mr401204766b.42.1789462976048;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
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
Subject: [PATCH 2/6] usb: xhci-mtk: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:19 +0000
Message-ID: <20260915090223.1346-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100259_688268_F18F106C 
X-CRM114-Status: GOOD (  12.00  )
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

The disable_pm label in xhci_mtk_probe() and xhci_mtk_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Fixes: 04284eb74e0c ("usb: xhci-mtk: add support runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 60af5fe29bd4..eb483a267bf6 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -700,6 +700,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 disable_pm:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	return ret;
 }
 
@@ -731,6 +732,7 @@ static void xhci_mtk_remove(struct platform_device *pdev)
 	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
 
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 }
-- 
2.47.3


