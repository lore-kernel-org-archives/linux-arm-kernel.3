Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154B8D68B27
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMrMd96M8K1ChNocSe4WNcB5c2cu4idUNGZaele1Xfk=; b=DahNZYG5txGWtgXf2s+AHL1xPH
	CPdT5fSXLNSZphCP+1X8NDr0sVLydRsIEKQZIScTrlEExiadIH2pDz2KMQ5L2Hf6suS14cbLntzK6
	SkwLlwu/KNoVNd+ABGgmxiSadx0jDQ4YqyI6VHyqOEnIcoU48clHhC4k6giNr48jUx8k/9glIIKCk
	W7rvl2gmTP6vqSP0YjAukOB+gqwCCu2tApVoHW5FXO0f7w/F5nF96i0Kh29cZu54dxFIvFFUq3gmu
	uoCvSki3A4ztPwb/s1niXQwxkp+i5QNwt70DfUqc9oUnP8pqmUv2YiB54iee+kiJf05JRTB+cHMru
	Vddfve4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaRR-0000000A8mZ-3MPr;
	Thu, 14 Nov 2024 14:03:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaPW-0000000A8Td-3oU8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 14:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MMrMd96M8K1ChNocSe4WNcB5c2cu4idUNGZaele1Xfk=; b=Qo6IhE/KGUP1kWfmSbapGlQDuC
	tWxXuZDslASA4YE3ISImFDG2umMExvJbJ2r1rSH/YowKg4qVlgq5uTbuAV+ms16e6IXGD3HSzd6RU
	IKRBN3Vn5VBksqWaIZ43TJWD6dbG9u+VQ4TIddp2IYjvq154Rz+hGp2pOI370rP86gTk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBaPR-00DIqR-80; Thu, 14 Nov 2024 15:01:21 +0100
Date: Thu, 14 Nov 2024 15:01:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, salee@marvell.com,
	dingwei@marvell.com
Subject: Re: [PATCH 1/1] arm64: dts: marvell: use reset controller to reset
 mac
Message-ID: <2ade2839-1e31-4124-aec6-7382c3da8b70@lunn.ch>
References: <20241112071350.762111-1-jpatel2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112071350.762111-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_060126_982625_3444B11F 
X-CRM114-Status: UNSURE (   7.05  )
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

On Mon, Nov 11, 2024 at 11:13:50PM -0800, Jenishkumar Maheshbhai Patel wrote:
> change mac reset and mac reset bits to reset controller

Why does this look to undo what the previous patch just did?

Please add more to the commit message, explaining this and the
previous patch in more detail.

    Andrew

---
pw-bot: cr

