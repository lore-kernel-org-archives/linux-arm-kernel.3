Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10741606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=to6lax5T;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nu8Ul8LG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jovyLjkFUlnE6WdunS/8qOSRwgN3EC5HwdUUEms1QH8=; b=to6lax5TLvBw3Z
	MJeskjcikBvpnhciFbaYPlmsTuYY9ddebkYMl+dqF1ccJyxUmIcNuKmoWVrOMb0PgX8QONaFHDYAQ
	soNRX/389OubEHx6y3nqc+c1wtqq5zGS9+KUd8Zvp4QlpDWUYZB+JZLq4xTtSWIktBB54GAw6rGpT
	W441O3wPOKa2jPRcUum659xaTv9FBmshPmJ9BFarxzO/um4iudCgmwQRcOo86SDpACkJHWmnOCixd
	oMizjc4rCMoC/2efmsoudpIXTmPgViwBZRkH18n6wsSPaMCnt2R3GFT2AMXYY/uJQRy1W5Nf2vn/F
	XaKB2WlE2o1aoIsFTkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnBd-0000000FqPA-20un;
	Mon, 02 Nov 2026 08:14:37 +0000
Received: from mail-norwayeastazon11013047.outbound.protection.outlook.com ([40.107.159.47] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnBa-0000000FqOg-1FjH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRaJhWONBKuQVLLxZl4nQuTWTLfxEZ2d9Q6sl888i+Yi0j5gmXqLdhPblEbWfaaK7NegRtgE9hoekC/101WGGf/1c/jUfGfCffq7ZTRctI10bhXgxADc7Zu8OU4blx5WIvxATLC2UWGC2j1l+Q1MtbxbBjgAiHmYCOBhYwxIIkmHZDoeUzcAcfkKaZatRDdbMamipdrSxrM0HQgsZ7AiU6T7fBLXx4mq3wCuSvKpSdHrtH7qe59fnpa2un0x1xq/zmVsRbzJkhjG+G2TLiiw8m7UwcIda2v/tQyZljkXyJ6GzDwmE2l+kUvqiezJapdG/tOuVjG0/VC56AeU0w2k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jovyLjkFUlnE6WdunS/8qOSRwgN3EC5HwdUUEms1QH8=;
 b=gPzznq39qatxYE2CparZAm9neL0u0ZSONqMZv9HSten3eOSM3JHzJemReBbCaxKtRAU9JdeXI7awMI9Jearrv8rIRiHGNFtmNLdqIPboMtC3oX5qfvL0FAoXvrRYszZWf9m3AWJaO1F8oOl7hlXe6Cm27kt7XdVotQOcDhTFAUlrCvDiWWdjRUYuI7U9LrXIgvLjZx1cMGji9QQXUBSmd1AdGPBn80vWVWIOp2ub38Idt/ZsmMZaNarrFkz+nhclRLGmDjUE+l083FJ4MYR5qhTMpC1DCE+qa4YtnTgyHjZD+ZGeTK7oEZ82MbyMxnWW/7IPp2MApnfduJXq6TO2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=163.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jovyLjkFUlnE6WdunS/8qOSRwgN3EC5HwdUUEms1QH8=;
 b=nu8Ul8LG4txktEyFo1yAzfgIds0hEANZPO1E0QqKJCxv7uRxcHrKV2izMwXd9YfbCPPGxPe/XLsPSRo3G1F/eBwXQFS1H6LcWzv4pLPYo8EKowJbjYwDwL0dROuo9sjSyh0DYq8yNd3EiBfTboFY8oKdDeGUXJodBLANjZLEEGKsrMYPDppW9+jSwIjdI0U1QhWX9Lc6+7sYqSmkAG3uhszkYlPsjDUtYMnjs0vLAz4srXrR7JFRQOWyOyWuS662wGD4SPEjh/OFcgwbFTFGaLcrtSNJnxog3QqLj7YNhi+OZ8TtbNFmlX+6Hbtixs3+1gace1fhUuAQDUVZHWhNWA==
Received: from PR1P264CA0190.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34d::19)
 by MRWPR10MB9601.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:501:96::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:14:23 +0000
Received: from ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
 (2603:10a6:102:34d:cafe::b) by PR1P264CA0190.outlook.office365.com
 (2603:10a6:102:34d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon, 2
 Nov 2026 08:14:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6BC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:14:23 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 09:15:07 +0100
Received: from [10.48.86.230] (10.48.86.230) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 2 Nov
 2026 09:14:22 +0100
Message-ID: <872a93b8-4bd9-4718-89e2-019fd3c5b8ac@foss.st.com>
Date: Mon, 2 Nov 2026 09:14:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Subject: Re: [PATCH net v5 2/2] net: stmmac: restore RX descriptor buffer
 addresses on resume
To: Ding Hui <dinghui1111@163.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
CC: <dinghui@lixiang.com>, <xiasanbo@lixiang.com>, <yangchen11@lixiang.com>,
	<liuxuanjun@lixiang.com>, <zhoujing3@lixiang.com>, <fujiahui@lixiang.com>
References: <20261025100636.613670-1-dinghui1111@163.com>
 <20261025100636.613670-3-dinghui1111@163.com>
Content-Language: en-US
In-Reply-To: <20261025100636.613670-3-dinghui1111@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BC:EE_|MRWPR10MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee9df39-5049-48a3-80c9-08df38b94dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|23010399003|10067099003|22082099003|18002099003|13003099007|921020|56012099006|4143699003|5023799004|11063799006|261021121427099003|261026140227099003|261022113327099003|261022105027099003|261026121527099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 7UHp7LZGBq6qUNAeA2Pe2y7Lf9CSFlPMGcq9f0eoJIdAwHb0orrda3lTeYYlEgVyBjG/nbDbWnFOrzJd6XB2JagNC4FfqNitexKu+QFo9Tie++gF3ht44eF1w0dYP9HvJcnk6M2whiA/0VwBJZQN/5jLJQzpZjNszy28rHfMhbkm3warXC1RpGuKK14Ite+BnYEPLtofw/rXGDhsMOdKx9+13pZZB76ubX2El99+sb5G2Fqq251UJMLrm0pcuAikPsmHMuRF0LsMJMQ/DI3FPXQl70RT0ZeOQAE2D89ZhhXtXJjDrSAWcTo6vx7dYHDIO38vvmtBzolS424BfVkZkp4DLtu6e+QGxuFcrZqsWfhzxEVhzsDAl49XZPD0XiaioTocPhE+6UwpBRhXiHm8mOGzV9h8kqTuzltlMYnGB5u4go8tfm7DB1Ev02m6ZXWk35fRq+RcDPEL9ZmCZfv1pLCOflZ4vN1edrJdr+FHmkUWKeiW0SL8KInG4l7UgZPY5ESgLHr5/PVv3eEX00QGcPCb+CecRK3igxBYTxV7N8xa8zDU8r8Y7hEHpiHrji9PaI7xuCqsVNXmkqIvmpl+iQ5YdZOdyiv6dBQNoaeNNx4iDSZYHU2JrRIqziPAEXPsFwA/slKKdcyYH/iJFm1rPFkYVl1HvrNXCWrR6k/quCR6ALPwJCIL+Lnd7qTxwtDQ
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(13003099007)(921020)(56012099006)(4143699003)(5023799004)(11063799006)(261021121427099003)(261026140227099003)(261022113327099003)(261022105027099003)(261026121527099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WXmarFeqkR0p1nxpMf+d7qJ7v/zCX3Ipcy4Pfv2DFFT/m/7wwKtm3GJHsP4OIgtwSX46WHm9Bcc6qGzN7CWhH8LE85ffEGkjwjk+4BsNUmZo0TyvHTfXXNEdHMVljcb3iwrVCG6pkFVY6Y/pofhyNN+9p9qJEBWnL8+4E5lcInyx7COi7v9GkiibwYONMxSL9oj4g0PTWGZd+NGPf/CjjCZjqStG3SKcdxSmOe+qQDN7+AdjDQDKvlepBsIgvDZ17F9kBBYHaA34fopRk7mNm1vRVXROHL0wCF66T4NuEm7pAc/Kq6r68hZ4gyYLb0+7Y9FrjWvg3G/XZabpj8uZc5wlLu+PXIyph8djy8Nd0lry+wepfryaodMxW4KvVcOQbg+ztVkHI7C029lBnVm2rTN4Ad1dkPPcxkr/gc4r7EfGLhhbHrg/hdRGtO5PQGsf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:14:23.5719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee9df39-5049-48a3-80c9-08df38b94dd8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR10MB9601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_001434_679202_F0688392 
X-CRM114-Status: GOOD (  18.40  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

I reproduced this issue on the STM32MP215-DK. I’m using kernel v6.18.
I fixed it similarly to your v5 patch set (cf. 
https://lore.kernel.org/all/20261027150556.51209-2-thomas.bourgoin@foss.st.com/).

I am limited to testing the low-power sequence on the STM32MP215-DK 
because we are currently upstreaming.
I backported your series to the STM32 fork based on v6.18, but I had to 
modify it because of some compilation issues, so I cannot say I tested 
your series as-is.

Overall, I’m okay with your patch, I have a few suggestions:

 > +			stmmac_legacy_serdes_power_down(priv);
 > +			mutex_unlock(&priv->lock);
 > +			rtnl_unlock();
 > +			return ret;
replace these 4 lines with: `goto error_unlock;`

 > @@ -8503,6 +8577,18 @@ int stmmac_resume(struct device *dev)
 >   	stmmac_free_tx_skbufs(priv);
 >   	stmmac_clear_descriptors(priv, &priv->dma_conf);
 >
 > +	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
 > +		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf, queue);
 > +		if (ret) {
 > +			netdev_err(ndev, "Failed to restore RX queue %u: %d\n",
 > +				   queue, ret);
 > +			stmmac_legacy_serdes_power_down(priv);
 > +			mutex_unlock(&priv->lock);
 > +			rtnl_unlock();
 > +			return ret;
 > +		}
 > +	}
 > +
 >   	ret = stmmac_hw_setup(ndev);
 >   	if (ret < 0) {
 >   		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);

You could move the calls to `stmmac_free_tx_skbufs()`, 
`stmmac_clear_descriptors()`, and your loop into a dedicated function, 
perhaps something like `stmmac_resume_descriptors()`.

In my PR, I also factorized the loops so there is one for TX and one for 
RX, instead of one loop for TX and RX in `stmmac_clear_descriptors()`, 
one loop for TX in `stmmac_free_tx_skbufs()`, and one loop for RX to 
rebuild them.
By doing this, I managed to remove the `stmmac_free_tx_skbufs()` 
function. It changes the PM sequence a bit, but I think it is okay. I’ll 
let you decide whether you want to do it or not.

 > +	/* GMAC4/XGMAC secondary address writes overwrite the OWN bit. */
 > +	dma_wmb();
 > +	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 > +		buf = &rx_q->buf_pool[i];
 > +		if (rx_q->xsk_pool && !buf->xdp)
 > +			continue;
 > +
 > +		p = stmmac_get_rx_desc(priv, rx_q, i);
 > +		stmmac_set_rx_owner(priv, p, false);
 > +	}

Since on GMAC4/XGMAC we need to set the owner bit after writing the 
secondary address, why do we need to call `stmmac_clear_descriptors()` 
before reinitializing the RX descriptors?
Since `stmmac_clear_descriptors()` is a loop that calls 
`stmmac_init_rx_desc()`, and I verified that all `.init_rx_desc` ops set 
the OWN bit to 1, could we call `stmmac_clear_descriptors()` after 
rebuilding the RX descriptors instead and remove this loop ?

Best regards,

Thomas

