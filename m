Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DB6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 17:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zaH4j7WopmuTe39LdIt9zVEEoEXcU6yeHbphF4jg2w=; b=VW1Fgh6NdP6Swxq2Zsbugt5433
	WAOON+S/4xUP+0N74FdL/zmJMoMOwK4FOr2PPQaVPrYniax1z3ifRL4tOcnp5C72zqxeyPgkh+5Pm
	t1MySAm7KsoY3hyEls2yFFDUV3Vidzk2S9knrEJNsXmRIYKqPPueFCOUoR1sdi8zwnvD4hovq0bIs
	8LhPSF6ManwGO7i4SzoGDaXcmMMSf3unmjV/YLfr9Nfc3Pmlt9qonACUUMSHALkC4Sk9W1KAId4mC
	JV5hKJnY+K9KEgTJLgt/1UlQXJ/uCB1y1+pW13wJtqQ/GWe7SiX508wUdnUa4cQslvhRYrudEptN4
	XtmdybMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQVWl-0000000E9sQ-2Qh0;
	Wed, 25 Dec 2024 17:50:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQVVb-0000000E9lp-0NXZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 17:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7zaH4j7WopmuTe39LdIt9zVEEoEXcU6yeHbphF4jg2w=; b=YJoq34KNP2+1yE2R1bC3Z857m7
	rfpQM73OR8kzfsg3OVDTB601+xgq6RysfZwZduP/8V9OiO+ry/C+UX/EcJX4SWUU2NlAzz4fZ6eka
	GYSliQW+wBPLL91KDsIvnf250jzDQU+RDIJ+mxpPV9G5jipTdWl5MVD5lVdUuOQrfy84=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQVVL-00GA3K-A7; Wed, 25 Dec 2024 18:49:07 +0100
Date: Wed, 25 Dec 2024 18:49:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Support tuning the RX sampling swap of the MAC.
Message-ID: <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_094923_134113_6FE1FC05 
X-CRM114-Status: GOOD (  11.76  )
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

On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
> The Ethernet MAC requires precise sampling times at Rx, but signals on the
> Rx side after transmission on the board may vary due to different hardware
> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> occasion between the rising edge and falling edge of the clock to meet the
> sampling requirements.

The RGMII specification says that RD[3:0] pins are sampled on the
rising edge for bits 3:0 and falling edge for bits 7:4.

Given this is part of the standard, why would you want to do anything
else?

Is this maybe another symptom of having the RGMII delays messed up?

Anyway, i don't see a need for this property, unless you are working
with a PHY which breaks the RGMII standard, and has its clock
reversed?

	Andrew

