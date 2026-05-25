Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4386CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 07:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=24zthJvGUKXcZPIu9w9sob21/I+YzFqoj+uIkca7DtY=; b=iY88hYCEW5UgYCSqxvNP1DokAU
	nSZv/fxm4FmtcxeENtKGx1kLLzfHA1di2VjApqta8jEvY0K98VZtOzaRNMtKr54fsCg/QfgQl00ge
	IH0awmzvRrwT3jfu97VMFfDvLMiD2JO/3eC2udHv6GP59ZHAdMal26wArtz3XtlTkL+gWKwLn2EOR
	6cCixwaPxAwLoIpY45wWBycGD/ZAqAGRmOTQqNVlFhvDJXonmzlStfM7c1ZR8gKOO0SVooJ2vXWpo
	TrZmKreyO7cd/ND1/GkA4drA2Qzurmq5bp4ubng5Ji6tIsxCahFFK58obrH/Hjs81SeKcc/5TMzlR
	MV5YRZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPYU-0000000GVgN-0AJW;
	Mon, 25 May 2026 07:16:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPYR-0000000GVfq-1Emv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 07:16:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891b0786beso62479465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 00:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779693409; x=1780298209; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24zthJvGUKXcZPIu9w9sob21/I+YzFqoj+uIkca7DtY=;
        b=nSGEji+CxIZH25Aw0v8ploW3/NFNuNvYhB/SSe+CDignAkK+N/Ie7p/aBcTB6lxmJG
         YL3UBYwOmrJCML8iJJa9TBYQ5+4/17DegrSD66idpU+lQXvxf/aByT7AF0SdjLjqhBqf
         /ApuIIeIZJRvcSplVdUBFi5B/URccwKMPGL8ne7LTR85WezDNWtyDTsUsw94xnywcHXM
         eea2SPJBKpxEuHDHbApeulTCS5NIzL7wzqWeGAdw5eert76e26yeWZD+rKFGa5Q20Zbt
         Tgwaar8HtPPOi57YIDXsfRzioSTSjPgXGHlw0lkJ8+yAD7PSWpiheDNy5UwNCfXOCKih
         fOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693409; x=1780298209;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24zthJvGUKXcZPIu9w9sob21/I+YzFqoj+uIkca7DtY=;
        b=GrsXo88ye7+LJCeA+OYMjzYmQ9bI/JgDgNwyDJCtg1PO206Ti8fCFWc7HNkYH7XxzD
         ovmqOMNCedmtpmF+cqyamQkd2DhXnMS5wPPFjOOKIxmt8ualP1rFCoW2p6OSdEEg95rK
         NgcuTwseoGoFh03lX6KQC9aKbSizBkLPKq/iK5pyQq8ES6Zno0uybNRJ1kNNYsU6TQn7
         UU6VUt6QLJxlc95Q9FYj8Sv3ZYfyz4NIZaj6s+Qn+HwU3pVb/SewSUgc71ob+WLHk04V
         VvaUQq6d2Ljq8g0NCciu8+DhTLK4Q74U8DR6gZCrRUdw+gZ/hwJS1h6OSHh27EFnw3dU
         cNow==
X-Forwarded-Encrypted: i=1; AFNElJ+Os2XsyJ7FEuKgXM9PMzFh0jmuDXsJzRfH2chKkKvXYK4b5stll3KmuCli/WQuuZj3Qr2UyqSVU2sTOJI+VWzL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5h7djIaLBuEf4jie4qXr+gu6EOLDSXutZuF4g9nXb5TjyD+Yn
	fy0jtDunyE/Eo59qgKbtDZd6yQ77Y5SAzBAsRYWHi3EIpVSAjrKa6WYT
X-Gm-Gg: Acq92OF91RD8LY2BjaQJqeviJAqcEmzLdzvgyZhIAKlHKfzgtRw4t5Ziu0thyQR8zO5
	EIPYw13NEIYMutC74k9S9G4IHCVxrq9dXPoGfAKdi+bUoxF02TNAl/c43hDxn0KX5aqodngI3yn
	Xog05mF8jkX1Hc2vKB9hm9eEeum+RndntwIndomdc7ytz0QhaAbs2WlvxO5rXz7+p6ft9sgvKv/
	9OauwhurLTrIAPqPi7PtEsQQ6HeK5iQ3AOW4dqodeuW2Ic8rB877kDJpDuegvlvfpqpWg52tKIz
	qDEH0pWuRdM7Pidr7RM1Taeq58gVUZpE56ALq5iN/onK1Bvlhzeliodd8PMQlIm0lggapKM4Ocx
	EGhScMEJmXF90L/OjwWFCjlmc6Arq6LVBcYtt6decS0txQ7a6QnNSMZtR1ccPp5pp8gAofet7I8
	C/PfCbPrbqC7XgAIYbjJy3k41Tbnq+BqenJqBZAQXB0DWd
X-Received: by 2002:a05:600c:4510:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-490424a682emr203079855e9.10.1779693408960;
        Mon, 25 May 2026 00:16:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd1780sm26456454f8f.16.2026.05.25.00.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:16:48 -0700 (PDT)
Date: Mon, 25 May 2026 10:16:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: zynqmp_dp: Fix uninitialized variable in debugfs()
Message-ID: <ahP3Xagt1LJrhmFl@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_001651_341091_8551EA7A 
X-CRM114-Status: GOOD (  12.94  )
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

If the *ppos is non-zero then simple_write_to_buffer() will not
initialize the start of the buf[] buffer.  It doesn't really make sense
to allow non-zero values for *ppos, so check for that at the start and
return -EINVAL.

Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 7fb11b0a44f0..847179476041 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1888,6 +1888,9 @@ static ssize_t zynqmp_dp_pattern_write(struct file *file,
 	ssize_t ret;
 	int pattern;
 
+	if (*ppos != 0)
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf,
 				     count);
 	if (ret < 0)
@@ -2028,6 +2031,9 @@ static ssize_t zynqmp_dp_custom_write(struct file *file,
 	ssize_t ret;
 	char buf[sizeof(dp->test.custom)];
 
+	if (*ppos != 0)
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
 	if (ret < 0)
 		return ret;
-- 
2.53.0


