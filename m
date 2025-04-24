Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B89C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/Gm0iaohoSUpFALDcDYkX48JKnw9ZtngTxphpD+oZ4=; b=KQhFUQGvqmzIs0a0CnEb3YfGkC
	m06pUZQypmtd6LmYnGTxwDMkRgZ5YdHRmd1mjTRlJ8dJLqPIPdpAUVcXOSKyAZvxw7n0OzrZ9qGSx
	jUzqt1JE5Wy5kZb5zLoCGVilOCKSB77amCK/QR/ELwGSizuk+ClHmoycLW7+Q8WymkPF0t59Edf5b
	4U5oCXNDmrueW7wm5ELF8vRlU1JRH5HIBSR+r4S6Aj9QnwmlIDBfRtk9I0fDH3uOQv3blmocq9ipC
	VfR2QIlUvE71mYbEczoJOqDu1quK7HSvYptOQqzR4uvgZSGJ62zV1E5qgihLFiMj5+HyHW6qiF6tQ
	+ohi3i1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ul2-0000000Dr8p-22lr;
	Thu, 24 Apr 2025 11:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tiW-0000000Dem2-3Oa3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G/Gm0iaohoSUpFALDcDYkX48JKnw9ZtngTxphpD+oZ4=; b=AakSvBo3nxxIpWWCBZe8FHWYLV
	1i5IDNlLpv4r3ttVsMU5wqqH+NLejQCpy59M1JfhLAvUPH5cUkPiFLD0w1FPFEku6prn4CTS9ouea
	esQKe8pz/SBf7ZB6ldeAZoRiwG1Z/ZRQzlJR+btdn1S9HbjKoKgQqIKoRR4kkZ9RS2VXw0H6czkMQ
	EUmS3qePRFcFwYq3utD9hoJoCue3Gh/uFKEDPaqK3803PLSHB8FuEEXLg4sSjSIszKKqVIm5+bMAX
	GFh37VY/TO+LuEiEGYg/Xc8sJJbuheuwHCIuNAqRYlz/dLTa8F+vWTZPiJ1IO0r56m2MElsCH/wyz
	/RpUEC9A==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tiT-0000000BjIg-2rH9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G/Gm0iaohoSUpFALDcDYkX48JKnw9ZtngTxphpD+oZ4=; b=WSWeZy8tdQ5+hNrDfHXaJP/mBc
	MMNrqvUk7fzxVuQtqKUWvqHicHn9KQ4vbgZS3df6ZfBVfzzm5XVJibPsvsiXLlDcB68ctT4ylEzY5
	FsUYrZOiXKTb0KnKWFySK7uw52huudu6QuNaWdV/VX2cIZQaLuI3wPuJWwq3j+XqFuAc1qfoMycmf
	YCJE3ZXIV6dZGga8UZJVCWgTQ8nsUFOO+bbW5B2EA3IBvwXhCrcWi/dtASngsFAe1Q5jG51+K55L8
	YdKbpkOc5EKVVafkUewbejioRaB+S4lmZ2vEkBYzzsZH8KDM3OVujyjlPH6l/kIVexAS/wzyYi7sM
	+092G0Wg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42566)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7tiP-0007Bh-0p;
	Thu, 24 Apr 2025 11:21:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7tiM-0000zm-2N;
	Thu, 24 Apr 2025 11:21:54 +0100
Date: Thu, 24 Apr 2025 11:21:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: xieyuanbin1 <xieyuanbin1@huawei.com>
Cc: sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org,
	nixiaoming@huawei.com, liaohua4@huawei.com, wangbing6@huawei.com,
	lincheng8@huawei.com, wangfangpeng1@huawei.com
Subject: Re: [PATCH] ARM: spectre-v2: fix unstable cpu get
Message-ID: <aAoQwsldwmxAKA0A@shell.armlinux.org.uk>
References: <20250424100437.27477-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424100437.27477-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112201_864966_EA0EEB20 
X-CRM114-Status: UNSURE (   8.04  )
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

On Thu, Apr 24, 2025 at 06:04:37PM +0800, xieyuanbin1 wrote:
> From: Xie Yuanbin <xieyuanbin1@huawei.com>
> 
> When a user program accesses the kernel address,

Please see
https://lore.kernel.org/all/795c9463-452e-bf64-1cc0-c318ccecb1da@I-love.SAKURA.ne.jp/T/

As I see it, this can't be fixed - certainly not in this way due to the
reasons I set out in the above thread.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

