Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C27810706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BMXSnRbfY4RdzwBne5tYOn8tTWdKkKLBBngZAzW64M=; b=WXh+jwNkOB+6pMErjB4T8jVSPi
	6egTXdQMNPp1i3DYmfa8mpiRp6t12eRVdscrrtpZsZgkJytnLzggwZhHW6zUMUZb1TEOt7C1z+pow
	H3kJq03qOqOdCV0cMBPVw6yyCCjNfD3NcXMkRp1wnvBxBEnzjQu8fnHSBab0gJ2MMhKQTfsaE2PvU
	dYUjj4ipTKD9yxoixayOoHdnzlUqzpIvLFeR7gVhzaHVjg0MXyXBdxrXGOvyIdF+KWzrdqGGwyEhA
	HXpstwsV8uQOhy6aUWlLD3mBmFNNFySRhwLdjIKK556lElHdE/PYLtr3AZIpCaQfz8+3DFU+AFPpu
	S35SeB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NHG-00000001mxY-1xIA;
	Sat, 14 Mar 2026 11:35:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NHF-00000001mxS-2GP4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 11:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B66560008;
	Sat, 14 Mar 2026 11:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F65C116C6;
	Sat, 14 Mar 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773488126;
	bh=GdeoLiMA8CXFq4sEcs5A46LTC+bCki0pRPFIvoquzJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MKIrvyyH9CrmOreJeW6kGQPYzcwgwK9RS3SUJJy5xcGGO0PECSQF6P9P1rAo0+YTA
	 2vAk+yBNfqnu9tAtTA2nKu6HMa9OwT0Q5ljbuOWNngsNPuZnfV6Ngp1vIV3OrAejuO
	 CEXn/dy3GMPTVL0RKZ4iREOMGJffy1GQ6MsqcYfM8JzWAJEziSDsKDdQBcd5J6SBIp
	 AyLPUMtHX8Jf0KYxdS3mr+wEILNPK0pb6l3Vq0wfcX7ya744Gh5NJGXr7Y3baP1v2F
	 SqhoDbVul4Tm6EGBlaqCavnJFmzBwwzYZuXDNSrr4+qPF686A8tbVvREaJhcCmzKQ4
	 xE3wHR2FaE8xg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20260305-arm-defconfig-drop-duplicate-ti-pruss-v1-1-2839e3b42a8b@kernel.org>
References: <20260305-arm-defconfig-drop-duplicate-ti-pruss-v1-1-2839e3b42a8b@kernel.org>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Drop duplicate
 CONFIG_TI_PRUSS=m
Message-Id: <177348812490.386756.6377774746208273431.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 12:35:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 05 Mar 2026 15:25:18 -0700, Nathan Chancellor wrote:
> Commit ee1ab82ee032 ("ARM: defconfig: move entries") added a duplicate
> instance of CONFIG_TI_PRUSS=m, causing a Kconfig warning:
> 
>   arch/arm/configs/multi_v7_defconfig:1152:warning: override: reassigning to symbol TI_PRUSS
> 
> Drop the first instance, as the second instance added by the
> aforementioned change is where savedefconfig puts it.
> 
> [...]

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: Drop duplicate CONFIG_TI_PRUSS=m
      https://git.kernel.org/soc/soc/c/9e22e9c4a5bd208a2d17f0b1a8414c170b4e5939

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


