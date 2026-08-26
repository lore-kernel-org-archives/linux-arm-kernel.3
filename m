Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F4BC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 18:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlXEgBPszyMY13F08Sg/qicoNcVit6PBydQLjeJitBk=; b=UJd728HidFxmPaeELNkPFeDlyg
	kV47IMhM/uAoWMdqN3K230nTOfOcAMjRAGzwf5iqVtL5mSyKDz+OnGwYgj1t8gnQlJFkzr9GUxp8Q
	K4R15zxJja5PAyr5YoabUrkwasAEO/VNsEAyFwI7WLN9CU0sNRbh7a94r2Yt+Mjo8AfbZqnPdyxJ8
	FvAa48HC3VJMwRM7hDE0wTmMV/X8fFxUGkfwoOs7xaiBiFBIRoCBF5VohhZcuI0KpXv1yDK/6FzIG
	gKURsZQXVn2mmN/9haqsynpHXgKWK09vjCgnWa03X4RNWST8YumGduc8TrdU/E0ULHOM2ORe29djd
	8HHRbNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIMT-00000002sX1-02Sv;
	Wed, 26 Aug 2026 18:28:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIMR-00000002sWg-08fQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 18:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rlXEgBPszyMY13F08Sg/qicoNcVit6PBydQLjeJitBk=; b=bPoEI2E472DYXjOwIBw/zBJgke
	wbmq0/6wYSfu7wHWw6xPnpqUZ41Pm4mo4QSY2My0uwT65q8VzdfEtqN0ydW9j3B98Tz6raNLM71vk
	jb11YPjm+2BiXRDz5D0NKwpu1rSTL66f4RJc6btZ8Wr3UOvBsf9/S+a/kPCzEAdopfTo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzIM9-001YoB-3T; Wed, 26 Aug 2026 20:28:13 +0200
Date: Wed, 26 Aug 2026 20:28:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net 6/6] net: stmmac: selftests: Don't test flow control
 for small rx fifos
Message-ID: <5ac1be4c-34a2-4917-bd82-00044ab60af4@lunn.ch>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
 <20260826140500.616466-7-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826140500.616466-7-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_112831_076367_8CEA8A70 
X-CRM114-Status: UNSURE (   9.32  )
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

On Wed, Aug 26, 2026 at 04:04:58PM +0200, Maxime Chevallier wrote:
> On dwmac1000, dwmac4 and dwxgmac, we only emit pause frames if there's
> at least 4096 bytes in each queue's fifo.
> 
> The phylink mac capabilities are still MAC_ASYM_PAUSE | MAC_SYM_PAUSE as
> otherwise we won't be able to negotiate 'rx on' pause. ASYM only will
> prevent negotiating 'rx off tx on', while SYM only doesn't really
> matche the reality (not symmetric if we can only do RX pause).
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

