Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8E7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XAlo36/cvqlWCfJP/st8V9NvEK1f/LvSK5OHVxavmM=; b=NV4nkLa2ciGlHOnnvXAaMinTT6
	kL5fz3/VL+rJGDzw4WOyluWjkCC2GsMR8G8v2We1n8n7WHZrSaXZIoEXhcwFaKmJK04Ce+XZu52lw
	0+jc5iGw586b8m+5ByG+F5d8HGHiXSLlGUht5z8Z1JlonVlWOZ6dCWKibhya/2gRqONXi4WXmOX+9
	jOneMyqpHFP8Dj8BXYnvL7aj4sHZ2s/0Ul+Tjl2syJLWnV9NEFrxOOPgZLbQNWRPR8z5CIHApms93
	Um32y5hKmWLV42Rwul/0HETyI2qvtQW+7nj5Ctc7QfbqrZp8eONmPqHFEqKKO+sKJcYYfcN3s88M9
	D/F27X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNp-0000000EDO0-4BQY;
	Wed, 15 Jul 2026 08:54:26 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNm-0000000EDLI-2HaX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8423f236418so1551810b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105662; x=1784710462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XAlo36/cvqlWCfJP/st8V9NvEK1f/LvSK5OHVxavmM=;
        b=Z3CkqtAO6dC5ndePqMXXPxFDlZGdyqWOh+g70cSgGJHiO7NWgdvYQ+spYK7Mmh6cxN
         vll6JxhWEih+vcDK612O6B3He80H/gkKZitFSEYBEsFy1QnbSTUAfwhpw+O50QHsaB9l
         gKc1+haFCSfegtbI3ewWI/QzpeACR8sgwiTAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105662; x=1784710462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XAlo36/cvqlWCfJP/st8V9NvEK1f/LvSK5OHVxavmM=;
        b=EYbj+DRZ/PloLnnXwwibISBie8QptUJyEwEOXsaEMM4GPyRipg/lj1Db4SB2ii/PEN
         m3Lh9s35sKxAAHKey48ZrzOadxyl7+8vOr+PUvOiRfAfJwO8xx5fzhl3nme4hOpVZPgl
         z57eSFDZkz552R9+zlQ9VJ+AJzKL64X7htLBLt1Em9ZKQiqMOoTDooTi9MtuQDGBAQqp
         T/yMb89fjbmrvqn8/zQqpgu6nAYsRlz7Blu6DVpUJXI9vrGQ8BQUj8fZm6HCiXMXvwtV
         8K/2p9KdFef7NOFA4+XimQjqyZeWFzlZKwesySCuL6ky0fGQKmSM41Iv1DkeAvniiJq/
         7Kmg==
X-Forwarded-Encrypted: i=1; AHgh+RqhYdrUa1S2gWPYWXp08NQnKz1PiLb1XM6+h4ks1oXObALsWgT7YQRW9vY0YIyhxxzaRYmr0s094y+zQfa5aiW9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjyh0hRPkhfCFs6denyOUnaDSr3O3X0O8ydaN8PnzgEgNU3T7g
	EddE/S7KQEnVnqa7BopPubAOB5UM3XHrzdTFYWNjcR7ohsUZ+kmMLmjDvEg9bg1rYQ==
X-Gm-Gg: AfdE7cnTUoj8z9lEj+jRAnx7xAYLQoPmBPDWTkVqH8wIB/u4G1ey7GlNiUsEoTpC7W+
	StJDz0G/x0x49x6aVGuyXbM5sBzVLixz1slGJr1WHdqACWm0IDrpLOGNMraTJP8nSlev/TUkmR7
	oAS36yLYBaeHB7+e2RnLFY83Lqo8pU9avj/vqOvcn3tuEFtuKybNcI+h4W4GrBbPoz4Wu+uc01e
	1FyIT5oeAFkShCOQ8LLofZ7hGiImPFsSThPQjG9IUVz5tIF5UIpC2SklBclLASw11AGzqpsaVw9
	kKYT+0mgoV/Z5EDkMGZqpR0RfylZwFrJfdZps9FD9jKUSIxhxljdnME8HmGU5wULAw6TpBJpj/l
	5GVmtcM+sXaO7vsH6vWFEzzmRClK1F7m2EH/ClWOTPICo8Rlz5Ewcs9jgO01+fawNXn2vqZCJ71
	nlD4IZWc8EmWzDP+9nc2Vhel+nAmaFwd956q3hElKpN00rTbqfxoWddPBbn1JPhkJVJSj6mg==
X-Received: by 2002:a05:6a00:21d2:b0:845:c6fc:2821 with SMTP id d2e1a72fcca58-84889604f51mr14884898b3a.22.1784105661732;
        Wed, 15 Jul 2026 01:54:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:21 -0700 (PDT)
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
Subject: [PATCH v5 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Wed, 15 Jul 2026 16:53:31 +0800
Message-ID: <20260715085348.3457359-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015422_628643_AFB77E57 
X-CRM114-Status: GOOD (  16.14  )
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

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Added flags parameter so users can specify whether incomplete ports
  are returned or not (Sashiko)

Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..950defc0c55a 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,35 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ * @flags: fwnode lookup flags
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Does not return ports that belong to disabled devices or endpoints that
+ * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode,
+						  u32 id,
+						  unsigned long flags)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
+					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..480ba8646bcc 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,9 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog


