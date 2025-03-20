Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE17C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FR+eQ+WzJL7Tjxm3+Hta3Kxi73aadFo8zNaQFLEErPA=; b=rz8zwcMai3a+s/3tzPHId2R2ep
	hdKC7p2X6/kMsEFBNmr0PdQYP4Js41OkSY6+qUdhq5Ji4V3h0zV740WLW7ijSSBL5VaejQopr/9Bu
	6Pm9XZsdCsh9bPl4a8PZY6FCBnzzF2WiWYaomWW4OYjYkCO/P0uHJ2kbA2gjHfY+Qf40mhtxPzHCL
	Xde8s7dUrQhmJeXVEzG7KUO70pmRo4QUAHchThsaoZhL2+1HXmhsUdR6ZptT4lzC0BqwKuTSONysU
	pr6TY8U5a7MaZ8ZqROgTajFl0FkJ7ia+jBC+Rnwsav31RnfR+Y/9MjLlVx0I9z1TcDVHU4LJac4UR
	HNLMhggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFRL-0000000C9jH-0Dvw;
	Thu, 20 Mar 2025 12:56:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFO6-0000000C9OR-3ap3;
	Thu, 20 Mar 2025 12:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=FR+eQ+WzJL7Tjxm3+Hta3Kxi73aadFo8zNaQFLEErPA=; b=oM
	mVsm3jgLmdjHVv4DBBRVxK2mZA9OtnEVTfxPF+4/FNzEz8qjwBcF8gynanENUUD5qGys/22hH9fOj
	kraGR7x8uPtaKhkDd4ep78y9ba+vRvapAhjrfNOYocmcnUao/p5ee1gl6P49U2dGN/A10YCPk8Xlb
	a6CrANh/FoIhnmQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvFO0-006TYA-Hp; Thu, 20 Mar 2025 13:52:36 +0100
Date: Thu, 20 Mar 2025 13:52:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Correct gmac phy address
Message-ID: <a9df5da5-b37f-4d59-9cb4-1285fe25e3a7@lunn.ch>
References: <cover.1742331667.git.ukleinek@kernel.org>
 <6b8ef7e37e646f4cd399ceb2f46017644d76da9d.1742331667.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b8ef7e37e646f4cd399ceb2f46017644d76da9d.1742331667.git.ukleinek@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_055242_893851_09B18289 
X-CRM114-Status: UNSURE (   7.30  )
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

On Tue, Mar 18, 2025 at 10:08:45PM +0100, Uwe Kleine-König wrote:
> The Motorcomm Phy can be talked to on mdio broadcast address 0, but the
> actuall address is 3. Adapt the reg property and node name accordingly.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

