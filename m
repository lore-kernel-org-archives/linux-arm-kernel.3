Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C316107BCD1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 00:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZWqpZg1vOaiKoR4DSlmunCSlEkK8XZEpM9MEr5G5jo=; b=g4V83X3t5qsNskwZEYFzkb2LJ8
	bqxh0Y+4GYn601oST8fCIFbjFLBEjsWo/TQp7AseWEI22Q6CnOFsHNrKo8wr5TjQhwVb9pK6DxwB3
	kXY4rXvhT+/xpXylhSGC5Fprmqf/A+cwjvOmsf7INB2R9eFlbIrGGRS8OTf+5jzGZwhs7NrfFuBTa
	zvvr2wYQ5mP4QUpYeKOJ3dIk+2A+WaCpJE839JQGRMLiWIIsXUmPyg7eWTO4/SLSkNYKWBrj4tCKs
	dsFUYgo6qlg/MDxs7DY01LY6e6wWeBdk0A0nDQwRcqP3yOtOQvVRo13U4E0q2AYuTXkP9OzogKAZ/
	67gvd1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D0a-00000001MRA-49rX;
	Sat, 14 Mar 2026 00:37:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1D0Y-00000001MQm-1WRM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 00:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZWqpZg1vOaiKoR4DSlmunCSlEkK8XZEpM9MEr5G5jo=; b=gvEPv2PX110hBhxslOImfIn0f9
	LWAqEeoOdUn5h2RMYq340b79VLWjiw8QYQT8S9fpGdRrjvWvRXJhojIqIPrYBOtaPIfTAsVbmbnT0
	LchiVCn6TZbpvagNcWV2HN9SKb1EYKqM6Z4jH5qMBbd8Q9AnoU7NgPSkFh+GeDGq1xVTc8gOqtNKr
	EblEw+cHjU2I0ypHpYMQU4Z+W2NuLabkTO3euT5SO6bX/teM6DkzXhlhjbiphjuH98pVp1xy3FI5T
	7q/ta1QFx5ut7ow/Wv187iiSm2oPibYZ3AiX1bHmgMXmM2Xk0eHDUAZ6AFv8UGuNl+wlncRxUk/Bg
	py9Xu4KQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w1D0M-000000001eZ-3hM7;
	Sat, 14 Mar 2026 00:37:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w1D0J-000000000FZ-3Cxy;
	Sat, 14 Mar 2026 00:37:19 +0000
Date: Sat, 14 Mar 2026 00:37:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	antonio.borneo@foss.st.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: stmmac: fix pinctrl management during
 suspend/resume
Message-ID: <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_173734_750759_2406E966 
X-CRM114-Status: GOOD (  16.39  )
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

On Sat, Mar 14, 2026 at 12:44:56AM +0100, Linus Walleij wrote:
> On Fri, Mar 13, 2026 at 12:08 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
> > > In the deepest low-power modes, the pinctrl configuration is lost
> > > and is never restored if the interface is down.
> > > This commit ensures that the pinctrl state is set in all cases.
> >
> > Shouldn't the pin state be restored by the pinctrl layer?
> 
> What we have in the device core only applies "init" and "default"
> states, and provides these handles for transitioning to "sleep"
> and "default" again (like a state machine).

What I was meaning is that - for a driver using the "default" state,
if the hardware loses the pinctrl state during sleep, isn't it the
responsibility of the pinctrl driver to restore the state rather
than leaving it in whatever states it happens to be when the SoC
comes back from suspend?

If that is not the case, then don't we have a major issue where
drivers using pinctrl but do not issue any pinctrl calls in the
resume function are buggy?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

