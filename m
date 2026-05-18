Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA296CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXZoMwG6Tq2zUsTH+zIYCTcolUhrlhhkb8dDKfwVMps=; b=x1L1rvpRpppJi8Os/JLzID3acI
	t1s3Vd7Rqra4/Alp6YgABkLYLskLHzDWndcP9upnfO+xxZp6ZT8nUOA5xbo6C8H6WWGmF0k+p4TQ3
	Pf5hx16dG4aFV8/kKx9slW7eQ9zA4wxpNDnXWhX4on+YHiwuJ1ZLa6bk283j8dyKf4YeAHrUgsI9B
	o5IAIbZwcmJbLUsXTq0FABU3KW2xE763EKCC0jjU2NF9mW+IPiR550sR5zp+q3zN+FQNFAVq2YUqo
	HZaIPK1ziJ9+BWYz5VhrEffAylmHjJC/ef212e2MRCsnpOHsYeBwu1zZcmos/0Libgt97AUuDHvBM
	i0sUTcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxuY-0000000FnUW-2Snt;
	Mon, 18 May 2026 13:21:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxuV-0000000FnTN-0pbR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779110489;
	bh=JXZoMwG6Tq2zUsTH+zIYCTcolUhrlhhkb8dDKfwVMps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hDEFirza8m1RgJJ4fITtD4O7v1mJn+kDX0+ykhsSsA8bV4Q2G+obJXnrUaVCKq8AE
	 nIVrZnfWz2AZmAfI4Z96nKjDqyQmwbfoms/EgqD56fjJSyFdbZL4vUIEgO3HVqORhS
	 S5GwBwtIuYOliiIxO4z8nqzImblYdw51yKu8HjMtPSX3+JCoSSD4MQ9wofcqDVnnU7
	 yyApWLNJTlifGccheD6149zegNNnlEe2kIQyDU0u3h3Y3/9fchxnT6zCKgsJj9FYEY
	 9TtpgH2P4ETam1xkCp/96FtEDQEpLI0/WftJEZ1KaanxqnKc35u/Uo31/HFT8n8GKx
	 txrAj+nJwh9Sw==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A52726025D;
	Mon, 18 May 2026 21:21:28 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260326-g6-dtsi-v1-1-348e7a0661c2@aspeedtech.com>
References: <20260326-g6-dtsi-v1-1-348e7a0661c2@aspeedtech.com>
Subject: Re: [PATCH] ARM: dts: aspeed: g6: Add PWM/Tach controller node
Message-Id: <177911048854.1942419.17635653553206157832.b4-ty@b4>
Date: Mon, 18 May 2026 22:51:28 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_062131_432019_54A34A81 
X-CRM114-Status: UNSURE (   7.72  )
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

On Thu, 26 Mar 2026 18:29:22 +0800, Billy Tsai wrote:
> Introduce a device tree node for the AST2600 PWM/Tach controller.
> Describe register range, clock, reset, and cell configuration.
> Set status to "disabled" by default.
> 
> Prepares for enabling PWM and tachometer support on platforms
> utilizing this SoC.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


