Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4728CCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fWmEChdpxrErFjVsn3V3ZIGQaGqnJGr1o6tiOdOzI5s=; b=kcrHHkdiAjtE7ZUvqjsXAYtncw
	RSk1AYuMwVPXNf/N/TZS/tn2U/3UPCgzhAfnq9cXnboECujfxVRkYuquW3Ozy8LuMS830dP4ojOYb
	sksHtACLEZmw6FMNv21vNJ/F0qhSklQNyw256H0DIjMNwx9Q6kvR3T4/8qEqoQTcvvlCVXBCxzzhN
	THLLZT1EoxtBxJsrEaU7NLDI26T5cuszs5rrgSnW8hNl+kN9CgolDoL+HyzyAB4UbjdFc24039GQ5
	tDgoXFIno35Jt2f3Qq+/1OdzqRzegVmb+N2I2jsJXV0XSkMRgqx6zERGm6vax1kCJiGPPNxjVkwr0
	zq0tXppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pL9-0000000BfQ6-2256;
	Mon, 22 Sep 2025 22:48:59 +0000
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pL7-0000000BfPL-2r3H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:48:58 +0000
Received: by mail-oa1-x41.google.com with SMTP id 586e51a60fabf-31d6b8be249so4572389fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581335; x=1759186135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fWmEChdpxrErFjVsn3V3ZIGQaGqnJGr1o6tiOdOzI5s=;
        b=EUbn4s1009yYX956hk1NRB1JFIL1sr0iJTlEVKyFJ76QVlLsArRZ17X7DkhpDWgzfA
         n9uTXSmkFhcgEVVI1+7ee8/XOBjG1dU89ySRBZ/LXG7eDIv+nILbZpbJcB8sf39emcc2
         sL57T4ufswWyzzfIxfKT2SNK9PFqmQsOrlg54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581335; x=1759186135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWmEChdpxrErFjVsn3V3ZIGQaGqnJGr1o6tiOdOzI5s=;
        b=SCxuZW54S54BCiY1wF7z9pTClglyRYceuUz1/eaD6TinRzKKB+uCCwqHhXHfFaG6DW
         eLXitWey0nTE2NP4oiz60qLBdzWkqAJOrZXQrqUlIeNfi2q9PtuXnsg609HjjqSmwlVP
         wogFOwyFSojkwHYgYv6QyKaSdk+roMk8oQAkcrIuJlTuxjfLFuRDcP42DoS9RS71Wh3Z
         6hcH33umJfUSQ9SMPizkUikZv3J0o/hStU6tTulpx7AKIEjwMbu4sEboNi5hL9zvQf/Y
         pdPsbJLnKEPWcll0axachDEw2B4GntFyCwgqDDVkHdg9HZVKm2r+EkPU713kJuKsXAV3
         rFZw==
X-Gm-Message-State: AOJu0Yx4ep9v1j9aS2prYrKnDM+V2HOsJwKCOh8hez/hZk8gg/BS1bzg
	4rgZMsJTM/ovDX/PhyU7pVw4qvGYD09FTrfsChTH0HBR4xzlrImoJKCST9JeMG3NhATXKxnjMSz
	OBJsCBGfe
X-Gm-Gg: ASbGncvb7xcMuNclXE8ArK8kr4sUzj0iyOOhIg4QF+O5w8IUWqtpoGEtwvy55pJFapE
	4g25Vqi/EALiS4r6TpHwbyfyK9TKDf1zXqS+3f+nIS4+Hr7+w/9cwFoNJnklLL9pC0Yx5QxWT/2
	zZYZDyj5J+IEa8FmmuBwPb+mQ0liB182OWtvbueVp9nnNZTvMsqkLFNHIfx1FgEXmJRQS5vyPN9
	wCc5Dbn3Np1icAbNlMR+Qylg/qUtwSVw8nzH1YQTm9uweR61HuLiZ4fypfzxgMkFlqc7qiJWD48
	Jx/FJk3HYPD1Jo4gMZhJFsg04u+qmtGI4Pba+u2wkMoLBZ5ItWE3KntBd2GNw9maxmV0HXLzaPE
	pUwLel0DZhU+iDo3+jVCvS7rYFP+g3w==
X-Google-Smtp-Source: AGHT+IHk03TiuVfvlVnwklNju8cnHVtFH0Gbcp+nf3/MfCBK3T7FJJbepFKpUdFIDYDjJpSQH8vCBA==
X-Received: by 2002:a05:6870:96a7:b0:319:c5ac:c375 with SMTP id 586e51a60fabf-34c73100e06mr307739fac.10.1758581335591;
        Mon, 22 Sep 2025 15:48:55 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-78780383017sm1167244a34.37.2025.09.22.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 15:48:54 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] scripts/make_fit: Speed up operation
Date: Mon, 22 Sep 2025 16:48:28 -0600
Message-ID: <20250922224835.1918759-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154857_717617_2B395E53 
X-CRM114-Status: GOOD (  14.28  )
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
---

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

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fita3

