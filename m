Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9EAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=; b=LSw4+K3TLav1lKmD50N2AprQDw
	OFmXFyf4GY96r8Zig1cofhqUxpLw0YSrKltlRC4/YcjsL7WTtIEezE6rLkTFMbk0VhN/cF7v7xRen
	CNmS1cUGaaPrdS3C9FXc8p7vQSWndL+93gW3q3k8htCRkcSvajdpKYFchv3QNiTU7taxwljXKH+ey
	0++s1RQZG/rcGSrsixUtWe+LcT0E1qtPW//klY5IlIKIcm2ie0O8guBrY3xZZcamo0tDBh6en7M/J
	8AKDTynqs6vLJPv7yyTV9cIbqdkzJoCZqHV33y2ins2+yArpaj1CnwYR6gZLoxnZKB/eLgqvFx55V
	pSShyH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6W9-00000005iTp-2wiW;
	Mon, 17 Feb 2025 19:10:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk47c-00000005I8j-3VXk;
	Mon, 17 Feb 2025 16:37:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso29757825e9.0;
        Mon, 17 Feb 2025 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810247; x=1740415047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=;
        b=PRXqPH1usQFzipxbV/oVq5us5vGgYPeovxJvgJyuD2zcGm/KGREUjJo/v6UXJKCXEH
         dWFlWhmL0+ALuLKq5FExvKHHlRmTUpnrrciZK/KUdLbD+q1o79A7xYtnJC/M+jDcFzXi
         FxAlti2aU6Tq6oA0BgyLwWnlv+d+ScBCQ3bob/VUMWLcgkXHglP2RTz1dpIvN0JrvTHj
         JqDkfU/N6W3g7w5UzhrUMT2RD1o73AfBgE/kufEaCRGlICEBhIDQ5umc4XXhF93b9s6Q
         7+mj/1A6P3nUQAvBPHSoySmuk2RMsKRjmSYSDAmLaYBw7CU1EyEpyAbizBXnJAhOZWeo
         lPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810247; x=1740415047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=;
        b=Lr8hq9aVpEgxJvWF3tJyLYRYz3kvmqiH+JHsirbv598YfQwVBN15YGo/Pb4Hu1wa1f
         6aXQAoMrYWsFS3sQRmGEAySjSx5rSHa/AAamp9Pmgv+QAIlogH3VFHp4DIOORTlvc6ze
         pBxLqjK477Ab3+KQRAV+/LsfY4F6ulvh8NgjcUWMujLUTTsL4G0k+cT6M4V90sIk07iC
         d1tgj2UObXsaWsvW0RfODAq2UFZPe9+Fa0kXddQM8MruYlZq65caE5J14KnCmgXUx0T6
         3ytFnGhb4KCt2tUjgYkerETHZmCGRux4/4K68fGODlRn0ktePmpA3g4reaPzanjEMeId
         sFeg==
X-Forwarded-Encrypted: i=1; AJvYcCUtmqudo7qgYjTcxdS4NaRsTEi10N5t1Ym/Lu1nvBsxQmUxvzZZ7AzAQ2dXDgG5UDHN1WGKi9G2l/EpJ8UphDpd@lists.infradead.org, AJvYcCVqEeagO0jJ6xKLpjGqYCmjUHhWwfkZYdP1cXV5tWd23rweQhmMcYhADCbeeHRn6rw3U6eFOL2XfwDAtf8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfuGDuKoDSEx8S6ceDkuVNDpocm24pZLqEaBIf7GUJ3G/huIuU
	PcI9pCS84mj4z1/63QO0Wo8Tk0swwn0Qyo+HT+gQyoqW59WFig0pdGFRdA==
X-Gm-Gg: ASbGncsXwaJQKkGUwpNJcCmDbMmLU61WXlgex6/Sqe8abi/IcpKYfHLTyCpNvM0jaLs
	bibEZPKC4ZE91LWEoFv0hNr+sptGN4gPrCeq2zkQD/CKJFOmj6v5veIiFQ8J5hnAViUvBqaKp6M
	a7oRaJkKtvf6IGiNG0kHoTnZR0I4hefDo62IQPOS71Kd9s2nEMm777HBZicYOAD0Qw1QuB3oN8B
	MhjtbAMqHTkjT9gGum/guPRcyr21oKl0C49ZsPjiYl3mHdUSaspKSEdrkh4QMz7McvF9Ojrc1ZG
	ZvXSqfG4diwSKWHyCoWMOU4EuMZMAUqGXowpTaGioRFMEcQPW2PS9QYrIYddoJpxsKeBmr2Vp/1
	hQ8P59a8=
X-Google-Smtp-Source: AGHT+IEy54knXhOWSdtV9GyJZiVARzLmEOfX1F7j3ZG37VozHahpHs0vmYGUgUyc0AkFNGY48X3mRg==
X-Received: by 2002:a05:600c:3585:b0:439:5b36:b4e3 with SMTP id 5b1f17b1804b1-4396e6e19abmr89349955e9.12.1739810247218;
        Mon, 17 Feb 2025 08:37:27 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439618a9ab0sm125047905e9.35.2025.02.17.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:25 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] bus: mvebu-mbus: Embed syscore_ops in mbus context
Date: Mon, 17 Feb 2025 17:37:09 +0100
Message-ID: <20250217163713.211949-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_083728_876094_6F25B7E1 
X-CRM114-Status: GOOD (  12.37  )
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

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the mbus context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/bus/mvebu-mbus.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 92daa45cc844..1f22bff0773c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore_ops syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -148,6 +149,12 @@ struct mvebu_mbus_state {
 	struct mvebu_mbus_win_data wins[MBUS_WINS_MAX];
 };
 
+static inline struct mvebu_mbus_state *
+syscore_to_mbus(struct syscore_ops *ops)
+{
+	return container_of(ops, struct mvebu_mbus_state, syscore);
+}
+
 static struct mvebu_mbus_state mbus_state;
 
 /*
@@ -1008,7 +1015,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1049,7 @@ static int mvebu_mbus_suspend(struct syscore_ops *ops)
 
 static void mvebu_mbus_resume(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1069,11 +1076,6 @@ static void mvebu_mbus_resume(struct syscore_ops *ops)
 	}
 }
 
-static struct syscore_ops mvebu_mbus_syscore_ops = {
-	.suspend	= mvebu_mbus_suspend,
-	.resume		= mvebu_mbus_resume,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1118,7 +1120,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore_ops(&mvebu_mbus_syscore_ops);
+	mbus->syscore.suspend = mvebu_mbus_suspend;
+	mbus->syscore.resume = mvebu_mbus_resume;
+	register_syscore_ops(&mbus->syscore);
 
 	return 0;
 }
-- 
2.48.1


