Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B52C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gADg9VNDLpQbKOL7DJWNEdDj/Dd07ziMut44yk6PmRU=; b=p+ITrlKm/oo+wBjnYOqer/vrTp
	EiT5b1L/uqV7CDDFjgxY3ylvNycPRM/Vu+x2EFuzWnMmoiR6AjWx2BeWHU8znZS34hGRgyocEd5VJ
	tCGC/6SUYr6bj+GpkYTX0H2gko5Z6uIWrj1RseADDbSwxxyaSJnNjMTxWOUVUZg7y1NO1r8FCQNfK
	Zh4SlXM01NJZTlnB0/8M1GMMGFgMJoqg2QqzGkHk309AAd2KQHRW0EmnEBFl+XbLF9tXFRB47vS8K
	UQyNHtCJQjNQQTkuwrGMlJHs+Wa+J8iU1WQvZpf1WJb/0qQ6AUhcc/f6eeCw+Leu+P4RzmwtEFD6S
	4FllZPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY2o-00000006CIP-0zH9;
	Tue, 18 Mar 2025 14:35:50 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuY0v-00000006C0z-1FaE;
	Tue, 18 Mar 2025 14:33:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2260c915749so34128795ad.3;
        Tue, 18 Mar 2025 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742308432; x=1742913232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gADg9VNDLpQbKOL7DJWNEdDj/Dd07ziMut44yk6PmRU=;
        b=RWA+5n3mgN5UPGkp0RAx3xk3fKQ9Cet/oUTNJNdyDE/ryndB2ZpsyzPemIC9bfWV/R
         tfdXlh5Xu5uVFEoZ3zRMCclSQzjDXKn2vZJfW5dyCm+7Gznt6NXiDXdrWu9KS9wx0Ych
         GZsuL7Uo2b/gVrPdUfgsq6S64TZvcnBGQFCd84iJ1l35cu24idvfsZUjL0oe5Kuk1eQ0
         HyammYSYqKpndYpt0YVMSOR8VMx7JWbLmPKXrmlf1cpNdATLQmj3vEzhX8CI6Y35+xdb
         X7Q9iYPq/jPFNjG79IHtGA9rgQD6FbGBRUXgsB8QGgJSoIb0gYVDUC408wE9AT4W4YAk
         5Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308432; x=1742913232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gADg9VNDLpQbKOL7DJWNEdDj/Dd07ziMut44yk6PmRU=;
        b=wFYZhjNFMVoMhWVZqPWJCzWmyHnaD6No+cpMxAIGMgeJaqd3vuWctvJBm5f2+OBeb7
         e4NZ52omdgru7s1nL3HEOLUJwL7gqY8N1lynSjBCiIp5a/tvRV5VCz952EbK6n4IW+F9
         fe/GEaOet31LRvqEDhOtj3ZqAehZAZaz1uxZR6E1TQUWuuPn8ClbQCg6OmtgX68QunhC
         mWuGzGs9mYxObUukpxe0xILwlMxE2Yd1+wWi5DJPTg6Xt6XM1ZwiOC6U49sfK82tXJ4v
         O/o64fhz7B3JsetrI/kepE87TPpUANIObXCpxxYl8nK0jcRkiwncSNLmnbmRKFVhiaKu
         SBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdrQebOjOE1iM8N4+k6PkbkCtfIAQvzUEBMMxgC1WBAvd44ojQnppjLQm6FPlL/8bhwrRJIgFMg2QyfXvpwzM=@lists.infradead.org, AJvYcCViewDWpzb4GIheFLpmhLOMsQyOpAGjn7ZlP3pJhBSwKbQVfuuJiFhyzlP/iaocSGri8pdBN22z/YJh@lists.infradead.org, AJvYcCX9CCpLv8OVwtJSR+Zut2qkZUOsMUHU/KSuF3vDSN9INHF73T3hCkP2fyJfmv5hd27CdFhI9ehr41CorMWvmD1l@lists.infradead.org
X-Gm-Message-State: AOJu0YyRU7RpilQ20qxg3utueoVzCnmyV+9RmSJTPcLVuE7rtEF7oNtQ
	3+8HYkR2Azo2gexlxGeoNAVgoZCn9UK5Ps/A4crKDZh7nwvk1y0P
X-Gm-Gg: ASbGncvXZ5dX3Ws5h0C9TUef5GPtGbBx52l4JvEJO/P2u1cGZfvb9TYGV8z1me6+YB3
	Evt2PdaVViZFzelBM20w3lastxYaayhes9HL853UoAI7B5cyTYfokhmOJnS8hMuut3WiP/ajYzf
	vgmHubjss8HwJqwt1vdD+eV8qryweUyw0nueeVA7Wj4i4QqvAZ4eiR44yvzq5DhKAx9ebAq+Tos
	rB+spaa0XzzH5rIRgTgEcV7VAWr6uSOIgTCLnIfW8LBihoK/l3QoDaSB259Eta57AVbq1PBj+kp
	o5XEGE3xDWnC9cYjcPYQ75R42BG04iDySfdXm/ODiDYqbgkw+lWZNWOJxjBKrqOZQu2qYmIeTJQ
	njAg=
X-Google-Smtp-Source: AGHT+IEfgmfK1crsVRUWCYlfsqwt+/1m0mmrpIocbRk2MJOVO/tv4/clXEIchP4T/Mf/Fhw6MElziQ==
X-Received: by 2002:a17:902:da8c:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-225e0a8fac1mr177828705ad.25.1742308431908;
        Tue, 18 Mar 2025 07:33:51 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-225c6bbca06sm94446355ad.161.2025.03.18.07.33.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 07:33:51 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] phy: rockchip-usb: Fix refcount leak in rockchip_init_usb_uart
Date: Tue, 18 Mar 2025 22:33:40 +0800
Message-Id: <20250318143340.25162-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_073353_335451_F9AB5A01 
X-CRM114-Status: UNSURE (   9.50  )
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

Fix a reference counter leak in rockchip_init_usb_uart() where
of_node_put(np) was missing after of_find_matching_node_and_match().

Fixes: 605df8af33a7 ("phy: rockchip-usb: add handler for usb-uart functionality")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index 666a896c8f0a..de7d879bb460 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -539,6 +539,7 @@ static int __init rockchip_init_usb_uart(void)
 	if (!data->init_usb_uart) {
 		pr_err("%s: usb-uart not available on %s\n",
 		       __func__, match->compatible);
+		of_node_put(np);
 		return -ENOTSUPP;
 	}
 
@@ -547,6 +548,7 @@ static int __init rockchip_init_usb_uart(void)
 		grf = syscon_node_to_regmap(np->parent);
 	if (IS_ERR(grf))
 		grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+	of_node_put(np);
 	if (IS_ERR(grf)) {
 		pr_err("%s: Missing rockchip,grf property, %lu\n",
 		       __func__, PTR_ERR(grf));
-- 
2.39.5 (Apple Git-154)


