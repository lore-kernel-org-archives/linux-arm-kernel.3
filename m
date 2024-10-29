Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1910D2AB3B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6czXhVAHI+Aj53SszoI85D54nutkwF1EOpphBfzmv00=; b=SYCBanqZWtUcIOfgIrdjOMIPsc
	Tb0gFwK+Df+0RadTDhr67vWwb8E7HbSawA7Uei6tVp80p5jqaQNk05huO89u+sf15ZZSUqfPlZR2u
	aumj+TOokONQnfv2JQ1ggOD9FCOJvM9dK2WmO1qsTtVQJ7pBAhWsFpasR1+pJpebY8cCObhY3Wa/b
	+9PJQwssOAJfviUFC+3Zs0ouk9kW+ioXFLhOoHO7IKMObNRpHX1etIKKLjJoSelp1vsWGZn3c+QFc
	SgLPL9gHy6deMxZ+gW2pg+55h+JzwHm8hjxETOdu3AsdemUA10tlSJlYsfc5FI5Bsn46fQ0EeXePA
	esVuHsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lVk-0000000EQie-1uQO;
	Tue, 29 Oct 2024 12:39:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kw8-0000000EKN6-0WPa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6czXhVAHI+Aj53SszoI85D54nutkwF1EOpphBfzmv00=; b=TQEtlY2zhOO4ALkUThR21uLZb9
	OmCFByrQY0xfNARMdEVqP5cCEQPpIRFUA88St0UjMaJZN9sWzEEiL9wqJXbLg6IsnR7re+DgKaRrB
	vsXBDRaRNaiKt7BjHxnh3jfyQX3KPtZKakC+E6PNy0jQIP0Ros4ZQ2KkkX7MmLgV0/3wE+RxHCI1B
	CFjTVv725RFjj3ZO7NenML6uhsQJOSe3F+Z9znitRJkWBCSg9lZMb0RS3CvDlVQkSqg/53iRguemT
	o56euUnxgeS1jFtuHlcL7yW70SGBz37eZyP2Hu2PlLEefL3WvnKFyuqMmgSaXzzJB/nSJwKBIfvnU
	D8azy1Ow==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kw4-00000009tFu-3TWr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6czXhVAHI+Aj53SszoI85D54nutkwF1EOpphBfzmv00=; b=InZqk2jv4yMQOc1S0pG28Ej+SH
	9Lzde+57azc2QoVtBYXQFaDHVO/kRF+VobNMxHIMwOZTbCylqrAXE7r0OwlpViqhlowNoYJSkbfXi
	ymfyc6GnL/ztmIyV3dtTF63jMxeNlNUOLxsBDjROJmArJBzUI/vJYuQZhkp7sa0zISw4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5kvl-00BZAY-JE; Tue, 29 Oct 2024 13:02:37 +0100
Date: Tue, 29 Oct 2024 13:02:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
Message-ID: <60050f6a-4cc5-4c78-9a15-7ee3c1c0bf1c@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_120257_168267_0B110B56 
X-CRM114-Status: UNSURE (   7.88  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:47PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

