Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B463BCF6BF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kkt4BN1qE8URamoqgKiZSyZuDf5XmvueUtedgUf6C4E=; b=22K+lUp9PtvFoJKWZi+cSL9xV4
	1JOSP0lNdz1l6c3oBcyMPZYZ7sV1/pwVxJXM9HbNyPnY6V7/gbRV56kWGyL6RvKG0woTCuC3I/ycE
	ude1J+NN4SuTzK4fuD4d/ItmLMfSwA8yDPn7+6rmNrbEe2c23L0DlSt37Ra6yOXMxobX3Xrruia6o
	mKKIUb/VIrvmE39nAfL6/ARHYcTE/y4pETV93pVTWI6Ewy6FzGzy7J6sR49gtXw6sEBpqcSWwENOd
	6RkZSU1qLv5zTIyMUjuDNsIASTCWZ+pdJN8WRdgOp/I8qIicX4DHkPXry/UINMRmGSVjNF2qWz7BN
	uv4aHBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdODJ-0000000EJGT-1hvn;
	Wed, 07 Jan 2026 07:44:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdODH-0000000EJFd-2vpb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9EBE4195F;
	Wed,  7 Jan 2026 07:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201D6C4CEF7;
	Wed,  7 Jan 2026 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767771854;
	bh=wtepG4ALMqKiyvEt0jTluSuqHX787/roVKJbXsbF/j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkiAXa7S+dmxh6XiyOJ+dURPUcCWvD6eKm660lGoJceLJX0suxTera4dNqRcaUlgh
	 w9+nwLM9cKZEZ5CTRWMDiezR/GE+amG8FjIGCKiGt7ayLbrignoWbYr41YE+01mW7J
	 hxisgmoRvkbvxh7x2Li1OKcsBiQ986t3XZURBOtc=
Date: Wed, 7 Jan 2026 08:44:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type
 declaration
Message-ID: <2026010738-collie-quarters-5ceb@gregkh>
References: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
 <2026010755-registrar-agreeably-a626@gregkh>
 <a65f4add-f052-4c51-85e9-317b42802df1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a65f4add-f052-4c51-85e9-317b42802df1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_234415_771194_39D47C94 
X-CRM114-Status: GOOD (  23.26  )
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

On Wed, Jan 07, 2026 at 08:39:41AM +0100, Christophe Leroy (CS GROUP) wrote:
> Hi Ioana,
> 
> Le 07/01/2026 à 06:30, Greg Kroah-Hartman a écrit :
> > On Tue, Jan 06, 2026 at 07:54:21PM +0100, Christophe Leroy (CS GROUP) wrote:
> > > Fix following sparse warning:
> > > 
> > >    CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
> > > drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?
> > > 
> > > As it is exported it can't be static. So declare it in mc.h like
> > > all other similar objects.
> > > 
> > > Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
> > > Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> > > ---
> > >   include/linux/fsl/mc.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> > > index 897d6211c1635..28441a456bb48 100644
> > > --- a/include/linux/fsl/mc.h
> > > +++ b/include/linux/fsl/mc.h
> > > @@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
> > >   extern const struct device_type fsl_mc_bus_dpaiop_type;
> > >   extern const struct device_type fsl_mc_bus_dpci_type;
> > >   extern const struct device_type fsl_mc_bus_dpdmai_type;
> > > +extern const struct device_type fsl_mc_bus_dpdbg_type;
> > 
> > As it's obviously not used anywhere, this should not be the fix, please
> > just mark it static and remove the EXPORT_SYMBOL_GPL() as well.
> 
> What's your opinion here as Maintainer of this driver, what should we do ?
> 
> Greg is right that it is nowhere used, and it is the same for several other
> types, the only difference being that they have a matching
> is_fsl_mc_bus_dp..() helper that hides the type, but not all helpers are
> used, and many of them are not used outside drivers/bus/fsl-mc/ which cannot
> be built as a module:

Anything that does not need to be exported (i.e. not used by anything
else in the kernel tree), should be made static.

thanks,

greg k-h

