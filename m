Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5418ECA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF2ObC+OsVZ7or0LZchP/vk8UwZrfHhQgcnlOB8aCz4=; b=4QeZL40pcMfBtw0bBhQ5V3yofn
	fFIEBtWJlyY6f56EBDK+E1c9mQgSHHqTMOusrfdJsBlAH2lyrJ5cKVJkZdZ9n9Ho76feu+fzNBP8m
	SZBuYGb3azrbVxoGF9X1Qn+gEOQj/Ivr4DdzPW2ZpHBWs9w5BlEXiercWDj1qiwB+tOLrfbHsS2TZ
	VQr4lFFj3Ouug7wfdgNWIL1KXIT/zHbTqbjbADWd2F8LxWINMG+nGz9GX6Pli/dIA7Hmlz/sF0guF
	5gwa1KIR82481sxvwRYdnUVk7wHJAaiPTMpitLhOrP/boI5f7fyJLLiwPGpOpEf/QTaso+1wcnqKB
	/K2J56ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrsh-0000000BmPz-0qoM;
	Tue, 26 Aug 2025 11:30:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqxJ-0000000BdEC-02g4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 10:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KF2ObC+OsVZ7or0LZchP/vk8UwZrfHhQgcnlOB8aCz4=; b=jZ6BNJTq2lIQwKfYvco0uRWf8+
	oV5k1oBfbLni7eapsB1h9rcCAp1N6+8fnG8gR5EdVvRlyLx8tx4l9tdvLBB5RjkYf1FEyZZE4GBvV
	d4TvThynTfshIl5sypaefRXA470zgUaMTNnq+e80GQOrHvf9C7YojtO6FUDr29BStnggw8ukriw+3
	BInjVJzkMkOnF5QZsbzLA4ROI8AE75BNQcWnQ3bNw7v9wN74/rFp72E5Ls1vguaXrPbF+AaAnbEBp
	qqIlvPDcA3eta/73J35HFoH+FUG+qe9MTwnF6vlNvi/TVAfSqxhfYX5kw8YsilHSBnG0eiO++PXWk
	G8BuwNgQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45122)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uqqx5-000000007iq-07K9;
	Tue, 26 Aug 2025 11:30:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uqqx0-000000001Ap-2cp5;
	Tue, 26 Aug 2025 11:30:50 +0100
Date: Tue, 26 Aug 2025 11:30:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: david.wu@rock-chips.com, jonas@kwiboo.se, mcoquelin.stm32@gmail.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: rk: remove incorrect _DLY_DISABLE
 bit definition
Message-ID: <aK2M2j7-CpnydtUh@shell.armlinux.org.uk>
References: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_033109_051498_096B5903 
X-CRM114-Status: UNSURE (   9.54  )
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

On Tue, Aug 26, 2025 at 03:22:15AM -0700, Alok Tiwari wrote:
> The RK3328 GMAC clock delay macros define enable/disable controls for
> TX and RX clock delay. While the TX definitions are correct, the
> RXCLK_DLY_DISABLE macro incorrectly clears bit 0.
> 
> The macros RK3328_GMAC_TXCLK_DLY_DISABLE and
> RK3328_GMAC_RXCLK_DLY_DISABLE are not referenced anywhere
> in the driver code. Remove them to clean up unused definitions.
> 
> No functional change.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Looks correct to me!

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

