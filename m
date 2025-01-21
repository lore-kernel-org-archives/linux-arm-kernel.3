Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4182C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MfTDBXKnfQgtBuHJqYH787sbTmGoB/81OUCCryIhhg=; b=Em5q5L2bKhjsTrmlvvLjh22hpL
	Q6txTgfm4HwckcCxt2rg1W40ef/39g8GpzcbCa/kZKg5Gn1aYl9LbP9M5B+IPbw1Hb/KadKGYFodX
	RvAUDYoJyonaiBysaxzy6n4+psLvhObXSJhi0W10TFtL1jUocYwYSHZNBwwo0VEdI/S5KL6jFAiQS
	xj1gNRRL1Zm9xINKB+rLhoulJ1JNbGcR/tgIsZT5dQ3dqcdIWNeaoy4rIQwFAFr23/O3tAQBb4mNo
	4vvafC+othJdIz2jZDAIDzbHGoqUThZuPwQCHl+8frMRrn7yqkfweuzJ61lRy+NVl5l2TeqO4iE/p
	swniuDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFMF-000000085EM-2cZ8;
	Tue, 21 Jan 2025 14:35:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFKx-0000000854Y-3SXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5MfTDBXKnfQgtBuHJqYH787sbTmGoB/81OUCCryIhhg=; b=gEupoOAP7LxUmTZs8ih/lPQx+i
	wUawPIwk0bYMEQK3Z66L6KQowqftXS6uuEiU2QO1fkwWu50PRRBamuVf7fcweqfXwhjeG5q6Jeh5m
	VdhQUHHCvED6l70O75wAiLkX4ycCNm0PkyBRgKonlciLC0XgnteJFOioUSjqJPK7akWo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taFKd-006enL-3z; Tue, 21 Jan 2025 15:34:19 +0100
Date: Tue, 21 Jan 2025 15:34:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable
 swap on qcs615
Message-ID: <ebf3238c-12ec-4da7-bcdf-594bbe070a82@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
 <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
 <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
 <0fe23cfd-9326-4664-9c94-cf010aec882c@lunn.ch>
 <89d4df79-a202-407a-bcfd-6af5315c403c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89d4df79-a202-407a-bcfd-6af5315c403c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_063439_859236_24FB5811 
X-CRM114-Status: GOOD (  19.89  )
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

> > Maybe you should go read the RGMII standard, and then think about how
> > your hardware actually works.
> > 
> > RGMII always has a variable clock, with different clock speeds for
> > 10/100/1G. So your board design is just plain normal, not
> > special. Does the standard talk about different delays for different
> > speeds? As you say, other drivers apply the same delay for all
> > speeds. Why should your hardware be special?
> > 
> > RGMII has been around for 25 years. Do you really think your RGMII
> > implementation needs something special which no other implementation
> > has needed in the last 25 years?
> 
> I do not intend to violate the regulations of the RGMII standard and aim to
> maintain the same delay across all speeds. But the RX programming swap bit
> can only introduce a delay of 180 degrees. Should I assume the 1G speed
> clock to calculate and determine if this bit should be enabled for all
> speeds?

Lets rewind a bit.

The RGMII standard specified which edge you sample on. Since it is
defined, no other driver has a configuration like this, they just
setup there hardware to be standards compliant.

Why do you need the ability to break the standard, and sample on the
wrong edge?

I can think of two reasons:

1) You have a PHY which is broken, it also samples on the wrong
edge. This is a workaround for that broken PHY.

2) You have a board with a clock line driver inserted between the
RGMII output pins and the PHY, and this line driver includes a NOT?
This line driver is causing the clocking to break the RGMII
standard. You are working around this broken board design by getting
the MAC to invert the clock.

Is there a third reason?

Lets first understand the details of why you need to be able to invert
the clock.

	Andrew

