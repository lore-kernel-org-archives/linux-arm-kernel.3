Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2A2CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 18:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzMDiq5tlTgX1W/21WhiBB6gzelJCaOUjEZfpZPw2jo=; b=O8Hnk51F3rrLBPx8PHTo7rLz9k
	1H2ZlLa7TwGtBE4ED4hDfIq60I1VEZ3kdt3J95U3GLXfAHz1emGw9V+pyaJVUUdWqeYr1ukPKyyfT
	Bo3/uWbwhNGihvQn3Glb3fGq08zLKTKkXKKBUojxFYv7Zd1N5qIOaGd+w4a+UDo3vOFy7Fd6I3IMx
	UspDg62t+4mLEnvuilftKAhVqReLecZefRxD2A+YdiJdBumMYo4JTHQj3FKlubu4jWGxo3R8j6K9g
	kUBpVur/0OVs89sgvec+mgzwwSL4ycaIc7+u/ECpboFooBk+3tOMWqlJfKTBoBYsVtYZsLshM4c7E
	riRekLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjNM-0000000Be27-3uYB;
	Sat, 25 Oct 2025 18:52:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCjNK-0000000Be1M-2tkB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 18:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vzMDiq5tlTgX1W/21WhiBB6gzelJCaOUjEZfpZPw2jo=; b=FlOF+A82rwYsAN7j4qoNpJgXtF
	iWSNKWO8eYN/x0dET5c9+Js9JoENDh1Q5nuo4uZl6XJtc+wddCkclErWajJuho0AAVCCNlW9BtOny
	7kFFe0pahZ/Ypmi5vZswSMO2q8XAXspt+qxQ7cPRb2z6ojln7nkxHRXc1u6ZFnl7yeKiL+6NFL5KP
	pdqzgLGgxtbt9xuNsWLKzj68BKWXm9M2Cwot1WLin+o+jWtRoseNWYEIh9Z+Qfx4s030zrPhlwmDn
	nxnEDjLNwimpjuvy8+OxtEbfKUHMGOnwNuCUb7Cynqu2POed4jzv6q6MW3wdAQA9a/3/O3mnxFilD
	tnpPQnCg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56072)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCjN1-000000000IZ-2XQq;
	Sat, 25 Oct 2025 19:52:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCjMy-000000003tv-0P2Z;
	Sat, 25 Oct 2025 19:52:04 +0100
Date: Sat, 25 Oct 2025 19:52:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>, kernel@pengutronix.de,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Teoh Ji Sheng <ji.sheng.teoh@intel.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>,
	Austin Zhang <austin.zhang@intel.com>,
	"Tham, Mun Yew" <mun.yew.tham@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 00/10] arm64: dts: socfpga: agilex5: enable network
 and add new board
Message-ID: <aP0cU1mygKbt9DBQ@shell.armlinux.org.uk>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_115226_726103_EA1A5F2F 
X-CRM114-Status: GOOD (  11.01  )
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

On Fri, Oct 24, 2025 at 01:49:52PM +0200, Steffen Trumtrar wrote:
> Add an initial devicetree for a new board (Arrow AXE5-Eagle) and all
> needed patches to support the network on current mainline.
> 
> Currently only QSPI and network are functional as all other hardware
> currently lacks mainline support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

You haven't included which tree you are targetting with this series. I'm
assuming net-next for the following review. Please be explicit via
[PATCH net ...] or [PATCH net-next ...] in the subject line of the cover
message and each patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

