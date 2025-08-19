Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9DCCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ybc4a5zVNR2n4RONlCYCS49NxANnn9uP57Jdk+jOlDY=; b=D9kqtOsnea947H/MCHw/72ILAW
	8rvFF4VdNTyiueaMBmIzIEqYAE3hYVOAZzc0EwxKZC0dy122QJygMtv478iJS2e0mFc0WBW38a/Bd
	+4BQSuW64D6hbxK2UnLN81X0xQJkHNWnaBNDBKsc3MsWi8hD9sMiD/94HGkEXwXQe+EUgerw4zAhx
	ohx6X7T1eBa2QrjjgYtSqU6WLgGx/w9h/hgcorGXDrQuqevjSoXTYyHDqWMFWoKw2cpYw6w1299TW
	IWs6W/+hcRy6V3vXtkZ2+wnG1j2souG8abUuHpd9C6oc/Xa13B1wDzciu45Hp0goBVwxtaKjnLLE4
	ceiI8wAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRv1-0000000BObq-3JYc;
	Tue, 19 Aug 2025 19:22:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOtI-0000000Aydu-2sMn;
	Tue, 19 Aug 2025 16:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ybc4a5zVNR2n4RONlCYCS49NxANnn9uP57Jdk+jOlDY=; b=d9QvesH04zlFpjUZ2zRbNsJtME
	uSnMz3e3gbt8KUCCTclrt+0NDJ+xblcwIx5ke8tVTAxT/L9V2P6WkCsGxOCTYcfCzCmiEcUgscpfW
	W7vfoHdSwrvw4NfoUKwSEhB2nb0Z4Q5ZB4s7UB4hhdDnAI6MWnugqDl6xBSZiQBfRRT8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uoOtC-005D9T-Q0; Tue, 19 Aug 2025 18:08:46 +0200
Date: Tue, 19 Aug 2025 18:08:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mateusz Koza <mateusz.koza@grinn-global.com>
Cc: angelogioacchino.delregno@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com
Subject: Re: [PATCH v2 1/4] arm64: dts: mediatek: mt8390-genio-700-evk: Add
 Grinn GenioSBC-700
Message-ID: <350133ab-a116-4555-8d5e-90b718c7b0e1@lunn.ch>
References: <20250819130231.181571-1-mateusz.koza@grinn-global.com>
 <20250819130231.181571-2-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819130231.181571-2-mateusz.koza@grinn-global.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_090852_722155_4C3034AD 
X-CRM114-Status: UNSURE (   6.08  )
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

> +&eth {
> +	phy-mode = "rgmii-rxid";

Does the PCB have an extra long TX clock line?

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

> +	phy-handle = <&ethernet_phy0>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 11000 200000>;
> +	mediatek,tx-delay-ps = <2030>;

Please try setting this to 30, and use 'rgmii-id'

	Andrew

