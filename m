Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F47EEF316
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBScHLNaA0wdLEmdGRRYgxORxoOpvTuWSTnHf23J7qs=; b=EEz0yaizkBizumaDhTVAhdKP29
	mTzKnuKn8BcYR/bI16VOckJ1unhW/RDytiGVkTo1616Jf8u25Aj6Cat24zPGU6GNMh8oPr6X3DkjR
	5kyx6AOLCOLp/vPcyN5KSp+KY5FJKOrpCeQLGPCsJqa23CnRV7lHjcOfBjOmQoTxiere3nUaoqkxn
	kr1v8NVb5FCmLO2TqGRyAPaW9K0lF5VDA2ZnArovM8RD0P1M8lJVxO4DLIo9q09qXJkEznnMB072o
	tlHEdwJ4DJYhO7QT1s0OZH6OUqXH6w/2rmrTHX+F6MdtSqA2Pldeagd73V0rif47PdOqO5KgQ/NvS
	SPqQq38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3ya-00000001BLR-46RR;
	Thu, 05 Mar 2026 08:22:32 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3yY-00000001BIM-1F8q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pBScHLNaA0wdLEmdGRRYgxORxoOpvTuWSTnHf23J7qs=; b=N7ckOA5PvGGhfD5ARt8UGTggqw
	1ZoGqceAJUeBLloaGo42EXrKoOYDL4J4AXdHNmuFEJGO2raqiH/eF9pznZGXjouAJ1qvh2StYr3dt
	CGcS1/lTM+d/h4K2Op4O5Wxp33mjoG6HYNnSBiMCcIGWwW7MKHDHHa0Q7+TUZ5nmLOrZQ+Wddfjyb
	jyOoV/seyinVVp/+uObtJBDgxupfAgssp1zxg4nXDQ/6zucLZbAWDjRY72XBVybViWg4VspfZd8yI
	PRqn6EK96xIDTixuDOaA3FBd2dAvgF0HljyaVVSvYCAqs6MSdYTCnCip5RGweuBmJVGWqBgBpXyWL
	ffFoO4NA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vy3y9-0007io-1E;
	Thu, 05 Mar 2026 09:22:05 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vy3y8-0007JE-28;
	Thu, 05 Mar 2026 09:22:04 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 08:22:03 +0000
Message-Id: <DGUPBMTFOV1E.EWJ7UBJFIDO6@folker-schwesinger.de>
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260305072310.5525-1-rahulnavale04@gmail.com>
In-Reply-To: <20260305072310.5525-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27930/Wed Mar  4 08:24:08 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_002230_627137_9503C721 
X-CRM114-Status: UNSURE (   6.87  )
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

On Thu Mar 5, 2026 at 8:23 AM CET, Rahul Navale wrote:
> I applied the residue_granularity/has_sg gating patch you provided. I kep=
t:
> 7e01511443c3 applied + RFC patch(xilinx_dma_device_caps + printk) +
> dmaengine.c debug patch applied (dma_slave_caps_printk() + dump_stack()) =
+
> all caps assignment in dma_get_slave_caps() enabled again.
>
> The audio issue is not fixed. Playback still fails after the first buffer=
 period.

Could you show the debug output from dma_get_slave_caps()? The stack
traces are not needed.

