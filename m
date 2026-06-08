Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3FCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sn2RaqFmcO0Fp/dqSoOY9ViKZkuBRw2xZmPal61BeyE=; b=Uq75Fw4gAdgI3JyQjYP5bUCy/Y
	8LX1abCljP1Eej6nVCmHVWEeY7Zw/VA5AVbnJFyJnzoz3F4Lppef2zLCvE7+C90zqqvEotV84toGs
	O3VKkx1wfmKIUQUiIQTsIhqtkoQwTE88Eta72QLweJH8Dg78XWu59X/wuAIe21siHs6bK3GOs5JcT
	5D2DPfQ0/jYcKQ3qUjMvB1vM9Si+dXOS4pQdAsl16Ofy8mdCgIGlLx9cLjY8AssthRqn/ffr6BgQm
	yKWvoUFlmGnkmRW0G27TfzpfuNsWD/DjZM7lXPNCX/RTfZNPV+MCNtaUCRc9ulsTyjyDt8eM6rBE+
	j4/W7HRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeM3-00000004FFU-0R00;
	Mon, 08 Jun 2026 18:05:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeM0-00000004FEh-3UFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 18:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Sn2RaqFmcO0Fp/dqSoOY9ViKZkuBRw2xZmPal61BeyE=; b=SA
	vCiCFZUrJ17FzKwxMlb28P7G5IGDkYRRug9aPlaq3G9S0tgrGiJy+GeUYBK1ANKZSaaL9QXPIOt3P
	ShNPGt/bzWyI8W5vFzcqp5n7q0IzyceAa5294Eo13qn2KcaD9JiZeJsCx+KsZbD+KkclbIyAOSljD
	A+gF0/JjC2GiX2k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wWeLd-006fu9-6O; Mon, 08 Jun 2026 20:05:17 +0200
Date: Mon, 8 Jun 2026 20:05:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com, ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] soc: aspeed: Add BMC and host driver for PCIe BMC
 device
Message-ID: <63654bb5-c246-41c4-bb7e-5bfa23e59f2e@lunn.ch>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
 <cover.1780929570.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1780929570.git.gregoire.layet@9elements.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_110540_867269_E34B1915 
X-CRM114-Status: GOOD (  11.04  )
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

On Mon, Jun 08, 2026 at 02:51:21PM +0000, Grégoire Layet wrote:
> This is a v2 for upstreaming the VUART over PCIe BMC device driver from the ASPEED kernel SDK (branch master-v6.18) [1].
> There are two drivers: a BMC-side driver and a host-side driver.
> Together they enable host<->BMC VUART communication via PCIe. 

I would like to see somewhere a comment about security. From the
replies i got the host can access anything on the LPC bus of the
aspeed. What are the implications of that? What are typically on such
a bus? TPMs are often there, but does a BMC have a TPM?

	Andrew

