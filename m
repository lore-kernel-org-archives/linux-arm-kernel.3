Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8752C105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i3gBEvfmyQV+9uH5i4FmpSfnmRtgPTkWMoZkpfNCYRg=; b=TwJ+YMS6RyoAEQifAr/F7ZQeAn
	xPlGjBa7pzE9do7823t9hjdzX6HYUfUVVJSJdqHBjJEwyExK+hyQYE9Pm5FSxIBsk1oo/D6RajLgV
	YPpM7f8I7ehlS4UiqwjXZG1UEYIg3IdFhmD8hsyJ9Z5o1ZAysjs1tkB4E6qUPK92RuZls8LzHpsOA
	svteMhmbxt8OFWfrV86VIwetp7R8kOvHon3oiIXUdqwJ67Nb6JwBueyrW51kqv9qlQ3GtWiMIkCl2
	w7RgQ3MStKNs5i27piu1Ol9597oVr5O0O0ZT8MGAEcvzVA0DgMl52hPyeEboXfOf7C6jm0K/y9/bw
	0Qi1CdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zA2-0000000HQgk-45Wa;
	Fri, 13 Mar 2026 09:50:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zA2-0000000HQgN-0LIp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=i3gBEvfmyQV+9uH5i4FmpSfnmRtgPTkWMoZkpfNCYRg=; b=Nxq0UqRtQOCAVNZWxp5Ha0LCis
	3nxRL3mRlTXeACLPwrjMq7PEN5fbrbRdk3Dkix6E62kfv9JJWTpcc/Y3zZGpTXLEbxxHijOCj9gR6
	XiupbPiWjiuI05umxAoMrrttEcxKuQizX494RvXNQluey1rEHIZSRi3l2WE0SDEL0naYPtBodg/pd
	cIsVTamuLVEROgQJZUOLFMMvaXCeGhHkZ5Xo3qFKWyOmB/Y8wZKhyZECttyQpnkt5jK6eHn+h+8Ei
	kF75a4MqjIm2VPlJRIVIL8CHriWi0ytKaYP7oChVwaLrfmN/t/Dt+3gPvMY7DFWAtLw5S9bhi+pnN
	pyky5K9w==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z9w-000000030nM-1vZd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i3gBEvfmyQV+9uH5i4FmpSfnmRtgPTkWMoZkpfNCYRg=; b=NGItC00l6+gJk9x21ROBzaYDvn
	WDz2Ey3tXX4u6ERSR3F0jaS/OCIKaQ2CHlLrcytk5TXO5JigVsKhtCg+9r0NVY7ptbZcsVQCqmbEw
	G+Vk2iaTBnktzw+qJ/E5TcfiA7wjR0412rqNEDS1munnv1Ctvm364t2zymjEUMHRefPkMZsyLdMcK
	EDK0SNpvOu8m/7Ej1PBlVVTPN6Al7c0DMHh1Kq+5B/gHUPRRObyGWgDRraaeWBSFxmNX12fbp0aq5
	JokDO9hJ9wgB4kdeCKtTj94xkinQOD5jBBknMcTgV3gIobOKi9EEqJPewOYzR+fJmlgfxwHZz52NF
	dAPPtwPA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37432)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0z9m-000000000bp-3IC3;
	Fri, 13 Mar 2026 09:50:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0z9j-0000000087c-2qla;
	Fri, 13 Mar 2026 09:50:07 +0000
Date: Fri, 13 Mar 2026 09:50:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v3 00/15] net: stmmac: clean up descriptor handling
 part 1
Message-ID: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095020_578585_2FA80D7A 
X-CRM114-Status: UNSURE (   6.84  )
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

Hi,

Part 1 of cleaning up the stmmac descriptor handling. Rearrange the
struct stmmac_tx_info to pack better, and introduce helpers for
duplicated code handing the transmit and receive descriptors. Remove
unnecessary struct members that are only transitorily used.

 drivers/net/ethernet/stmicro/stmmac/descs.h        |   2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 458 +++++++++------------
 4 files changed, 197 insertions(+), 273 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

