Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0198CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPZXjDqTrTZBwarSESdBXaTUWAXplwHtQluw3xIz35E=; b=oZdeTYNgHjl+MBIweh/Qz0E1Xd
	vhRle+COvKBl6N8q5YQ0Rb9jZsDjyIl6FLfHcyFUpdPFvdHvrMhF1qNsE84KfMtRMEPBjbPQWehrn
	WLOoQ/leobCPIlCT2+1SIiQ7RLbQD6i3Tr+mrhWDTYf5DK0fSK385CLb0GjSUb/24/fvCzl9zgjm4
	Gm5hHNl8AdJGCO2cgtBhLZoYlvZJjFMMeyMuzP5PvQ7F3gSth738SIQixQ3BMBJz4wA9ml4L6Lx7q
	g9yINbv4CnD1B6UmQcRZ4T6BlGwxJL8rKJ3MveHL20l8fGC9ehZx24664BoE8Jm8Q9WWRhjB3KVTS
	c9Dl3jkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIeW-0000000CfyH-011H;
	Thu, 20 Mar 2025 16:21:52 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIcn-0000000CfkD-0ysf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 16:20:07 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZJVZy5GhBz9sRr;
	Thu, 20 Mar 2025 16:57:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpSF7WRgoDNQ; Thu, 20 Mar 2025 16:57:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZJVZy4Fbyz9sPd;
	Thu, 20 Mar 2025 16:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E13A8B799;
	Thu, 20 Mar 2025 16:57:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id g0xQPgVyxzkg; Thu, 20 Mar 2025 16:57:30 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E8D5B8B763;
	Thu, 20 Mar 2025 16:57:29 +0100 (CET)
Message-ID: <f79c2e97-2d50-467d-9852-c64971f11370@csgroup.eu>
Date: Thu, 20 Mar 2025 16:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
To: linux@treblig.org, ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 stuyoder@gmail.com, linux-kernel@vger.kernel.org
References: <20241115152055.279732-1-linux@treblig.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241115152055.279732-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_092005_446845_EA88CE52 
X-CRM114-Status: GOOD (  16.93  )
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

Ioana,

Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
> [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> fsl_mc_allocator_driver_exit() was added explicitly by
> commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was added in 2015 by
> commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Can you ack this patch ?

Thanks
Christophe

> ---
>   drivers/bus/fsl-mc/dpmcp.c            | 22 ----------------------
>   drivers/bus/fsl-mc/fsl-mc-allocator.c |  5 -----
>   drivers/bus/fsl-mc/fsl-mc-private.h   |  6 ------
>   drivers/bus/fsl-mc/mc-io.c            | 20 --------------------
>   include/linux/fsl/mc.h                |  2 --
>   5 files changed, 55 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/dpmcp.c b/drivers/bus/fsl-mc/dpmcp.c
> index 5fbd0dbde24a..7816c0a728ef 100644
> --- a/drivers/bus/fsl-mc/dpmcp.c
> +++ b/drivers/bus/fsl-mc/dpmcp.c
> @@ -75,25 +75,3 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
>          /* send command to mc*/
>          return mc_send_command(mc_io, &cmd);
>   }
> -
> -/**
> - * dpmcp_reset() - Reset the DPMCP, returns the object to initial state.
> - * @mc_io:     Pointer to MC portal's I/O object
> - * @cmd_flags: Command flags; one or more of 'MC_CMD_FLAG_'
> - * @token:     Token of DPMCP object
> - *
> - * Return:     '0' on Success; Error code otherwise.
> - */
> -int dpmcp_reset(struct fsl_mc_io *mc_io,
> -               u32 cmd_flags,
> -               u16 token)
> -{
> -       struct fsl_mc_command cmd = { 0 };
> -
> -       /* prepare command */
> -       cmd.header = mc_encode_cmd_header(DPMCP_CMDID_RESET,
> -                                         cmd_flags, token);
> -
> -       /* send command to mc*/
> -       return mc_send_command(mc_io, &cmd);
> -}
> diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> index b5e8c021fa1f..6c3beb82dd1b 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> @@ -656,8 +656,3 @@ int __init fsl_mc_allocator_driver_init(void)
>   {
>          return fsl_mc_driver_register(&fsl_mc_allocator_driver);
>   }
> -
> -void fsl_mc_allocator_driver_exit(void)
> -{
> -       fsl_mc_driver_unregister(&fsl_mc_allocator_driver);
> -}
> diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
> index b3520ea1b9f4..e1b7ec3ed1a7 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-private.h
> +++ b/drivers/bus/fsl-mc/fsl-mc-private.h
> @@ -66,10 +66,6 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
>                  u32 cmd_flags,
>                  u16 token);
> 
> -int dpmcp_reset(struct fsl_mc_io *mc_io,
> -               u32 cmd_flags,
> -               u16 token);
> -
>   /*
>    * Data Path Resource Container (DPRC) API
>    */
> @@ -631,8 +627,6 @@ int dprc_scan_objects(struct fsl_mc_device *mc_bus_dev,
> 
>   int __init fsl_mc_allocator_driver_init(void);
> 
> -void fsl_mc_allocator_driver_exit(void);
> -
>   void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> 
>   void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> diff --git a/drivers/bus/fsl-mc/mc-io.c b/drivers/bus/fsl-mc/mc-io.c
> index 95b10a6cf307..a0ad7866cbfc 100644
> --- a/drivers/bus/fsl-mc/mc-io.c
> +++ b/drivers/bus/fsl-mc/mc-io.c
> @@ -263,23 +263,3 @@ void fsl_mc_portal_free(struct fsl_mc_io *mc_io)
>          dpmcp_dev->consumer_link = NULL;
>   }
>   EXPORT_SYMBOL_GPL(fsl_mc_portal_free);
> -
> -/**
> - * fsl_mc_portal_reset - Resets the dpmcp object for a given fsl_mc_io object
> - *
> - * @mc_io: Pointer to the fsl_mc_io object that wraps the MC portal to free
> - */
> -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io)
> -{
> -       int error;
> -       struct fsl_mc_device *dpmcp_dev = mc_io->dpmcp_dev;
> -
> -       error = dpmcp_reset(mc_io, 0, dpmcp_dev->mc_handle);
> -       if (error < 0) {
> -               dev_err(&dpmcp_dev->dev, "dpmcp_reset() failed: %d\n", error);
> -               return error;
> -       }
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(fsl_mc_portal_reset);
> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> index c90ec889bfc2..37316a58d2ed 100644
> --- a/include/linux/fsl/mc.h
> +++ b/include/linux/fsl/mc.h
> @@ -417,8 +417,6 @@ int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
> 
>   void fsl_mc_portal_free(struct fsl_mc_io *mc_io);
> 
> -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io);
> -
>   int __must_check fsl_mc_object_allocate(struct fsl_mc_device *mc_dev,
>                                          enum fsl_mc_pool_type pool_type,
>                                          struct fsl_mc_device **new_mc_adev);
> --
> 2.47.0
> 


