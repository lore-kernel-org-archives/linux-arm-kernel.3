Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0A606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=scdazl2p;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pZ7tXaXc;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dbA+IJmf;
	dkim=neutral header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qa9LZRM6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yl5Q0Yhg+88xllrX1kMC1NiLLtnuA2INxcGfBrE9LpI=; b=scdazl2p1Flmk7
	Y0sqgYZgYSvzt4BscWQ91oI2rBkvQeYW159YYzyQWtvVX54G28cWWICxf74ZN/3D9r0tBwSOQYgR/
	d9CYq28KOcRJBiDGyfDSl/G4PRcnhxlYYFn7bYBjVhlbYN9OnpLhHbOhfd0JsU16IkUSi7UM/mPZC
	e4KcDBoGfm6KDNnBuht0r02eL0Doh/+KCwerbXOuR4JofqCCUz6EmFgl4ES7wVnPNOwUs4XtU/Rpt
	eIEMH2FBRSDIw/TSdYxO8EE27DQ11czaEpwjDSg9f7H6z89aSQrQafTo5OSbojgt6+Pc9Z3uUuoLh
	we2jxEFa64Ty6Rndx6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmoE-0000000DWmW-1H0I;
	Thu, 22 Oct 2026 07:01:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmoC-0000000DWlu-0lOw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 07:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=yl5Q0Yhg+88xllrX1kMC1NiLLtnuA2INxcGfBrE9LpI=; b=pZ7tXaXcz91Y+D+aN2a6f2xg+2
	uSsOUNxVwmFZXtWW/qVwTM7C+SMPwoI//nIZVjZjZKEb3Zt6quP2dkuAxjfMgm4AXRJVJkclYt613
	jlJ2lvI1TI9YEoUviQ9KqbWR1cMHgxhoR0UysEFu0ybKQI7UTCHBvDfnUIyi53612+sl1NnF9b2+8
	81Z/nutgPED3+Fnq+AkTC7RDNy6E+reldDhCtziDy5keoCjMPwt7yZnAKMfYbiG5z5Xz0Y5M733j8
	vCQ8kduzDPC9E8klZm76j5iHQO1GUUp/5PPVX+K8E34LbgG6ttfUVNJ4voqkkXJaZgLjjFfbsm3q/
	LDbNdyHg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmo5-00000006XFK-2fNp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 07:01:50 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792652501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yl5Q0Yhg+88xllrX1kMC1NiLLtnuA2INxcGfBrE9LpI=;
	b=dbA+IJmf4k/suoYUrdFptKfzRxSbhEQ7jZiVFdAZ6TrwiDGUw/zysfnHprKtLDoICu+cqD
	QDWSNiooTP7H5zHoTzA70qVJqnNxH6qviwSQNJtQY2rLGr7S+do91ST07Jg/pHYar0NyBj
	23BEz/BeroANW/o3lEENWh4+KAEW0v63NPL7PAY0SY0IKdolkDB9A6/nQ42oyJZCs1l814
	7dlh1dFFW5doJyRWY5x6VajgmcH1PMJR969bEsowy2ffj/h6pQtiZWz7LSOlipczZgVgmr
	T0Js6QFB2s1gjTiiqr+qrIi+awuIvziaNfNioRNB88zGE8w6rKxwoVeb+u0LZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792652501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yl5Q0Yhg+88xllrX1kMC1NiLLtnuA2INxcGfBrE9LpI=;
	b=qa9LZRM6NfQ+MtC/BIOnd6FjneUzpjrFH4DtdbEfuigupMVXcShC/XHmcHLoyn+yJZmVc5
	1c9R5IhTdN9JcECw==
Subject: [PATCH net-next v4 0/2] net: stmmac: Fix XSK crashes on stm32mp2
Date: Thu, 22 Oct 2026 09:01:33 +0200
Message-Id: <20261022-stmmac_xsk_crashes-v4-0-15c0c750bb96@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM602WoC/23PwWrDMAwG4FcpPs9DcmyX7rT3GKM4rrx4W5xhu
 SEj5N3nZKWMkYtASPp+NAumHInF02EWmcbIcUi10Q8H4TuX3kjGS+2FAmXhhFpy6XvnzxN/nH1
 23BFLBHc8BovatUbUw69MIU4b+iISFZloKuL1d8LX9p18Wc11t4tchvy95Y+4XdyizF7UiBIko
 TamCT7U+vwZ07XkIcXp8UJbyKjuDALsM6oy2noLvnVWK9xjmj8MNrtMUxkDwdf/T+CC+s8sy/I
 DJI/I+GIBAAA=
X-Change-ID: 20260914-stmmac_xsk_crashes-10a77f614ab5
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 Kurt Kanzenbach <kurt@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=CKFc4YQcze+zKieJAJ02zDARwoapA5QsLlCRMkFAJKs=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBq2bTU0TnmPz9H28QeFJNjxPJy7hEvZVJVduAF8
 frD8w3LjDqJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCatm01AAKCRDBk9HyqkZz
 gqs8D/9rsgS5BD242m5ZHhGynFavy7JQfGNQfvZ3z1nmCZlHSHejvOrfg9VAGHLluF5QRYGdMFi
 PQxC/pJSTTx6/zSz6KGftJn3qcF5/WkgJcrVv/thIiUJ+m2ISMerEo1cMSMlwvty3vVe7oJRGbm
 LHPg1dmpcNveiC84UEzwNR5zXS3Z8O4470wGb8xLmhwjm43peFl+9BP6fB231GUB5ziiryJfP/o
 ShKvGaafWmD720C3xxO5to3TH6Wa6MZI1ZNm24IsoV5pBrozo1vazD7poYtzRBQxPtSDmFvF4O+
 q71OgXu5AfB6MCOpwO12nNMwDlkeMX7CqPx+cGN6cGgPd0HsSXJq1MZXPNyBKTXD4riNBlhBaAE
 pQz1YsKxxpx9ZNjFnWtsqz6s/qGAykH16wmH8QX2znKkifInbcu4PiJvuSArqArvde8PFNjy4g4
 y3pUSIBM/j5ZGleWKW+RGFxIjzSFMYtoW5WzwE9wdI3MYwVPgrjleYaMv9K8oFuOy/EBa2zEgD/
 dILFswFrE0iOL80LKZVf3PlLe/QKcTLo1OOozzdczDXJfQR3elt993JICMT1XNHjj+U99XPswBl
 49uma5Gb1G5BCuKihUCLsFFl1kGkFkZc3W0oDT0VRQxn2iAcNpfOn+qrtytx78vMZe81kQw1+zH
 hEEgvslF6u/md7w==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_080147_710547_992F115B 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

while looking at the TBS thingy [1], I've noticed kernel crashes. That
happens when opening or closing an AF_XDP/ZC socket while parallel Tx
traffic is going on.

So far, I see two issues:

 - Patch #1: stmmac_xdp_release() seems to have the teardown order wrong
 - Patch #2: stmmac_xdp_(en|dis)able_pool() does not stop the Tx queue
   at all

The kernel crashes can be reproduced instantly on the stm32mp2 like this:

 - Run iperf3
 - Run application which opens an AF_XDP/ZC socket

[1] - https://lore.kernel.org/all/20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de/

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
Changes in v4:
- Rebase to net-next (Jakub)
- Add tags (Nicolai)
- Link to v3: https://patch.msgid.link/20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de

Changes in v3:
- Remove txq_trans_cond_update() (Maciej)
- Add queue stop check for XDP TX etc. (Nicolai)
- Add tags (Nicolai and Maxime)
- Link to v2: https://patch.msgid.link/20261005-stmmac_xsk_crashes-v2-0-46c60cba6421@linutronix.de

Changes in v2:
- Remove RFC. No comments.
- Link to v1: https://patch.msgid.link/20260915-stmmac_xsk_crashes-v1-0-e14553fcf553@linutronix.de

---
Kurt Kanzenbach (2):
      net: stmmac: Disable NAPI before stopping Tx queues in stmmac_xdp_release()
      net: stmmac: Stop Tx queue when (en|dis)abling XSK pools

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  | 13 +++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)
---
base-commit: f71ff7d406523748bfb8236830c7eaa6a308aaa1
change-id: 20260914-stmmac_xsk_crashes-10a77f614ab5

Best regards,
--  
Kurt Kanzenbach <kurt@linutronix.de>


