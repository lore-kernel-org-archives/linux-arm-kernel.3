Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248B8CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 02:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb4JBmEsWtoEGyeTiszyx0RPQRE+/A3Z5NBMEzjYIRU=; b=hrUgGjBuR7th4sxZJBEUZS1QCi
	nSJQmQhDU0eCXGevBapmQNwymNthHsfJYNRCZH+MYQcNdJ1EBjsTO9c9ehNiZbQOD1Ns3B7k/e+jd
	3N+c3EMPr0mbrkruQlfLpv/BK4aZUIUN1SA+qUNJiyEwW4h+ixkhgxgBZ86ntrhq8XWJdmk1vDhYN
	DjFx04ABgBQwesaqRbmReyhchvsacqCIkq5ooPj8H4KP5cjK5EcoMnuCFS8HgZNr2DLYLCTjKfHxU
	q9TjJrVEfUn+/Mq5jpc6nhT5Lo27ux/2QCwrjgr3a97bXoJAMkUu7NgTjE/3mFMx6RULWuekyv+SM
	3nqgGlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDCr-0000000D1hU-157l;
	Mon, 27 Oct 2025 02:43:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDCo-0000000D1gu-0xZu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 02:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sb4JBmEsWtoEGyeTiszyx0RPQRE+/A3Z5NBMEzjYIRU=; b=cDOw4UPMJDU9CVyMTPEcvSFHTT
	zFcIz8uAGS3o+hLjVeEmqRMTl7hd0qQFs5MDi30fCsw3MN5swD9hqpjR7MU9QU4xTmWyhTY5DJqng
	e1EwaDoZyGZ4KcVmTo1HOtFZJLDYl/df68cmzaKqVFpk2nk/iTZKFBW7hCnjy5QoO0Us=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDDCl-00C9Qj-OI; Mon, 27 Oct 2025 03:43:31 +0100
Date: Mon, 27 Oct 2025 03:43:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY
 address
Message-ID: <3ca009bc-1683-4fff-a3e9-11997173a866@lunn.ch>
References: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_194334_263403_F3595DD3 
X-CRM114-Status: UNSURE (   8.74  )
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

On Sun, Oct 26, 2025 at 02:17:29PM +0200, Laurent Pinchart wrote:
> The RTL8211E ethernet PHY on the Debix Model A board it located at
> address 1. Replace the broadcast address with the correct unicast
> address.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Make sense.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

