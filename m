Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807D2CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMaunYaTiHBvajS7Akr5txw8OUSAxQkTAc82E7olhqA=; b=hmtxl2/jeSKOqLkytz9pCwlJOD
	1K5iPorxYd0u4FIzfZVevyCqapeXoHmWGV6/VDrapneeYMNeHiy9okQQO62lAlh9GhKmivgc78110
	3mDc6MSCIZYqtX6VyMdq9jFPUtFaSkb9/4uPzmSqsC3BKMYuL4Fx77ohxJPseTme6xCsX5EAjj+3Y
	jPeUsiBj8JF4Rlcb8ip2KAaLhoaY12JLCdLL9PAUjSHSm9G3DrFNKhWCoM6srFNiosXdwx2PF9SVq
	aj/EOVl471g3lzQZDBUpPDWTASKWL6Pxu0+xbnaA0V51csaPl5DOfgnmP+Wdr5x+jTw8OgxJfJ/zV
	nE0coVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jpC-00000007pVk-2Xcj;
	Fri, 17 Oct 2025 12:44:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jpA-00000007pUZ-32NI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iMaunYaTiHBvajS7Akr5txw8OUSAxQkTAc82E7olhqA=; b=eaCyIulFQ6xXo3jsBkivsFl4D/
	eX2T8893dgSWPXh0cB9jACnVhOKEftIlnkvKdgnTBqdyc5p81MVz6fbyELEM3BxWyq6MkccMQBaRe
	u58byjoq7OPLCF3H5LTWYkPJx7qu0a/yUatYpBiWM7NoDtVEbCzIHayP22SbhtnHvdkeeG1g8cro3
	eYu93lp8g+6CLI6mvoLnmagZtbsA2h+fpTOa//ygkATewPSSWzSHBwzR0ObROGZPTRZxXX1WaqMQf
	zfbONHfMmySV7TT5o21EKlk6UP0k9p2He0SK4PXGt7oPhbylRTUmdNUQLofl/7pJ1c7MRzntD6eHk
	SOcZZeEg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34722)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v9jox-000000007tY-2bB3;
	Fri, 17 Oct 2025 13:44:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v9jov-000000004Jy-0MNd;
	Fri, 17 Oct 2025 13:44:33 +0100
Date: Fri, 17 Oct 2025 13:44:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Rohan G Thomas <rohan.g.thomas@intel.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Message-ID: <aPI6MEVp9WBR3nRo@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_054448_761365_F64574D4 
X-CRM114-Status: GOOD (  10.14  )
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

On Fri, Oct 17, 2025 at 02:11:20PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> On hardware with Tx VLAN offload enabled, add the VLAN tag length to
> the skb length before checking the Qbv maxSDU if Tx VLAN offload is
> requested for the packet. Add 4 bytes for 802.1Q tag.

This needs to say _why_. Please describe the problem that the current
code suffers from. (e.g. the packet becomes too long for the queue to
handle, which causes it to be dropped - which is my guess.)

We shouldn't be guessing the reasons behind changes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

