Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59EFE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rbT7xplslF0DCwfG1zTGk6wwOgd2peDWsm8gQHEx3QU=; b=ZhNxGUGGEYqTOZFXRLqgBqBo8S
	QVwNrM8kGPUNAiVDmRxRgufpcYRn6KIqXIZZrOmx7xXWk62/Anlsvsob+DQZmm2/qZj4ka2+U49lX
	S4SG+wU2EIdbmoknIpFYFK6y5GQrE0JDWX0vD/N4b/VgBmBWWCZ0IJ8/g7fFxkszqDD1t8upk3XhB
	2IyKpt6IeRpqzmlTebXQiPVfvDPjguGE4ax6nHBXqkw8C97uv0SLSGJhk+/hPo+dzY/Hs69XgjaFr
	AGj8fdlDOtLQl27Uu+xsN/tyfLY3/QacOVTWQgi+W9aEl2xgTGeEtzEGyTdwwUy7kml9D4caSQ0JO
	ytnnfsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIun-00000004yyz-2AwH;
	Mon, 13 Jan 2025 11:47:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXItA-00000004yak-2rCm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rbT7xplslF0DCwfG1zTGk6wwOgd2peDWsm8gQHEx3QU=; b=HbV//J923OKFzYQsHCa/mYJO0C
	9uuIYF46MTKqOgpdamOhMHRV+Wm9SIPPz91V3memmxMaE/Qvruj7Qa1HlS6zQUHdjMwaedD5hXUP5
	25q7Z3fpmeUVaxOsEIQWB0HFGwIbMmC5js2OhLEieEh1+ld6qW61bVOE/pKMp45QWEctF4pLwR62+
	mYMXdMNCIfc5usr9g7m7sv3Vumj9ERgypVSYZTPCuxmR2nZtsLg4pnovVXSG8XsQ1Iq1bQYzIt2DJ
	bqK7ZxiyrLDLtM01HHbmbFtTQX6pRn6rg7c8BgN4S+psaC1cJDcFdP+6fagisCsJ36P7t3VI78DrS
	F6U8pnyQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tXIt3-0006Ue-02;
	Mon, 13 Jan 2025 11:45:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tXIsz-00042f-1U;
	Mon, 13 Jan 2025 11:45:37 +0000
Date: Mon, 13 Jan 2025 11:45:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: lexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/9] net: stmmac: further EEE cleanups (and one fix!)
Message-ID: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034548_720042_E7BDC8AB 
X-CRM114-Status: GOOD (  15.09  )
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

This series continues the EEE cleanup of the stmmac driver, and
includes one fix.

As mentioned in the previous series, I wasn't entirely happy with the
"stmmac_disable_sw_eee_mode" name, so the first patch renames this to
"stmmac_stop_sw_lpi" instead, which I think better describes what this
function is doing - stopping the transmit of the LPI state because we
have a packet ot send.

Patch 2 corrects the priv->eee_sw_timer_en flag when EEE has been
disabled. Currently upon disable, priv->eee_enabled is set false,
but through the weird logic that was present prior to the previous
series, priv->eee_sw_timer_en was set true. This behaviour was kept
as the previous series was cleanup, not fixes. This patch fixes this.

Having fixed priv->eee_sw_timer_en to actually indicate whether
software timed EEE mode is being used, it becomes no longer necessary
to test priv->eee_enabled in addition. Patch 3 removes the redundant
test. Patch 4 also uses priv->eee_sw_timer_en before manipulating the
software EEE state in the suspend method rather than using
priv->eee_enabled, which brings consistency.

Patch 5 provides stmmac_try_to_start_sw_lpi() which complements
stmmac_stop_sw_lpi(), and allows us to move duplicated code into one
location.

Patch 6 splits stmmac_enable_eee_mode() - one part of this function
tests whether there are any queues that have unfinished work (in
other words are busy). Separate out this code into a separate function.

Patch 7 also splits out the mod_timer() for the software EEE timer
intoi a seperate function (the reason will be in patch 9.)

Patch 8 merges the remains of stmmac_enable_eee_mode() into
stmmac_try_to_start_sw_lpi().

Patch 9 fixes the delay between transmit and entering LPI. Currently,
when cleaning the transmit queues, if we discover that we have finished
cleaning up all queues, we immediately instruct the hardware to enter
LPI mode without waiting for the LPI timer. However, we should wait for
the LPI timer to expire. Therefore, the transmit cleanup path needs
to call stmmac_restart_sw_lpi_timer() instead of
stmmac_try_to_start_sw_lpi().

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 58 +++++++++++++----------
 1 file changed, 33 insertions(+), 25 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

