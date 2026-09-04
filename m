Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273ADC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=; b=GFIB+WpXkI8LqEUuXUVBQ2hQnR
	wU74eszwRxU0qWhbqNdEN0F/SQihX3WX/dlQxshwBAbyGluA7XSN+cWjkV0i+sFTz4ZUujJyVWeTd
	eeADhy99tbLK3bUjYeqhsbYh5xsyDsvVj8Mnn0SibMfv91LlvGm9RC6SkSC2eaR9HpGHr/iUBo7g1
	AkqYDKEUZdTSHSw8Q9qu4iJsTe5SeomKKu5/PtdMbJnJxdAqPVMbGcbIw/9y4Se+O0fISrzYBSuM7
	IBAV8dE45ckh0FelHBVZLohiRxTmi9POmXVT7hgFBFy12+TeHdVjWFC6AFkGvaB6r5755LbqSoeAW
	o6ACQO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVA-00000001PVr-1gSr;
	Fri, 04 Sep 2026 08:42:24 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PV8-00000001PTW-0pg5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:42:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso970245a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511341; x=1789116141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=;
        b=mZhs38QokB2QdakyBpWbjvjHVqGnQSILOLP7KrzOqbZxFFNh9RcsDHQS3p3rm66EOC
         abqE2SjzHMS4/gZtLTbcDK2lTu/5ZHR4pxYMhrqKB5pShPfO1mNXdBDueMa1BwVb1Xvs
         s25dkalMjxwCZVL2fxWgHKWRnvJr/Y+rGN/aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511341; x=1789116141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=;
        b=l1Hz8+34B5YxYdAOou7i2lc9O680mjIQkJRcAdSiUPusc9bvV+O9ZYqo2ooUb+4/YL
         yJk+c8LjJAj6Yp7h6vbHMtKwCF9IabCe5dZhaKQcXNh0y0MXpc9GtVKLEgUNmm9Kz2iE
         adJiT0qmmNTf9rg4YunRS3KhB2RGGYSggScS9yxHgFnjnwkQh1IIKtSxEjDE05q10fVi
         xrQgE6bT4ybZIt/C9YeYzSzmaOjLY1l3dVfAnThQezDGGObveFTJVgluQYimOJs0ZKlf
         5WtXOUQ2h3wCHsnqg7NNozPEJHxhEfKFmp3k3szJyNsm8zdrKFUEZ/G4Q64Ts1XQCtMx
         nH5w==
X-Forwarded-Encrypted: i=1; AKwUvByw2pKYI5777CIbnl04zHGOp2kK1WkKlCGOzW/4xKuumwUFl1rPPzgvItiYxWLNczRiRXW3j26NHEa3h/4Qm/sV@lists.infradead.org
X-Gm-Message-State: AFuF++nYxURceJcFh8MAUvza8wsQQYEzE4ryWHNqMQ8cUxn2SpZvBiPe
	ynfA30a8MgWF+GGfbyza6EB9M79p4OG58Q2+tGqU7IaTmLOo6Vl0Z8C+5QMb8XN7uQ==
X-Gm-Gg: AYBFou0wT0YA+rUqZNVJB5ie0HHwsk8vhNvFvO+kmAAMZba7SAOe3n2eAYwNikwgREc
	X5VCGh6MCB5xzEkq2vN1CaqpcwmSTz2jezOjuTX6j4P90dL4Jpn3EOUBGtscYrAtOsPyzKCWpeo
	qbPBUc1NKgCEn+jFSXxaaCsCtSPZRatt4Ayo4TRXxr/Di4XiR8eCgyMhg6pZlCSBnBElRJ9ooOA
	8TA7IreZ+XvRC8NsmSkws+FmYLkIAzfuCPXUHwXTZgRN1m7SsrZZ+dqp/ZwAC1GW9VK5nvMtlH0
	TsO9s+zrrbuqD7aaWJdNecEQDnLrT0b8eM1SUcPRj1tIdZdxh1hUqIxnl3WBtLgVR5Toqnpu1/k
	HlgWEAcN/gJbycy+N32Eokrfpv7pmDbkY4zikHAIdvKcup9r6wT+p/lc5tt6uMOcI2WedI1nvN3
	so8cXGvDwU/izZSD68at2xV2R0QZ+PPtj385UWYtCTNeHKTqsdjo79UGjooFyo0aW1pVuu1LZ90
	s/7uQVwQY2d3wNR/cqBxWAaTpAqx/ioovY5FnCjEpId
X-Received: by 2002:a17:90b:5343:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39b2628fc1amr8001002a91.23.1788511341225;
        Fri, 04 Sep 2026 01:42:21 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:20 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri,  4 Sep 2026 16:41:41 +0800
Message-ID: <20260904084158.1341550-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014222_304896_D88CCBC9 
X-CRM114-Status: GOOD (  19.44  )
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

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 68108805482d..fe7c403e3fa9 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1109,6 +1109,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
+ * @port: Pointer to the target port firmware node
+ * @prev: Previous endpoint node or %NULL to get the first
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer. Note that this function also puts a reference to @prev
+ * unconditionally.
+ *
+ * Return: an endpoint firmware node pointer or %NULL if no more endpoints
+ * are available.
+ */
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
+							  struct fwnode_handle *prev)
+{
+	do {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (fwnode_name_eq(prev, "endpoint"))
+			break;
+	} while (prev);
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index 3dbbd01a52d0..691e792775d5 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -509,6 +509,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.979.g7e5102b832-goog


