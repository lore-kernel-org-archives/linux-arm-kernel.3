Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70237CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=; b=iXo9E7UVBhnaq/vR2Zht1V2KGy
	7oqXZpR8te/b3QfSrCNysMvMfDzowAFFDhDyq+f9F+7vHxo3OQqBO70nzNuJ4o/kCljaGvjWx97WA
	fxQut/p80A9M493PpGGxgZkBx6AlGtb/80Z1v+xLgb8hhzmripSO71RR3gu72N4a1/DPpsXuXbWZx
	kvcjlQGY9wy0buGgT5fhJWeyy5BFv+QupNP1RC/FgnYYYvK6wUvOmuO45IpNnq65+8pp6su18l3qf
	PcUtHVksl3flj2ClKVeoC57JcvvzjbOFTYvjT6MJdlJIDSZsdRg1Ug+drZYvy6NIt9jys9Kz8keLo
	3Ahxc3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6j9-00000003lHi-3utm;
	Mon, 15 Sep 2025 10:46:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6iy-00000003l8z-1VaI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=; b=MjO5cOKLCTHSKsi+F0QLiJFWjk
	Ts20SnoqGT2ZeiPnL6siI3MtABGX8dWCK0jXWOenddi4++42AXfmcQt5fJrXo3Uw2WzBE7H2tdaZl
	qPcEQbj6Tavyxc6MiVJvKGuWeDq2regaUWgAKUkwleMymlexqhgy3F3tm72H2mV4Pmnsi9PlZ+hCS
	xjYu0BG8QKT9udppsSv9Kv6M5QGabDuNvcxLq8CnFaCjOC5Zn4lUtugWrj1vqWqsb0iQfjhY5bahm
	tyTMt3Qf3jSxn684Cx+RMwUjC4GrqxdetnNBWa3ViYevmw1rcYuc0rs/greTyhOHMgF0I/GGY4X5B
	Z9oNFstw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6iu-00000006wGQ-3Nty
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:46:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ea7af25f42so625057f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757933174; x=1758537974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=IYpSmZlY1tX0fX2A9oRPjSliOPVO431xwaafwCGJs66pgUrjcJD45OfMy2r9WxFACO
         Abw+Wq/yyFak/b/ZugSfgnyulRmqCVZLUZEuwUFcv/d1BVfL4ZleawIrk47jizdFIbK+
         PuQ3waMbVgEumOAANZhlyjuf6emIyeB8SNSR8EvDxl9XDwUnXo5DF53yYmGu5IGZpjt0
         8/0ZThMzLgCqKEbvBwDB+OACMCRoRa3SGrfLAAShRemHnpd32yCk7oeWKzeFhR6fafA1
         vh5Yl4h0KWzF1GHaGCfbPYQ+ehkbhNdgmxZ/kWMWbK1UNQxcKLNM6Rw93ahf9OMaeUuX
         rQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933174; x=1758537974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=iJvoT2P50u/sH1Tx3ju6SFhF47wBZ6Np+UJB6Muf5lL/xCxHbWMnRJ83yWpqp76G3b
         9iPBa038eQpkSJY537Cb+8zf/aqVd9XLua59jZbDCSIDVbrEJjjN1jPiP73bKcTspLLZ
         jedxZij5VJi11cWC4k0lzgua065Wzs1+kfvDuPEDDO9Sv0JIICkAvqaP6/Nyim6BbiQr
         n8k9a7WM5j/skAm8hjtW6x72ad2912b5vQOpy6oK9NxPlEqPetx+FBO6ZvVdPCFiXMvL
         istfbpZVWvKj//+3vtF+0XfAdQeBhAyhFZgc62yQ16FmEW+KvmEn4vZBi29krlI72wg6
         7EWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp0vPB4PbwdLD0ltqqqlw0F4hPXccij7XpU/NLJiRHwgD4T4LoBl+CUYVGXS8Apj3omZBBjTp+85bU14k0empj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz7ke1/PJEwIc9E63N9O6KolZdpautYuezw9O+0eYb6OvKAje4
	2gMa3zAkKfmyF8PRSYKByklwLj7eH6Vb35dLEFZDXY239hH0uOZX4qEb
X-Gm-Gg: ASbGncsHs2eKPurxuVYHHABldnoQXpHRdkytcRretc7gtL5wdze7HdeZHylzFU6ZZru
	NZiUdJY9C2335/YQNccWa4mPMpnrjedY6HHCEunBghzIOEPtZGxTpUWiyxL7CLvt7hHLRWYLwUi
	XaLaTuaSLIEPmNjheKSHgexMsTo3XaMkw1TfJpLyQfqhqk0tB16I/wgSt2XqfycI30QXsxi0DJh
	mSKnkYFpvfoNCDpUmsxZLVs2uhudGmfnFdx/amceSsqeCVKV00/hH0Gd/nFuOH34xEtXpp2RXMD
	050CEl1Te7mkIXfIVxJJhqwRwYrgOHsTWqCUpJCEV1CMonI4VipJXD6QXC3TjgjImS62ZGTHtx4
	gHw77a4DFSvo5FI9ui+InnA12knWJyYsqFHiwOJCRFoxJJLENf8zIcWW8iQveDqquAWWQzLUFca
	jQiGUh04oz6gX0ndHV
X-Google-Smtp-Source: AGHT+IEiFbkrpONQ4XqXk19ByjgEAHG7EmwNVeSeBkfcrYsWrMW7FZrDKlSQ24Q5Qd7fFkQP/hDrrQ==
X-Received: by 2002:a5d:5d02:0:b0:3dc:2930:c7e3 with SMTP id ffacd0b85a97d-3e765a13065mr8441662f8f.35.1757933173856;
        Mon, 15 Sep 2025 03:46:13 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm67163365e9.0.2025.09.15.03.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:46:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v18 8/8] MAINTAINERS: add myself as maintainer for AN8855
Date: Mon, 15 Sep 2025 12:45:44 +0200
Message-ID: <20250915104545.1742-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915104545.1742-1-ansuelsmth@gmail.com>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_114617_105518_2C32AC47 
X-CRM114-Status: GOOD (  11.58  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b81595e9ea95..818fe884fb0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -740,6 +740,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.51.0


