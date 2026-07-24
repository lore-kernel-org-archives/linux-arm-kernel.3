Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4CBC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3ipik7auGStkEDr/T9A/4r5EQKWd/pec5jMaPqfTe4=; b=PRuBQzui99zoW6unJ2ncGq2DEf
	OTQoOBkbQ2tW3+NFMvEoPJ60IDlHATrVKuoTKqJUrah73jev8+kb/yPCBBl3aMwDK4sNHngwE4l1X
	+Rtn+sgyerZC39apREstvFMOSGpC1VKSY0fPrJQ9o2e/Fmi8JdtSoxU2+zRl9XzeHlMtOQFSkfgTZ
	v1tdvuuKnNooJ2zz+YvKfKkXXibb93nCuSaTJUwLEt9TTTCeBYo8LzVLP2vSpzPUJr9L0cyX3JN/c
	Wq5yweM27P8n0X9RoAx3ywUnGH7Fgnrhtv0BPdKsdCeQmAQgHj5YsI8pTihPLl4nH6+ldwNfcLfaH
	30OovFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWF-0000000FqjX-3MUN;
	Fri, 24 Jul 2026 08:44:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBW4-0000000Fqai-2R5I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e08baf860so156946a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882664; x=1785487464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3ipik7auGStkEDr/T9A/4r5EQKWd/pec5jMaPqfTe4=;
        b=oHxwIoiw2RwPctcWZ030MWa2cTB1arlIjWjcBxaGXhcc11x30MDKQo9hmC2YzisX8t
         rt3QZ5Cn40hxZmE1c+dNPakHZ36yRkfQJqVGy6AjNL7DzNhxgNBUCrJNGdzgbQi/Qfem
         JJgp0CF1k5lO6Yckq+/+9aq8Ltn187uA5fIu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882664; x=1785487464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3ipik7auGStkEDr/T9A/4r5EQKWd/pec5jMaPqfTe4=;
        b=dwKyiJ36IbSUKIHV2R1/PhwGHhtn/74DbUjKz5vRoOJMcVVRCT4bQRdlw7OBebShz9
         cXxLAowTBoyGEr2O/62667HXduttlqCZ8dfGtegTvKTGQXp9kaA3dJmMESNpBM1J2/Ya
         wHB0yhbq+HWdn4H9ffwBZVJkh4wPywdzziBFkcEVYhiod8rcRw1eclNsKbalpty9Kf+L
         mzpGS4X4mW75MsmzK+aPQPsZuNPAhjHDrEzVkkiLEsdBhFJE77r8TkITxSr6wm+6KDFJ
         aR34PGGphFil4Tk6DJbxgYu9x/AFtv8pOqdnU/oRLkZENR5XBnrfZdjqjkahMny7H2i9
         +QFg==
X-Forwarded-Encrypted: i=1; AHgh+RrbdIUNxoYj2+Ev9k8NPwS3TNgYktos67iMrZAV5tORqaVKY/bOQgoaE+ve4JzY2F7m1vcG+u62IcTTrfwA7Oo7@lists.infradead.org
X-Gm-Message-State: AOJu0YxK4OELqUgFFtHDr/FeQLX7aKBDZZh6JrS451sIen2X7w/4/p26
	hYw77QKvXeh3+n7UJi6cP6dtZTg6jpsfgDU3MkXV6EeBNb1/oYfrQA6mY1E7TyCD9g==
X-Gm-Gg: AR+sD10rbT0asT3Q6TEMiaRRE2CQX7gJnM+KtZnRtDx1s96rX0sGReoQkip9F29lS69
	dILHuqT/lH7T6Y90gpnL4BEtnPTEzeLBC60SNVL7TAQNvbyEz/TEJOvGFw+i6FqZ/wCtxw06bNr
	XJIqvCZ4d7WHqDpZU5suA7kAgXxkMUTMCNHoplnSgl1Mct/XUtEZX3sHYLQ+Zrobu5jPGXmFC8Q
	oa84/Uj5JfVzg2s+LtZE71HsSxwdVLsqzNUNqsJDhCzqbXMgEkpaaJ+Darga/lKncHyxcfx/4oy
	o8M1yNKkJInjmfvRh3H36H5YX6ltjlDndwyIpBIuKNgUZbTe3pcpp4T1BsykmVBmiKBanALNYkP
	SYTCwJH6GuDaE0ZmhIUdQQB2c0H+SjySIjC1p3Yn/rluoFVdJZlvAHFLawC6USs0YZmLXm26V8V
	CT/pCwSkQT9a2KxZm6IF2dS1dfSdfnllYtcvhfp2CAb6+dBgj+7VBaWevejE3Pjt+KIkPJGw==
X-Received: by 2002:a17:90b:314a:b0:381:23d5:693f with SMTP id 98e67ed59e1d1-38ec65f9916mr6632501a91.28.1784882663919;
        Fri, 24 Jul 2026 01:44:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri, 24 Jul 2026 16:43:13 +0800
Message-ID: <20260724084328.3943997-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014424_624713_EFEE9352 
X-CRM114-Status: GOOD (  12.83  )
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

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2cfe09a141d8..715f26f05a31 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog


