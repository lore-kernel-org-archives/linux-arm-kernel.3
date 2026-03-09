Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C12F3C241
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH6ozvbl4SoE8+9DSnbKYETUPjTRVrhnQ17a8BVyHXU=; b=yiak3SENUhiaeCTH761JtVFDrF
	XxHrmvTBsqW4RBfdPMjLcBsrG7A+Y4S8B9WWPKAM9N/0qEmoRiBlpmxJOqB6m+DpvzBrfk4CrdSnF
	+bbLQR3+Om0AiULL4XXQXw16lJR9HE0OfbznfokrjgeOpuxJtZ4SsApY9ni5PuXzTDsLfkxZxMVul
	1cnhFtWdNlEvLPvOVmoiLCjYQ1zjX2gKcSrAFpgre90qbO9WKLxsk2IHhkBGdlRYCyMzhQYmEL4SL
	vh4+TzkWsvJ//7KBUDAjSl4jelacIPI5OdlC0IbJieOObuRTzhWRjM6msI3/0tl89WPYTND1FImTF
	lkJSZ9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZle-00000007Jo7-2xD8;
	Mon, 09 Mar 2026 12:31:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZlY-00000007JnP-2w5n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BH6ozvbl4SoE8+9DSnbKYETUPjTRVrhnQ17a8BVyHXU=; b=N2YyzPOr0LUXTXIueBvroPOcxJ
	4ak0AJLNB7tBKR4VG+PcEtI9Dq7YXzg0FPwXVTxDRhX03OcHRfGIvuPSdUJ5m3MSMIP4ca7QZMCOC
	3AabvwxhDO2MKNAGg2g5ewr67DzeypdnyU0Kg2+xbBQCezbJZHdjzjXz4FuDkGQSQvB99lHtpjCun
	AVqfmIgsW3R/ZXMnBLt3WcXqN9L1V+bIFC492S0sanI9GCqLwrJ8bXXtcD8eheiVLtRciupNiX7yS
	X7nvdW8+mMgFWRhCE7kTh189zTFwXJHoWZ9X1RAWT+op3P/7sLPuOYAkyMctLI2VGSGTRgIUbiV9T
	tgL9Hppg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45216)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzZlQ-000000003om-0iZr;
	Mon, 09 Mar 2026 12:31:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzZlN-000000004JT-0TdY;
	Mon, 09 Mar 2026 12:31:09 +0000
Date: Mon, 9 Mar 2026 12:31:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aa69jFPMR0pAcz9I@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <aandp3FYSJbwoZxo@oss.qualcomm.com>
 <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
 <aa68itP3mXx0WUNJ@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa68itP3mXx0WUNJ@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_053120_739157_14D3820F 
X-CRM114-Status: UNSURE (   8.93  )
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

On Mon, Mar 09, 2026 at 05:56:50PM +0530, Mohd Ayaan Anwar wrote:
> I will pick up v3 and try this out if needed.
> I am also going to test these changes on IQ9 with the QCA8081 PHY which
> shouldn't have this issue.

Oh, hmm. I suspect that we need to make the default_an_inband patch
conditional on !RGMII.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

