Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC3CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVBouDME3yyB4oBFbpIyijCZ2IoHFwuH0Y/Nfu3LeAM=; b=eAdIMLX2gPeKa4x2RxKTmIitcX
	islsDCQE5ufre7eeCfZMNpOb4ndGZGAQPy31PZRPA37Gys+cMirI3dqJ9rKg8s0Hj+JIx4/OxeZ/6
	lk9sM0Da6IRlcMgn/3H7PkP25WGwm3iWxiYtorXhtHwu0R2CyBS8AiXkx3kXHG/vLunBvg4FvNpYu
	svW/+9jq3OIHABWhHSzQXerPWhG/KPm+K0RbmroHpVFBRi+xODma7+VhB9CoaclNMgIrkvaYuIi33
	7mLEUL+qoShs9No6ptKctHaLj06ZyFYFaNdtglucDiCnUDoQO90v0dM5leuTzyASgx+VXaPOtaTaw
	qkuWnSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAPo-0000000BRCJ-2jka;
	Fri, 12 Sep 2025 20:30:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAPl-0000000BRB2-42mo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 20:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mVBouDME3yyB4oBFbpIyijCZ2IoHFwuH0Y/Nfu3LeAM=; b=YCPcdasteYKljjzN0JKrJrS6lP
	l3fz/ljsVsjqV2C0ALlax8u6tA3uvM9WaSTUQTrQFM9giuHCkSQwHRgmi4fihEeo6RhZmjkVZ4FqS
	WJNH9xfAocflQzYZpnQKzblj9gY81xljHdYLn36SnAVt7nqshJZidrxEdFFOgk/07zR0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxAPc-008FmE-0B; Fri, 12 Sep 2025 22:30:28 +0200
Date: Fri, 12 Sep 2025 22:30:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com, rmk+kernel@armlinux.org.uk,
	faizal.abdul.rahim@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	boon.khai.ng@altera.com, 0x1207@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	emil.renner.berthing@canonical.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v6 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <7c81cd46-36e5-4280-9a49-8924a7bd5f92@lunn.ch>
References: <20250912055352.2832-1-weishangjuan@eswincomputing.com>
 <20250912055702.2939-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912055702.2939-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_133038_006108_F28B4BE7 
X-CRM114-Status: UNSURE (   7.70  )
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

> +	/* Read rx-internal-delay-ps and update rx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "rx-internal-delay-ps", &delay_ps)) {
> +		u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
> +
> +		eth_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		eth_dly_param |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> +	} else {
> +		dev_warn(&pdev->dev, "can't get rx-internal-delay-ps\n");
> +	}

The binding specifies the X-internal-delay-ps values are required. So
this should be dev_err_probe() and return -EINVAL to stop the probe.

	Andrew

