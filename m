Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBE4C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iKvs8dMHmrcw4r/C98xgeNhgYefsrbbUKWhxHEKgUA=; b=UW7yG12LO03xY9JCBEw8yz9GHU
	DnJZ6HbHYR1Wcfi14/LQg+BV0+B+LXtrUb2Xnlme8VC/9ZBr/VQjLbuVW53NTJAYwbMQQi0xDhLmg
	tSyHzsxqU8WiS6NZqgKQXcYfFe0doJozdBlJ1qfRVuflSEhLEW1rCZisLGveeixfPxhunS1SWt8Av
	CVP/k4n501wrGm9sEfyc9xsdnIbCgPy6M49YUQVtEGBFZ1hRI6Iwc+Wte/A6b7updO+6kBtIAp9IO
	SO1gGSPTWQmTlp0u4hTVfN+cZX75E4tQYqi0llrycp3hSHykzZ+36MDRkjW5CQgYQFPewdNY4IqmR
	iVF0T7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyIU-0000000BCUg-3WNN;
	Wed, 18 Jun 2025 19:18:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxbO-0000000B5Ds-3YJD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 18:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48DE361F1F;
	Wed, 18 Jun 2025 18:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3F6C4CEE7;
	Wed, 18 Jun 2025 18:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750271618;
	bh=Qvk01E4K4eKwx+8ladXQ0z7hVsHIb+7XaYBHTXV1Qho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzYud4bftYB9pjydcI4H4I2BpBLdO83lNw+wguQau46tp6Sh0UauAF4ND4tOpOpLP
	 D2/Kf8q0knJy5v0b1oZHaSKTA3P2gFtLrDxnRRjOmXCsfz1C8tnF8niME+kTuWtXav
	 CbT8TSSE6zTs9qIQoa9OQtf98mZ/Lx0dYzZbc2ViKVGru0vTDkM9w9P5HpHA1p16hJ
	 MOBmcZfOBbgBUozS+2zstmeSdPwOdMynK6nwraPDiwIJMJ4eOg6cNdh50DkWoJ19jn
	 ZCw0l0fqTM0wMXyELOFqtPjq5UaoY6mCns0psqj6uWdg+NBrxJ3VthF6OHpaOBqKXd
	 xZvDXhGQThkMA==
Date: Wed, 18 Jun 2025 19:33:33 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data
 struct
Message-ID: <20250618183333.GW1699@horms.kernel.org>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
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

On Wed, Jun 18, 2025 at 11:41:09AM +0100, Russell King (Oracle) wrote:
> Provide a structure for match data rather than using the function
> pointer as match data. This allows stronger type-checking for the
> function itself, and allows extensions to the match data.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>


