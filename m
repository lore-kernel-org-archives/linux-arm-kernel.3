Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39D2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSSYTZhlNYuWLdojci1CHyfJ19u42cVdqr9Ovo7YbXU=; b=PZHnRZDXjARTnehxTq9DSxMzJg
	syp8Xk6+JkeqO/udBH/D0tyYUVVzA8FdjGwxcgV0b2F34M19j38CElVmf+Af8JMZeRhTPit6blkM/
	KntJoFKwMiFQw1BG3uXNKd2c5AEqo6Zg8SLH8+Hi5L7Mv4rTBsjsgDkeoh6+1RLQPbi8juVz5lMpb
	dVkbT8qQ7HSJ3KRN9+4jcOehmLHNnMnhkv3S4+OogRX+LNTr6ptoD3k7/RvLOFJdPYXzy+6PgdiEV
	XyPuu+XV5kSR0MgNGZVus9nOHwGN8UduQhF3tgAEdy7YWYb/21coHr9XhGR2dgO0Xa5xw+edqIG/E
	dbxb7Rvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrTd-0000000G7sG-04hd;
	Thu, 26 Dec 2024 17:16:49 +0000
Received: from [156.67.10.101] (helo=vps0.lunn.ch)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrS0-0000000G7hJ-1B9P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OSSYTZhlNYuWLdojci1CHyfJ19u42cVdqr9Ovo7YbXU=; b=rv8yFZ1RdFiszPsIp2g446Jg9r
	5yCZ4KJnEFBfhmqSyNhi30sXvS55XbvmI+NrpvykjyVR9t/PrVw17g0cxYNoeFh7LfF8KdFGyAk4x
	PRg+itdJsllxbbDnd1gzsjgKcUmVulpX3uEAZxPg+UGKNz8KeH3YQWDjUIwFn2kukbSA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQrRV-00GQ1U-0i; Thu, 26 Dec 2024 18:14:37 +0100
Date: Thu, 26 Dec 2024 18:14:37 +0100
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
Message-ID: <59590ff5-676a-4cd6-a951-96f66972aad4@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
 <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_091508_324615_EF2D49CB 
X-CRM114-Status: GOOD (  20.57  )
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

On Thu, Dec 26, 2024 at 11:06:48AM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-26 01:49, Andrew Lunn wrote:
> > On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
> > > The Ethernet MAC requires precise sampling times at Rx, but signals on the
> > > Rx side after transmission on the board may vary due to different hardware
> > > layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> > > occasion between the rising edge and falling edge of the clock to meet the
> > > sampling requirements.
> > 
> > The RGMII specification says that RD[3:0] pins are sampled on the
> > rising edge for bits 3:0 and falling edge for bits 7:4.
> > 
> > Given this is part of the standard, why would you want to do anything
> > else?
> > 
> > Is this maybe another symptom of having the RGMII delays messed up?
> > 
> > Anyway, i don't see a need for this property, unless you are working
> > with a PHY which breaks the RGMII standard, and has its clock
> > reversed?
> 
> Please correct me if there are any errors. As described in the Intel and TI
> design guidelines, Dual Data Rate (DDR), which samples at both edges of the
> clock, is primarily used for 1Gbps speeds. For 100Mbps and 10Mbps speeds,
> Single Data Rate (SDR), which samples at the rising edge of the clock, is
> typically adopted.

If it is typically adopted, why do you need to support falling edge?
Because we can is not a good reason. Do you have a board with a PHY
which requires falling edge for some reason?

	Andrew


