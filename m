Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C7ED41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=; b=lsu2MdA5gNXQp5KzhO7NSy1sJN
	9Xb5NblGsFa+w9vfQy47zEWt88wp6L9fng/OVFsqDVDnmzI3vWOZ+yQB2qlbBhk9jX23Z8nN30rNn
	QiQJ9D9OqmdEBIdcxshbJMpXhIb2ksMjIOtUE2bHVcbm+Qxo6/23ofZgOFz3vzePiknEObjw5KDaw
	h+C4Eoj4YT674yuWBXJ6LeDJrW4WBxfzHGVL/6xyO9fP/8SOk+Qp8K/x6rubm4A8KAaZlHPOutC4O
	rnDaUdee0keMhUWmaXwX6bJPKM59ZbH2AuzcyLQCFkrvjW/TSh0JgdK7fnJhVFXRv82ABiK6/mNqW
	1MKzV6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGj-0000000Ggkr-0Tbk;
	Thu, 11 Dec 2025 14:03:45 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGh-0000000GgkC-0uWU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:03:44 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-45090ef26c6so36029b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461822; x=1766066622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=;
        b=gIIkA7y007MZn/EfszA9jfWq2Lr6nGyUVw58IHneSbwhZCMPFtpl1qqDS9tuTqYSHt
         M9uBF7bgqG0G4anoF7Wjxidix/e8/xJ7AF3OgfdgjV/gfZq5vq+5nYCfu3GghcOKcrmo
         V3QVU/iuKKCoH1mvu49vdm06UIca0wyqKM25g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461822; x=1766066622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=;
        b=c3zK4hMklbgJEWytuR0+wg3B7utDGlL6tcCShiWE1MrtLDhyG884wwbamFIfvyTP3O
         oNEvn64/28L7SYF7R3jRW8U1RiWTfJEbJyzUlkYX3hzVLBi3Ed9MZHqFwUunmEl/lR5X
         KChwbRB4EXcLj5Zv3ZHsqcaiRilN710bC/KakqkpzA33Ggz1aIu2Hj5rbzak7r/tqYF6
         Tf42IObvR875Xsgc3DfuS7B6NoZLIvxrz5SsY8e4wipO54mJMcbfYq4fGbUckH5czhtA
         ezZZfe2DMJUyXF55XvpM5/pomRycYw5jCXkG3fAY1S9AVyDfSWVbYPBfDazAz51kGJl9
         1Omw==
X-Gm-Message-State: AOJu0YyhiCxgP2RSc24XDWjm1m/HO5Zij6RauO6jlg6fnF/YFcT2jFg1
	OfHJui/glDH2mME0ijeAhoMnTZqa/BHNEp33um4AnjpNmZxPRmFmEYBF4csfjPpHy313Js19/kz
	rtx0=
X-Gm-Gg: AY/fxX6bYq81kwFBnCHlXa9NeQ9OmOlj0PHK92ZEKc89oLPR+VdeErIqIqx3ePr2cew
	wmeQjiDs3c37TgYs8napxMUaTmK1h8/16Z0buJP4CFJsMS7sbq0kYQX8re1azo9q6Mc8DQwwZDU
	VAmoHC1zGqRFGnkCBibbsYWxVJC4yW79fV7D6rmFKpnRlauST05ntxp9XwBU5zsXNJikuWR9Wq6
	tXecimg7EHeYClpKkNWT58YNUHl0MvSyLUJDEeX5dwO5nwWFGK+sY4qld+gXijjMb0JCR/sKkks
	FyQ04VSWRrBkibE8CBT02c2sLPhh4r80fiPjcSs+rKSWocAZBS5M6IgRahOBKr8hl++DV6nXc9S
	+FBsG0rmPOasxjfV2AVLtcK+BPwQBhLgXY4b3e0v386ojOWUmZUtAC+E3pye/gFBGoU88sHpdIJ
	QAQi+UAQZdbZXF87Y=
X-Google-Smtp-Source: AGHT+IEa1BeEGmi4St54QeGtSB8Z4r5rsDPCPbjRjNJyjfsp44pJXGn7gep4nq/PLQSPhCGdL61Z+w==
X-Received: by 2002:a05:6808:1710:b0:450:b781:3731 with SMTP id 5614622812f47-455863b7c8emr3319159b6e.26.1765461821361;
        Thu, 11 Dec 2025 06:03:41 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:40 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] scripts/make_fit: Speed up operation
Date: Thu, 11 Dec 2025 07:02:58 -0700
Message-ID: <20251211140309.1910613-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211140309.1910613-1-sjg@chromium.org>
References: <20251211140309.1910613-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060343_284354_B1E202E2 
X-CRM114-Status: GOOD (  13.77  )
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


