Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4698C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OA13Zni3URzGAidEIRgBrp/qP4ozxw97b88r2lO+YJs=; b=KjBnYH6gtfTv94pP7Yns+1w0fb
	qalsA/xuz069kRUsFRQk8bHHdhJTeTMz1edAn2CPr5PSDpUZePqcZfkGKZMCEkaCKaDf8UZpWU+Io
	7GLquW1TXP6dvMA0hbLMFfwSY4tE3NQ+wtyXtCbLcwlLgVDcrFSrX4zy3wF0HzEY8ylZaTBfXUrpX
	/vXvY2hatH78NpYedAFubOxcwyVTUBF9XhbruNjekvkEHTnUKAgMKi+PlSB4jhKQHOSr9+imrhUlv
	4bp09Bah962SklMPArC0id4+RMO4r+8uIx6hzIHEG/oqDv5KbryqxZs5PSGnZDbPKp3sG5B0M6Aq8
	5iXhM+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu5H-0000000AVYU-3KPj;
	Wed, 15 Jan 2025 03:28:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu3z-0000000AVEp-1s0j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 03:27:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-216728b1836so108897605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 19:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736911647; x=1737516447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OA13Zni3URzGAidEIRgBrp/qP4ozxw97b88r2lO+YJs=;
        b=lSLbFj70R9PS+tBjH4IfmyigecssGVgmzKwMs29u8n8yheNndiP8giWewe+62X5PlY
         VkhjIGpWVA9s1QOuAt/X1T34Zf3H8dsyuess3mCLUF7aGNCAsZ8Dkc84lJMrclXq9MTb
         Z/SMN6dL9N5gcAAZfDBg9ORIAmZ5ghQpCr6W3kFr6haZC8XmNie5gzrkFug/K6rTnISJ
         Fqq1kqoEQaiIOCdEeTEtkypKaYm/LPrivIIe5nrXvaiWVjYTapHoVDkozMl2jwWtGh3b
         pBrzV2w2YEfouivq/Q91lSpivOFZerTg/lvrIBW4s/PLgY/W4wgjOF52duiiJla8RDwy
         tm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736911647; x=1737516447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OA13Zni3URzGAidEIRgBrp/qP4ozxw97b88r2lO+YJs=;
        b=npX4trAubKpw4AbL7yKEuut5GfATIyXviKpWTOIAGpglP+fY3PYrmAu3lelCPfQ0fK
         I7n79HFraETl8iqPu4+1WXu0mquIE+lyziEDs348Rv7iPDa28yCm9wIJi7Hyxy95PA+D
         8fAaCrk3Hyrf4SBJeujj+t+fYWE04NFgTnbh4JZ5UCGWjoFUITLCRfSB/JXr1DQqChCV
         8kwH/pIibqApYlCBT/L05qiS9Hui3SNJIVr+V4s4z1VnV1DY5egYtTWJGsPlU30hfaqt
         KZSzUjtq6wH2xRjOvUcu9iRzKEEVSqJ5vdk/b91vgJvNK3DQYaqJkuy9GD4X8nT0Idyw
         NKOg==
X-Forwarded-Encrypted: i=1; AJvYcCUFcx4pWRV3mVYvZU2EjU0tDwpkgImF5AEBoQvXpnL7RZXOPGFxc+0h+kkFNvlFhVHDPwG1OxmXadnAngPYrkyE@lists.infradead.org
X-Gm-Message-State: AOJu0YzZsLPZcwe1XQ23zn+N4p02BQ6aPE9j8axwXeZGWxmQsaxdthcD
	N0DGaTjnGM/SaGKTSH9O5dqH6HzXrXXDLCbH/aPHBygprfcLD9Hy
X-Gm-Gg: ASbGncscxs8S2GNBkLi0M+u0oD6H73bnr7eHzQrFLlxFaMdcRxPz7Oti5IlUVS11qV6
	VA16aI7Z1j70PEbk2rKHXNci1LPKAuncaU0vdRJC2k7Tt977PuSqkf1WRMTlxKsW8c4ElByrWv9
	TbnBvanW9KMYhHnsRoW2Ha2HCwIPT8BbNOXYaX5PvecbJ5kdHqEpfhKv2CTlVIVCdK3qu6UqSE4
	vdQDdjGyEudyIpneNdcekhPwH5Au/0besUMszjfvTXrU7HWEv7x/d630fHoePk2Z0JoWQ==
X-Google-Smtp-Source: AGHT+IFlSEMkAXEPqWgqCAfQugdN95Q538mq9KIKYO4zUWWbGb5CTB8WHYGyQSp6aFpnsVw3r4VLzg==
X-Received: by 2002:a05:6a20:6a11:b0:1e1:ad39:cc5c with SMTP id adf61e73a8af0-1e88cfa6a52mr49396788637.14.1736911646648;
        Tue, 14 Jan 2025 19:27:26 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:27:26 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v3 0/4] net: stmmac: RX performance improvement
Date: Wed, 15 Jan 2025 11:27:01 +0800
Message-Id: <cover.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192727_490778_ACA7AB5D 
X-CRM114-Status: UNSURE (   8.98  )
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

This series improves RX performance a lot, ~40% TCP RX throughput boost
has been observed with DWXGMAC CORE 3.20a running on Cortex-A65 CPUs:
from 2.18 Gbits/sec increased to 3.06 Gbits/sec.

---
Changes in v3:
  1. Convert prefetch() to net_prefetch() to get better performance (Joe Damato)

  v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=924912&state=%2A&archive=both

Changes in v2:
  1. No cache prefetch for frags (Alexander Lobakin)
  2. Fix code style warning reported by netdev CI on Patchwork

  v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=924103&state=%2A&archive=both
---

Furong Xu (4):
  net: stmmac: Switch to zero-copy in non-XDP RX path
  net: stmmac: Set page_pool_params.max_len to a precise size
  net: stmmac: Optimize cache prefetch in RX path
  net: stmmac: Convert prefetch() to net_prefetch() for received frames

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 34 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  1 -
 3 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.34.1


