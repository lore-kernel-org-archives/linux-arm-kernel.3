Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A76FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhv0V3Xq90p2Zx9s6tdiOx4Xuhn7HTGGCsvmN7JlFWU=; b=qLLBViGSW/pzN/WGIMW6n2ZgMh
	C5PD5PiXeagyFFoi3lznag0xEHc8LS65ZUZXXPjpLFf/MP6rUYd+zJIhZaAQoWvDoLeXgf6/7sBlb
	OJ63ojFjsJUIj96Tj25AX0BOF2ZZ4B1o/S56w0qV9+nuRmQWB/hG4bVL/ufigJ/4vLiB0T76Ibr2s
	DLzgdZQOIJ1vOlxKYThIEmnTw6K+QiOKTKP2eGhs4GF9c4RkFyoNKGOyTKRxgS0cGsdIHheFhGGVd
	uFE0cSxsTw396/73wcgllLylyrVuh3NZ7gCWnBuNmtJJNh+dNhOGtBMK90UiUSFEyuF1F9H+2nrHL
	nRM0GmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkXm-0000000DQxs-1wa2;
	Fri, 03 Jan 2025 16:29:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkWa-0000000DQnw-10zb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bhv0V3Xq90p2Zx9s6tdiOx4Xuhn7HTGGCsvmN7JlFWU=; b=bmdwkbJ+2QGX1R+x5t1PluRNym
	uGqLLBBuClRCbtveL23IFNyT307MRDjD40jvDm5eVegSIGVV5yRBtFj6tGnxZ+oPVBlxdUEJabV+5
	ws/8M+DN7ceC6kF88GSteaFNW8V4BJMibPIJK202W4FNlKSxN/mnqdVdfTHqdjmkeM6w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTkWN-0015Oq-11; Fri, 03 Jan 2025 17:27:35 +0100
Date: Fri, 3 Jan 2025 17:27:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v6 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <4a6cd601-1926-47c9-ad04-9b77c5b8a501@lunn.ch>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103063241.2306312-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_082748_286161_2E88F61B 
X-CRM114-Status: UNSURE (   6.99  )
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

On Fri, Jan 03, 2025 at 02:32:41PM +0800, Joey Lu wrote:
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

