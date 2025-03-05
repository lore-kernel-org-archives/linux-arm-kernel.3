Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E1BC282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=; b=Uk/Xobyo0m8ptbwskX8MleWdoN
	TBRHLx1XLs57u+JRrZ0qzMwYcdc95Vkl+hPD7Bp2Saaf2fXv5NPbmVq3FrAsnCkkXGk/FOZM+FqN0
	fhuXep8aZlErIXEjBWhlBVU06E7C6X7XNbsAFXM+RcTFSLa1GWTsdJba+rhc8o6A/M5QIuiM/mDKJ
	H5EP4si6rIrEjeXCWZ9/ixjMr3cpuo1BwJhysLK8R9nul7/gzgwHmeu5ozXk0jpPVwMr3Fd/P9RV/
	UhQL3k3t8oRU7Wkd0Nzq5j1XMTjnEecejjxywOOSfBvpPQ8XrzxWGpOfPFOIuQyG8xi5dTFf5ZjJ2
	RGk4GdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiVW-000000079qm-18cl;
	Wed, 05 Mar 2025 06:45:30 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiQF-000000078hQ-49ch;
	Wed, 05 Mar 2025 06:40:05 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c3d3147b81so143318785a.1;
        Tue, 04 Mar 2025 22:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156803; x=1741761603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
        b=TRrom43jFtxHP/yqiCHnrHJBEl0LlF5J/d/rP9NPLSWZQpA00Uacq6hVEv9iLV9xGH
         nDMwkc0xra1l+5TLb1BPIQiZkuNBdQr70J388KL2SXmIibuxK6okPeTx41YQnc2lD1fV
         9n4Ck3rlfddnZZPtzaECNet+rQ9XARAp40CW+QIhmLqjhIer/u/RZiueCrIGdej0Ta2q
         7gXucrqnV/z3WWdGlX6dWoy6DxyTbsA0uHIXkR632SF0/arMlRqoccs0Dz2dsprAhrp9
         9j1VcRJJpAqe+JtUGq4EagARbKn2LRYrOJZM0bFA/nijXQJgcwBdEcqEmRZfH3xwunc9
         mLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156803; x=1741761603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
        b=crcC6E3WxIQgrsIotCHBDspDYS2GbTGiVM+Z2z/j+BES0DJoWPyXWhTIFbFHgVf47e
         zvAN2+BXhn27CHO9CDoeVLx8rXiG30y7iDsYbjYz8X4utlhaz54/bSN94w47kyRjue+d
         fIVNlNRP63IjLJXAOT0Z1yRzNcvaTIdCRuVXLu5rqFsWBad8ZbgjpeAjoqpnw80nJUY+
         +A1tyrn2/8o9RcRr29upaVbldOk7lXlNSdC4ah4H8liuHsQA3IV0xMAHQmtf8VfuKlXL
         XqP9XafHl5dSJL+EZNl13euFFgcBQikzYLYJ41maZjK/Kc1cPiJyh3Fk3hGSbkGJAZgg
         IvKw==
X-Forwarded-Encrypted: i=1; AJvYcCUT4//CGflkehFv1rZ22/k0mQbiQfbKCkYJOf+zm7JWbHhdPVRduZiTvysceb7vuwo40/GLQgqHzOdhw4o=@lists.infradead.org, AJvYcCWzCgIi5CPFVThfWWuTdn7DkctloV193x67QpLOvQJEnyAjejEUBCCkphPq67G46tu2ItEXq4urj10xjXsQtU0Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp8eAmiDf31pM/tIcc4mQuqH3l9uHSExQpYM7lbOs1aQVEewYx
	Q4pmkl9d0CyFu+hZs/V57L6aHdZdwnOl3IhcTofilV+hUrqzT7CX
X-Gm-Gg: ASbGncubo4HehlGh0mcFv3w7378+YkMunIpgnhYg4fkWEI39ddFXzjsBVP49ESUrUao
	r3PUPOIMyfe2bdyA6ETBAM4mjO/JXqoP20s+oBgGRHZiLv6shBzEhzds5W9SIc42JcwhtniBR91
	IoQP4iS2KKDR4uWLJXKSGmM8Ri1FSwK+rDFdZf/VziDhkjz1KHHvFnHlhXQBB22aZ9fK6M9hHjf
	1t0Y7BNlUVPiiFeilTG6vFGJ+G3Bn0rM17KL86cZhJO8mvImdDRpk32mXDC+dRUl0RWe7xSyTuy
	xWHvNQ8mYhT1BimPzRfL
X-Google-Smtp-Source: AGHT+IHvjwxT5WbMC7jnX9jkcACdhgQLJENaJZs+PW3Nv5C/K/7SkZFAn2aK/Z5GNbzrtFbbjPi8Rw==
X-Received: by 2002:a05:620a:6288:b0:7c0:c2d7:5f2d with SMTP id af79cd13be357-7c3d8e7b411mr307853585a.28.1741156803205;
        Tue, 04 Mar 2025 22:40:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3b67458e0sm409029085a.57.2025.03.04.22.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:40:02 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v6 3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Wed,  5 Mar 2025 14:39:15 +0800
Message-ID: <20250305063920.803601-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_224004_031560_F07E04B4 
X-CRM114-Status: UNSURE (   9.46  )
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 4a3fe44b780d..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -412,6 +412,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.20a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
 	NULL
 };
 
-- 
2.48.1


