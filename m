Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F70E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 03:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU+0R/zCIoCNC2OYdjkWppKJT9H70D+WolgyqGUuDu8=; b=BtX0AhzFoW24RddYp1gWxusNf8
	61EtlaE2Ots9e1cKUyyE+ma/R6VRcST0zeAyhVETpXbsLxBQ0N/oUwCGHXSKLpsAb5ByW1ntCopE0
	snEH55Y5PvTEofz6OmEMS2i5F5T8URV2CqQ8/ovhFSkF8gplyTrVz3iUM5De+Qql/Uw9TkZ/sZiLm
	iS3bBFyO+xfS2dVCxVdn6yqXrdrmHdRRY6nmHxhKyYsv/Faee9buJjWGy3DA+sQgbkEGOOKMp8UpJ
	ftRV+hdee8CTfKN+zvhyKHfdaw9siM8RBxutts3nbPI9G6BWK8+B1D/JG49+o1tPWyf40Xrx9EJAL
	9/3q9vRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMfKm-00000007KZT-2zfI;
	Sun, 15 Dec 2024 03:30:20 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMfHs-00000007K6C-2szZ;
	Sun, 15 Dec 2024 03:27:22 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a9cdcec53fso27091205ab.1;
        Sat, 14 Dec 2024 19:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734233239; x=1734838039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU+0R/zCIoCNC2OYdjkWppKJT9H70D+WolgyqGUuDu8=;
        b=gtqRdLxij42jM5HWvmw3rWLYTfhbZMc2eQHhCTGIRhBGW7zQV618mIg00ZCsOlFAJd
         MsHigMLGjGEvc9i1yXXtU6U4Fftn6fZ4ZkurcB+qkdkkfAX8T5Ds5o0bAnJ5qsJescDh
         mEy+YwvAskkER/T2Tm+9wiY3wmIFlfTE9aXjU+GIl7Za27HuTCSTgA0fLjB02KZjrB/E
         h8S9jbIEQmKXX+joot4vsxkW9o76+MoVswvaW6icwfmsOqwbJ/d0RxB6hVyGZoleUpIK
         4URKZUD6fEaJswu/SApdOzm9tgi1+tDfRhK5s0hxGfVYUzbNR1w5IjRDImeEPCVio66z
         7boA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734233239; x=1734838039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU+0R/zCIoCNC2OYdjkWppKJT9H70D+WolgyqGUuDu8=;
        b=izmem2j4/TdS37C+UtYl9u+uBwI+dPYJYPHqncdSRqFaCFX1FVocn9WPz8yOX997fO
         eOvyGfzltM4iJD/Qrrs3KdFJcgSeu+SUKTeCDJkgLvyOGqiSrTMOKJ31gr3KpkI8cWk2
         i5RV4Xkyfb/qEDU0Ykg4dERqgMZ9BgPCHt6QawQQaVtPC5gXuuCN/iqlj4qLFUwA3bUX
         xVJp2KXdNXR/ouPjVxOiyH2POyn38fEg9COcNCk3BdiBTCfl4w9VHzWwD0iIh9jyYaRa
         uLySNXG9c2Zlip2xkQu7A/iQbv8XHfO/mihGMn3X2Q9eh69nc8lYK+735gs1CheCF00b
         zIHw==
X-Forwarded-Encrypted: i=1; AJvYcCWOkDgVzaKM/Jl0kvUa6fBS/3ruCp5+Kk85IjvpZyl5+XKy5js8vMaDDASE22zipjN0qCh2Hw3dzVJ4lnTORYXj@lists.infradead.org, AJvYcCXhNBTh4O2mZceWtVUDRCguHHA09y2C7vTE/vdvYF/jPRH32T/LMO3YWFsUNlJWOfLHM1odCvrJlROuv4lS/JE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzN6RHwzFOTzLO8PPTKHWkSaOxtgSpxpdOyOP3dRe6MAwZ7AdEP
	3D9E1xgcbziZQ/N5BOD0Ka+XNb+3sSBV+Sq6dJlJiah2jXUsTfb5
X-Gm-Gg: ASbGnct2K+MZRsu7nuFrR+bV5ugzQjw20MtVUsBEhH3fstMPBpUbL0Vi7sQV0VnRF60
	evJBoeUdJqV48uSWBj9tq6Nh0fD4lTkuI/ENPUvnqRHvXgIo3qQl22L/rAKXk1eTAY0QFrGileV
	PViozzOiB2Dp+ljEdz6OJwfHdmzgjCIACojYeJRIjxP1Xw0jjn4Sw746u7uFtfIrRIHfhdVIo0K
	co7AhFn/w9I96KS5UiU+5hpM6d3RVxtHsqO37i/V1+uPdXZnTGxREbJmWsyGGRdfOXfx3I9Pyvv
	EobitbMqv4QMec7wjrG2dTj+lvQ=
X-Google-Smtp-Source: AGHT+IGLuZuyUVQlqPr/ixxRq6aO17BEgow0JIL6t0cNgQQ/GGoVKqF15/txgg5gdcvquaAnaVX+HQ==
X-Received: by 2002:a05:6e02:168f:b0:3a7:d792:d6c4 with SMTP id e9e14a558f8ab-3aff972b7c0mr88949015ab.21.1734233239593;
        Sat, 14 Dec 2024 19:27:19 -0800 (PST)
Received: from localhost.localdomain (65-128-205-244.mpls.qwest.net. [65.128.205.244])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b2482298c6sm7755575ab.31.2024.12.14.19.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 19:27:18 -0800 (PST)
From: Shimrra Shai <shimrrashai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Shimrra Shai <shimrrashai@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: add header for PCA9555 GPIO extender bindings on some Rockchip-based devices
Date: Sat, 14 Dec 2024 21:24:54 -0600
Message-ID: <20241215032507.4739-3-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241215032507.4739-1-shimrrashai@gmail.com>
References: <20241215032507.4739-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_192720_746371_F5A61D18 
X-CRM114-Status: GOOD (  15.00  )
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

It seemed a bit disputed whether this was actually necessary, but I am
including it nonetheless. It makes it slightly clearer how the pins on the
PCA9555 GPIO extender used on the board are actuated than would be evident
from the numbers alone, since according to the spec sheets for it by NXP:

https://www.nxp.com/docs/en/data-sheet/PCA9555.pdf

there are two banks of controllable pins, IO0 and IO1, which are labeled
equivalently to the labels provided below.

Also sorry @Heiko Stübner for adding your name on it; I had cut this off a
BSP source file that was longer. Since this file contains only this
isolated section, which was written by someone else, I put their authorship
on it instead. Unfortunately I do not know who "daijh" is, only that they
used that handle on GitLab to submit this code piece and I got the
indicated email address.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 .../dt-bindings/pinctrl/rockchip-pca9555.h    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/rockchip-pca9555.h

diff --git a/include/dt-bindings/pinctrl/rockchip-pca9555.h b/include/dt-bindings/pinctrl/rockchip-pca9555.h
new file mode 100644
index 000000000..21ca99488
--- /dev/null
+++ b/include/dt-bindings/pinctrl/rockchip-pca9555.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Bindings for the PCA9555 GPIO extender used on some Rockchip devices, e.g.
+ * Firefly.
+ *
+ * Copyright (C) 2022 Zhongshan Tianqi Intelligent Technology Co., Ltd.
+ * Authors: daijh <djh@t-chip.com.cn>
+ *          Shimrra Shai <shimrrashai@gmail.com>
+ */
+
+#ifndef __ROCKCHIP_PCA9555_H__
+#define __ROCKCHIP_PCA9555_H__
+
+#define PCA_IO0_0          0
+#define PCA_IO0_1          1
+#define PCA_IO0_2          2
+#define PCA_IO0_3          3
+#define PCA_IO0_4          4
+#define PCA_IO0_5          5
+#define PCA_IO0_6          6
+#define PCA_IO0_7          7
+#define PCA_IO1_0          8
+#define PCA_IO1_1          9
+#define PCA_IO1_2          10
+#define PCA_IO1_3          11
+#define PCA_IO1_4          12
+#define PCA_IO1_5          13
+#define PCA_IO1_6          14
+#define PCA_IO1_7          15
+
+#endif
-- 
2.45.2


