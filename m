Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11621E9A74B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJwQ9+oRctfr5dpIJQo3Ps6u0uqQvSoNxdVowemfWsM=; b=dq2xUzBIibSkdgNBazwmkj0fjW
	gEnX0WpD610L07dNySypW0ob2bZ9ZyyHcXNn00WairRng+VCUo1L90aIjSx6UybBw2WWfiQSwBujr
	9FewG1FTUs+Rj5cD9clRJJLowxEP+Kdo+G+VWxhDvj1UrjtS88D2FYmNbpeDBB97vx5PsCRcPZ+35
	UPaT7DFg/k1Q2ABCtFGz6CTimy4WxutMmJ3+bzpu0nFL7ntbkHj47jp0U4HdYwEhld2IGpO27AMHf
	ENah/5qujRgkorPUT6lfJ8jX3yDJC0ziVFQDjZ/MR8+J5mSFyabeXk1BJq4/rm0oLqN2/lMdho1Rx
	BQSlKfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yNJ-0000000184D-1YBB;
	Tue, 24 Mar 2026 09:48:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yNG-0000000183t-3bst
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SJwQ9+oRctfr5dpIJQo3Ps6u0uqQvSoNxdVowemfWsM=; b=umBvJAzb3vktIyEGqq/LBR7BVP
	lsO1jeaffWXOvVfwo8a8hig4hkjRAx4u4ainT4Ht2winfhufOfgXXiYsbGOF+uS1Lc2ejpEEx12Mr
	Mc34j0DNH8Ly/9q2TSHiN3beRZ3DBpmQSJmGb7xbPINIC+djCFEOcBZVMtHwkeb+7XbVl19TQ5qWE
	hPE814DMnOxWIOPNXqdkKdQdeXz/hsWJtm/ULhOk64OyhLnNY+a/hXzeJF4uhNUc85I2RMEMKxga9
	V9DRc/FBvUx1cWXN8IEQCZ1gmWlZ+l5lY26rJWJ399ogt1gzN0YHoEr6XAWw5WxeGIrQLqoIdPiXF
	iMlgE8IQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35944)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4yN2-000000001go-1Vgb;
	Tue, 24 Mar 2026 09:48:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4yN0-000000004xj-1BAN;
	Tue, 24 Mar 2026 09:48:18 +0000
Date: Tue, 24 Mar 2026 09:48:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/5] net: stmmac: dwmac-socfpga: Move internal
 helpers
Message-ID: <acJd4qJ6XLE0gs0C@shell.armlinux.org.uk>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
 <20260324092102.687082-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324092102.687082-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_024834_923930_85108642 
X-CRM114-Status: UNSURE (   8.28  )
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

On Tue, Mar 24, 2026 at 10:20:56AM +0100, Maxime Chevallier wrote:
> This is preparatory work to allow reusing the SGMII configuration helper
> and the wrapper to get the interface in the fix_mac_speed() callback.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

