Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F87CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ/kCg315AOZdOhv258ZuI8YopXtLY3HP/NmSsvY524=; b=eZp6U/+u9S0n/H3cfjy6jDvK+j
	fO/t2O9qEfMTMNS2eyx36qBJue7GoZIZH0YfYTYqJ4CV2eB7Pa9KqGXfNd7/yxAI8evdlP1iOPjFP
	fP7dckoqMoKfWqVD5Tu4LtvVnlFHV0mkfPf5SaercrcDpe5BgIemjNVgEgiI7U+HNEd8YXThAjOOa
	uG1VDBipGamOVtRg2s/ipv0FHZCrvHLR7ZoaFU9SWxfg2kOH7uX72U5edHJRj/SDThO+xu0Ix5fY6
	h69AJfP1qPto5lznMMSb59ztLhl1RCyBlUxcHc+jcxabYEQnbF1iF0uEoIjdY6myI83DcMbKfs6cI
	sdwA9zsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSQz-0000000G5cg-2q1G;
	Thu, 14 Aug 2025 07:31:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSEE-0000000G3tb-48Yt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68777601DD;
	Thu, 14 Aug 2025 07:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539AFC4CEEF;
	Thu, 14 Aug 2025 07:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755155906;
	bh=dimKx23huTNq7ndUo5JXI5Ve5ilX+nFkk6o+pI2E0Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Elut8q4gK/DQnVF2FTu3JSUuMHfdp5tASCwvQDMXk+I2sjuMCH2k7HKXw1uymxgoh
	 CtiucKFzY/s70niahonbQtlc1w67bqX70HaADHkFK4TnWSR1Y0dQS7YVJuNvbwEPsK
	 bbuk3AE1PyL1bXAbZM1zytiELb923yQ8yxCKaobfwwPkLiADA76QggCYGYT/k13550
	 WrvfK2I9Gc3VUDUazB5PfRpyeBI0S2uJZgJ4CkMm/a7i56408y0+1Kl0nLxCYzRk+C
	 quycfUywHu25bGb9PiuGkRbwSs4dMoZZ8p9t4nMEvD7zQdJl4zCGf49ZXn00IumOcc
	 0BsCbvN4Cdkcw==
Date: Thu, 14 Aug 2025 12:47:58 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	Srinivas Kalaga <Srinivas.Kalaga2@arm.com>
Subject: Re: [PATCH v19 2/6] remoteproc: Add TEE support
Message-ID: <aJ2Npmru9RLPTj7c@sumit-X1>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-3-arnaud.pouliquen@foss.st.com>
 <aJzAkk-k4nfXY7Ux@e130802.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJzAkk-k4nfXY7Ux@e130802.arm.com>
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

Hi Abdellatif,

On Wed, Aug 13, 2025 at 05:42:58PM +0100, Abdellatif El Khlifi wrote:
> Hi Arnaud,
> 
> > Add a remoteproc TEE (Trusted Execution Environment) driver that will be
> > probed by the TEE bus. If the associated Trusted application is supported
> > on the secure part, this driver offers a client interface to load firmware
> > by the secure part.
> > This firmware could be authenticated by the secure trusted application.
> > 
> > A specificity of the implementation is that the firmware has to be
> > authenticated and optionally decrypted to access the resource table.
> > 
> > Consequently, the boot sequence is:
> > 
> > 1) rproc_parse_fw --> rproc_tee_parse_fw
> >    remoteproc TEE:
> >    - Requests the TEE application to authenticate and load the firmware
> >      in the remote processor memories.
> >    - Requests the TEE application for the address of the resource table.
> >    - Creates a copy of the resource table stored in rproc->cached_table.
> > 
> > 2) rproc_load_segments --> rproc_tee_load_fw
> >    remoteproc TEE:
> >    - Requests the TEE application to load the firmware. Nothing is done
> >      at the TEE application as the firmware is already loaded.
> >    - In case of recovery, the TEE application has to reload the firmware.
> > 
> > 3) rproc_tee_get_loaded_rsc_table
> >    remoteproc TEE requests the TEE application for the address of the
> >    resource table.
> > 
> > 4) rproc_start --> rproc_tee_start
> >    - Requests the TEE application to start the remote processor.
> > 
> > The shutdown sequence is:
> > 
> > 5) rproc_stop --> rproc_tee_stop
> >    - Requests the TEE application to stop the remote processor.
> > 
> > 6) rproc_tee_release_fw
> >    This function is used to request the TEE application to perform actions
> >    to return to the initial state on stop or on error during the boot
> >    sequence.
> > 
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ...
> > +
> > +static const struct tee_client_device_id rproc_tee_id_table[] = {
> > +	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
> > +	{}
> > +};
> 
> Other implementations may use different UUIDs.
> What about adding a kernel configuration option which, when enabled, allows
> alternative implementations to override this table?

You don't need any other kernel configuration option for table override
but rather you extend this table with UUID for service provided by
TS-TEE.

> 
> > +/**
> > + * rproc_tee_register() - Register a remote processor controlled by the TEE application.
> ...
> > +
> > +static int rproc_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> > +{
> > +	/* Today we support only the OP-TEE, could be extend to other tees */
> > +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> > +}
> 
> Could we make ver->impl_id user-configurable please ? for example, by reading
> it from the device tree since it isn’t discoverable at runtime? In our setup, we’d set
> it to TEE_IMPL_ID_TSTEE.

In case the TS-TEE service gets enumerated on TEE bus then the
ver->impl_id will get automatically configured to TEE_IMPL_ID_TSTEE. It
is how the driver will get to know if it is communicating with an OP-TEE
based service of TS-TEE based service.

> 
> > +
> > +static int rproc_tee_probe(struct device *dev)
> > +{
> > +	struct tee_context *tee_ctx;
> > +	int ret;
> > +
> > +	/* Open context with TEE driver */
> > +	tee_ctx = tee_client_open_context(NULL, rproc_tee_ctx_match, NULL, NULL);
> > +	if (IS_ERR(tee_ctx))
> > +		return PTR_ERR(tee_ctx);
> > +
> > +	ret = mutex_lock_interruptible(&ctx_lock);
> > +	if (ret)
> > +		return ret;
> 
> In some TEEs, the client driver might need to perform extra work during probing.
> For example, when using TS TEE, calling tee_shm_alloc_kernel_buf() is required.
> Could we introduce an rproc_tee_ops and add a TEE probe operation called by the
> remoteproc driver for performing custom TEE setup ?

Sure, as I mentioned above the driver will be able to know if it's
communicating with TS-TEE then the additional functionality needed can
be conditionally implemented during probe.

I think it is really the next step after this patch-set lands where we
have to support the remoteproc service hosted under different TEE
implementations like OP-TEE, TS-TEE or QTEE etc.

-Sumit

