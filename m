Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A0C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=; b=pGLo00TDb6dxJDau5tbTjcpS19
	w5yA8/+iRrN1som2RqzHm2im42V95U38ZruC8/KqTiXwHdvsduVej+RbA6PBSQ4alM0nmuYSiYNJW
	JZibNuC/n+Y6ig+WAtkWgD0DHFCRA//+Y/FLNjHk4l0wCiMICFt2R2TuecLDF0znU7hULyV+IaK+L
	AebZ5P1A8DH1oxAXk246CAxAJxka9VyISOHp/iLqyGBmIzheVlz4cXnJhgk4d5tWaxNJcb+o1icMc
	3jnAVDhn1Bp0xm+piBREjf2r6D2TuypvrXp01RHKAoKogdvGOSEv67l2abMAkKpPFRPoNWAPCrZAX
	TmhCFLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCid-00000001M2D-1hkW;
	Mon, 14 Jul 2025 06:31:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCOy-00000001IKs-15BC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:11:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-454dee17a91so29166175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473458; x=1753078258; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=p83TZ5yelZmEOLaqnWsPDS764aalSazNYIIzJbpk/Oa1+Q39MmdM3WrGT+1mKrvOoC
         uZ5cKJ9EZWxY10mctZttaFwizQrEd0A47tz/qJFXiUJKVxy9qXAwdrHggiuUYLPJ+3ar
         +3SagJiEvCjCzfkEMq9VFw/zC1RExpuixAkZq/SwD5troBtfyhWfOR/SGzcRIHkoAP3G
         OtW4Cj9C7X75FiybpQb1mQb5DSZZFCRw3QvNML3GnJkE9eykVxvv9NLw1/edVIPA2E6B
         ra+DGPjRcyZLiOus9IDrETWG5z/wVYYKupjncQQGTDBpm02QquBPgUt/TmyakX1LybjS
         JURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473458; x=1753078258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=M7LSWqytNKHyu8U/wUBs+KtZbYxZ+623V2Pr7o4feJRgRX/+HuxbvbHlQVLydVYBdp
         P1DIHzb/u9GlmfluAEjcj/GGaMETwIWa8tA39vEK2uplWGXx0CS9AP12sp5FQ4WwuIIG
         Hp+Np3BorUJpGcdpH0snv+j7q4781LlqnY2NnIZy+6udTO6hUx2PUn3tvnfn+wGeWW0w
         KYrbvuz39EQgJAW0qFM9qfM4LdKHWzH5ub5HvoL3ahShKTtkFhzklD9i+3qRUh31OM50
         xmpP/N83lJ8zyVUsnGd6LkQYABEt1GQXAw5XBZ9RI09uyemh1eEMBt5m+3rB/bcruFFG
         NQTg==
X-Gm-Message-State: AOJu0YxoW43i5svwJp7ZHu7EbvktNBVjzadRd53lB3X/UNH5I8vavBQY
	qL58nt73PHfF6oYq4zy5h72Rbot1XhdxuVwOSesO/c2uRKqOahL/lTnYgSquHhXdtelw6MxufQ=
	=
X-Google-Smtp-Source: AGHT+IFULlVjyNemOnSbG4TdMozAA0zsJZsF8hZ5FwjjrDDzQ4zhxHet1bEj5zD9JLh9WJDb+7sgf2zL
X-Received: from wmbel18.prod.google.com ([2002:a05:600c:3e12:b0:456:1194:a7e7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358f:b0:456:7cf:527a
 with SMTP id 5b1f17b1804b1-45607cf57cbmr50279335e9.28.1752473458182; Sun, 13
 Jul 2025 23:10:58 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:45 +0200
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4119; i=ardb@kernel.org;
 h=from:subject; bh=1185/TpkpWg9isRLFf5wyjQebHCYqV40b1OjCDnfhjU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3pfgGfFHvMs1rzs+7g2Z3jR3vmPyZLljMXN3nZu4o
 j/3A2d6RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhI9XmGf+YT5LnE2xivqL3c
 nC3HM8NQY4PQY8/mbbM+RMQ4nbzY8JqRYeV6Hz0bozMrpnLtY7c4Y8N90k7s2BaRs7se9l/3u/z 3DAMA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-6-ardb+git@google.com>
Subject: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_231100_305901_9C94B28B 
X-CRM114-Status: GOOD (  15.99  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The EFI rtc driver is used by non-x86 architectures only, and exposes
the get/set wakeup time functionality provided by the underlying
platform. This is usually broken on most platforms, and not widely used
to begin with [if at all], so let's just remove it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/rtc/rtc-efi.c | 76 +-------------------
 1 file changed, 2 insertions(+), 74 deletions(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index fa8bf82df948..b4f44999ef0f 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -112,48 +112,6 @@ convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
 	return true;
 }
 
-static int efi_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	/*
-	 * As of EFI v1.10, this call always returns an unsupported status
-	 */
-	status = efi.get_wakeup_time((efi_bool_t *)&wkalrm->enabled,
-				     (efi_bool_t *)&wkalrm->pending, &eft);
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (!convert_from_efi_time(&eft, &wkalrm->time))
-		return -EIO;
-
-	return rtc_valid_tm(&wkalrm->time);
-}
-
-static int efi_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	convert_to_efi_time(&wkalrm->time, &eft);
-
-	/*
-	 * XXX Fixme:
-	 * As of EFI 0.92 with the firmware I have on my
-	 * machine this call does not seem to work quite
-	 * right
-	 *
-	 * As of v1.10, this call always returns an unsupported status
-	 */
-	status = efi.set_wakeup_time((efi_bool_t)wkalrm->enabled, &eft);
-
-	dev_warn(dev, "write status is %d\n", (int)status);
-
-	return status == EFI_SUCCESS ? 0 : -EINVAL;
-}
-
 static int efi_read_time(struct device *dev, struct rtc_time *tm)
 {
 	efi_status_t status;
@@ -188,17 +146,13 @@ static int efi_set_time(struct device *dev, struct rtc_time *tm)
 
 static int efi_procfs(struct device *dev, struct seq_file *seq)
 {
-	efi_time_t        eft, alm;
+	efi_time_t        eft;
 	efi_time_cap_t    cap;
-	efi_bool_t        enabled, pending;
-	struct rtc_device *rtc = dev_get_drvdata(dev);
 
 	memset(&eft, 0, sizeof(eft));
-	memset(&alm, 0, sizeof(alm));
 	memset(&cap, 0, sizeof(cap));
 
 	efi.get_time(&eft, &cap);
-	efi.get_wakeup_time(&enabled, &pending, &alm);
 
 	seq_printf(seq,
 		   "Time\t\t: %u:%u:%u.%09u\n"
@@ -214,26 +168,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 		/* XXX fixme: convert to string? */
 		seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
 
-	if (test_bit(RTC_FEATURE_ALARM, rtc->features)) {
-		seq_printf(seq,
-			   "Alarm Time\t: %u:%u:%u.%09u\n"
-			   "Alarm Date\t: %u-%u-%u\n"
-			   "Alarm Daylight\t: %u\n"
-			   "Enabled\t\t: %s\n"
-			   "Pending\t\t: %s\n",
-			   alm.hour, alm.minute, alm.second, alm.nanosecond,
-			   alm.year, alm.month, alm.day,
-			   alm.daylight,
-			   enabled == 1 ? "yes" : "no",
-			   pending == 1 ? "yes" : "no");
-
-		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
-			seq_puts(seq, "Timezone\t: unspecified\n");
-		else
-			/* XXX fixme: convert to string? */
-			seq_printf(seq, "Timezone\t: %u\n", alm.timezone);
-	}
-
 	/*
 	 * now prints the capabilities
 	 */
@@ -249,8 +183,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 static const struct rtc_class_ops efi_rtc_ops = {
 	.read_time	= efi_read_time,
 	.set_time	= efi_set_time,
-	.read_alarm	= efi_read_alarm,
-	.set_alarm	= efi_set_alarm,
 	.proc		= efi_procfs,
 };
 
@@ -271,11 +203,7 @@ static int __init efi_rtc_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, rtc);
 
 	rtc->ops = &efi_rtc_ops;
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
-	if (efi_rt_services_supported(EFI_RT_SUPPORTED_WAKEUP_SERVICES))
-		set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->features);
-	else
-		clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
 	device_init_wakeup(&dev->dev, true);
 
-- 
2.50.0.727.gbf7dc18ff4-goog


