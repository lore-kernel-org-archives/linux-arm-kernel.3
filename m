Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611D2CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUjvm9eofoV1ResAkmWD1i4gWOlEKZtbOKhgLDy60X4=; b=bLGtmsRWTo0zxrvQPjkr49R3lP
	w0t9TqrXX6vyej3klzdQIEl4jT4uYKZLiHf3x2reSI/RZjS2/5x2d2Y0h01FL6Kh4HE8XgWT1sYvx
	D2wzleNjbDmreakZDpQEaNa4hdlvUpkIb9+5mjkeD0bYKuAzCdKTaN1IA73huQwLjrH4ArAetFtnK
	Ha2I0N0JrEJQXomanJFZYdQDKm/tIird73pKvGteVR0UsvVKxCBui4rCKTftgKmFtrMxGnZsOgOCJ
	FU8U5TtaXCPEsnZH4EhAvoWLrt3EpOu2Rq3TmlGClFImHqIKrxx5MILqpc6I81khWIKYv01/hMKwb
	4/KcNEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnOB-00000006YuZ-1nUt;
	Wed, 03 Sep 2025 13:19:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmUa-00000006N5a-1eA8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YUjvm9eofoV1ResAkmWD1i4gWOlEKZtbOKhgLDy60X4=; b=Ah0SU7TeDcUCOSpr1QDkS2w9T6
	X1BI7rrsOnffJ+UGQkLG2e6hIadpm3DWpHV8Jq3DjceYSGhp+RQIIAIlgPUujdcjUNq/pq3se2TlC
	P5ZGujTnFTicaOaeReDJvlWWfKE01m3xQ0exgGklDzV6Ynb/WIcr2BEMNEQfTps034ic=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1utmUS-0070oZ-Tc; Wed, 03 Sep 2025 14:21:28 +0200
Date: Wed, 3 Sep 2025 14:21:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: st: enable ethernet1 controller on
 stm32mp257f-dk
Message-ID: <5c49e94a-9267-459a-ba6c-70f3763f1a7b@lunn.ch>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
 <20250903-mp2_ethernet-v1-2-4105b0ad2344@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-mp2_ethernet-v1-2-4105b0ad2344@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_052136_431779_B882E2BF 
X-CRM114-Status: UNSURE (   7.99  )
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

> +&ethernet1 {
> +	pinctrl-0 = <&eth1_rgmii_pins_b>;
> +	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
> +	pinctrl-names = "default", "sleep";
> +	max-speed = <1000>;

RGMII naturally has a max-speed of 1G, so this line is pointless.

You only use max-speed when you need to restrict the system below what
it would normally use, for example if the PCB is badly designed and
the tracks don't support 1G, but can do 100Mbps

	Andrew

