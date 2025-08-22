Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D4CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0V9vnhvl7kfzNO/a9uciBu9rFyDt7meyaj/wnJfH86E=; b=kFRXws1/HOSbcjAMAG+ZjONdPq
	L9dw9bHL8ftLSzj7Tg7D6Ef/Y7SQdt5ZmKvOq02LI+xtFT6jBw5FUNwwKeL/scvfrwjcibWquQGoB
	dpdjzV3juuuX67Elq10DpgVdo3k4T3C5x511vVcrgFY5AjCRqb/ypnnwtyTZaqcNXo1o6rDEmkcS+
	T128+/wNU3OgSX6PXFtB5UjBPl+gyUhqqcy7a8hN+DCM9il+im4OqDx6mslF4gCWr9TUNdMtBCUC/
	zdy/RGN4ga+1NTYb9PKidTErOghPF3FZp2wU0+9qiezuHKNhHGqh7YqZn//ZHtqXiRQkS5vqX4CzM
	Glxc3few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqf-00000002Hzo-3n0R;
	Fri, 22 Aug 2025 11:22:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFOC-00000000zxV-12VF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0V9vnhvl7kfzNO/a9uciBu9rFyDt7meyaj/wnJfH86E=; b=hE9vcDcvu8i7v5Uh6vAfLCZ32i
	GZ7mT1gdrfNFREwtqr88Ijj/ipJHSsfGjhcO4A/ygORSA94FThY1eRtgRDRs+TwVM7ZECF6tkQiYK
	ynhgDpw8MDLJIG2eN0nJmK6tDak86IkvU19ggl9pv62PQBr1tAgtNSHTvObueR06Nt3s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1upFNr-005W4E-6y; Fri, 22 Aug 2025 02:11:55 +0200
Date: Fri, 22 Aug 2025 02:11:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	howard_chiu@aspeedtech.com, arnd@arndb.de, andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [net] ARM: dts: aspeed: ast2600-evb: Correct phy-mode to rgmii-id
Message-ID: <6a3d7eb4-c091-437f-98f8-2b8577e539a7@lunn.ch>
References: <20250821052555.298860-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821052555.298860-1-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_171216_284696_CBA0B848 
X-CRM114-Status: GOOD (  10.94  )
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

On Thu, Aug 21, 2025 at 01:25:55PM +0800, Jacky Chou wrote:
> According to the latest ethernet-controller.yaml.
> Since there is no RGMII delay on AST2600 EVB, the phy-mode property of all
> MACs change to "rgmii-id" mode.

> @@ -123,7 +123,7 @@ ethphy3: ethernet-phy@0 {
>  &mac0 {
>  	status = "okay";
>  
> -	phy-mode = "rgmii-rxid";
> +	phy-mode = "rgmii-id";
>  	phy-handle = <&ethphy0>;

How does this change actually work?

I could imaging such a change as part of a patchset which changes the
MAC driver, and how it handles RGMII delays. But on its own, how does
this not break the board?

	Andrew

