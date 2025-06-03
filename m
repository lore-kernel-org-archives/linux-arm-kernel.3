Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFC5C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QaxPVYGiWt7mB9m4DsoMvxZpkgJLcaRJ1KKz+wbYdg=; b=ss//PTou0tseU9BFPTtMovvlNn
	XWsp72JPiOPjwvGNQTENO/uRm2rMTXrbWhVoIhdNeoFjnwil9u0hJFi49ZjNlY/+gCefr9M3k3Hep
	p5nQGe6yeQyYzCI8cgpben9X8g0GUbn9obTJUcUVffakSl9XLfwSIHUOHZ5vsyhy1K/snCQfSUlEW
	Rr8WByJymR0NegprofCk9+N7ng5ZAAIjnLSBpC16ZCyh9xWwZT4M90at7fQF1obUX4vqh9tIcokNT
	sqg36HBrNc6WY+3mdWa98MbbSq7uWUAPLaL5TAFd7pEaS8USZAQWOzz6c6NuxDpGeys6FDaVqHBf/
	UDLdhcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNtr-0000000AVY9-2RQX;
	Tue, 03 Jun 2025 09:25:39 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNan-0000000ARQK-1R8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:05:59 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1F3C940E01B3;
	Tue,  3 Jun 2025 09:05:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K0iu0KJE_bea; Tue,  3 Jun 2025 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748941548; bh=+QaxPVYGiWt7mB9m4DsoMvxZpkgJLcaRJ1KKz+wbYdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtHV+BUx7HNlS6dpAM95SE7mQGT3JdPGXqWH9wtCmvdAG5a1RhJms6YNo31fyxMUu
	 rP3bLzG2FjNXsiATg3WpZBEnYdAl9FpTY+nPbbCB8FphKglfKV19oW6zn5ja8AhWYV
	 5l6ODc2SeqvOXVtQ9qnzpdwvNnZvoIHdR2KrrSz5rnsrlZKni7kLND2Jn+x+NXIFxs
	 8ZYTPfuPZFPdsdYQoh1a71DpZG8v/4T0WhiOEX3MiurVswt8syEoBYfUaF5/j0Ko9Y
	 4NCGy3NxeuUXg5HpcLNljXAbRR0axrsOsqhidwrF+FaMEMIfbU2sugPTSbKrwVxwZ2
	 I1ktLXpthcIkkAQWcrrq8LnHYtDdILR/4UJWExCzphWQFrd4kceO2ZEygQbOq0dn0G
	 vJu7Iuvn6vyP9PEzfU8cQhMVVL36Wc8AvX0WukfhOKj3TZsveK0GRbxCbQFI9YoNbz
	 XjrbxWsz+WNPrrO7E5jPgZc9N2wP5reYeAurbNbkTKVtSUY1dr6+ET3e3oscFOiiwT
	 QOXkN4StUOJFviC0ADcjz7qncNkKBHKPbTDtyYHSO9CilwRiYQHUVxDvqFXaOFcWIk
	 EJHDDXyoEWiQlIXAmv8Soks8UqyLfu9J4VbkcKn6i+brb/plhjQufJ7XjXezAaikpB
	 0+OIy00SRzXfKUgUmlg21waw=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D9A1640E0163;
	Tue,  3 Jun 2025 09:05:37 +0000 (UTC)
Date: Tue, 3 Jun 2025 11:05:36 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH] EDAC/synopsys: Clear the ecc counters at init
Message-ID: <20250603090536.GCaD664IbJB5IoR06g@fat_crate.local>
References: <20250528065650.27646-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250528065650.27646-1-shubhrajyoti.datta@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_020557_533249_69F3B356 
X-CRM114-Status: GOOD (  17.78  )
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

On Wed, May 28, 2025 at 12:26:50PM +0530, Shubhrajyoti Datta wrote:
> Subject: Re: [PATCH] EDAC/synopsys: Clear the ecc counters at init

s/ecc/ECC/g

> Clear ECC error and counter registers at init to ensure a clean state
> by clearing all ECC error and counter registers before registering
> the controller with the EDAC framework.
> 
> This avoids reporting stale errors that may have occurred during
> boot or prior configuration.

Run this commit message through AI and ask it to shorten it and write it in
imperative tone.

> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  drivers/edac/synopsys_edac.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
> index 5ed32a3299c4..ebd2d6e771a1 100644
> --- a/drivers/edac/synopsys_edac.c
> +++ b/drivers/edac/synopsys_edac.c
> @@ -755,7 +755,7 @@ static bool zynq_get_ecc_state(void __iomem *base)
>  static bool zynqmp_get_ecc_state(void __iomem *base)
>  {
>  	enum dev_type dt;
> -	u32 ecctype;
> +	u32 ecctype, clearval;
>  
>  	dt = zynqmp_get_dtype(base);
>  	if (dt == DEV_UNKNOWN)
> @@ -763,8 +763,13 @@ static bool zynqmp_get_ecc_state(void __iomem *base)
>  
>  	ecctype = readl(base + ECC_CFG0_OFST) & SCRUB_MODE_MASK;
>  	if ((ecctype == SCRUB_MODE_SECDED) &&
> -	    ((dt == DEV_X2) || (dt == DEV_X4) || (dt == DEV_X8)))
> +	    ((dt == DEV_X2) || (dt == DEV_X4) || (dt == DEV_X8))) {
> +		clearval = readl(base + ECC_CLR_OFST) |
> +				ECC_CTRL_CLR_CE_ERR | ECC_CTRL_CLR_CE_ERRCNT |
> +				ECC_CTRL_CLR_UE_ERR | ECC_CTRL_CLR_UE_ERRCNT;
> +		writel(clearval, base + ECC_CLR_OFST);

A getter function clears registers and commit message talks about "at init"?!?!

This looks like a hack.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

