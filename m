Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F850D2AB33
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28P+nO6+7LRY7tiN18rzw6ddnXEFrM5ez8f38EAhSdo=; b=AyUhvNMZM5aGGbYaM/1khay7jr
	15+vpRSsynjYBRbMU7UWd7oCtmlEqRKO2q99v2keI0JOsuO3PthtP2k57sRso3cCewhrl0NlI7MQD
	nWz0Zf8HW9NUkOCdIPmIQf8fdph99sl+dqZOAsYrWtZvL/iM9tkZmThZjbTaKDC6LJk2suiJtq7T3
	1J24PowanOyBHpI9xO1KadKcKewq4mtfPn+TmFznA8xBYuZwv1bE4n9se49D0//rAUFJX8Sck57v8
	fGzGqDTj6/nY4dH7CR27zC2DBrJh0SvzDjzzkOdy+t5HNQe8Wrz/4YsLn51wmC7rrFnhrHb7diXZE
	HrFLSJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lYy-0000000ERcQ-1Fw6;
	Tue, 29 Oct 2024 12:43:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kwU-0000000EKTa-2483
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=28P+nO6+7LRY7tiN18rzw6ddnXEFrM5ez8f38EAhSdo=; b=S49y2Z0hD8bs7FaHz7zevpzxLz
	ZUGNfYifgHrsLx4K1qQx1xmz5dUVD3VNi80GSC9AM+9ziMnyjP8Z+KY/gP8pIRv7TSwERBVXv34wi
	FR5CmSyVTWNc3uapJrmHuXbqLlkdcJbenqws1vac/Q/B2PUoUkIrahfGpdmy9rwty/68Pw1nJJYmP
	HtxW/rFltWSsfcNStIrEZgi1ZMPjKPX9WIwS9NPPvmppTMQUp0fhN0jyl8YjvfXS7035wQuts6dsX
	RP9Vi/5ml2nQqp2N/1tFEeQjZ/aK04ZcqMXVm668P3oLee66W5J79xcx2jllLY50DQM4QZ7DoI0Xx
	xKLCwUcQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kwR-00000009tGl-24y5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=28P+nO6+7LRY7tiN18rzw6ddnXEFrM5ez8f38EAhSdo=; b=1oJV8saTVv87A+m+V5gWXuiUpH
	Dwzrq09LUqTJAkRfeOW3SogL96ZdPvEFFksgX/EPw1EUa7wTndoU+zYQUvsri3FTLP9soXhVkoQ1z
	eC/YxqcpbHmWw45Re5APhTb+QRpavTtIbb/6515gY919BH1odXF/dczA1l4+uVIvVJH8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5kw8-00BZBh-JF; Tue, 29 Oct 2024 13:03:00 +0100
Date: Tue, 29 Oct 2024 13:03:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 06/16] net: dwmac-imx: Use helper rgmii_clock
Message-ID: <af44d346-d2dc-465e-b6cb-6c40802b77b7@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-6-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-6-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_120319_773580_C9F8FE61 
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

On Mon, Oct 28, 2024 at 09:24:48PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

