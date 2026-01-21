Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D62D262B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=; b=4ia6T8quT7alza5/XLSBF5tWmv
	xXwagMexKPW9YmpzW8jNpeHN25vtmdsIzRJS/UI0d4CE7dyU7U3NPaMKUjvQ6Q4FmP0GKdl8k7U/K
	+gJ/YCqcFZmlz2PFW7VRTAJWB+qXaT8a443HUDx0askcwwzeAUu4a0VAzaHVLXbeti5j9/NYTxwMT
	B6rxctMEkZ/1dejBbvAJ4iTo1tqHzxIO2DVBgDe7fjw4dCKWJ/qiHrE/41UoapV3v1/7fl60+Twc/
	CtcGYI9VFlH0nzGygFZ8qlvp+81M2S8SYqyM2P/z/N8wIxYdK4byRfTjvPoZKs67TnPtzvFsAYeyg
	nQI+KUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSPQ-00000004zqa-0d9j;
	Wed, 21 Jan 2026 07:13:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSPP-00000004zpj-1Tpp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Jan 2026 07:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=; b=qR2cTnG2NmQ2eOOwEfc3+SnBS6
	n6hktQZIEEX8DeG9GLUvq3SfSR5Xe2CW1+cn6XTdU4ULULPMuSlQMKAjFSZar41aCiJG8STPP5aS5
	++CgziFRGskUno1ia39iXkLUsyVtf4TYt/Plv+dMEhe0ojLnriQ58gVuDI4wQZvDSxSx3vCjBBfy9
	B7i3A35+F3+RzsGmGW9yHtOHuz+FfBmqMMxDATk6Y3InkPJuehYYnhq5tSFb8mhBSWKV4o9rANukc
	EI4jt0cOLhUZa3VavSIvFl9NIuKPz0QJLZtj0CDcoZS2Qt2T7I62r/phcMUCy5301dW5VUBXEhekl
	QA/AgSMA==;
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSPM-0000000FVvJ-2baA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:13:42 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-12448c4d404so5215622c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 23:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979617; x=1769584417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=TqHLZQS2M/beZx6v+QITqkN0QEbg6dHNokFuHRiXtGzX6avbIERObTyGIfPonItCWI
         hJp4ZzoqJev4ORyYt006OESp35SzEg19ksvbtty90vXNfnh3lVVjoCU20AEW2xmdFAAF
         cQCyLaDftKoQ5Mb1VpWHSVXEuWQLiv1V0aUYbXu4EoGHUnCl7wBzlAvGAX3nfEoNozz/
         bbkla+pruc3Ydj4TTPIWUgQnT1czCzu0TPgbLci8s3tpexznw4eB8x146CrBff1rC2Mp
         t+lQLe0axYSkqh7qyWTP1F1GyMOnmfm98ptC6a4JyJt6hD9MiZ7tQeyy8iUtXgL16+G9
         SVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979617; x=1769584417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=WCvtGsAOPOoxWJRuvWWgr0txk49X7HIz0IGW9VFU57DZyzIekV7zAiGlcOTsB3yqvG
         nR9ufwOTY2kCQpJLxKAGJFSb9WKZnZpUOT6v2gV8Bfu0fkkVRcrfE1fMfMn2sHV6m3D4
         09Lp7BJLmCOFFfctTkcETLquGHGxyWd7FAwoNlwuss5aL15Acr0ImDBZ0UX9eb1HZRcK
         dlEFvAg4EPtTSGe4/Lb59loiXYNObxENR69TDKy+kr/MW16hOP9MhxsUR3muDBWKE8+I
         uZQNNs0HvONQ5LWtCoZWM2fG8xWaePi4wiZsJe+TcG/rn4MUEDs1nzgamDiViDLp+8Dt
         iB8w==
X-Forwarded-Encrypted: i=1; AJvYcCVVzd+8o75qS/IP4zm8qwoi5nxUfixSOOtGRWxeiBABDNZC6Qc1TL13TyN54UVL0bYO4ESeOiMqlGY+3PGxj3I0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7cFLuO+6YST40HRU3Gz3TPEdmpNihZPR9yKXKfA4nJuKAHPv2
	FEunKUmfrddoZwjM18saIC1GCLLrwhErsYjqfPT7J0dRp7gDCD7UHTry
X-Gm-Gg: AZuq6aKnvLNEV744EVkUyxSGx3N4g+SwhrEmcBvW19aH+e2rcP7gSV4qmPC6BhB+bDO
	RCrJINDFj8QDTR0d+ruLosiB2Tz4eDDMTcFBUY2T+kE04Bc1xehkhPk+FTYye5XAgdewXnWDUzW
	FNfOlOWXLRTe/0Ho43PtY20oiv/oN0cvbwOiJnz31Yldc2jU/97DrC+RorpexAGh5+0UbmuOBRA
	G3HD16b0ftIrTr+JX1odGhzsmVVtqj1irIQL+XiKUe2ZUjN5JqgmG6GikmPgMAL7Q5qxtysspj/
	0qQzaVmejxWzQszprYLRw7XFrsoPHHpDkZEO5USY8BrTQCNTwNzfo6y3F3puQeOHv5zQQGRRWlt
	WruRlxoVBodVUVpPjuqCGhNVB3wBbUK9YEjdCOCE0hLFICSKC88LhrJvjOMV3/eIx/od2amBSll
	Wc11MZ2dFcjA==
X-Received: by 2002:a05:7022:914:b0:11b:a514:b64f with SMTP id a92af1059eb24-1246a966afdmr2812178c88.13.1768979616484;
        Tue, 20 Jan 2026 23:13:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm22387219eec.32.2026.01.20.23.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:36 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v2 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed, 21 Jan 2026 15:13:10 +0800
Message-ID: <20260121071315.940130-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121071315.940130-1-inochiama@gmail.com>
References: <20260121071315.940130-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_071340_688557_8E583535 
X-CRM114-Status: GOOD (  11.48  )
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

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..54c7b1537ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.52.0


