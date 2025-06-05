Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A0BC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 18:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABQ+R4pwnorBV2z4nO2cVlEZNgaZTPGaBG6lJM0Zb48=; b=2u6fRiNp5hCPr8TxqbJ4bQx21G
	nwZhD21ZMhK2FZ6hIUjgLgwqS0dJdf9Kh4uzQUeb98CRsfy97KxDeewwL3GU6/c4JEYOBwfKgO1iK
	qymSqTFctGe8ZaTrTnWFpTGnDr0TlpxFMJDWUBnad+oFgBPnULkdxRSRAUiSuQohuBBQ74zyN//88
	S3tDjn2svP9JmO+m6QV2dIoAbbJ/GLgpucQYN9sG/nf9bnXPxueGDfZAdGZ2P1piYyI1prslkqr4n
	iZj1BO7CQ680Wu2CijiBlkrt0xN5g7xdLUojfuctSVpcA2zLoY6yYJHzGQmg296wqqq0rL4nNBXut
	WtlYkmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEw3-0000000GDNj-1C5C;
	Thu, 05 Jun 2025 18:03:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEtq-0000000GD9v-1T6o;
	Thu, 05 Jun 2025 18:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF47D5C592A;
	Thu,  5 Jun 2025 17:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B252C4CEE7;
	Thu,  5 Jun 2025 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749146468;
	bh=FFaPKo3Niu9RqMBqouhyjsr5pkbat3ko58gh0kIaygI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsISSBDmLN/LacoCwnMZjX5AwlQ7v2Rd24XpsPDo7CB7dKlFPq3TSnSLcJbXoqe9z
	 BLONc5ERjnWhh8IkPkc+EPWwo4OpF5rIWXslyj63jMMkTqwkCpbUw3S2cqFDsOYtvY
	 2CM2Vv4P8LwAtN6HwUx/HHYiTM7BuFqyBrfWCjMjSDa/cVnkD/IK+0wx+z/ECTAwMI
	 EIUgu+D3+HqTv1joPgZO+gYKRffxar6Eqttl6hOQyhmyt4RO1BDynBzoKtjduYwwQR
	 nwop7WMcExp/55hMMt/dejvUObz0mERk4Cx4e/8N8VQLRrG1gOPuuMQwcIwZXCwVGP
	 elx6AsZdDtHew==
Date: Thu, 5 Jun 2025 13:01:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, vigneshr@ti.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, richard@nod.at
Subject: Re: [PATCH v3 2/4] dt-bindings: mtd: microchip-nand: add atmel pmecc
Message-ID: <174914646334.2943943.16175676311352783500.robh@kernel.org>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602053507.25864-3-balamanikandan.gunasundar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_110110_432662_BB4E7D14 
X-CRM114-Status: UNSURE (   6.94  )
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


On Mon, 02 Jun 2025 11:05:05 +0530, Balamanikandan Gunasundar wrote:
> Add bindings for programmable multibit error correction code controller
> (PMECC).
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt    | 61 ------------------
>  .../bindings/mtd/microchip,pmecc.yaml         | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,pmecc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


