Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F802C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNLaZYweysNghkTQQ5vEunIOEfjB7A4eivqMKKKSU0k=; b=p1gDh+VvISFwtMYcV3bCPIlMiJ
	BM2JWTme3cKmfV7idD7LtjERd039SWxWh40/RhBPj7BF5RHix+q7RWG+HC9bI18WTIzqJ2rYdF2tO
	rnFDBfh8iXimPKWcTSWjebVl+CYIxt6HPpfvOtFM6IjYeuGdC3jPw5dA3XKgTYepnyLK7MKC2YcEX
	2kxPxI1XxaDNea478kYo0EbXV+a7MckO6EmZVyMtDTx5ye1UHM7nf4lKNWeUyFjwk1viX6rdRy6AH
	/kxrcD3JP6//N0NSSn0XYu+NgFJU0y8oOwDUadMbuo1m3hVfgLSWRGtS59P7xPXLyntzihXGdVzdx
	eWJDdg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuDY-00000003QCc-20vy;
	Mon, 17 Feb 2025 06:02:56 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuB3-00000003PlA-1EMI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 06:00:22 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-471f7261f65so574141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 22:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739772019; x=1740376819; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNLaZYweysNghkTQQ5vEunIOEfjB7A4eivqMKKKSU0k=;
        b=gu8kKidbUiZ7E0ZelxqQtlyIFIhGXU7h9gnG/IbD8R2AVYORAaPT69NyUGfiodyQ00
         1WcXHJMtthO4F9EdPuYjdgtE+6I2TgHGaNHK+ZjwGdTU+A0nGPYLU8a6ci0jxz0OmQpd
         9ATvGlV4OCS/lcXOC2p/Bb/Vv9TpPTvTJ5e2FrHs5xlWZsOVgF7coN01I7/yasPaURXE
         dBgaQ35hQkY4+Fchv7UsL/9piOG/j6AbBRNf95EIuEfe2uEgwUhx/lospVd13Mb+p10/
         +D9CyhU/hOyNs+FKp+swKnC6616zSdSrMw3WkFoktilPj0sY3ybCQ9Xr7rv/QYYMnio4
         L33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739772019; x=1740376819;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNLaZYweysNghkTQQ5vEunIOEfjB7A4eivqMKKKSU0k=;
        b=RlZu8r08wGbO2dQ2Z5mXEFMGl4d/wlK7r0Wjfzm3cI8CCB2QuuZ0taeQ77ZlboKVGl
         JOKuiXa1yRBAlMpTBg2lCbiYxLjsQM8WbvCUKlSNsSzuqLhaTK7F7IKhsmcymT1xGQpr
         lKsM4vA7Kq57qp6As5sD/7lIsaULnmm8jfk8ZefKXzTYnWhV0yEL18Qw+NdasMGsv1pc
         Gtsnwr/M62yaTm4JYPQoh3or+6Z7olxwptjmR9NCgMCgcXzLk3xjG9wmFM5Vcy/YBX7r
         FqX5KFiZDswCiNlOOm5p8+gsDL2Nx4pp8tBAxS/2NTwMpjM6t3v5O20ouQ1EP6fYmqJK
         V6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW64xYNmYH7Go+FvvSq51lc+Q9jscYLqvVJF2LLD3irEjnLf6c9Twt00w+2/hCBSE5peSjdaMGbKYGWkm+L0Ihb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw78peNMO97Mb3+BVu60hJuHnbywwcMU+gLh9lAD/l3b6iyjSe
	s958ql8++CbvJxm9DVZWxUtbHcMWzDKf/JVQ0lnQof0xvjor59n3M30TLPH8bF0=
X-Gm-Gg: ASbGncuB7WqnwO8paG93XEE7rvvHNRSiOcSTgf1QNYZQxWQB1uBVdXx5tdREQ16l9YU
	QOsqStem1TC+EBsmnMhgZ6yolPyePpyx9iKVXs4u2sQRu/xt1oKjVDS/3F6vAozBEDZn1RN0SUe
	UcEKY0X9lXw+EbqRM3VyM7GsHA4qUUvmZS4VguYwN567BkSa6VjJWVaRmnsu8TKM+5CTpeGHhty
	b/mf18zMp/fhOHnxpxiFUTgstTM6lcz+fNIHpROzE08HBhonrR0LVgA//dAr6hsyvXZS1iTmavY
	sxdzoNkv6xcYRnkb2IcG07qDVAoOActi4pFMiw==
X-Google-Smtp-Source: AGHT+IEa/Pzs7CbSJS6B4jiAkbAvdqUHWHU03XvpyMfamqGiwX7MVgYWBqRl7K2/oJni/7AC6EA7iA==
X-Received: by 2002:a05:622a:8b:b0:46e:2d0b:e1bf with SMTP id d75a77b69052e-471c015077bmr226327871cf.11.1739772019591;
        Sun, 16 Feb 2025 22:00:19 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471f6674aafsm1396881cf.76.2025.02.16.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:00:19 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Russell King <linux@armlinux.org.uk>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Praneeth Bajjuri <praneeth@ti.com>
Cc: Nick Hu <nick.hu@sifive.com>,
	Andrew Lunn <andrew@lunn.ch>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: axienet: Set mac_managed_pm
Date: Mon, 17 Feb 2025 13:58:42 +0800
Message-Id: <20250217055843.19799-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_220021_344437_30F18E46 
X-CRM114-Status: GOOD (  12.06  )
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

The external PHY will undergo a soft reset twice during the resume process
when it wake up from suspend. The first reset occurs when the axienet
driver calls phylink_of_phy_connect(), and the second occurs when
mdio_bus_phy_resume() invokes phy_init_hw(). The second soft reset of the
external PHY does not reinitialize the internal PHY, which causes issues
with the internal PHY, resulting in the PHY link being down. To prevent
this, setting the mac_managed_pm flag skips the mdio_bus_phy_resume()
function.

Fixes: a129b41fe0a8 ("Revert "net: phy: dp83867: perform soft reset and retain established link"")
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 2ffaad0b0477..2deeb982bf6b 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3078,6 +3078,7 @@ static int axienet_probe(struct platform_device *pdev)
 
 	lp->phylink_config.dev = &ndev->dev;
 	lp->phylink_config.type = PHYLINK_NETDEV;
+	lp->phylink_config.mac_managed_pm = true;
 	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
 		MAC_10FD | MAC_100FD | MAC_1000FD;
 
-- 
2.17.1


