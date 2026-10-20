Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A56C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Om4tFXz8;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Qb8cbyga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UOKaEW6OC6SsaUM0x34TonYk7TnhblFFxasv/bE3Als=; b=Om4tFXz8aej2CeXTotxtCrDxJI
	4yO4fBtjcewp5JYRMbR5ejArxBtTlrqBmU+6Yoa5mrCrZ6gfJEW2cshQUq3kMkDqX7/xaAsdosseL
	mQ3Bt1nbg9lZIpL8Z6wCW+f5HdnzKwx6WtvrzXwRoHpoxRZ1UforL3/xMCflErhKQEXNaSItm4p4v
	HjRiafiTx6jiewpNhqzT7rTken3SjeLM+Ri5iWy/cU5wpTvULTO4HdIjWLvNhUGqDIL7MhH1Lj3nn
	a3p6IybZg5j+QEioWHj0IbPm85S4gZDimNi8hYwOOm8c1lrV7PrcigJF/5QoHNWVpH89WDDGegOhD
	zv06DxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Ae-00000009Hth-3Ibd;
	Tue, 20 Oct 2026 09:30:12 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Ab-00000009HtD-3b6l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:30:11 +0000
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: afa@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 937912018A0;
	Tue, 20 Oct 2026 11:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792488607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UOKaEW6OC6SsaUM0x34TonYk7TnhblFFxasv/bE3Als=;
	b=Qb8cbygaItZ+bhQeS49fdZpiJuiVDbXKJMNqvClkoT3zjkYLwXSH983KuxwFr9LHOzYkeT
	lm++NZMmh6nXO7YTex7I/77YyFiC7A0UC/u3BAyD0AkrscRH2lxrgRXhWn/k9kH40hvtL3
	PQJAx0R7B0qIzsBrXMsvBgMbvQFetKydzlLCx7kTX6DiAHffqGLoHGHOf++AaUaAB88VQ5
	HqOVxzgPMN2ufISV+jjWbaJ1fenqI2qcdSbxmxtNfgXmt40tsyM6uuuheH0K2kaGoB8n19
	duRA6a9BtAuUuefrLWEbeFEVZhJ7e6hrsKezLHrEN91ihL7lyenM8Sc2ivYcgQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792488607; a=rsa-sha256;
	cv=none;
	b=AqY5IcnnAP7TcMb1aCQJJQd+185FKoxVE40dNYcaxAfESuqxCyTmZRdTPBrJZ30SlxZyI9
	WwFnQckJmGaZZxYQ4bsrHE0ZPqORO3kVkeV9fZ3wA4tuoIyEFyrkLROse71KQHqrNR/TVC
	L50SQg/qZsrDhwbKCEmVaOEWjONuwisidwBaUQ6h+Bd+k/Gr/FcilaaxuNrh4oMulFoQwa
	zT5Y3x1HeYxXk6wJKo6kYdDEsjAQB6RXaP2Whvx5zQSEBlxqxqFLqrKp/oYCYcvUkFseyU
	y3jA/GLQUM7EFJn7+yP/QGVXTd2Zjv1JxkEgocuPA0dPTKUECz2DvdwQvO4Fhw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=afa@pengutronix.de smtp.mailfrom=a.fatoum@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792488607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UOKaEW6OC6SsaUM0x34TonYk7TnhblFFxasv/bE3Als=;
	b=IfTe0VnZ9bKnUPjdkf1a8PwNN4+FompKoN+kC/HkclR+X5ROBQQPDBSFggU1UbGFuCmXtM
	GX1+afoQZkJN1J6mWQ8Lbioa+gdz+QuCRnbmfSQWuTEZq+HzkIwY6ak9jqedt3tqZWFezZ
	IkPl9HLjz/7jgTXmVujXvDxwnsaLLah75v/p8/x2BOHixmvygx20lfiFBWTZpFEw41q1FS
	cv8VUY1c3jRo5Hm5rNthDnwofkUcAbKochfcphH3s1Y/X/e/llC54KuISnKa2TAtyE8ADi
	AzwJT1GFkpziVN6JurV+UmFt+hAUQwPHBomSrc8+U+L00ffdlYtGwzApZ4DJyw==
Message-ID: <171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de>
Date: Tue, 20 Oct 2026 11:30:07 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
To: Sherry Sun <sherry.sun@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, regressions@lists.linux.dev
Subject: [REGRESSION] Potential problems for DT-described PCIe nodes on i.MX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023010_073764_B91A2A62 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Linux commits:

9dc39532172c ("ARM: dts: imx6qdl: Add Root Port node and PERST property")
37f53f50b36f ("arm64: dts: imx8mm: Add Root Port node and PERST property")
396fbe9a028d ("arm64: dts: imx8mp: Add Root Port node and PERST property")

Both in v7.2-rc1 introduce potential regressions for i.MX boards
that already described a root port under a different node name, e.g.:

host@0:   ZII RDU2
root@0,0: GE Boards
pcie@0,0: Gateworks boards
root@0,0: SolidRun Hummingboard

All these nodes may become stale now as the SoC DTSI have
introduced their own pcie@0.

At least on the ZII board, barebox fixes up a MAC address into
the DT node, which is no longer used if the kernel decides to
use the newly added duplicate pcie@0 node instead.

Fix is probably merging the existing properties and child
nodes to be under the new &pcie_port0/&pcie0_port0 and drop
the board-level Root Port node.

#regzbot introduced: 9dc39532172c

Thanks,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


