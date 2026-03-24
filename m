Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D8EE9A75C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r4V4dQe1gU9tt6jQ/MIXP64Tb/Q+nLz8skV//X5OSAI=; b=acLlyj226Mjb7i1QbFdFXUIA7S
	LDX4N0oMfKYoeGj+SNYZ97j0APWGcZN546cr0WSV7g1KemdHfnLEqfmwbykmkogWvLv5Ho0PB2xhm
	tSlEmxpXtAoefDcS8r1Xmiky5ITIGm2pnBdEAN1zLHVsOvo0u9JGUSp3fstJ8mJtjoj/rIsZexM2o
	xSIwC9KKqdlmXf9GlfTbkP4tYCXUv2zfA3zBxaubcdd/HSRKDeCTZ2yZGm3SzXXZjRbHapJSNydPI
	OvRpFA4Rwdkeqs1dFhEvdR+BvThaVfp6NeilqVtWEXQXfDo5qJzRNZA6kgCqWaaYnYXs3EEOiZlet
	QlwT6hlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ydr-00000001Apy-12Zl;
	Tue, 24 Mar 2026 10:05:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ydo-00000001Ap0-0mrb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r4V4dQe1gU9tt6jQ/MIXP64Tb/Q+nLz8skV//X5OSAI=; b=k1Oqjp3T4DZ9gFyQn4nVacB9W1
	Nu0DIPt1pBTzD78woBasQLdg9ox4bmQR81PXobsc0GhPtDkAPdvpqyIEVaGei5u8bRS6OJkpolxO+
	Gv6RTmKvqLyUK2SHLDILs4cs4cbKcLhOlVrEg1KKXPBOMPuPFZLN1LI8gi7LO7hfwufM29+z63eHo
	YTnXwaMkKKgeXPEPL1UYGae9nA2nf1t5SDiLEu1eEQY68XDf9q23NP2c3C7Iqra6rieW4B3jY4Po9
	teKJmhug6N8AMoZIsj39Mzx85toKXibNoM3101jtF3RuRFVBoLpoYTKDSdJEf0oiogb3bwa8skiJz
	MxFrqtyA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39192)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4ydb-000000001kv-10UI;
	Tue, 24 Mar 2026 10:05:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4ydX-000000004yU-3ZmT;
	Tue, 24 Mar 2026 10:05:24 +0000
Date: Tue, 24 Mar 2026 10:05:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next 0/2] net: stmmac: remove unused and unimplemented
 AXI properties
Message-ID: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_030540_225513_15BAF94A 
X-CRM114-Status: GOOD (  10.31  )
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

commit afea03656add ("stmmac: rework DMA bus setting and introduce new
platform AXI structure") added support for parsing all the stmmac AXI
attributes, and added code to set most of the appropriate register bits
with three exceptions:

	snps,kbbe
	snps,mb
	snps,rb

These were parsed by the driver, but the result of parsing was never
used by any of the cores.

Moreover, no DTS in the kernel makes use of these properties.

Thus, it doesn't make sense for the driver to parse these, so let's
remove them. Also remove them from the DT binding document.

 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 18 ------------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  3 ---
 include/linux/stmmac.h                                |  3 ---
 4 files changed, 25 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

