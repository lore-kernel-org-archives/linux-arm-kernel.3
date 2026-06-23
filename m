Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110C3CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgTiUtsWfJTzG5+jBv6t25W/zs/ISNn2aRtz1RmdzP8=; b=iJXOCBV93ZsZfBNZGEGjiGWkUf
	eirt0o6fzooEm8pGmMITsNnJTSSqxSshCBiQoxrZohKIUeJSA6DRaKSXYc/a+7IWWvGk/w/kzsMTk
	nNZC5YImLXfKQ1Zyj13TpAAXIQb2unADSO0X4WJlKuP6lUDqf+znvB9/5+UPBpt+A6GqcPPvoqBdU
	PE9d41hG19zxlGiVPJiUAdgZFs8C686NoQPIC97iyOxtoeLhQeHSrKD1w2ckhxQNSf+lmS58DlgNH
	1e0EIT+pJQbwj/jrbXqoZlQTkX7brVOynn6JlC2npLyJ0tDRIEjmDroB52j7jeP73wPBl4VKmf++1
	fPeBfB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx4O-00000005xo7-1QUn;
	Tue, 23 Jun 2026 09:05:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx4M-00000005xnr-3Whl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:05:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3608E43F41;
	Tue, 23 Jun 2026 09:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE2E1F000E9;
	Tue, 23 Jun 2026 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782205522;
	bh=wgTiUtsWfJTzG5+jBv6t25W/zs/ISNn2aRtz1RmdzP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnLqzqqzAxCFLIo0VlgNpDfkkjM3B/uuj1gem6x12sl0NIMAPN+1KeENIZX/YDZ87
	 TgFre1MHioXlUsLu+DGNskaBT57qBaG3DxQzL6LW/c2OZwcF7YbFd5qMbfhLme05FT
	 IejheBxlsYP28FQdAOdkmCp6Sxp84K/vMrfv53EkkOXQOZ1sBBS0dcdwIUe9fKuKA1
	 WrxV9YLSuGmKo97KMOhwPMzE7I6qhzb6i3VY8sxTEwA5KgYGmyLUKlmKaDHNoKmTOu
	 8rMHFu5MmgEpSjO3AKIhtTEUAhvl+ua4o0V0BSiExsTdHPalGmKKVMw4Gi/ntjlri2
	 3WO+0QJj2yp/A==
Date: Tue, 23 Jun 2026 10:05:18 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: arm: Grammar s/may needed/may be needed/
Message-ID: <20260623-neat-booby-of-amplitude-f0fd93@sudeepholla>
References: <a9a082c25e4bda4d73b261eee951efecab20612d.1780499882.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9a082c25e4bda4d73b261eee951efecab20612d.1780499882.git.geert+renesas@glider.be>
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

On Wed, Jun 03, 2026 at 05:18:43PM +0200, Geert Uytterhoeven wrote:
> Fix grammar in the help text for the ARM_SCMI_POWER_DOMAIN symbol.
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

I assume Ulf will pick this up.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pmdomain/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
> index afed10d382ad7f66..ba0b190a63d6bb18 100644
> --- a/drivers/pmdomain/arm/Kconfig
> +++ b/drivers/pmdomain/arm/Kconfig
> @@ -21,7 +21,7 @@ config ARM_SCMI_POWER_DOMAIN
>  	  enabled or disabled via the SCP firmware
>  
>  	  This driver can also be built as a module. If so, the module
> -	  will be called scmi_pm_domain. Note this may needed early in boot
> +	  will be called scmi_pm_domain. Note this may be needed early in boot
>  	  before rootfs may be available.
>  
>  config ARM_SCPI_POWER_DOMAIN
> -- 
> 2.43.0
> 
> 

-- 
Regards,
Sudeep

