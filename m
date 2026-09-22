Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AE8C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4O1RmEPY9SejqZ5YjxYRppZci7yF3d7r+9+JhGwoYKI=; b=OC9NMqFxY3UUxKp0jBo2pJS4p5
	h9EJrrzBMemB5L6s8QLOX1s7dhPm0UoO+hA8KF/A4z3RkUV502iFTRqDvGlYB6vnu+imlhCaCxenc
	Q9WTs9mN3ak0xocW6voieVphF+JdWuxW8vqtxZuv5GetycVHeGU4sRy2mjRufuTZenIBOXvszGe0D
	rYurUHJx/YqlWqMxUpu7ruQreTEaEPQ8JYD/S9mCPu/VvjWZOpJPyiar2Le8Ggr9sBIcf0LpAz2kH
	3H+nym3hTngL7ZU5CR6SMLL/eUd1KJpFXk/biI/CWuJvzhhTXnd2H7EMPIK+R+f6/GymRgwUqCknt
	wIVoE/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Nh-00000005pGm-0l1V;
	Tue, 22 Sep 2026 15:26:05 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Nd-00000005pEt-47kR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:26:03 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id E852F22B2D;
	Tue, 22 Sep 2026 17:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790090759;
	bh=4O1RmEPY9SejqZ5YjxYRppZci7yF3d7r+9+JhGwoYKI=; h=From:To:Subject;
	b=d2WXEQdmC6JvBmrJC8mErz4ZsJ1FNL75OVK7bE52X+ztW58DG0uqAq218lCk/gsDV
	 DP9tEJONo02PJyonJhNlnz11wD4t5LWHsewtqMqvmYsmg75Sywex14c64gOrWbtFUz
	 D1/jAtDy3AMI/DAZlv9Pi+RYsxJvowvs4rs03C6nQef4ZCT08l8tt3E3txtmJ3HiFG
	 BGpJOU4OPeTiuthwOX7cMn/BCPjTW9Bz9t+9KI+/pYMJRQQLWuMOIGz1ljRcgrXRE/
	 5r9RkrTPIO+gsHZ/lg+PW+z+HCEA31VS5eE55g5L5ogqBhUhJYOxeBkdDFMEAUYD2k
	 vP0BwvyLF7NTA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: k3-am62-verdin-[ivy|zinnia]: fix main_gpio0/main_gpio1 line names size
Date: Tue, 22 Sep 2026 17:25:47 +0200
Message-ID: <20260922152551.270845-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_082602_180840_FA7A414C 
X-CRM114-Status: UNSURE (   4.76  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

zinnia and ivy redefines gpio-line-names for main_gpio0/main_gpio1, sized
87/88 entries instead of the SoC's actual 92/52 ti,ngpio. Resize both
arrays to match, keeping every existing label at its original index.

missed from previous https://lore.kernel.org/all/20260914190943.50843-1-francesco@dolcini.it/

Francesco Dolcini (2):
  arm64: dts: ti: k3-am62-verdin-ivy: fix main_gpio0/main_gpio1 line
    names size
  arm64: dts: ti: k3-am62-verdin-zinnia: fix main_gpio0/main_gpio1 line
    names size

 .../arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi | 41 +++----------------
 .../boot/dts/ti/k3-am62-verdin-zinnia.dtsi    | 41 +++----------------
 2 files changed, 10 insertions(+), 72 deletions(-)

-- 
2.47.3


