Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FB6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8CUEKu0j9gFTq9op+uSbKNLjrJ99roV2aNWqSdvKwg=; b=2VRtBZAYaF1yL99AWFXCGl4RMF
	cKjfVA2GiDDbsrybOAWfo6LwmvQybR9Bui9W+qRAL1mSewhRwC48v63uCjcjklg6kbnf6YUwXYsBs
	+4CBAPJltK0TCjUd/1/BRrVnOtnkjnA8TaMDFL9MKoqEz3tbj8SRTnblXw/BCfXJf64rYBD3fZFmz
	0F2bIfWh3z6+42ItdbxQqolNrTbNe20cki5IwOSsyM1qCByLO4sZWv+FbvbU7epksmMDbPf1GJem7
	cy9mBhxJ4vnzCbjGAyoJCxFv2E+viMooPW1DYpyeWTlYYSfEdFiB0mfaSq1nflVLocPEIrPyzFcQp
	MjkUkNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44Zh-000000008wS-1mYI;
	Sun, 13 Apr 2025 21:09:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44X7-000000008fS-0OAb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w8CUEKu0j9gFTq9op+uSbKNLjrJ99roV2aNWqSdvKwg=; b=oyJpRXa5ZcqD9ltwl/vAki/htn
	VKWouhUhHmYuWVVcApFrVcQCCj0F3yj8NctnS9olrFrIg8FCgAk4MbNmNT2juS4Rz+Y+S/7AvPnBu
	G8SZqticmjJt10Hw1dgb3oBtPsfLnoIEjAJY/At/vKEjomS2vf19Rut95y1Cnz7SBCbY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44X2-0096H4-Gf; Sun, 13 Apr 2025 23:06:24 +0200
Date: Sun, 13 Apr 2025 23:06:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/4] net: stmmac: qcom-ethqos: remove
 ethqos->speed
Message-ID: <1446b6f5-b0e9-48b9-aa49-8e5f7065529c@lunn.ch>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
 <E1u3bYQ-000EcK-9K@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bYQ-000EcK-9K@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_140629_151333_8781678B 
X-CRM114-Status: UNSURE (   8.90  )
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

On Sat, Apr 12, 2025 at 03:09:54PM +0100, Russell King (Oracle) wrote:
> Rather than ethqos_fix_mac_speed() storing the speed in struct
> qcom_ethqos and then functions that are only called from here reading
> that speed, pass the speed to the called functions instead.
> 
> This removes all readers of this struct member, which then allows the
> removal of the two places that set its value and the struct member.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

