Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D70C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7D02OKa8lcdXqnUJqZ8sBJPjnyfKlzRt8GHlMFNIzs=; b=dIvkQ4b8rjki7tlZBmYxHs9d2e
	FCBPPWgvEElVy1A39iL9jVJsTVS+RX/qfWqiznrc2THmNyVDJFdjCqkt5HJEBLT2hv+8OvyxwUqBU
	V2YKPCwuT83bIc6L7i1S4hVKPe/aiKnOns8ZP5Do+gJHEx3aCqtsT0VM+sCyCoQFuSJpOs9Ti1Gpi
	Sa7qUIDTQ1k+lhhNmaDTfT0DaO2+r0EAGy6U/m7cgAUFIg8AJu+ylUP8mNZceauNmvBvOqXMlAljU
	b5/wEOY3xS9wK7xEp0Dy5BqEadqzcWc0Z5NWOuk5tznwq4Bi3HbpCmhqkAvtyQwzdduHSdcQOFEpd
	4Wx5zJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDHH-000000077xm-2LiV;
	Tue, 24 Jun 2025 23:42:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD54-000000076Ns-114n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E87AA520EA;
	Tue, 24 Jun 2025 23:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0BCC4CEE3;
	Tue, 24 Jun 2025 23:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750807773;
	bh=05HNQPwBtyrgW26Vc7Vbxtx/maWAq57HxbUh2ZxvJ30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lxbf109mvjbn0TirCG+sCyt/Ame5IbV1g9IA1Uk281WOkYBEqT5INF4ZLGxA8RyxY
	 zjDWHb/aPeSRxTvj9N+lGl1qY3GHih7gWN9bOvsQB7PQ313Gg7GvWWaKVn0KDhKw3y
	 g687ccDbjrB3wMt+6p6Fl79jtMGP1Dthonu1FEqomnou7JuNanxq6gJml/W2FIFtHc
	 8fJ091giY5xzz2ViYJW5nsIgk14kHTwJ0m4d6jj+TE9VhAS1v+zcLxp9tLW8AXMu47
	 pS76wLnldyp2MM08loZc8EsKqsU2zc1gdS7xOjuEU6YD9Lt7gRQJ4/RCSU91qAj67i
	 Zco3zMSmyBFOw==
Date: Wed, 25 Jun 2025 02:29:29 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 2/2] tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when
 it's built-in
Message-ID: <aFs02ZgVyGTg2cJx@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <20250618102302.2379029-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618102302.2379029-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_162934_426228_53B8A5E5 
X-CRM114-Status: GOOD (  30.88  )
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

On Wed, Jun 18, 2025 at 11:23:02AM +0100, Yeoreum Yun wrote:
> To generate the boot_aggregate log in the IMA subsystem using TPM PCR values,
> the TPM driver must be built as built-in and must be probed before
> the IMA subsystem is initialized.
> 
> However, when the TPM device operates over the FF-A protocol using the CRB interface,
> probing fails and returns -EPROBE_DEFER
> if the tpm_crb_ffa device — an FF-A device that provides
> the communication interface to the tpm_crb driver — has not yet been probed.
> 
> This issue occurs because both crb_acpi_driver_init() and
> tpm_crb_ffa_driver_init() are registered with device_initcall.
> As a result, crb_acpi_driver_init() may be invoked before
> tpm_crb_ffa_driver_init(), which is responsible for probing the tpm_crb_ffa device.
> 
> When this happens, IMA fails to detect the TPM device and
> logs the following message:
> 
>   | ima: No TPM chip found, activating TPM-bypass!
> 
> Consequently, it cannot generate the boot_aggregate log with
> the PCR values provided by the TPM.
> 
> To resolve this issue, the tpm_crb_ffa_init() function explicitly attempts to
> probe the tpm_crb_ffa by register tpm_crb_ffa driver so that
> when tpm_crb_ffa device is created before tpm_crb_ffa_init(),
> probe the tpm_crb_ffa device in tpm_crb_ffa_init() to finish probe the
> TPM device completely.
> 
> This ensures that the TPM device using CRB over FF-A
> can be successfully probed, even if crb_acpi_driver_init() is called first.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/char/tpm/tpm_crb_ffa.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
> index 4ead61f01299..462fcf610020 100644
> --- a/drivers/char/tpm/tpm_crb_ffa.c
> +++ b/drivers/char/tpm/tpm_crb_ffa.c
> @@ -115,6 +115,7 @@ struct tpm_crb_ffa {
>  };
>  
>  static struct tpm_crb_ffa *tpm_crb_ffa;
> +static struct ffa_driver tpm_crb_ffa_driver;
>  
>  static int tpm_crb_ffa_to_linux_errno(int errno)
>  {
> @@ -168,13 +169,23 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
>   */
>  int tpm_crb_ffa_init(void)
>  {
> +	int ret = 0;
> +
> +	if (!IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
> +		ret = ffa_register(&tpm_crb_ffa_driver);
> +		if (ret) {
> +			tpm_crb_ffa = ERR_PTR(-ENODEV);
> +			return ret;
> +		}
> +	}
> +
>  	if (!tpm_crb_ffa)
> -		return -ENOENT;
> +		ret = -ENOENT;
>  
>  	if (IS_ERR_VALUE(tpm_crb_ffa))
> -		return -ENODEV;
> +		ret = -ENODEV;
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);
>  
> @@ -369,7 +380,9 @@ static struct ffa_driver tpm_crb_ffa_driver = {
>  	.id_table = tpm_crb_ffa_device_id,
>  };
>  
> +#ifdef MODULE
>  module_ffa_driver(tpm_crb_ffa_driver);
> +#endif
>  
>  MODULE_AUTHOR("Arm");
>  MODULE_DESCRIPTION("TPM CRB FFA driver");
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

NAK

BR, Jarkko

