Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BFBC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Pnocolf/+FMPBsjA4XKBOck60bqAiKE6Tl4dgyzfRI=; b=BcDXWw5Ujg+NdGfSzArnz8EJUi
	chiWmIFWJh2i8KjcrZMo0gv9KGRlOlgkzZQkyY4jxkPfbgg7K2l2DEfLwSeZX6RTlbd/p0gaeSaNk
	rPxnE0fpMnQf07jImG0cHOwRvX+L6pItr06JsFSRzgA3AFbOPcaxlLYy0OvBzg4n78Akec7UFNPK2
	YzyviYYPMP9QrHf4hD3JXsRnSPXviO1TwYmEcJAu5O1+ZdLYlIzplTvxb+eU1wnr+WT0uqLzsF88p
	0bUGo3PRB98GfZxQmahQ1Mo8xpq+JivZZYoB1ldgMNQaPblDoFsUxVd3aXIkUHXiqBDX8OU5E8IOR
	6emKsNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHeH-00000008QJ8-2osw;
	Tue, 21 Jan 2025 17:02:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHd0-00000008Q7l-08bA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7Pnocolf/+FMPBsjA4XKBOck60bqAiKE6Tl4dgyzfRI=; b=qu9hGiLEi/SYW6d2f1eyaAFdCs
	1qp0YPhycK5jWI/BYvXgioC80c/Q4WXVxCidQ7YVf1kQrT7B3cdzujhe1g7BNEjoZb0oQxDhzuxw+
	dn0VRXrCxykMPy7+z+08vb44I4S9nuAzxCpnkjyPfaKSN75ZWLb8i2LpNQE6FrwbtW/Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taHcX-006hE0-M8; Tue, 21 Jan 2025 18:00:57 +0100
Date: Tue, 21 Jan 2025 18:00:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Yijie Yang <quic_yijiyang@quicinc.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: net: ethernet-controller: Correct
 the definition of phy-mode
Message-ID: <69954039-96bf-42d9-850d-48676a530ec6@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
 <20250121140840.18f85323@device-291.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121140840.18f85323@device-291.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_090126_079132_7C03C8FE 
X-CRM114-Status: GOOD (  17.28  )
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

On Tue, Jan 21, 2025 at 02:08:40PM +0100, Maxime Chevallier wrote:
> On Tue, 21 Jan 2025 15:54:53 +0800
> Yijie Yang <quic_yijiyang@quicinc.com> wrote:
> 
> > Correct the definition of 'phy-mode' to reflect that RX and TX delays are
> > added by the board, not the MAC, to prevent confusion and ensure accurate
> > documentation.
> 
> That's not entirely correct though. The purpose of the RGMII variants
> (TXID, RXID, ID) are mostly to know whether or not the PHY must add
> internal delays. That would be when the MAC can't AND there's no PCB
> delay traces. Some MAC can insert delays.
> 
> There's documentation here as well on that point :
> 
> https://elixir.bootlin.com/linux/v6.13-rc3/source/Documentation/networking/phy.rst#L82

This is part of the problem. This describes
PHY_INTERFACE_MODE_RGMII_*, and the value passed to phylib. The
documentation even says:

   The values of phy_interface_t must be understood from the
   perspective of the PHY device itself,

But the value in DT is about the board as a whole, it describes the
hardware. Software gets to decide if the MAC or the PHY adds the
delays, if the board does not provide the delay.

> So, MACs may insert delays. A modification for the doc, if needed,
> would rather be :
> 
> -      # RX and TX delays are added by the MAC when required
> +      # RX and TX delays are added by the MAC or PCB traces when required

From the perspective of the board, this is wrong. 'rgmii' means the
board provides the delays.

There is a parallel discussion going on, about how aspeed have also
got there implementation wrong. See:

https://lore.kernel.org/netdev/0ee94fd3-d099-4d82-9ba8-eb1939450cc3@lunn.ch/

and the test of that thread.

	Andrew

