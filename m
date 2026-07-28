Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320A7C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foFk8F1wdsuWT3Dh0z0pWEWTbLvlSNuNG+sknbc1YSU=; b=ipabRdsvoQ0Mdud2hCf2u0tOdj
	xpDx5hPvr2aTc6Pp8+5T62lxbPYJ6Toc+v6mBAKDxO0aKtHqI3odPpKffWL6oCUU7r4urIQfUgW6A
	L4PLXPn+xzcsxAz+73+lMa3badO7DiWbZiMlX9FBPh9WsH7zhdihfd5m4UPunAsOG+AWDAZIf+y4w
	FaZpn5oSjwKR08FQgFBaiwUpTrv2/CzZMxw/om7JaVpeZoGItl9kHsAyB71UbgFES5VPszXxSV2+e
	oiPRv0oen1YjYWohFsZWJp2jnWQC9QxgO9fwuIGgPy3DJIC62v8Ue/1NVyzubN3ZRe2AShwLJ6XsX
	4QY4omSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok4A-00000005iIT-3Cmw;
	Tue, 28 Jul 2026 15:50:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3g-00000005hsZ-1pLh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:49:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so36744175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253770; x=1785858570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=foFk8F1wdsuWT3Dh0z0pWEWTbLvlSNuNG+sknbc1YSU=;
        b=JtDkPuArEHVAUTS5Xhhm5TcU3PsPlu7gcA+xuh4htnmITt19mSf6Bm+nXTYJhECMCc
         fqsvGS+6zd/ssHWvtg4YqpaN3eTRcqlZE7jcZFy2Y5Rf1uqUuQ2hSOGGwr7k4qwP2/g9
         qaqeWKaD/AJIJpFTrwb61lBqnMbPpI9CZ16VZjhPP1ea6htNObGxhTB11ACOlIbro6ni
         pUdqnIGpB4QuiI5cI8l+DdjCJHp2NERIQ8GeBZ9apBc09fwsk7PtU2KsvlONpdor6ryM
         /LzID0MYkwtnpvknOOKyvTxw0mjOP1YxXfR/A+6WrGTGP5XeA/Xs6Yzg5DXHEFMuIOdh
         sepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253770; x=1785858570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=foFk8F1wdsuWT3Dh0z0pWEWTbLvlSNuNG+sknbc1YSU=;
        b=QzjZAL2K+8p6yCm6sI9oWTdHnDit7iisUTSkm8Ecv2gOyyhPvjPyybHMdZ8i4+XOah
         HlZo4bEJCXpthVenfwQ2rbqSY4mq0rh+Iom+3h6cdIZfo0O0iP5BXtNUtk9+VRUqv73C
         tSyENT6v7/E1y5x+33AUWZ+2g6DeVo4MmopMvyMmtaX+8PubGM5SnwYSc0ncvJRXWaN5
         9ihyPV71WBul1lDw0OOv528UVXZZDiq1v+O/fZlSPV/xLbE9DCHjjRnH2uogCqI+B6xx
         9XEHPjv9YE6GSAtvBb/bZgy2t/szUQHLHOJuQGzkUzt9EdFt14iEf0Ysi7PU5JdFvVgW
         yTeA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8IxU3oLUuzoOz4tLT82X2ERYrmhznoldNVKWc55xq7/bKGINNIa6v7wj5OwdqXvMn+pSxonDjefiWmYBSnkuB@lists.infradead.org
X-Gm-Message-State: AOJu0YxoIhq4+/lJcELRAhTAOz/YSDtO33PWjQafeMT9X3rjpVKYMxl0
	N84fzVjVQyEWGqkcmnaNL1x8WrIRrTIUNrsORWOB0jotuHIkKx+YiIi8
X-Gm-Gg: AR+sD11JjZdxrtG0gkyz6H2kAYSOmV//4EhS8n1Jl5IZ2Rsu6jjs5IZwQlaHi5lYx1e
	KaH7R1KoGTRehcH23iWg+x0a/z+3Wushh+M+rbVBH3aImEkrMVNhVm+riATYevQOsOXUu71uT+z
	Lh80G4bphR9iejjDr1+70z/jJAKrnR6UC/KPkZM8TEq8bALY2R/gQi4iQJVDmkGXrPUNu5E6F16
	CMFWY8m+01QqC54zokl/7BG0FODsxJ3RZZocPJq4rSvp3ko+mLiNUiTygyMPpdO2KGHEditGtSD
	10hkeVf3c8hqlnvqFyrgasBrNBkSB9alFwK+mIcMijYnwdndQ9rnYRnDSRyvZTTayM9fhYywXM2
	EqbYrD+FtPwbtYRxnGQ6FDH2+JHQEPJAzraaVhFw/sEkC2U/zdFdMrW+oBk/jgDAdT/Llz/7sb9
	0o74IkWwkJi1q7cEUMig==
X-Received: by 2002:a05:600c:1c11:b0:495:3a52:cd7e with SMTP id 5b1f17b1804b1-496c657d05fmr34143125e9.25.1785253770337;
        Tue, 28 Jul 2026 08:49:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:29 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v19 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Tue, 28 Jul 2026 17:48:34 +0200
Message-ID: <20260728154846.1828945-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084932_527157_E6BA681B 
X-CRM114-Status: GOOD (  11.46  )
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
index f3218abefd0c..b8580ff98b8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -760,6 +760,22 @@ S:	Maintained
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
2.53.0


