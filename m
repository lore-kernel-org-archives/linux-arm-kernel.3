Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B40C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDA1cYYyfuDKYbwgUHmpY8FkX4NARkM3bnuCuka4rxE=; b=hukaSkhHiGAVGkzwtb+AVCotOz
	Sc5iCt1QsyTuBMvl2tKmnYMYjgSLIH0OgDaBRSgeKI1hnabI2a1fwB7yYBtoUfh8y0rrZQtOZzNZU
	8FYJgf2fBATfogsU9Ocbn2P4cay5f3cysfvF2/RCGVpyCBXD0udrh2/MZaJaxwt00uX4/DxQXR4Wl
	gk+TPilIjnKx6coBaapGK9jgJEd4Z/naagj9p+VyGg+86GVhQHNKYpc96qF1I7/tSh7S/nCS04Axg
	YdIJbSNzJkLh1cTLREXyiS3fSCZvdoPhzfaEOGmFoc09mARC5GOrZJA2C0XAlMtSRwxliGLI4kWlG
	A6vT+foQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLAo-00000005wuy-15xL;
	Tue, 17 Jun 2025 01:31:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRL8P-00000005weY-3lZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 01:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UDA1cYYyfuDKYbwgUHmpY8FkX4NARkM3bnuCuka4rxE=; b=C7eZ4HKHZHhKvuAJdc9KTsTMbH
	l5LfzjjEZCxud8ecVt8c8jDuQ8ckp/8wZCUE+EflCjyHBxDTBjjoLSMos7FOgTAXy7jFYEu3PmSUg
	7sreapUH5Y5USo+jkk6ZC28xGVaUlerBqxN5z7Ltla/Y3Dkkj3iSSscO8OBTOEQldHVg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRL8C-00G7C3-Kh; Tue, 17 Jun 2025 03:28:56 +0200
Date: Tue, 17 Jun 2025 03:28:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexander Clouter <alex@digriz.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: orion5x: use string choices helper
Message-ID: <eaa1038b-9a3e-4f42-abaf-8bb8b92aa482@lunn.ch>
References: <87ldprnsc2.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldprnsc2.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_182909_960468_C8EAC7D0 
X-CRM114-Status: GOOD (  13.19  )
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

On Tue, Jun 17, 2025 at 12:07:42AM +0000, Kuninori Morimoto wrote:
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm/mach-orion5x/ts78xx-setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
> index af810e7ccd79..c250703e696d 100644
> --- a/arch/arm/mach-orion5x/ts78xx-setup.c
> +++ b/arch/arm/mach-orion5x/ts78xx-setup.c
> @@ -460,7 +460,7 @@ static ssize_t ts78xx_fpga_show(struct kobject *kobj,
>  	if (ts78xx_fpga.state < 0)
>  		return sprintf(buf, "borked\n");
>  
> -	return sprintf(buf, "%s\n", (ts78xx_fpga.state) ? "online" : "offline");
> +	return sprintf(buf, "%sline\n", str_on_off(ts78xx_fpga.state));

static inline const char *str_on_off(bool v)
{
	return v ? "on" : "off";
}

That is an ABI change. Sorry, but NACK.

	Andrew

