Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822ECE8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvbRq9bCGh/nAgOWupKkqxRMKWYEjgy9tA+ZYZrRk6o=; b=uOMBkVmlwwAgrggtCKHz3d6lw/
	YNpE60KWkUTPiR+hJx+q6E6LmZwduPvSwuPxvOxkdxI28rNKoRTY/yGOOPTdC1v9eWzNmbPQO19Sn
	ZadlgMp/H871vcLGrpV+Z/rb2K4zh+rlPflOxa3ohJLPRn0O8zImzAKeNH8im27ix4H0ihN8tGSr6
	ShtzsXRMZndegyLodghmsk7TKf/Zq6OOmugEe9FeDwKEF/1QWZSyAPxw+hIsEZo7eddlYDYXjouLo
	f6spFKXPq2W79l36dqEsUtB1ibUwkEhln1Fyw8FyV6PrSHZdlHKOwbOUaGefqFyNMxJcJx60/Sw6L
	jV8lJb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8eG-00000003ThU-29AZ;
	Mon, 29 Dec 2025 08:30:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8eD-00000003Th0-266D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA2DA409F7;
	Mon, 29 Dec 2025 08:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75297C4CEF7;
	Mon, 29 Dec 2025 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766997036;
	bh=n+4Vy8rai+s6XSvnBGa9OPc8jPApInUghc5+Yvwzoo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRvvLhenzEKts8AL5oX1M2/YpkfgJIK82bURxRRNK4mHar/ksYEqQORiiYzGtZJT5
	 hgSIUKc6jyE2mqpbHeaXX5RbTWE2OmhC7H/eZSMXSHgVVjPlwwepn7I79hVX7TFRhf
	 JKftSbUQElyfIt+V5aOoOMk7kapElT0PAcDd1H0K2On9TOkjFCJyIAapUxnB4t8FOA
	 oQeHskZnloLkmSmfe3yYqZr7Ybe8L7/0L9qQyNwIVB3Njw7hpCg4plKCTQW3GA7jZH
	 iP3EpVichUHo0M+sEu3iWX1sqAjV5jLJ5ZFi9ZeaUJE6zUHEITr+ybmFVzRI3Zv90d
	 qjGNb5aEV2nog==
Date: Mon, 29 Dec 2025 16:30:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: correct I3C2 pclk to
 IMX95_CLK_BUSWAKEUP
Message-ID: <aVI8JKPm8eTx9NgA@dragon>
References: <20251118062855.1417564-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118062855.1417564-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_003037_571905_4F8F32E1 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, Nov 18, 2025 at 02:28:54PM +0800, Carlos Song wrote:
> I3C2 is in WAKEUP domain. Its pclk should be IMX95_CLK_BUSWAKEUP.
> 
> Fixes: 969497ebefcf ("arm64: dts: imx95: Add i3c1 and i3c2")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Cc: <stable@vger.kernel.org>

Applied, thanks!

