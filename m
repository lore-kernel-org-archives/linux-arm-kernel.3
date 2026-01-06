Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371B7CE9D79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=; b=lrnNSkXQeDVYDAUe/QywjSJMPM
	Hdarh5CNAwVOu03j45lT4FSvXXDmIpelgpJ4xvS5HECi7VHJXymfXolu9uk2JMBF2B5vKmeBJGjVW
	krJ/8akt2iTevjKMMv/RRaRm4w8689o82nQYL01aThlCtI1oxlEdYKBdTnu3//zBM5IUo7DRH8g7k
	WSdPrDrojmEx5TN6LoEYfOVFmOLllRPG0RhvSXpqOh1v0mJCp9AEZyO4Xt/+Idz0dR3wlcafN3XGN
	jDZkpIln2QLPhLOYq7LYxR+o9geaQwkjRjeOCV9QXKHhkKX8uj8TLBTmAPmGbhV6bcMUJGxMOWYnf
	cMeb19tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9uh-0000000DU9z-1R2s;
	Tue, 06 Jan 2026 16:28:07 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9ue-0000000DU8i-2ebY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:28:05 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7c75fc222c3so633462a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716882; x=1768321682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=;
        b=eDU+vsXKW5fwGyYRw2H/ehNZ7PVFrnyIb4a+lNFyv+xZfzCqxgNGQwVVuI9/9bUVTE
         ji1v1+waht54620bXyvDYE11r+6McBeg/+b6F5U2bFprsZhRN1Mj7ZO1t2HUm8ba8u+V
         Fo+mOGKpABb7vGSFN2DQxu9UBbqZzgEieSm1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716882; x=1768321682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=;
        b=LEBD9DumVZKuuWaXZI8RPeqwWLfVFatmEWYyd+jthzlQbWUXIM6Fj2I/n1GZB3fc2/
         P3rlGG5mcxVMH04SZXqc5pxP1nDVVzp1BAi1VhbF7vlQLzDteIguDUA98wqRsfOC1uP5
         ilJ2RgO18uOWIAtv0AK0sGVCRWnXfQIGKERSBG/8xhv1pYr5CPLv4/nfHTFErRiIl9CI
         wTi/J4iFbhJm+F71555UD6UKUhFKMyzuQKl4u3alzweK+YpPNOu94UMOc4EZfSb8Ya0Q
         D9y6obUXTfYvqm8HPIdr9rwA/I5aHurl9AZhuzrhdFlmcV0iu9z/2dX7pqjuImmVIwBE
         rf2w==
X-Gm-Message-State: AOJu0YyDhFDRzAWkX0aYwUQreKp6X03wjOQWxFzf3Z3PlAX0osIfMs+r
	3IRZz+jJsznDZR3oa/+Fo2/H/viM+DxUgLiXBDt+PX39WMY2yf04bzKm1FDv/Aux5PwM8Q6GFat
	XT0E=
X-Gm-Gg: AY/fxX5DR8DNS1KJRlEMK5U2ZyicqqOKv85fK9B2/qTOBhOJh2b3lEF+Cc5pfuJdebP
	Kw/R34Dp7+KbRHq3nLpRs7/3goiEClBcIFqr6wTKJBTN8kp8EEPjCiUuU6v50e//sawu5ZeO/so
	sRsezqQzQbkFc7CfFnn5JAeENFFhyi1N/AfJQf7XP2MsWjjBjQ3LhVXlDgySo7bOF9O0Eqnn9Kd
	4SKFmqgAHNJ4cJRHtgOXtqxOUafa80OBC7dSbHmy3+QtDqoCzyaTWAL9fB9fiEgChHRJ0S86jn3
	fJMnb8lK5O1/tr5EbAfhhXdqu/F0YbliWfoRjn0ahNZWOmMiyA0SLIbBk+ND7uy5SjCVhDtDOdC
	/syzm4H0mOWKluykEhh+1DoudMCAp4Xj+i2BqBoDS/eTzRCQiqqbb9jNPLfWyn41lAe8ClS0zMv
	eXzqSX
X-Google-Smtp-Source: AGHT+IHGVWR+o96TRxTuXQ/F0UqzqBMP6VrRhont/V7m3XjqYj+I6OqdMsB67tcwk8vgU3JBwJdygQ==
X-Received: by 2002:a05:6830:2647:b0:78a:5183:8f6a with SMTP id 46e09a7af769-7ce46710f3cmr1799055a34.28.1767716881755;
        Tue, 06 Jan 2026 08:28:01 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:28:00 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/6] scripts/make_fit: Speed up operation
Date: Tue,  6 Jan 2026 09:27:31 -0700
Message-ID: <20260106162738.2605574-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082804_675906_740E7CDC 
X-CRM114-Status: GOOD (  14.75  )
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

The kernel is likely at least 16MB so we may as well use that as a step
size when reallocating space for the FIT in memory. Pack the FIT at the
end, so there is no wasted space.

This reduces the time to pack by an order of magnitude, or so.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v3)

Changes in v3:
- Move the ramdisk chunk into the correct patch

 scripts/make_fit.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1683e5ec6e67..0f5e7c4b8aed 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -98,7 +98,7 @@ def setup_fit(fsw, name):
         fsw (libfdt.FdtSw): Object to use for writing
         name (str): Name of kernel image
     """
-    fsw.INC_SIZE = 65536
+    fsw.INC_SIZE = 16 << 20
     fsw.finish_reservemap()
     fsw.begin_node('')
     fsw.property_string('description', f'{name} with devicetree set')
@@ -299,7 +299,9 @@ def build_fit(args):
     finish_fit(fsw, entries)
 
     # Include the kernel itself in the returned file count
-    return fsw.as_fdt().as_bytearray(), seq + 1, size
+    fdt = fsw.as_fdt()
+    fdt.pack()
+    return fdt.as_bytearray(), seq + 1, size
 
 
 def run_make_fit():
-- 
2.43.0


