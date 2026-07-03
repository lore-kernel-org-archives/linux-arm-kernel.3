Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E993C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=; b=tTUdbNOJpgiMR2Sxgh0tKEG/cQ
	5hLnM7NY8WcVrPI9rXhMe1A9c0SAj0GF63kSw5S1GH/bgUO+Sl425BVw7QnYQA4wGWWZYdLw2Dfj2
	zwqgAfb1ghBOwdK97Sw/r8lK8MKf/uV1lZ4eW7sk8GTWb83ExSCHprTCj523JvxU8SIrBriGm/2qw
	+bcthyAtY2SVZs/yXjZP4GI3G6Hj4LEFWmu/6Xnjz1H3XlaKS22cN7ePTaBkh6z0hIrAwgLyNvWMg
	hJnrtYatqGMIRHWCAKNT+vYEVtgNks+EboVrGbVrthLJqdqD7VtT//GP+NbE8VkH8WaQO8Qtjhj2H
	48webCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbh1-00000006lka-1Fv2;
	Fri, 03 Jul 2026 11:04:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgy-00000006lgZ-38Yq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so16667015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076660; x=1783681460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=dObW5vVLXSNrYlSQb0LswrssNvk7h3ntRlMPSj/SJ4nZNFgJOt1wVRJI6NnHP+lR5T
         +La1SRswKQfdKa08QR/mven4a4aHXFIc50viZ/R1hMJFsDhBHUX4wYgDWNaEV4cHGwnm
         bklQxAkbDgC3LzFLmyQBXaj8vGWmAKijKcQbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076660; x=1783681460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=XN2vOxpa6WzSHvTfAsE7BONi24A8jMxttbIu4QGN1lI9JPCgnM+5PrGXqjYcIoqAJl
         70ZL9qbaYp5y4iP18wlGX2C6+jcMDbEVwqGNeWxBMqKGpWRiwpWGJ4Z7iqfbY1KWdabX
         6K0E1CTVARbL7o8Pt+MmHBaGpKCcQWFyh570Ddunmr6GHq0/Q853WX/R2b3dwWtDKvIi
         mEbhvZmp+E8oImMZZX39M4BTUQ7fA2NVcEU/oNJCItxhUsA2sq2HbnyhZQ5wBGcdSCPS
         4MZmLGdzypnPf/rK7WtEJUPa95gbYE9K5mMElNdUFKxQE09v2MRTE4q+vLx5vO9zLuq4
         wBXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+qJNeww6PpGiEDSRRTyDtW0fBkSZlbPFkWw58WiBVq5b3Xi7ilas5Yh9QUnilvtwude0ZssVkHs9iJMUcsiwK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+vd1Pb7+kJnNy8yCBu9lcHEqygpnWPrTM9HTTJfkGbYRfXCsq
	thHwOjCi7yL+QLY58wPPdN54bVQJViEJUR+1S18OdHhruJnay7S/zsfUgWyfgyuGcw==
X-Gm-Gg: AfdE7clI+Cnt5LbdIDT3VmEbVQ6vg0+gV6++Qn+AoTbTO4lLd5LL8/8sx0R+bKSbbDq
	AjIqesLhhww7UTUEF/RfcWmZ20RAtBCmJCN7lJ9XBgBoAV9whizJiFlLlUmPN07q+ofp44nSl/v
	67ufwKMR4thjHdWaFBAZEkrWY3+/ZuZini8EC7eWYFWTLYy9H5iTBtHt+P1w2ONWaxgeGnGb+37
	UEAQhdSt46VfrjWoSqM94aRzrYgeS9uT2n7FtesqdbCDNW5fL0Vl3tiz6QBiA9QIHkhILO8q8Kg
	POgTZZk6lVDSXsKl4IZpyXKdmoohSx0w8d09aKwE3lI9FrwD64q/z5szl8Qa+mULohhEU2mpDyo
	ZV+Xyh68MsYq8OP2AoN58waXtb2iXIEo+SCedNz8uzj8PU5BXkVIWoGrNjK/3tXDJ1rCZMG99jg
	3OAuAIZawavNwMlQKMr1RDtbvlajjteQu5cVbwEe7mbI3MUYhwrE421z5YV7ncOcihy/S9Kd3Q9
	J7363NC
X-Received: by 2002:a17:902:d4c3:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2cacaa911b2mr39932695ad.3.1783076659705;
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 10/13] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  3 Jul 2026 19:03:11 +0800
Message-ID: <20260703110317.1283411-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040420_815804_4538A5CB 
X-CRM114-Status: GOOD (  15.43  )
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

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index c8ee6df42b81..16a47f76e7ce 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,18 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (remote_port && device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+
+		if (remote && device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


