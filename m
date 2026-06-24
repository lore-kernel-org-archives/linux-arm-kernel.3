Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4D7CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPpByjy7W5L7XpVcP76WXAwInbwRDBlAjul1A4H6MFE=; b=f7mfUtNyOTXHDPTbPnHoIFn0qD
	tImZ8G0UhfGdq8dFgEhzqv7j8MqftLFrjMaRBpCxoOMbccsme9qD0wot/Q8M1SnY01DoOq+RGud9z
	aWejY+tQ03m2bjOtNNawwYMlGuwTUMQteshNsY3xsQgCIp0qxNXlRPqLL3mTuiQA1WTLm97RdM6tS
	Y0ppNE3hyrtDxyI1sKZ6cKmwUEDFavpGm3fIwXygYf6CBWgSN44JOdkcwHkYk0ot9uQPGx2CGg7gT
	3nzytVulokbzD6RH+HWyRb1y9fVrNzsUSBUSssJdWi3txyMdMqH8t0SZksqH8L5BT6dF8C5iFLhMJ
	h3zzXzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPk1-000000081aM-0Qs0;
	Wed, 24 Jun 2026 15:42:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPjz-000000081Ze-128n;
	Wed, 24 Jun 2026 15:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xPpByjy7W5L7XpVcP76WXAwInbwRDBlAjul1A4H6MFE=; b=w9F4ID5ojrpJx1Mc3AY1BPTJS0
	Y5BQyHlaR0t1aG7fVvGNnP1lQ45Mw+Pjq4pqi2GQg0gr+VtY9lkQe3rrNDymgupHQWD1MTmLVLTNZ
	s9aMhTef0+LCMRs+rh1lSAw+ELiw2UoO87AomQx71ltMD20iNUrwlcSSVh986rFQeNSU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wcPjq-0096u7-99; Wed, 24 Jun 2026 17:42:06 +0200
Date: Wed, 24 Jun 2026 17:42:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yanan He <grumpycat921013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Wu <david.wu@rock-chips.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 6/7] ARM: dts: rockchip: Add RV1126 I2C5
Message-ID: <1d1d3618-b73f-4c38-a817-b7d053687497@lunn.ch>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-6-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-6-5aef608a3f64@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_084215_304431_29C553EB 
X-CRM114-Status: GOOD (  10.60  )
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

On Wed, Jun 24, 2026 at 04:44:43PM +0800, Yanan He wrote:
> The controller is present in the SoC and can be used by boards for
> external peripherals, such as an RTC on the Alientek DLRV1126 carrier
> board.

This has nothing to do with networking, so please post it separately.

What i would actually like to see is the patch adding networking
nodes, because my guess is, you have the RGMII delays wrong.

       Andrew

