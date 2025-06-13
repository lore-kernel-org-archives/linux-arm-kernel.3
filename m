Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBB5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SQ7GUXRJXqTDf9P/Qm4haDbuby4wi4QGvJKfFQG9Ik8=; b=XA+QYK4jc8zjU4
	rwFRkrxY8pRSiLMpMFv2oxdRN5NnvY84n/YhbthBMfHeJqMdzTn0hielxCu+lwyWpRDxMSk6Y4ePJ
	njYr5SPwRL6UbdyDFpy023Q47bkt57NauUNNPJ0l5mxKmiRwdbQRQeJRwBUuc4EAPth7ptN4tQD2G
	jVOjZRxjdE0DMPldCEr8Q1Xz+x2GeD980PS0z4XZQNG744YXX9zWn6ydGRLUeDxRxAPNgiqgeFiqb
	G9xGUXV4iW21XBYCbmhvYvT61JWVE4EIO6MO1YAgo9PiMtvb9SJTKT+BJmIP6fBJPxWhSCyBphpp/
	i00l6cm2rCNhsU+AHNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xr-0000000HGiX-0ADY;
	Fri, 13 Jun 2025 18:17:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6oi-0000000Gz76-2yOt;
	Fri, 13 Jun 2025 15:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14326629E5;
	Fri, 13 Jun 2025 15:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8987AC4CEE3;
	Fri, 13 Jun 2025 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830383;
	bh=SQ7GUXRJXqTDf9P/Qm4haDbuby4wi4QGvJKfFQG9Ik8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=n0zzX3fPoRLTKtU+Wvdnf5IHXCu+A8x1xZNu5w/6wgOQjGKbQFeV/0lZl7mE6OVIl
	 LL5aVqs62RYkY/233ZAY7Wker72IKkGxfsiesN+3BPeO4JGA4e1fzISkzQqpi4cp6V
	 m400saPoJCII944lgT4+iD0UphSshRlzWNtAaIkt7walOyIdybnhSOKR94PEl6pJeJ
	 TT87n7a6/GvYSEqItedZbj00JjeSYf/eYjB6Fd+43MQyY/xIR3zdgK1MxjBTdr5JPc
	 cPeXPYeWLBpoYGUAeXaYGSh1ZwK4TOVV2g7jHOzZhqLb3fbymJctUrPkqdw8pigTxU
	 HHOSLHP8++VnQ==
Date: Fri, 13 Jun 2025 10:59:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com,
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 4/7] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST ctrl
 pin
Message-ID: <20250613155942.GA962477@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033001.3153637-5-jacky_chou@aspeedtech.com>
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

On Fri, Jun 13, 2025 at 11:29:58AM +0800, Jacky Chou wrote:
> Add pinctrl support for PCIe RC PERST pin.

s/PERST/PERST#/ (subject and commit log) to match spec usage.

