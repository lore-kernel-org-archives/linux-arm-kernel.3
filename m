Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E21CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lCgU/PTPjJLCD5EIYcxUrji1PO4DM689Wj10Fb25Pg=; b=EJvRMS9fPQdSGYYNPT7UFOGc/H
	3zbFJ3xuXkPM9bIvjuOtrmdWzVEMX/yWkB+vK4ybWckhDUJotd6g8gc5mtE0k8gek+OAdgOgWSZYH
	lMaVyJh76YLfmAYYhDNxew0Y8x0wpiUdR2aF5pC0VGBOROjzAdypTfKhwUkAPiYQV4z5TH2TiSaSF
	9PmWWRqUN9/WMnhuMo5aiiGrHLUVUdEvTlkQfRb7mHAG4qvB6ezv4TNkGAiAW70eLvsPRqaOOQlWk
	NH6TUaOuPZ8/w6+kQNJL6cT9dt7gYLAMZvHZRxvnI+XAOvpv723YsndlX22qyOF/KNiWLptTcieqi
	jD5adFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Tk-0000000CTdB-22gF;
	Tue, 10 Dec 2024 19:01:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Sh-0000000CTRn-210e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A5F75C6194;
	Tue, 10 Dec 2024 18:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04288C4CEE2;
	Tue, 10 Dec 2024 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733857198;
	bh=2NRBUcwP6ADVM9R7gTZwPbbRPE94lPjt0cZuUUXJ6GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGIBTn3wtYjyRu94EIEgV+ps+3x1ocKtGE0nwB9UMNSC1/dfPJv0NZUvdpeTDIuOm
	 DYkr4BOfikTdT0TnCKjNFEPvhSIRJXiUMgjeC0/MkjsA9nBpouepqWLgAtuqjMxyjn
	 FnX5zer9cyr9SnkRAXrQX2xcpP84IqzIokThXor0926VT/qof9GuqTyIoajI+yeZEd
	 TYEJLEtN9mHP+mifcy+FgxN9Qq7jVTUvXSPAsath9fKYoqY3JYL3poJFV7eGK2ATux
	 B1Gmj1owed+dKcG3Sa4KidGm1uGB13WCB7jk96RG7e1PHASKXH3Hgx8qfNZUa/dpTk
	 Ec5cE9GpPvNxA==
Date: Tue, 10 Dec 2024 19:59:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: nomadik: Add missing sentinel to match table
Message-ID: <6gfa3lvgmdqsr4kjaojphlxiu6soxiri7xjcttdpljcd5btbl3@xboan7zamrfp>
References: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_105959_556662_7F573F0C 
X-CRM114-Status: UNSURE (   8.91  )
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

Hi Geert,

On Fri, Dec 06, 2024 at 09:28:06AM +0100, Geert Uytterhoeven wrote:
> The OF match table is not NULL-terminated.
> Fix this by adding a sentinel to nmk_i2c_eyeq_match_table[].
> 
> Fixes: a0d15cc47f29be6d ("i2c: nomadik: switch from of_device_is_compatible() to of_match_device()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

