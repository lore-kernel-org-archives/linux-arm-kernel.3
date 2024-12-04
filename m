Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D14E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N0iHfCuUo1t+gQYjiRw3/5D4nJ73sKAtZ2d4ukZ7mM=; b=IbBRQ2EBAzBYf0QdXmPja4NAyn
	9vHLkLbheKYjeHBd2gPK0gIoqqwU5Ia4AsVH/LIVTpXWtKdOuNryGdNJbJd8TluAGTyxTheH+6asE
	uvLZn0YnSkZis855aOKHCxPocchuxPase2bzyhzPpVT3S5h6BCYgYkQUVA+ch4Zp6OJ70HFXJ73gz
	so72u9NLuaBWSimPmtNpiIL6sYRQ4/e0noIqS8CaE6Dwpt34hmHTSLWq6qIiBQOTnBXqk3X6aqeaH
	HVhMtYkaQjRCM5VBVeyRxOx8bnCnFcwwC14XD0qeCCGi8z3SQrPhmIw7GuEREnz1ezMM6Ms7/XyWv
	uRvtcI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIry5-0000000D8Ey-3ugS;
	Wed, 04 Dec 2024 16:11:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrrY-0000000D6IZ-421I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0N0iHfCuUo1t+gQYjiRw3/5D4nJ73sKAtZ2d4ukZ7mM=; b=OZ7R/FvW6YYmpKfSuzSQXMe0i9
	Qg7Ehbb/+KkZZqg653/YtBwt3dvKIoY/53ekuSBXEuSSsfsko4iJNgvJF2vHwDtK5e8HExBf3mhiY
	Qyhho/Gb3e21CmjxS5ya6l5xynWKMGmHrNFjUKPcIB41hW16HP3gO4hhsDppg2uZq+XI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIrrV-00FEDI-1S; Wed, 04 Dec 2024 17:04:25 +0100
Date: Wed, 4 Dec 2024 17:04:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default
 configuration
Message-ID: <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
 <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080428_995571_DB740CD8 
X-CRM114-Status: UNSURE (   8.57  )
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

On Wed, Dec 04, 2024 at 04:56:47PM +0100, Marcus Folkesson wrote:
> This configuration contains obsolete configuration options e.g.
> CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.
> 
> Rebuild this configuration by run:
> make ARCH=arm mvebu_v5_defconfig
> make ARCH=arm savedefconfig
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

You probably want to wait until Arnd big removal patchset lands,
because this is going to be immediately outdated.

     Andrew

