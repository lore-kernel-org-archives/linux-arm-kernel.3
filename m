Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF862C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXx2rv9zT35RkoqKlgbg0mm3kdEQQG79f5HFBb1nhgc=; b=hwDjbk9BeFtByf94LhLUG4B9K4
	lAPuK5lgn07lAB3WY8dVUOOxeN9at9UArTAVfWhxh/PD7n5ipdmT+8bSenSAacZMdOl35571HidqI
	Ze4AB8iEx3STyHCyYtowMliMlxXFbV/4JxFcjk/LR/5gppin0a3qqulzcPIg+sfodWZ/NzOlo5gR4
	Pjrq6Y3dPy51Xvn+XxEIhPBLdJA/F+BPWqANIseZcjtZC9V1KAxZDBUL9FzsB//ckFojlYbFqNUyh
	ZEcZRV+nBlyplOd/xEQp1Se6q1jqLBp48PTKdsofvjTQkqQscZxliPH8U9VltkUafKuqG+dw+8oru
	wYqhRanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhe-00000000Gwv-2ppg;
	Mon, 07 Apr 2025 12:35:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lCJ-0000000090c-3frt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:03:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso28135175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744027406; x=1744632206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXx2rv9zT35RkoqKlgbg0mm3kdEQQG79f5HFBb1nhgc=;
        b=Uu8zHbdiWoUyqkHSsKczmbT9FaV6r/uJ9WzPo/FChl3s6RuTSooVZizFqMnr3JwCAc
         cWLUB8UdDF1ynpn7OQ8sZsoU9jVGYMJQZ/pl9mMQY9yHg0bZlqv3QFOrHeuwRvkDXYFT
         302L2M0/sdk/FPbcikc0Q3K/SYGnIUtdMEvQgc8r8S/0oQtP+TbL9Op1wD84WkGw4IAZ
         bU0vCKHVBVcp3SHdPlu+fWLgSSfaEv/HAPrp8Ip1j8t9mufW/a2YxZ1YhCCuLXLZDZi1
         MtccN+MUjOsU9b5KkwEEPfgrOUSjF2QQr6FSndP59atP8phGLeCb0Qj7oKQiwYU720bf
         s7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027406; x=1744632206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXx2rv9zT35RkoqKlgbg0mm3kdEQQG79f5HFBb1nhgc=;
        b=sywq72vDEepRIc96vcqJvmihY9OG/uV26i/FLj1ge3JbTFPpS/sqgb5FIxM6qe2Utb
         ySy9oFytTD2OnqoRQAADrLTOeDlmRqT3/IRopyhHrIjsfZZecTGIo0wqsTZvcb5NbUGm
         hkxk20KEDtsau0z3XSQ5J4ThL3c17yt6dUSPTkLBIjc7rwkjWIA5vn4gLrIkN8iGw/aV
         sfiZOHlEmrzIWgK6rGYZbgxn/u7HXaI409lmv5667WHj+4yHTuA9XzDNby0ZRHShudi1
         34/sPwsJwWds+H98IPo1jseEbYvzzweK86JmPfWTY73GOJBCiz4SIpuIrFoPzkL+8VAB
         tOjw==
X-Forwarded-Encrypted: i=1; AJvYcCWZJsK6cg8tVy5q94sn+ufNlO7isq0nZq45iIW1WUxwHQFAMjT1oWTB9DywvRm6bRHtan0anhBbqM2KQW+BQzM3@lists.infradead.org
X-Gm-Message-State: AOJu0YxpG89tiR2ULcKsLVNJQwWVgjV58W0GSgndSreAqeqs9v/a/7cT
	g9eSNgobBRdSvffNFBj+YhU/BJNnhXop2ES17menfMWOk1xVUAPV
X-Gm-Gg: ASbGncvLJ0aw+JJw3Jez3pQ+xoPlFY7nFTUJVjphnGhEbnxDqVYpuON+CLlvwyMMz6E
	4ts3eg7CYcNDAOVB8F7ge08CfR1rFH7wYLUskA0FXquj1HnXUvS7DO5GFv5RZRTqr0OO74yNu3c
	fXhElDLc7mSv538zdiACQCttBbSSiw85H24jtayXR3ZuqiyK2thwI4eKkb7NmCpwDwL+O/UKA3H
	pCsrZBv6sYEfjOcISzbwPuGjBpjvkQXrl53VvkuigoWrfFnQ4034lxeifVKOJ44E3wqF1DNC8E0
	7Y1ei/Y3p/A2rFaOajL4iSIIb8wWOiLZjPcI24O6SJQoOd1eXCaoZDXhZmU0n7Fe+gLM9jeUJzC
	SgUBA
X-Google-Smtp-Source: AGHT+IE37bdrVUeb/XqXM/+1lhsEdri9+eE8Oa4q2uNN8bo1IG+kwjQxWy1YJ26YTiId2TriZ2pQ3A==
X-Received: by 2002:a05:6000:248a:b0:397:3900:ef80 with SMTP id ffacd0b85a97d-39cb3597eb7mr10077348f8f.22.1744027405651;
        Mon, 07 Apr 2025 05:03:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:03:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 0/3] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Mon,  7 Apr 2025 13:03:14 +0100
Message-ID: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_050327_921580_43E88E1F 
X-CRM114-Status: GOOD (  14.01  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
the Synopsys DesignWare MAC (version 5.20). The changes include updating
the device tree bindings, documenting the GBETH bindings, and adding the
DWMAC glue layer for the Renesas GBETH.

v4->v5
- Rebased the changes on net-next

v3->v4
- Fixed maxItems for interrupt-names property
- Maintained reverse christmas tree order in renesas_gbeth_clks_config
- Returned err in case of success in renesas_gbeth_probe()

v2->v3
- Fixed review comments from Rob and Russell

v1->v2
- Updated commit description for patch 2/3
- Updated tx/rx queue completion interrupt names
- Added clks_config callback

v1:
https://lore.kernel.org/all/20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
  net: stmmac: Add DWMAC glue layer for Renesas GBETH

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  25 ++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 165 ++++++++++++++
 5 files changed, 394 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0


