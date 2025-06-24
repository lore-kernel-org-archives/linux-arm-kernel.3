Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55962C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX+aDmUm6igolpiXgNXgCg/cD6t2NGaw3+p//ISLo3Q=; b=AS1jMiqHKjzeCm+wTFbS51gjPT
	sdhKRZsDsQt6vivtDNS0IanGeUqhJJ3CizMcHRZH51kahbD6VYRnzOnhGiHsmExf8wT7LBE/KpkQh
	uMKZOCuv6LQ9w3CMIsrb6sU2Xguu96KkFCl/15Kt5/mgVuUAbP7dkXWzExbOlZhwH02wW7OrrzNNl
	0ZP754mhyhQOxIyE4DwGLkhGTVEhCWG+j1hhrIVWc6GtLt1JFQV79KhXua14jcywvz2BrOVCAkgl/
	rtJJXE3QdNyM1WjDiSpKMhQ0xe7LyXeSOb9adzJN8ocun+9aPF4yPJJSqgp4pHcZynjlFI/2dh1sV
	YECh877A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTz4b-000000052ID-3vYd;
	Tue, 24 Jun 2025 08:32:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyuG-00000004zwv-3MUG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 08:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kX+aDmUm6igolpiXgNXgCg/cD6t2NGaw3+p//ISLo3Q=; b=iYp9hcqx4xAC+0WkrlnifTG4Mz
	cUn+pSx1/5zpt8JU19zea/s0fSQ6x8RSCV4pwydiFdcH64QPDCCNHGBLNIUgpF72fZ4rBEWRQi/VQ
	Wy0emyklkRwzN9GNtT5ou0HV98fshE9WLPBil6b4Qpd5Dddc4Yx7h7Zw8TzA5KQVQ7kA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uTyuC-00Glop-49; Tue, 24 Jun 2025 10:21:24 +0200
Date: Tue, 24 Jun 2025 10:21:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com, bb@ti.com, devarsht@ti.com
Subject: Re: [PATCHv4 4/6] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <bf784ce6-aee7-4366-87ab-f0f79f8ef28c@lunn.ch>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-5-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623141253.3519546-5-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_012128_838561_459BB7C2 
X-CRM114-Status: UNSURE (   5.94  )
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

> +&cpsw_port1 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";
> +	phy-handle = <&cpsw3g_phy0>;

Does the PCB have extra long RX clock lines?

More likely, this should be 'rgmii-id', and you should delete the
ti,rx-internal-delay in the PHY node, allowing it to insert the 2ns
delay in the normal way.

	Andrew

