Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B394C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEsRyzQpnsTIeXVgh3VKXs2l1ybuznv72IKMRB+grdU=; b=alGIJLVZ/sDFUeLJL6UKYzqDAo
	05TE5/z3IcNgwA/hroVCvEoB+001wmZFP/UTjMfGxn3dlTInFndVUgpZcuFi4sMNw+T327VQcSy29
	D9FyeOCj4EaNz7bdBc+/O6oFrevwusRtnB6r1EIAMeSsWbCuQAhsx3t3ruUWfSUZ+D3vmmFZv01/b
	66sB4fE26WhjV877eUOgJKyBdNe5u3rbWOFpPQnA/rbgkhGja/Qe9btkg4n/NAaMK00FRsH5+5Tjt
	TZCDcypf1i8LzyNWO0eMJOLhw5gbLlfaei1CtrKvDecfCsizB3qKbdyV7mThtsTxn0ylhIwtBFUY+
	JnhtZuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiXq-0000000BNOm-23WA;
	Thu, 13 Mar 2025 13:24:18 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiUp-0000000BN55-2uVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=PEsRyzQpnsTIeXVgh3VKXs2l1ybuznv72IKMRB+grdU=; b=Qr8mHT8tIdgntsqj
	NLrrS5Nptf7Tk9fTNx2lUaq17GWzLPe++dmJ/knwGNcamJkF7mmQdKUGO4KkGfI+uOVW2SYvOuYnj
	ywq5WWolNQHzhB7hsIoObIvmm9u6ce/iE5xZaAOFJw6dhcs5UnROKWLVAjmUtFfLy396y+rxr2CzL
	qmpNRx7lY61adQjn+6wz7BJhLBG7bIIvq2SLUJ5JvM22js3jepniEmeIAk3RyUCZbWHhkRBXvC77N
	an/ZWCodTWczRMEeRy9NtcFHMYAC/dC1m5zJFgVLfnQGxemQF6+/kVt1/UTOqMf+RwyDheSgPRMs0
	Clmjuln9XCwddUhhDw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tsiUj-004dd2-1D;
	Thu, 13 Mar 2025 13:21:05 +0000
Date: Thu, 13 Mar 2025 13:21:05 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, ioana.ciornei@nxp.com,
	stuyoder@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Message-ID: <Z9LbwRUsHwFLpBZA@gallifrey>
References: <20241115152055.279732-1-linux@treblig.org>
 <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:17:26 up 309 days, 31 min,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_062111_821906_389EE9B7 
X-CRM114-Status: GOOD (  19.93  )
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

* Christophe Leroy (christophe.leroy@csgroup.eu) wrote:
> 
> 
> Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
> > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > fsl_mc_allocator_driver_exit() was added explicitly by
> > commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> > but was never used.
> > 
> > Remove it.
> > 
> > fsl_mc_portal_reset() was added in 2015 by
> > commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> > but was never used.
> > 
> > Remove it.
> > 
> > fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi,
  Can someone pick this old change up please?  I see the PPC patchwork says
  'handled elsewhere' but doesn't say where.

Thanks,

Dave
> 
> > ---
> >   drivers/bus/fsl-mc/dpmcp.c            | 22 ----------------------
> >   drivers/bus/fsl-mc/fsl-mc-allocator.c |  5 -----
> >   drivers/bus/fsl-mc/fsl-mc-private.h   |  6 ------
> >   drivers/bus/fsl-mc/mc-io.c            | 20 --------------------
> >   include/linux/fsl/mc.h                |  2 --
> >   5 files changed, 55 deletions(-)
> > 
> > diff --git a/drivers/bus/fsl-mc/dpmcp.c b/drivers/bus/fsl-mc/dpmcp.c
> > index 5fbd0dbde24a..7816c0a728ef 100644
> > --- a/drivers/bus/fsl-mc/dpmcp.c
> > +++ b/drivers/bus/fsl-mc/dpmcp.c
> > @@ -75,25 +75,3 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
> >          /* send command to mc*/
> >          return mc_send_command(mc_io, &cmd);
> >   }
> > -
> > -/**
> > - * dpmcp_reset() - Reset the DPMCP, returns the object to initial state.
> > - * @mc_io:     Pointer to MC portal's I/O object
> > - * @cmd_flags: Command flags; one or more of 'MC_CMD_FLAG_'
> > - * @token:     Token of DPMCP object
> > - *
> > - * Return:     '0' on Success; Error code otherwise.
> > - */
> > -int dpmcp_reset(struct fsl_mc_io *mc_io,
> > -               u32 cmd_flags,
> > -               u16 token)
> > -{
> > -       struct fsl_mc_command cmd = { 0 };
> > -
> > -       /* prepare command */
> > -       cmd.header = mc_encode_cmd_header(DPMCP_CMDID_RESET,
> > -                                         cmd_flags, token);
> > -
> > -       /* send command to mc*/
> > -       return mc_send_command(mc_io, &cmd);
> > -}
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> > index b5e8c021fa1f..6c3beb82dd1b 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
> > +++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> > @@ -656,8 +656,3 @@ int __init fsl_mc_allocator_driver_init(void)
> >   {
> >          return fsl_mc_driver_register(&fsl_mc_allocator_driver);
> >   }
> > -
> > -void fsl_mc_allocator_driver_exit(void)
> > -{
> > -       fsl_mc_driver_unregister(&fsl_mc_allocator_driver);
> > -}
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
> > index b3520ea1b9f4..e1b7ec3ed1a7 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-private.h
> > +++ b/drivers/bus/fsl-mc/fsl-mc-private.h
> > @@ -66,10 +66,6 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
> >                  u32 cmd_flags,
> >                  u16 token);
> > 
> > -int dpmcp_reset(struct fsl_mc_io *mc_io,
> > -               u32 cmd_flags,
> > -               u16 token);
> > -
> >   /*
> >    * Data Path Resource Container (DPRC) API
> >    */
> > @@ -631,8 +627,6 @@ int dprc_scan_objects(struct fsl_mc_device *mc_bus_dev,
> > 
> >   int __init fsl_mc_allocator_driver_init(void);
> > 
> > -void fsl_mc_allocator_driver_exit(void);
> > -
> >   void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> > 
> >   void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> > diff --git a/drivers/bus/fsl-mc/mc-io.c b/drivers/bus/fsl-mc/mc-io.c
> > index 95b10a6cf307..a0ad7866cbfc 100644
> > --- a/drivers/bus/fsl-mc/mc-io.c
> > +++ b/drivers/bus/fsl-mc/mc-io.c
> > @@ -263,23 +263,3 @@ void fsl_mc_portal_free(struct fsl_mc_io *mc_io)
> >          dpmcp_dev->consumer_link = NULL;
> >   }
> >   EXPORT_SYMBOL_GPL(fsl_mc_portal_free);
> > -
> > -/**
> > - * fsl_mc_portal_reset - Resets the dpmcp object for a given fsl_mc_io object
> > - *
> > - * @mc_io: Pointer to the fsl_mc_io object that wraps the MC portal to free
> > - */
> > -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io)
> > -{
> > -       int error;
> > -       struct fsl_mc_device *dpmcp_dev = mc_io->dpmcp_dev;
> > -
> > -       error = dpmcp_reset(mc_io, 0, dpmcp_dev->mc_handle);
> > -       if (error < 0) {
> > -               dev_err(&dpmcp_dev->dev, "dpmcp_reset() failed: %d\n", error);
> > -               return error;
> > -       }
> > -
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL_GPL(fsl_mc_portal_reset);
> > diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> > index c90ec889bfc2..37316a58d2ed 100644
> > --- a/include/linux/fsl/mc.h
> > +++ b/include/linux/fsl/mc.h
> > @@ -417,8 +417,6 @@ int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
> > 
> >   void fsl_mc_portal_free(struct fsl_mc_io *mc_io);
> > 
> > -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io);
> > -
> >   int __must_check fsl_mc_object_allocate(struct fsl_mc_device *mc_dev,
> >                                          enum fsl_mc_pool_type pool_type,
> >                                          struct fsl_mc_device **new_mc_adev);
> > --
> > 2.47.0
> > 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

