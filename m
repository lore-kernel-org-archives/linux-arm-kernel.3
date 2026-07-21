Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2839AC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=; b=kcXSjCJ6HZX8hNfzTGpBZc7ial
	laIJGW1wCFluDxrw0Cv97iu6MJOONvUNnMRhCg2X5LF4BQTkADwfI9ZOXiTgyCEGQABGtSTwpuD0A
	m+tN1W/ldHFCC/U8528f6qt576mWU3WauSGL9TQi2WF+YaLw6KfRN2ojQJI0Hh/nr4/eb2P1RN5pX
	LlnlZy2+QZ/ib4ywAa+t+y8d5dGCqP/JnK1hh1/zxJmjonjRT+be817RyYQ+plnXTCavpibCGd8To
	MRCYU6gY7aqFVbPm1ESKHyX1WN7Q9alpEtaA9eJODRKCRx6iyHueW4dc/eFnIW2FDKdDP8l5aK2Bb
	qsNCYNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NX-00000008a8b-2fNw;
	Tue, 21 Jul 2026 06:54:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NP-00000008a1i-26Pn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:54:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ceb096e675so109407245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616891; x=1785221691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=OMMB5oNPFINIzLr13OO6Q8wEsOaZRyXBeDvQbxNtAt/uFS1YWk02PvxwoXGWSRmy42
         3dgBMVn4ehnzpwNQtEyyxozdIfEJJlejCKqpeG/ddCpRs66nkEv4a7GCrW8MftTZHi6M
         wqqc8NJcL0S9J5LfEb9+2xfOfMxklXxaOL4kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616891; x=1785221691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=nGTkBHKgXjhUbYI41Q0UoQIoqH5Pmw75up4gWSjumZxc0OKl8QvXRo7cotwn43O/FK
         DTuDQKL+4g/WqrBjEDB3kvIB1BjOtmDz09yH+wov18sRzWFKyzZk3YthCNwsw4EEl7TO
         kRunRdh/QZBIhOddFJiBLXmoLi2RlBtUWccIrps/hcDXnEr5Uq+bXExtF0bOUcqu3bBU
         RrNvyIXBHc5icRX7fK6qiwgd1qj6jFz8tVbgKVxGhQZD4W4skPJETAg/MiscI3SnUQks
         PdH8enTnpY/fky+wWOsK3zG5ovU2MYNyfXS68TnQce+PgeeEiV0open5zGox6GsUvMHw
         AuGg==
X-Forwarded-Encrypted: i=1; AHgh+Rp25zyBbw2l8yQ9Im7iIFm5Ttm5RFl6f6GR1h1ULckej+c5UP0tWuJUNjNJVmcFgVyLkT8f9IDdubnJ5g3pOWq4@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ1e6cPCP6VbvciqFt72ww7xH6jLee5rukeBySeS0oZjOXAVSN
	Oxi6lz3QUEWrA6Vvmcp0UUeGmm1NDFPmvW+tKz2aoAFuHB2tvHpokqtkKoxRuQp3DA==
X-Gm-Gg: AR+sD11NiUXSuLoztJ9dnN4Me2WYMJ0WlTS+FsqGWq+ZDYGRdaic4eV3v/AS3xA84Ps
	59w1AuoQ/qHwB8RRTkVuaBshB9VTL4rpsIokeNzaXq8dJe1RW4lmA+xYsola8nljATo2dfxdioW
	Fc/zaBuNM42p1gHZgm8fx+E/U1PBZH3S8edvTxssaKhfKJYuVTODsyuugwuAsKvB50MT3/Ija2D
	nPJ23BGXespi8Llqe0ucsh0dxwRbyGBxPZW2Eftv1NIQ3/ewjP3Ua1sBO3d7OlekqbQFcTTl1ya
	1ApLjG+4SzPJPT0dCOdRaK07PALMqe0ecHEX70StEKmV9xr1r95d2D9OeFVTjA5H6DDOgX5w1WW
	QCpabVL2bS7rxICskwjl1z34az4sEw8g6CZE4AsoR5+v/7bSDxXBtyn08bIwg+3ajXR+uC1T8lj
	6BoXMkdVUJvn2RDq1qOdlxkDNlAAfYIan6ls9bfSd3V/GzoceLKuK+OmXX5lM=
X-Received: by 2002:a17:902:d4c3:b0:2cf:30a9:93fb with SMTP id d9443c01a7336-2cf349cf7a8mr187361575ad.34.1784616890927;
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Tue, 21 Jul 2026 14:53:58 +0800
Message-ID: <20260721065413.2306137-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235451_551847_6E7DBED5 
X-CRM114-Status: GOOD (  14.64  )
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Reverted back to returning -EINVAL if descriptor is NULL

Changes since v4:
- Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency. Bartosz wants the change on an
immutable branch to pull into the pwrseq tree.
---
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..72b96d36920e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on and 0 for off; negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..3c6122bd0205 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.229.g6434b31f56-goog


