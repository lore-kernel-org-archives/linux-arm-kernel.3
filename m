Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376CBC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ARK5arm4xRMg5UA4OO1T6K5We9IiVU4dSpLE3tmkVDE=; b=Ghg3ycyjxUUjK8CnRfkjHaYIw4
	Rl7uYDTQWwDyqtxKjn9+K8HzwXNl4nljNpJ8k1uloXaZo5z22mWBfEcX/KdRCzjwjEiBGrw5OfYyn
	bepVRdWPyspeHgWJOWf14skNUzB1viX/5fhBZ/ojuowdJKvJrNl5fvjQBXUhLcntKaJaiYA/88OK5
	kNAsYGpR1RRIZT6dnnpqIrl0ZBSrm7uWb3WFU1AgprKCp/9vd8pF+NqJKBf6JSYfeoLNk1BDl8sPE
	wGRa8oT5YpBCrJYeT8FM/NQTmpSwkxC6jDqlf0CzUtZClPamaf+W91hj5DlG7D/si9ckcTNbHcFPv
	Pp/2jeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9D5-00000001fsW-1UCc;
	Thu, 22 May 2025 16:55:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9B3-00000001fXs-0vOD;
	Thu, 22 May 2025 16:53:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ede096d73so61375185e9.2;
        Thu, 22 May 2025 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747932831; x=1748537631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARK5arm4xRMg5UA4OO1T6K5We9IiVU4dSpLE3tmkVDE=;
        b=PDwn1VP2+LGju8za6UGdj9zpQR1WC6nzl9zsvqJCeS+fdI71G5iyvC/vR0WN4rcuJs
         ILCLbMzKmB0USNw0EISOoUzwn6aE5/VFLlgdlruGfvnYLVCabh2Xrgm27i0+OOk+EPEU
         9gTO/Zc1zWZ46kdqgYnMierhNp5pXJHXQ+7i1sCZFHkFu//Cz/BkGkFR0CBy0Gb3aN7X
         WYREH0Fu+cDzQ6aaRsmT5a+zywosNhI2JbM+HZXDqmeVJFd9D+cRnocNZtNFNQ2wmK75
         irgT4Bb4+W6M9PoVxG6sFNhdn1jn8jZfq78jDzZHUihqiLTQQREmURPOIxp0x1TJ+nuM
         rtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747932831; x=1748537631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARK5arm4xRMg5UA4OO1T6K5We9IiVU4dSpLE3tmkVDE=;
        b=m1/O8oDYr5EXiked//LXym75hPQXjlfXsoX+PknTQ+/2f58ld0FOJgqOb5Xs+V11iL
         Zx1u4I8c9a+zaBsYkeVVJwot3ly9gtvpdUwKMQ+II2G+OSlbDFdneccRm4mIad5TfOwh
         F0qQ3femDWsv72LC8ETMyTvbn/llzzOh92SVhg+mXoo5iPKYAIx/4/xnuUqsHhslN5d/
         6YxsQtWRRX1yU07fiq/R7zGIujro0jt2mwL1DluvUy1TLNQJtrUDw+W0u1aJkdAAsldG
         lVUz49wSOPdGs8JNnDDnm0VEJ4N9LRRor4I+OnjHDZBIwz0pD35wKU6BXj+yy24eY/28
         D7iA==
X-Forwarded-Encrypted: i=1; AJvYcCXNuUNXJvPtq03eOa+iUBoKlNSWjHnAN8iQG2x5YYwxoTw4ViRTWgjQYI9hp5DEXMFWXoUNKTguAZXzGqS9mEV4@lists.infradead.org, AJvYcCXes9szHp7mTIzJusCiX9/8uXPl/cEAzbdtOrWnny7uILXFPajYKb6D92mzwYnT7HxlTkxkhxY6zqVtDaGE2x0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaYa8ZkXC41czq6qoRyAKyUnhp4C0MIgqWEZWGqLUkU961Gd1l
	I0L5SP1eTAgQ+/LpYg438dKSKxDHfOefKGQWRlGtxBWiZy+YpRwAIFzU
X-Gm-Gg: ASbGncuM/UpguL2UsTRwB62KjKdqmhWa+15Iqly1d470Apex8am+jzS97CnXFNwTt8y
	Egu/NM3V8gtWy5kUTuuEi7NAJZrgeX8kDeTwGbBrZriGyQy9m87gLGo8WExmSKdQ880ucGGFSi6
	TjOze06hilrajDG5l3cT9hSkXsyTNkDsUBTw/RODgZaxNZWuMxu+bDwNHw4Tl3t61deqID9JMRQ
	loDC88G7if06WGT37JHWAT18kGpkz7ThQ+1uQONxhmdgpBZfFeuNQL81fd1ZAVfsQ5aYIhNtlDP
	dA61ooKt5xpmJqfDU3FxmPgIvA5L3AgQb6BZGAy8OLg3XLZ22MwtiSC6Jt/WYOIHXqWkvitowob
	AVX0gVtbFqeANi/0bVnXc
X-Google-Smtp-Source: AGHT+IHWhtAWXRBGh/ENakgND9IzcrqJZpmuMgIAj3z1JdfL9BG36SGp+6PXxZ3vxlmo2rQYJG68cA==
X-Received: by 2002:a05:600c:8411:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-44b1f5b8d2cmr16008065e9.13.1747932830716;
        Thu, 22 May 2025 09:53:50 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f6b297easm118737525e9.6.2025.05.22.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:53:49 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 0/3] net: dsa: mt7530: Add AN7583 support + PHY
Date: Thu, 22 May 2025 18:53:08 +0200
Message-ID: <20250522165313.6411-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_095353_258136_2A9BB311 
X-CRM114-Status: UNSURE (   9.35  )
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

This small series add the required changes to make Airoha AN7583
Switch and Internal PHY work due to strange default configuration.

Christian Marangi (3):
  dt-bindings: net: dsa: mediatek,mt7530: Add airoha,an7583-switch
  net: dsa: mt7530: Add AN7583 support
  net: phy: mediatek: Add Airoha AN7583 PHY support

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  5 ++++
 drivers/net/dsa/mt7530-mmio.c                 |  1 +
 drivers/net/dsa/mt7530.c                      | 24 +++++++++++++++++--
 drivers/net/dsa/mt7530.h                      | 18 ++++++++++----
 drivers/net/phy/mediatek/mtk-ge-soc.c         | 20 ++++++++++++++++
 5 files changed, 62 insertions(+), 6 deletions(-)

-- 
2.48.1


