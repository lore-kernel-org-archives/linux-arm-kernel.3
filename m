Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C2D25031
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss3B6MRAGxluOfMk+Ev7z+q95mmBhKsL2hIyydgCPbg=; b=CJJqsf/LF5HTRySWRukxa2/fxV
	7HSbdZct5mm+RrqDRXdfRnpeQWodJrpKEGGknR6GWM+rI+Vlf+1qZpyxLMsH0KN7zCuHp6IwduDfg
	2K3ImciWkTyJZKVJxp6YGlsA18PAJQqiB6JJVx0oi9a+PQbxmLL5vCg31VfAmiUeeMsr7lOyZ4Pxc
	dgBWxKT6iAJo4WgBb6kk/lzfBBoQCnuKP1+7iKMQDqx5g45QtBaludXdznVO6qraJSYiM4Ee3b7vP
	5x6TDGAI5imOOCh78dHOeMnFpVt5bsgzAiyeaqAheVyJIMxlqPOL5rf9jNot4E61ZnzcYtfzhwCfT
	qWSI5CyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf2hN-00000004VPy-2Ts8;
	Sun, 11 Jan 2026 21:10:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf2hL-00000004VPa-0uFg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 21:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ss3B6MRAGxluOfMk+Ev7z+q95mmBhKsL2hIyydgCPbg=; b=1sv7RSXEIg2Tt+1Q9QvtJP4p0r
	grxYVR9RFSsjp9kCPIhciD4JuwcJsUq5XsJRGGtlFnGfCIPCdQbQIW3kDtVaFmqGkizT1eIZDlkwC
	fvRRIXDdn07ufceWRSAf73V2QXXYyVolrTCiXGfb1Mel2BDdNWFHl4V2znx1IaWFXUas=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vf2h0-002MOs-Hk; Sun, 11 Jan 2026 22:09:46 +0100
Date: Sun, 11 Jan 2026 22:09:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Asus IPMI card
Message-ID: <fdfb7212-5133-4cf4-9448-15cbbaa34eff@lunn.ch>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-3-anirudhsriniv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111201040.162880-3-anirudhsriniv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_131007_257032_3ACF1EC7 
X-CRM114-Status: UNSURE (   8.17  )
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

> +&mac2 {
> +	status = "okay";
> +
> +	/* Bootloader sets up the MAC to insert delay */
> +	phy-mode = "rgmii";

There has been many discussions about this. This is broken, 'rgmii'
means the PCB adds the delays, not the MAC/PHY pair.

Please drop Ethernet support until aspeed fix the broken MAC driver.

       Andrew

