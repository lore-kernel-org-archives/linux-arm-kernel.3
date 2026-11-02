Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNsD/9Sd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0lhCDbbB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f2iHlmQM8BVjrAqEqrTQxQY1XsehcxpHrx5clmyJcPs=; b=BNsD/9Sd5m5ZZS
	X4bM8XPx+F5ub0yzG36ChAADaOpW27EOr9Do2/0gezbVH3kxtklE08SBqc2JjKK87KXd2q/6wg4zE
	2Ivjc7ZGGxCC89t03kI44i9mSJQaWeq73ztxxdZLiLHFAzEXXOPP3wmzF+do14dayAZLBprWkxoJL
	lhD6h/IMvLb5ZWqRTcGgAOX7UvxFiwnw2tGCNLfm0yjjK2/zWv4nr4tQ4+uWTfZ2MbehKkWcCt9+G
	sIqxhbVyOD3YmX236oduz9d7f4fT3UnuTseGkVwskoEB6sGW6u3hQ9GFIS6LOm3VZeNhnQAHL0oOZ
	BHev3XZ64tNRoIktlpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzXC-00000000TEg-22DP;
	Mon, 02 Nov 2026 21:25:42 +0000
Received: from mail-dl2-x08.google.com ([2607:f8b0:4864:38::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzX8-00000000TD1-17u3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:25:41 +0000
Received: by mail-dl2-x08.google.com with SMTP id a92af1059eb24-1379d236149so1383914c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654738; x=1794259538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2iHlmQM8BVjrAqEqrTQxQY1XsehcxpHrx5clmyJcPs=;
        b=0lhCDbbBammdHJ+AFSV4yTtIUfgHjagOoTxtNJOubkOLoUU3nAZybNIpFSsceanLSm
         wovWSxJgTG7PbWM39bwq3iDHO4Vg5dAzWwuuQIP3g8KMZcvYg6KFFGKtv3XdTSnEt4e3
         P0pCT8n2mDFU5tW8bItdAKp9tfSuO6T22XDrbjgPY6ScJjhkMImJDC0prGXX2AVmqurK
         TTC7RkZ1RcottqrBeu3N7t7Uq1XSIp6JznhBl6LZsYEdbT16F9L+HeyTBV+mBA/YMOnv
         MvEOf1oVt5x0hN4VYQ47LlrseeEHYwZoCt7ou7CYq3/50S+AOx4kKNKpfIYSNsz4JMUA
         oOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654738; x=1794259538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2iHlmQM8BVjrAqEqrTQxQY1XsehcxpHrx5clmyJcPs=;
        b=NyrW4YuJZF+RBgzDID4VaIbxSxXg8cp2LW129n3iFcSefG88DKXfPEXPlreX4F1mtY
         FfssPqB1LSLSzi4WP9ztmfWjrHYZwhtpXCxei8QQm/kxlP+hmmYQob5zIgKXqKKB/DlC
         9vRxILyoW+6W+mMZWb0jykaREfTcZBl/T/CscumOXUO6lcaq1jLLbUCKG6q5oE1YZIGw
         177u6r3tWdLUI/JamCbLsLzkHHYn3s44F+iCUJ0+ruMVQlTCQTgKOSEIyI7okl5+Klpr
         kGBMxo1cqCVpwign0PjejbpwtlXu+y4R6k1TapOwxCAoOrwCzhLZTkK9mCGU+eYfYARF
         sYZg==
X-Forwarded-Encrypted: i=1; AKwUvByPSbh0++7C9/sHbAIdSRzs780JfchWJT6CUOezg80bB8fjgb+93+WG6TUAy3fA3J4D0IVycLf6myIVdgoF7Lj+@lists.infradead.org
X-Gm-Message-State: AFq9FYLCe27dgMiessKedN9l71C2YsyOM5FJvhK9Mcs5o64ZdCNSvTP8
	daEmtL64VrBH9h8CMbuuaW9ewRC2AFJ/8EWTGulmm/ZKHagXmvuLhKMc
X-Gm-Gg: AYBFou2c9PL+a7zsayY8j4sDEInmGuUAX3rRw8IxtETXh0i1+0I1wkEYLh/NMxcgMNp
	y0gBK4R39QiwNQWFcr8uJvXG3FkHlfSD2inV6YDTNstfZZlNVdvglo0gdXPb3fOZTXJ5brpZxXG
	zoypy71cs6ayatE0SCyf5SG89gQeorb7sVwww/Ba5xwppEIw/BXbKc55lcKLDSD5ALC+RH1jQRV
	EC/dAjtEhO4IV/PTwnxKGESM/LZ51RrRFI4Iq+TSq8x/lNbOFagnqzjLTvKVwyQZdpgTIfeDyUd
	jVJxnrcmA5vcZ+p9ixRbmEvSaVfWHAmOme7SZn3T4qVzHcuBCOomWdX3E1HnCZVs2vWi2jiH3SL
	al2wRswicOVaW6vQnvOPE6T7TU2kU9DI469ugrv8dFDgL4JLQ/GF5LXV3/CeGD8u6h1iTlO432Y
	jyxKpaKtxdqPTobmV3d/ZgocrvanYnI/fZyPwbNLPi5X9csL92xddaaqKXpvg02tLWCO9M5iOPD
	S7inQQTtaTEeKEMbMIN3LAiprpHOnEB6/X/IZWNBgLhCS6+wG+6q1s3MkOAFwiyyA87oRh6kE+F
	J/sqHUHfRExmvx97EUKT/AZlUNM=
X-Received: by 2002:a05:7022:b053:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1ac56302618mr17357629c88.5.1793654737507;
        Mon, 02 Nov 2026 13:25:37 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm37195851eec.12.2026.11.02.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:25:37 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net v3 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO to core
Date: Tue,  3 Nov 2026 05:25:06 +0800
Message-ID: <20261102212506.3348537-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102212506.3348537-1-coiaprant@gmail.com>
References: <20261102212506.3348537-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132538_358015_872DA14B 
X-CRM114-Status: GOOD (  13.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The txgbe driver currently defines DECLARE_PHY_INTERFACE_MASK_ZERO()
locally, but incorrectly uses PHY_INTERFACE_MODE_MAX as the array
length instead of BITS_TO_LONGS().

Move the macro to include/linux/phy.h and use
DECLARE_PHY_INTERFACE_MASK() to properly size the bitmap, while still
zeroing the stack variable.

Fixes: 47f848aac4e7 ("net: txgbe: initialize PHY interface to 0")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h | 3 ---
 include/linux/phy.h                             | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 757d1ce8d3ad..8071464c7b90 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -315,9 +315,6 @@ void txgbe_up(struct wx *wx);
 int txgbe_setup_tc(struct net_device *dev, u8 tc);
 void txgbe_do_reset(struct net_device *netdev, bool reinit);
 
-#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
-	unsigned long name[PHY_INTERFACE_MODE_MAX] = { 0, }
-
 #define TXGBE_LINK_SPEED_UNKNOWN        0
 #define TXGBE_LINK_SPEED_10GB_FULL      4
 #define TXGBE_LINK_SPEED_25GB_FULL      0x10
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 21afc2082b17..43aba23109fa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -159,6 +159,9 @@ typedef enum {
 #define DECLARE_PHY_INTERFACE_MASK(name) \
 	DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
 
+#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
+	DECLARE_PHY_INTERFACE_MASK(name) = { 0, }
+
 static inline void phy_interface_zero(unsigned long *intf)
 {
 	bitmap_zero(intf, PHY_INTERFACE_MODE_MAX);
-- 
2.47.3


