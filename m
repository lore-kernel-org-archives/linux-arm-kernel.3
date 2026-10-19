Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D71606C16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VAtjyyCg;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=bg//iQlO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ES/36iUYSJsd3edItbfZ0i8T8t6lEUq077AfpRWn0OA=; b=VAtjyyCgCsssLZ8cH9nTEvCgG1
	hDJCLS+gL9AHFRChPvrUHPhqH3OlcwO84FfrDdVYpVeRNB+dhvsE1geTceTMxn7sa8TV8mKXAZI9G
	SWt1tiEwfe7qF9yoZQ4tov7LEf5IKQDuihR88hX8vTmOLnMKKtLg9Aw4aIF8xasLzU0cFc/Bokvvf
	p8QAWl3vqXOXXaUNQyQFSCZnLat65mSZJ57uML/CAMudj+vDJqpqzCiSHheT57QeA9JXSgmz/O3hT
	P+RrRFocxPC8JAjAQJKifT/ARGlgyZ/pFk9NxCjo35N/vipedHeiDrOHdpfimoDNQLwXolyVzF/H/
	8NRS1mCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpkg-00000007uLA-1EjI;
	Mon, 19 Oct 2026 15:58:18 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpkX-00000007uHn-3Scf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFb1zs0CD8ql/OPTeptsvB8JKBk059ZFXrdi+5dWExd4jy6t+XNQqsU56CjqCwP7Yn2uG/Vluvg+QvvGOU5oBG7i5yOPzgMAFyV0jMYMCTV5oZqYyLNI5Y8H7Y5eAP1IRAungp3t4m1ApoKYlP7DB/GxN3XfHddWGB+sBtCBRDWjl225ODpgwDT6g1Fkkh+XTc59uN7wYy/0wNk8xoMgozlvb85z8sUzOp75I8fMmIOOkB07JNsNa/WX4CdqG2J1s2rMbPzlOlVnbAkfgijuXPu3mVcjxWCZ40WC9ppwBRleo515rQD5w7ou1Bnr2qV/5fblzyPduBgOsUlIUgeVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES/36iUYSJsd3edItbfZ0i8T8t6lEUq077AfpRWn0OA=;
 b=Vu/wWn4hufB0vpyWIVtnIyN9q290PpWd6XksheyXvSwOqZsIXyCtzQpSpbP7rj0BHw3XaU3aHakC9hxW5hOFXWTg+pS/F0oSWYFUbdrtdvOu0D2ALIrIp6wiREUBoOLbDJUYOGaY7l2bk9FVV6Y7bI5rkwIP54rJUqumJPVJXAH811qYQ4nIZOq1kNCXkrXTOauumxnFxXSOYiiewgXClK7DdQ/DLlZ2u4h8SkA++5eyp7aRFAyKo/X3N2HFp4CvSuwlTjFZHcYA6HmEjD1vkcuQr5074M4yXFdo8Z1FpFFbof2ZBf8gofWnAD0SWdLNbe5bqbbGHJ4qu+GzcqxfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES/36iUYSJsd3edItbfZ0i8T8t6lEUq077AfpRWn0OA=;
 b=bg//iQlO/ftISWXmwqRb7tv9ORY6Jh5mRpEllAnDqlPQmql1QvWOan0Ylg6RXMdnlSGj/+KZ3iJSxnhGeWfQj41T+P8fUMM48utLSBVlXFHQsJNA4zHl0gYjzj1AvUQexovPbqBVLq6lw/hzbiCFgcWB7hlNozqtHo5HfUcHLIE=
Received: from OSTPR01CA0075.jpnprd01.prod.outlook.com (2603:1096:604:21a::7)
 by TY4PR01MB13059.jpnprd01.prod.outlook.com (2603:1096:405:1de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:57:37 +0000
Received: from OS3PEPF0000003C.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:21a:cafe::5f) by OSTPR01CA0075.outlook.office365.com
 (2603:1096:604:21a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 15:57:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003C.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 15:57:37 +0000
Received: from vm01.adwin.renesas.com (unknown [10.226.93.174])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 326403000241;
	Tue, 20 Oct 2026 00:57:31 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	xiaoliang.yang_1@nxp.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 0/1] net: stmmac: Track the TX DMA threshold per queue
Date: Mon, 19 Oct 2026 15:57:27 +0000
Message-ID: <20261019155728.85318-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003C:EE_|TY4PR01MB13059:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 794869d6-c8e5-4e36-4f59-08df2df9b25b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|7416014|18002099003|13003099007|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: uehmbA2tn0bHHX/hRyP3Zf2LrWLGkhEiR6u5xtmqghaE32WOuck6SAs589Z7BQ7n67RRSvXj/ZLyy47nGNPVjovHU1hjC7WB5XMV4SMqLYj5jz7n2iWyEJFtHo7cma8Ud5/0ruqmYck5SWN1wQOxAdlmnJpFDhDxoLcrAbpq+lOPEtIOtrSTkHvRQt3iAcBS9K6Rs1gcXeWckzugyqrjAaf94OeET4fLkeeJZTzTZBOd+7aYiHH38I08zc0yRtucNXdt5Dt1nEBdi6CMUnhXhyVwilC70/79ig+eFhpvysHf8HgmMuCsRdQStNO03TvlWT9IUkbjFEpGTzu6M/vk/NlU8DzgCxDTIkcUXMFNy1JmiUt8ykT9UimamVwBXarHEn6TjYGuGiRT1yCH7LgKpHaVlrHTCZ9UswNhUAEKJ08xnlboYkuqjEJxk0QFasfa8uLFW4Dw7iv6YJAgodf0ed2fF5XlQgBtaTxXna+j5G8Psx1esOTJS3WCbMRWW6AYy5Hk35K+9ASqR3u6mab8zdedWr7ZOAKzljU8hV8wOkrQpr9h35cHwquTtKxYPTHFvxnQbow8aG0KrInKlrMzWoZiDQ8bIoixjmYxyIWKfOIRg8eNjj6C/NR3Up3DmeihCAswzKeN0EvMnWGfzBtxNscwbtwWuSayxZ6qCmGITNw=
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(7416014)(18002099003)(13003099007)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2RVutyA8nMlUBAQZc7nPg2vBct8XO9BpabzE+k/IZQTpB/2nKWBKje0X4hPdUERLIfy56IgXkIURX+0MNQLsCZImIvqEaWf0EVvyyofzUbJBpZvFdiqHe0JyzBgXCN3EEFnldy1RQsRCAykgMD5QqFpR5XpkbWgcFKqW8Vg/gpOik1y0hAajFcXhYNusL7NC2xxlSIveMkwAJ8XP9OFSt0fW2BuVxnI+c9nT6mQ1+o6QJKD1+nAD7fIHSKsj6PXxSrY8MJYq37iMrmBInj4VdL9osjfbrivrqSvV6PS9yrF2VcSZcjH+0IfNX4w8g0WeXipL67RJ9Sut4NnGvMuOTS9TCg3fkv4AhfYb9G7sztq8C44637GFVTuIqG4ZYsIVGULIV0e748ET7cfjyf/uggDFXhxzi9ZFRt/qwnWkrLG/VLdF4CVK6hTDokwgKsE1
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:57:37.1648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794869d6-c8e5-4e36-4f59-08df2df9b25b
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003C.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_085809_869042_A1EB0443 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Renesas RZ/V2H platform, which has two dwmac4 controllers, we
observed sporadic iperf3 TCP TX failures on one of the controllers, with
throughput dropping from >900Mbit/s to ~1Mbit/s due to TX underflows and
the resulting retransmissions.

Commit 3a6c12a0c6c3 ("net: stmmac: bump tc when get underflow error from
DMA descriptor") made dwmac4 raise the DMA threshold of the queues that
report TX underflows, by increasing a global module parameter 'tc'.
However, this logic does not work correctly across multiple queues and
controllers, and can leave the TX DMA threshold stuck at 64 bytes.

This series fixes that logic to track the TX DMA threshold per queue for
each controller.

v2:
- Dropped patch 2/2, as it is not suitable for net. It will be sent for
  net-next at a later time.
- Added "Reviewed-by" tag from Maxime.

v1: https://lore.kernel.org/all/20261013114503.57487-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (1):
  net: stmmac: Track the TX DMA threshold per queue

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 +++++++++++--------
 2 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.34.1


