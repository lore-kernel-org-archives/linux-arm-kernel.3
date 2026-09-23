Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B0FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXJnRJRTxgy4hjZ9q9bU+112uVIymJuRU1zRdHwHYCA=; b=QhdNMO3U8LPQ8k38bOD5pYTewc
	MHCRzlFeTqIwSmcrjlzbCLbK/06q6UO78LMPvJRXfaJoTwAVvgak9MpG7Y9xW1et2f2ZL0S0f8JOb
	ZwAvSYGhXdsTM0sHSJZfkt8lvR1qqg2M6YuEatxyjPwhKDl24FpI7pG+znvPwcgFy8aWyeyFc5adY
	Yf1arj+KMqV4zeVr7PZM0Rx2V6mWh2gDm+M+7PeX7uCGE3mAuAkXTdYFqlIs3Qz3p573f4VJaC0A+
	8Zk0H+cSKpfwlzzeaL5LXLoHTVdtdyyT89hdiWY6cRbM5SVjldDbDYuzHH2MkHPVSti1H1Q+2UgQs
	absLTEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rp2-00000009DWm-3tFX;
	Wed, 23 Sep 2026 18:36:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Roz-00000009DUo-1eCP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HXJnRJRTxgy4hjZ9q9bU+112uVIymJuRU1zRdHwHYCA=; b=iKAwokD+QZzNxHtib6CZO8slHG
	6a9ePUyZsbIPtW4/T3Hab0cy186YRSmwntzxMx+VRURlU6Th6lfT0b1Edbcu5hCNQ8o5Pr7O1g/fL
	YVecv794yM7XumvEu6aApqdRlWO1ZAkKj9lIr256PTNsIDLQDqJgD6ow4XnRUe3XWAeI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9Rod-006r79-Tp; Wed, 23 Sep 2026 20:35:35 +0200
Date: Wed, 23 Sep 2026 20:35:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
 <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_113557_441011_2C4F8DB6 
X-CRM114-Status: UNSURE (   9.76  )
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

> Non-existent MMDs
> -----------------
> Returning 0xffff on reads and silently discarding writes is what a
> floating bus / unimplemented feature looks like, so I agree with that
> direction. My pcs-xpcs-rk does the same.

Did you read 802.3?

  45.2:

  If a device supports the MDIO interface it shall respond to all
  possible register addresses for the device and return a value of
  zero for undefined and unsupported registers. Writes to undefined
  registers and read-only registers shall have no effect. The
  operation of an MMD shall not be affected by writes to reserved and
  unsupported register bits, and such register bits shall return a
  value of zero when read.

This is what i was commenting about in my review, returning EOPNOTSUPP
is not correct according to the standard.

	Andrew

