Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F41C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 20:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+bWvLNfqVXKoM92yRwQ99BQCTFezGqLq0CQ17PjyRk=; b=WP4+HBqxjlfBFS4oWT5IL/HZ9B
	MsJE4C7+sd48EW922prMNFx0W06FJThi1f1oMNX/lqckjAXOFrLkzfZHyV1OPUxv2L+n/caZSZJCf
	HSJx9nyIBI7nPZcl3NEj/Xkd9LBSV/jLuCJ3arXyTEj54wbCKOamtLzRxw5c2NQjynP6NHXQTPgQK
	wlMICHaMKkyAaCYfZnO4pRHRxTonMhgZY+LWnFtKhKlPG2qrcjw4ikeu1wNTk9VrDpv7SsDWIugE2
	9Txpgdf4hOywJ7IwGQCji+O+ZbBQ8xnRvqptEd1QuFngeN3SH7tXuvUOOlJgvII/RF3pnT98nrABs
	+KbqXYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u43fb-000000005Pr-2Ksx;
	Sun, 13 Apr 2025 20:11:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u43dl-000000005E0-17dF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 20:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4+bWvLNfqVXKoM92yRwQ99BQCTFezGqLq0CQ17PjyRk=; b=ZcGKUAeh7QEUUa1hdlTLhnNbV/
	iwc2eD/oDOI5JIH62/PG9XxJIzQV3QExdX6K+g5ZBNZrdW8JqakiMP/tZ3fWTI8ZRp5gSii7IKKIq
	gglFdW0PxMfuww6tSpdbHmNFgmoYdq6CJGpkQROcxxo7bOSd0T+BYj47VyfysMOPmh/s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u43dh-0095hS-QW; Sun, 13 Apr 2025 22:09:13 +0200
Date: Sun, 13 Apr 2025 22:09:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: remove max-speed = 1G for RGMII for
 ethernet
Message-ID: <a21ccb50-1f32-47b4-b37d-d8250a505afb@lunn.ch>
References: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_130917_306968_0AECB00F 
X-CRM114-Status: UNSURE (   8.56  )
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

On Sat, Apr 12, 2025 at 03:22:40PM +0100, Russell King (Oracle) wrote:
> The RGMII interface is designed for speeds up to 1G. Phylink already
> imposes the design limits for MII interfaces, and additional
> specification is unnecessary. Therefore, we can remove this property
> without any effect.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

