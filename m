Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07022E63C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACFr+emG6c+HSjLRFGH9IDZ5SyzcIYaTDvRfsT2A1dc=; b=0sWHid0W/Wp7WOhaYiYJbbN/BS
	92MnqT70toNovmE9zowr0qQFjfOKrEMtljKnyTYXba11deLbZp0kMOpCOqV9G6sCQOjK7XygIziqO
	enKETAHNUxoqf7tuJ0kK3o2XC/GV9nh1hMAIs6CwoH9Vj9daaszarlxkBtd/pbkNNo4sr2TsTHcAl
	szd4bzyHJURzf4UXzC590KmS5aQhjS9Q5r7VIVaHNysLSOTDdP5dJswWqWYTx2QIsseTaKehdQx+A
	ROQft4seviziD5KTXBGoTGceSwPqF5Ejn480QlfOhrfWaB6QGq348b8hrTDTtLYfqOrlUI3yl3PoH
	RJQiqBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk2yy-0000000BJZp-0tx5;
	Sun, 25 Jan 2026 16:29:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk2yv-0000000BJZT-0Cwz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ACFr+emG6c+HSjLRFGH9IDZ5SyzcIYaTDvRfsT2A1dc=; b=tTQDhVzgB0hC6erW+zr3mcBAGc
	POfQbcUIg5mXpjYJXoMQGcybC0xaOfWWKeVN3jFmL2VEXiwBFlJ1TWWjDqtOCAt35ftalR021hKjD
	fkSTvrfW2zPzOaQrkfvJ2iZDoC3aG1oGffs2GWFJJ7/RiAU8OojRZ1PKc/+9b+yC8feE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vk2ya-004coJ-8G; Sun, 25 Jan 2026 17:28:36 +0100
Date: Sun, 25 Jan 2026 17:28:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Elad Nachman <enachman@marvell.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, pali@kernel.org,
	mrkiko.rs@gmail.com, chris.packham@alliedtelesis.co.nz,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: dts: a7k: add COM Express boards
Message-ID: <38fdefa0-a13e-44e4-918e-d2e54c3fb668@lunn.ch>
References: <20260125152347.2518538-1-enachman@marvell.com>
 <20260125152347.2518538-3-enachman@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125152347.2518538-3-enachman@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_082857_113469_37EE62AD 
X-CRM114-Status: UNSURE (   6.55  )
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

> +&cp0_eth1 {
> +	status = "okay";
> +	phy = <&phy0>;

Documentation/devicetree/bindings/net/ethernet-controller.yaml

  phy:
    $ref: "#/properties/phy-handle"
    deprecated: true

New dts files should not be using deprecated properties.

What should be used is:

  phy-handle:
    $ref: /schemas/types.yaml#/definitions/phandle
    description:
      Specifies a reference to a node representing a PHY device.

	Andrew

