Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20916606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DutloZxO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/eiPLwa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1ZWtq/VyD1hnCbbTlIRXMxrxGJjkw9yh/4VO0EVDO/I=; b=DutloZxOdysesR
	yRK3NkIgJP6fvcvEKWDAxUkUNNMZ3yw5/H6WaUiS9IhCDK+ujFzEVgr6Ub6NNJVtlrpTFUbHmlj85
	eCElbBsCsvr/yvpa++4RUWVt9GbExusBDIeC/q4go5ZjGb14v+iQIW2tjXNKI19Y0RNXwa54dnZok
	tIGclun5VZ+jGuk6Y7jTf73b4UCbwWlo9L2y4cBcf4A/XLXebxcxwBkHtBzG434CqRGQKrWoTSqaZ
	cXygtWYtNHadFAY210kWL0PnNfiy9Ni+oqUmpQvWuIsmS0DaMHIxABLSQeE/Zmk1T3dSyKycn3Hv0
	HDXLhP2nCB5jfYLfqInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7q-00000008Vn4-3G24;
	Thu, 05 Nov 2026 10:55:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7j-00000008Vdk-1ZPz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:55:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2928845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876113; x=1794480913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ZWtq/VyD1hnCbbTlIRXMxrxGJjkw9yh/4VO0EVDO/I=;
        b=U/eiPLwa9tZz/WQQWoPAFB1PhbqYpG0i+CE3mgcEjIxVTU+5lE7Lznbn+3CrLsjlAQ
         oLko1cG+S3TV8/1CMU6KsxldvZtkoknt8rmiArWg5dC30EvZO7hZxkF1bjkKCBTezd4O
         wTW5WM9fO2KWhTBq7/9GYPTz9W6+clJifAeIyBQ+Yg8bZSkAu5g1ts1BArO1xfF7MAXP
         MFaM0DS0hRbMQKfj1cjeu69S2amTW7DJQ0R0g7Qdt1CyELb4uYl+ZYIp0118gV06eOLt
         A6PFF1FZaNcQ4CGPD7ocAqqqY8H1/hTx9k3YTA6LaOLF8ERp2xu9lA9swImhnwh4BzTg
         4nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876113; x=1794480913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1ZWtq/VyD1hnCbbTlIRXMxrxGJjkw9yh/4VO0EVDO/I=;
        b=pJ8E5nFNRjzNP029iw2mikMxZHDAIOS7vqelFgib/tAkYz6efebqpdD5n31nZUnEHQ
         X8bZ2pV/foyrQhHj772pRYbEVg1Fku4R/VSXP4MQb8PKATfMHfN9EnZAAcr9LTjkUYKp
         +DwEWxOAWtv7O/NNSkbM9y3SYM7br8shadU3bQk5opkIqiYYVz3Lmtv4xgjQDcwiSpi7
         tG+tbDohbDS20seUz63+tJBtB7abr14uMsQSo9jFMuGFn6JI7gELrBrvreqEZgyal2Cu
         CI/O6aheHKEzAkIislUZUu10Nba1l/32Nzu7Y1ySTP2xEWCg2M2mCQ+/azseHiYcnLEv
         9YKg==
X-Forwarded-Encrypted: i=1; AKwUvBxBB+Fu86KloISw4+6xhot7fcbbGqzJCXw4Pt4R+dRm1UtfGmVZGCneTn4S17dfm5Tgu3W+lJ9vRPBXby8z+eFf@lists.infradead.org
X-Gm-Message-State: APuU4Z+RXtrb3sVKKnHDH3zbJB7fC8VKQk34AwIETiMmQXEr//zUBY77
	NCxRhpKZyw83HwWTXg77wwBKlx3aSn2zMYJtzI0HXr//satJxuFlgsrW
X-Gm-Gg: AYBFou3JCh7ol/SOQJTZwj5/jicLpTZuhvAaaDHq0MQvn613SbH6QuEQTNb7p7sT+BY
	vPoH0+n/qzJ6sj41T55f6T2gKP7ytn6XonTKrqKpg+VsFWkClBobSlGGgLVkRR7qMTX4O+HNt36
	uTlfSoJUrW9HtfcnZUifa9ktiK0wU7ISiU5cZU28bMTL6G8U6IO4b4JdPvdCk7VhUWP/en2SsDv
	RvZwQd8G9JrDkOmL4WkXDu4fA2sbAECAciRkSHQmDTEVgdvx5k3HyfH4EyP7yR0mq0iz7puSjJg
	fgEBK1l+K3guVK3XN+kiRquvzbA19g+v0+ZWC3MVP2zZlWLcbfEkzoZUaZjq2f8uRnmk3zw4Av3
	YBbqT01KfVX8SCYYAGmPwJYDAB8Ni2Hf8TeenEjnxFVy9ZRnALxFvLAYJKm7ha9C9PcO7+vb7kQ
	ZQpele0mnRCfUShjo1yF17+nTJlkuecnh8xCr1KXGL5ojAs5I214t7kLCPAu4C2eIjLgJ5XTOPz
	b0rWUxm8U40g8Zl0p3GyCA5aFkCGl6XyHXRRTBQGNSFRP2gz37OUobl3ylgu8TCgZz7MDCI/vX/
	6t+EgY/kwutS/5L5jgAm30TuYYtIcexHabzBsJZy/5pbcMh5Jb6UnSgNcFUOj+zCvqSoTdEExsL
	VrewghY/eI3Z1or3Xaj8gKnA6
X-Received: by 2002:a05:600c:4e91:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4b55cf2fcd5mr37241315e9.5.1793876113275;
        Thu, 05 Nov 2026 02:55:13 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:12 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 3/6] net: phy: add additional helper for PHY package
Date: Thu,  5 Nov 2026 11:54:59 +0100
Message-ID: <20261105105504.1024-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105105504.1024-1-ansuelsmth@gmail.com>
References: <20261105105504.1024-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_025515_518135_0ECBE989 
X-CRM114-Status: GOOD (  23.69  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add additional MMD helper for modify/set/clear and poll register in
addition of read and write. These additional helper follow the same exact
implementation of the normal PHY helper.

Also add a helper to derive the offset of the passed phydev in the PHY
package from the PHY package base address.

These additional helper limit complex code in the PHY driver that requires
additional operation on the PHY package like specific PHY calibration that
needs to operate on a specific PHY address of the package.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_package.c | 57 +++++++++++++++++++++++++++
 drivers/net/phy/phylib.h      | 73 +++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 735806c5bea8..0a649e2f6f74 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -75,6 +75,19 @@ void phy_package_unlock(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(phy_package_unlock);
 
+/**
+ * phy_package_unlock - get the PHY offset relative to PHY package base addr
+ * @phydev: PHY device that has joined the package
+ */
+u8 phy_package_offset(struct phy_device *phydev)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	u8 base_addr = shared->base_addr;
+
+	return phydev->mdio.addr - base_addr;
+}
+EXPORT_SYMBOL_GPL(phy_package_offset);
+
 static int phy_package_address(struct phy_device *phydev,
 			       unsigned int addr_offset)
 {
@@ -179,6 +192,50 @@ int __phy_package_write_mmd(struct phy_device *phydev,
 }
 EXPORT_SYMBOL(__phy_package_write_mmd);
 
+/**
+ * __phy_package_modify_mmd - modify MMD reg relative to PHY package base addr
+ * @phydev: The phy_device struct
+ * @addr_offset: The offset to be added to PHY package base_addr
+ * @devad: The MMD to write to
+ * @regnum: The register on the MMD to write
+ * @mask: bit mask of bits to clear
+ * @set: new value of bits set in mask to write to @regnum
+ *
+ * Convenience helper for modifying a register of an MMD on a given PHY
+ * using the PHY package base address. The base address is added to
+ * the addr_offset value.
+ *
+ * Same calling rules as for __phy_modify_mmd();
+ *
+ * NOTE: It's assumed that the entire PHY package is either C22 or C45.
+ */
+int __phy_package_modify_mmd(struct phy_device *phydev,
+			     unsigned int addr_offset, int devad,
+			     u32 regnum, u16 mask, u16 set)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+	int new, ret;
+
+	if (addr < 0)
+		return addr;
+
+	if (regnum > (u16)~0 || devad > 32)
+		return -EINVAL;
+
+	ret = __phy_package_read_mmd(phydev, addr_offset, devad, regnum);
+	if (ret < 0)
+		return ret;
+
+	new = (ret & ~mask) | set;
+	if (new == ret)
+		return 0;
+
+	ret = __phy_package_write_mmd(phydev, addr_offset, devad, regnum, new);
+
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL(__phy_package_modify_mmd);
+
 static bool __phy_package_set_once(struct phy_device *phydev, unsigned int b)
 {
 	struct phy_package_shared *shared = phydev->shared;
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
index c6e26ac6b28f..6258b1f84bff 100644
--- a/drivers/net/phy/phylib.h
+++ b/drivers/net/phy/phylib.h
@@ -12,8 +12,10 @@ struct mii_bus;
 
 struct device_node *phy_package_get_node(struct phy_device *phydev);
 void *phy_package_get_priv(struct phy_device *phydev);
+
 void phy_package_lock(struct phy_device *phydev);
 void phy_package_unlock(struct phy_device *phydev);
+u8 phy_package_offset(struct phy_device *phydev);
 int __phy_package_read(struct phy_device *phydev, unsigned int addr_offset,
 		       u32 regnum);
 int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
@@ -24,6 +26,77 @@ int __phy_package_read_mmd(struct phy_device *phydev,
 int __phy_package_write_mmd(struct phy_device *phydev,
 			    unsigned int addr_offset, int devad,
 			    u32 regnum, u16 val);
+int __phy_package_modify_mmd(struct phy_device *phydev,
+			     unsigned int addr_offset, int devad,
+			     u32 regnum, u16 mask, u16 set);
+
+/**
+ * __phy_package_set_bits_mmd - Convenience function for setting bits in a register
+ * on MMD relative to PHY package base addr
+ * @phydev: the phy_device struct
+ * @addr_offset: the offset to be added to PHY package base_addr
+ * @devad: the MMD containing register to modify
+ * @regnum: register number to modify
+ * @val: bits to set
+ */
+static inline int __phy_package_set_bits_mmd(struct phy_device *phydev,
+					     unsigned int addr_offset, int devad,
+					     u32 regnum, u16 val)
+{
+	return __phy_package_modify_mmd(phydev, addr_offset, devad, regnum, 0, val);
+}
+
+/**
+ * __phy_package_clear_bits_mmd - Convenience function for clearing bits in a register
+ * on MMD relative to PHY package base addr
+ * @phydev: the phy_device struct
+ * @addr_offset: the offset to be added to PHY package base_addr
+ * @devad: the MMD containing register to modify
+ * @regnum: register number to modify
+ * @val: bits to clear
+ */
+static inline int __phy_package_clear_bits_mmd(struct phy_device *phydev,
+					       unsigned int addr_offset, int devad,
+					       u32 regnum, u16 val)
+{
+	return __phy_package_modify_mmd(phydev, addr_offset, devad, regnum, val, 0);
+}
+
+/**
+ * phy_read_mmd_poll_timeout - Periodically poll a PHY register relative to PHY package
+ *                             until a condition is met or a timeout occurs
+ *
+ * @phydev: The phy_device struct
+ * @addr_offset: The offset to be added to PHY package base_addr
+ * @devaddr: The MMD to read from
+ * @regnum: The register on the MMD to read
+ * @val: Variable to read the register into
+ * @cond: Break condition (usually involving @val)
+ * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops). Please
+ *            read usleep_range() function description for details and
+ *            limitations.
+ * @timeout_us: Timeout in us, 0 means never timeout
+ * @sleep_before_read: if it is true, sleep @sleep_us before read.
+ *
+ * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
+ * case, the last read value at @args is stored in @val. Must not
+ * be called from atomic context if sleep_us or timeout_us are used.
+ */
+#define __phy_package_read_mmd_poll_timeout(phydev, addr_offset, devaddr, regnum, val, \
+					    cond, sleep_us, timeout_us, sleep_before_read) \
+({ \
+	int __ret, __val; \
+	__ret = read_poll_timeout(__val = __phy_package_read_mmd, val, \
+				  __val < 0 || (cond), \
+				  sleep_us, timeout_us, sleep_before_read, \
+				  phydev, addr_offset, devaddr, regnum); \
+	if (__val < 0) \
+		__ret = __val; \
+	if (__ret) \
+		phydev_err(phydev, "%s failed: %d\n", __func__, __ret); \
+	__ret; \
+})
+
 bool phy_package_init_once(struct phy_device *phydev);
 bool phy_package_probe_once(struct phy_device *phydev);
 int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
-- 
2.55.0


