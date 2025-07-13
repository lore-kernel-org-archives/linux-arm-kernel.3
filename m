Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2CAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUlKkkT9yWJ7b1HYL1nvFWc53qv/qhzbMN9WpuA6OBE=; b=wdIOIzNqAUUCgGHn19lbJ1u9un
	wdDDACzZbJ/Lk588qCS6AEmXmqwIMGVJavdHYMjwloTy01EDqxzzj5seQKT144p+ct0cYf7nq4Td8
	neesuiZBSOk6uFUdIELT2tqjxX4QnB84dcsus/uleI65nX3OHkrFqXwBWL3SBXqF2FZrSpBh/76uo
	3z9tE5WFCoiGGcnCWHrQ3bd3/3EWZ6PEWp3se698BLRDjpTnCVY5gorwE77hWhvpKokSubm7bpTcM
	GHIhXM/2uQUXv9x1UxjWzZUE3LVrbqMfkk/OiyPvrAN2ILWh5P0mkt/gDicd3wBj+sHGX5qBTUT5O
	zw8SHLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaziY-00000000OQy-1zZe;
	Sun, 13 Jul 2025 16:38:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaze6-00000000O71-18Gq;
	Sun, 13 Jul 2025 16:33:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235ef62066eso52259235ad.3;
        Sun, 13 Jul 2025 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752424425; x=1753029225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUlKkkT9yWJ7b1HYL1nvFWc53qv/qhzbMN9WpuA6OBE=;
        b=SkzMrClQuIpgSwpCRZ0rtFjzIA8qkvUN5yH16KWmlIDx53RJdeDhLScTw630B9Mpen
         nkn/8eLCnrH9xE/erP8PheL8JR7cJrxBliQE4nzU8YnYE5yiUQk7I6TwmxM7FVDfCXKo
         nvxxtXFmnRTJCbL/03I6XXU1TTZK2Z2Kr8sezBXhLs7DGz67Z3ve3btvG6Z7/UUoJT8H
         xdnC+Qlg+INbxRvZ1YRJkDnm3CdtBjj86UsSB+JToYBvw4qTes0ZPoind2VWwDKvoYs7
         wEZOvrB3NpiJcLxWewjd+IvmO1DYhvp7NTf3jy36Tl+E/mN0G/okU2BUFGDJPyjfMwDl
         boeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752424425; x=1753029225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUlKkkT9yWJ7b1HYL1nvFWc53qv/qhzbMN9WpuA6OBE=;
        b=fXJSPszsM5kEdGbr26ijbY9gQb1eH+1PkK8EFKLaGhXc/ME60CpKyjuA5hyA7sAEEv
         EsxYtn5XD2YHf8HkWh1ap2u/twUqkAZht1/GNx31KnZqKXvhdX1Hqv+3kSSPflyNNoO0
         0RHIU5ZGtElRbdr95+7aFZg7xRhmbKnAxRuwKi2koXx6SnNarw5TC6jgqwv/1RBhFgMG
         vzVvQAsfYuO9cGqXVbvwssXDXN7Heaq3rfsRRUz5U10WUelaJyBfwytOkO6Fd+CO/0iE
         gn347kmmvCbFXNCNnKyhCeiElCvXarmdZPyw85MQY/oRyV7hWYkd/adiUpU/B7qqpLaS
         xyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVlu5frNu7qMuWAbqLhNtzig30SgRVH5gdr87ZY8h2U5xJqEXH0usb8IltwZgwtKAt6IiDlmT+nWXG8lkL4psAs@lists.infradead.org, AJvYcCXrGjqf/G/n44kzrs+muYBDtib4aIoZ4FSudeaic03MF2ELdT8YEEURRFXp2LmU4IoIOzHLYqn+s4X/xiwO90g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNlhvWnZhRrNZjyGG8xAYnPcHoc9CXKBRq98E/BB/9sJJkio4k
	Px8UwC91cvDKueVVaocOqjgb1Cc5SUw9s/D1feOd5ro9JQm+P3xIyuoK
X-Gm-Gg: ASbGncsc2JpaEgccfuZ+Z5+xE4tYxiC5WYnTQY3NJUZV0WBE4V7rcMyRKRnwfjYrF7n
	xKZ601r3QVjfExG6CKgkg5EQERxWJKL+0I1H9w0yJCpW+5A0g6Opwwej5Y+PRcHlSMvj6GMQHTB
	UFoxVjykh3RW7t51xVrQVy4DlYJvMkzFMpIrPUgoi9b8yuBx1pEaJl/bKeZ9WRUAW+blD6jQlzk
	1Pv4NM7POF4k3VGTlSw/lg6UdxSQy7wYo6h9zmH1vWOBBTnjwheuRP+LzPZTt6WBfZXqFyDL0BD
	F6U4apkTfDK6NUDeyp6oClJKKzj8sOCMgNMZ8lPb4b2dE0hiE/JKcUw2EEc5t4R1aiY58Z6kuw+
	6ngDh39XOIAhJ5++YBS0Jy2VN/f+NI969qfo=
X-Google-Smtp-Source: AGHT+IH6E5UEkJSfiF+dSq+9DovIWQcD7yf6qUoqec9uZOt2S1XrHYXoTzVMb5+OVnAaJl1+LFcIvA==
X-Received: by 2002:a17:902:8b8b:b0:238:f2a:8893 with SMTP id d9443c01a7336-23dede984b9mr91199825ad.42.1752424425482;
        Sun, 13 Jul 2025 09:33:45 -0700 (PDT)
Received: from arch.localdomain ([155.117.228.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4285ecbsm80809655ad.48.2025.07.13.09.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 09:33:45 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	dsimic@manjaro.org,
	naoki@radxa.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co., Ltd.
Date: Mon, 14 Jul 2025 00:32:53 +0800
Message-ID: <20250713163255.163669-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713163255.163669-1-jerrysteve1101@gmail.com>
References: <20250713163255.163669-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_093346_309895_ACC03F87 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

OneThing is a company engaged in edge computing.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..77fbbe040706 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1108,6 +1108,8 @@ patternProperties:
     description: OLIMEX Ltd.
   "^olpc,.*":
     description: One Laptop Per Child
+  "^onething,.*":
+    descriotion: Shenzhen OneThing Technologies Co., Ltd.
   "^oneplus,.*":
     description: OnePlus Technology (Shenzhen) Co., Ltd.
   "^onie,.*":
-- 
2.50.1


