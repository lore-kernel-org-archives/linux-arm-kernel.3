Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C351C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqVQmif5rWfQY9xKS/pYfnIOIMVEEPODJnDQ9GyjQd8=; b=nJpcGvbKJ/Yv1MAxfcCDhyHShY
	ct/N2Ibsp4sWquDwx9Dxx2TuTbTwao2Y0FHKDfuaDwqazDq8tj/ga0HSIT+etKWfhkPKPPzEkXES4
	gNg33hKfUv13K6/iJ32c1wJJSZqofp658uqtXunHUKfXofcs2VHGboEQR/vLdVwPs/xvT+0IvUCSV
	/vvQp8sjC1xJ50o1HtdAuaI1Lvb/QVFr7Q3E79VU37ZWU+EszCC853oPdTwXY9l4DcagQleBAOlgn
	DKfwG4BUTIbt42HZKxBW2plaGO+uMb1lrxi9uQLSCQSlAbCELV0vapWpEH5ejfllZwkMA4roQpPqj
	Qo2ujEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrI5-0000000F5RS-05oI;
	Wed, 19 Feb 2025 21:07:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrEk-0000000F48u-1Pou;
	Wed, 19 Feb 2025 21:04:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso55690466b.0;
        Wed, 19 Feb 2025 13:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999045; x=1740603845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iqVQmif5rWfQY9xKS/pYfnIOIMVEEPODJnDQ9GyjQd8=;
        b=WLvLTBOGVkPzkT7tglui1ozNchLGUrznCMEalHmDj+DwUrLSLp9KvWjMpEFGgz7XQT
         vbUiDzy46AVABMLNMPN3lCH7nZbMyJangZrB8TQijic3P7gsfGx0c1gdML0WErALANMG
         Q+5d4R2rwedd959/xg+qLZhvxH3Wr1QVzFZPunfAngN3S27Y5A1Y4K37xkoipn2k0iok
         +quGf3aTGJXLmAteLkMbnn3WjJF8D/ZVSQiwIC/aL29sEVKBuTqzbmCjLQoJS/FrqoBU
         plzHiW7osNpmVrhpbBOydoY83HabgES4K9a5AG22fXouCfFM0jVukrdOA1wnGe/XshIB
         EbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999045; x=1740603845;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqVQmif5rWfQY9xKS/pYfnIOIMVEEPODJnDQ9GyjQd8=;
        b=xEYRXKdT6SnqDTSQvyRt/xfIu+lEBLsfv38vruo57qaljbqdMlLZdUWz5ho2VtWqh6
         SUPYezxWcObej5cBv6yDhxYHMgalDcduvgx39LJytr5Enzg+Dhmw6sZqzaGm3vgTqLL1
         92d3eRpGLg9wTU7hwzNdvaqRLVqox+s4QxJmuM0YAB57BcMFL5dzr+fLPiCLJvesNSBd
         Xtuyu2M2NoLlcq8CG4+yt4TSanN138G6T0bkdUrtqGIw0Y2cDz1+UtftgPNmGB3oHvdD
         6tO1bKecXSZizt93DyfZ22gb9aSKWynkHrY+prhJAbcPc1cahV8HG5dYVUqUiFyOQUxc
         wHJA==
X-Forwarded-Encrypted: i=1; AJvYcCX59N/PNFxKQ+NUttKcbWBMU8xadQxyl/bcu5UEu95BwaJc24S/0PkYmLFCxIkpiNWyyY0upuEUjdEWsgtmhPs=@lists.infradead.org, AJvYcCXQgdV2ZvzBZq+j0BE5yIw6j3k6/mt5bJ4kBeKKaW+HLzbUUxRKnweeUBLHXpJxluQ4Q4HvNIYn2l3sG2VfLiYJ@lists.infradead.org
X-Gm-Message-State: AOJu0YygCbx2VHhfpkCal9NbIr2tD30eJYMbLO4/XFUEBkQMRTzagS5l
	xXDtu6D+vhdfYN6O3af+IGmK4Ht/CK+naBJaRRz8e9kU+vygHLw0
X-Gm-Gg: ASbGnct4c5M8Fg71KUQ+Lwr4xGEs8NDBFVsqRuRJ2NvEykspO1jICyMML9MtDnOJc6I
	DqU76ZTzU7ojfnk73u1pR26EXkICspsqEVi5kWUNklloXzBrXWPMSXCiea/rTKYokHQEHPMAFjN
	KIFQ0ucvXI+SblQFIlULh3TLN5g/cWnpDPes7Djiziy/EDEbQyGPxligmfNYbYEpuMrZf/lT5HC
	SvXUDsbvP2Dy+iFtA6eYvnQfdkqI6ZbNacHP0VLDCYiewqX/Mox7e8nRDK6y5s1BizMGCcWHzaK
	ew3FY239HuSUegUsPdqlHfHNYscB6SJOcgklKZZzRHI3Afot5bqgBlBPCnUh/QuHqD6mZpoY2qQ
	XYBSLCbR15QDGxUq/baJsE1b7qhmLyf7ccwqTxtEBRH9TGXosMGvtIpgUhbGse5o+iW/LWkps/C
	9llRh/DFM=
X-Google-Smtp-Source: AGHT+IGHn8JMWM2nJoXI50VLUVNtZBVQFbuznMWtLN7o6/jBqEWvvL+cqAhZ2DA0oLYdK/lp9E0AUA==
X-Received: by 2002:a17:907:cf8d:b0:abb:e7ed:1324 with SMTP id a640c23a62f3a-abbedeea645mr55214466b.17.1739999044595;
        Wed, 19 Feb 2025 13:04:04 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb9de73d1csm635483266b.140.2025.02.19.13.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:04:03 -0800 (PST)
Message-ID: <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
Date: Wed, 19 Feb 2025 22:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/8] net: phy: add getters for public members of
 struct phy_package_shared
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130406_381609_96555C36 
X-CRM114-Status: GOOD (  10.65  )
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

Add getters for public members, this prepares for making struct
phy_package_shared private to phylib.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_package.c | 12 ++++++++++++
 include/linux/phy.h           |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 9b9c200ae..6955b4132 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,18 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+struct device_node *phy_package_shared_get_node(struct phy_device *phydev)
+{
+	return phydev->shared->np;
+}
+EXPORT_SYMBOL_GPL(phy_package_shared_get_node);
+
+void *phy_package_shared_get_priv(struct phy_device *phydev)
+{
+	return phydev->shared->priv;
+}
+EXPORT_SYMBOL_GPL(phy_package_shared_get_priv);
+
 int phy_package_address(struct phy_device *phydev, unsigned int addr_offset)
 {
 	struct phy_package_shared *shared = phydev->shared;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a8f39e817..ce591307a 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2095,6 +2095,9 @@ int phy_ethtool_get_link_ksettings(struct net_device *ndev,
 int phy_ethtool_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd);
 int phy_ethtool_nway_reset(struct net_device *ndev);
+
+struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
+void *phy_package_shared_get_priv(struct phy_device *phydev);
 int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
 int of_phy_package_join(struct phy_device *phydev, size_t priv_size);
 void phy_package_leave(struct phy_device *phydev);
-- 
2.48.1



