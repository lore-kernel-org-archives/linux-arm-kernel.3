Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8934FCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCPbtPoRp/5E8iJgNfCMdf5lIBGqkv86uavAoCnp1cs=; b=GI7OvMhM2dyctxoZYqQZoVETGK
	e5oZUiBL81o6a/tYbU/aO3osfELqkhCJCPbxeWdWaVFkUsFyV2TxnouCbGREHE5QS8XBgFs7Y15YG
	lAqedLOk8R0JMFWNv0witQfz5KKFbm45StmsbNfjLya8wwgZfODei3H93LmDKkErbG0rWf5RaSnTh
	YghFMKbZD6U2aWTasUE1GuoRS5UXsgICYUyrnho9Q9OhYunL0rbnf0po+jVtpSwZeDxvV2D21goa4
	gcIqiJbwWYlHrT+3NX17pH2mCaD/CqoFkyQEeH8A85WR8ffV+KtYgdYQeYGpn5aFJzP6QgfOaDVGL
	13s2vx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usg0V-0000000A5iF-0jwX;
	Sun, 31 Aug 2025 11:13:59 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfjx-0000000A4QV-3nvI;
	Sun, 31 Aug 2025 10:56:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7722e0ca299so1383617b3a.1;
        Sun, 31 Aug 2025 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637813; x=1757242613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCPbtPoRp/5E8iJgNfCMdf5lIBGqkv86uavAoCnp1cs=;
        b=WMxcG8aZrCItX8XwVKinAshULkiCgCSTmMvsKSIGyIJ1jhOW6c3syAh56yvMWneItE
         FRmSZ3c6KM5Wo9y1A9kdtEV7pQRHx/RBZ9duAbK2vDMOr8Pwuc4PVy+KZrcsvvTZUzpp
         +jFhfIBiCxIkiYHOpX50xpD4TQ3unOhHr0IBKD1MLFKYx+9zVQJYbGOCzQLCRRb6ip7a
         RjpQRxsLufauuPb6RGGCV+oGtCwB875vdlpDXvFUWUwxQgNs/kQkwwND55+fkeWQ0+78
         0Zsioy/AJHm5lAjnApxfrLVQjbnupuwpDyFglhYRJgbG4ta4i2hacnsL/puJKnOEd7Jc
         Db1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637813; x=1757242613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCPbtPoRp/5E8iJgNfCMdf5lIBGqkv86uavAoCnp1cs=;
        b=lju8jwYa0xzrZNzfgiPXnGKi0cXBcoRSuxmPp1fi6N+SjYV/6jN/3SGUjhcBXyxGUd
         ZHUyOyjCF0dQUzAcGOji/+rrrsSzbrrpuq/td8EiGbD9v+tARXfrLZhPUW+Lncs5VTe8
         UeJxnbtkGRahEdz8IT4YvnbAy6Dx28nGN6mBbGknkatLJN+pgGLbsZDYG54M8/hBGo3S
         7XSiVrmoACE/ybl0fwmYRlhk3TH0OxBpTgJRbwF0jFCYPk+c3BaPt9BitbKUI+OI20GQ
         3BbR6tbJOcGE603b8jV3aUjJ1lG9bEgbszY+m/Rwxjww485GjDhGZsuhOqBlo9D6p15y
         BgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbyHeLoLY4h0Z2sd4HXXACBI1Uuhk/TAJe2oPAn0Z+xFPSFoXyWlg6qtiPspySA/WDbpqXRNwtYSHdCD6WsW0=@lists.infradead.org, AJvYcCXcgI6PQuVl4vb/Hg+HFzWaN8hJgIGyPCyrEVNn1DWlA2G5nfmIbsn9wuvatyB9LwP2GvxbsD1b+qjY/HXhBkW0@lists.infradead.org
X-Gm-Message-State: AOJu0YxFHz5GOhkbb7wq6IrFo50nQ3ogXKQtYpYVz++6ArhUBE32kXjL
	wqAOMX4INTzAAhknRM+uI1862BiIy4K7+NH91qIoriL9xJJJMQwfYXHE
X-Gm-Gg: ASbGncvwsHxJSZDg9VPgELDR8XZ0lv4cnXdXnird6U+rgGjtjLKCEXG4N1Br6fik8du
	0kbty0SQKozY/WqQ7r0pMIa3yirk3LAKfp6d3e2xXzCDHFpcXX4CWx6R6nhxs9H/cAaM9MgxJjg
	U3QPDS37TIcszBUFcu20F3z7hQkNqk9CaftJ8yqIX64+m+hwChyOz1izuYRLQavDh0IJ45cU2iI
	g11k9YQVAgvFfmqp6CsrawikOKdUU0974rUdvkBpQiZOgIu8vTGbYzO5UlrW24g7Hn2304DU/JH
	aCV35p8Pef1zxihVfsdPGjq77slMhMcX9Xh/SqTBsbUEfWJTl+LYtC90lek9ZK2JvwQ6I3oOn2b
	TJMwsMiyByc73kGFXcKPWnBuX4W1oJbXOvzXZl78re0AWAHhuBmuOPqzk6pEP
X-Google-Smtp-Source: AGHT+IH4cx29ND4zxQRtl31kTvjj/dkWFXLu/WmUGScIWTE3nkmtp1OWtfffzdIAXBE0e0puWLezKg==
X-Received: by 2002:a05:6a20:7f95:b0:243:27d2:61cd with SMTP id adf61e73a8af0-243d6f7ef34mr5369334637.27.1756637813211;
        Sun, 31 Aug 2025 03:56:53 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:52 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 4/7] clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
Date: Sun, 31 Aug 2025 18:48:52 +0800
Message-ID: <20250831104855.45883-5-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035653_941090_69A93578 
X-CRM114-Status: GOOD (  12.69  )
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

Export the clocks via the newly added clock-ids.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/clk/rockchip/clk-rk3368.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 04391e4e2..95e6996ad 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -526,7 +526,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	GATE(ACLK_PERI, "aclk_peri", "aclk_peri_src", CLK_IGNORE_UNUSED,
 			RK3368_CLKGATE_CON(3), 1, GFLAGS),
 
-	GATE(0, "sclk_mipidsi_24m", "xin24m", 0, RK3368_CLKGATE_CON(4), 14, GFLAGS),
+	GATE(SCLK_MIPIDSI_24M, "sclk_mipidsi_24m", "xin24m", 0, RK3368_CLKGATE_CON(4), 14, GFLAGS),
 
 	/*
 	 * Clock-Architecture Diagram 4
-- 
2.47.2


