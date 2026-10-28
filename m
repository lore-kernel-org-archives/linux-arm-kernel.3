Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rSSMoJVu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2ZYoHu4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/vK5C+z753Ldc2efhljC24upKDWY/ID73cW01PyfTLw=; b=rSSMoJVu1a1+eJ
	rwBRnG9FWQFF9TL447hNTD30i9xu1sNuGSd1mlh9n41tYcEC752lIckuUBGRtEy8vuWXNIlr6vKDn
	QXTEsb0gQqRHN1m7a7jmgMk9J0uESfhib8KrUHe20VKa1QKA5Xbvy95d7a5tLEl7IbLtT6kEz7FA8
	0CDcekVD/Hb8mvqyppmYmz3GQzUnnhsS0dL5ygUXz9dJU+wDVtmevYN/e19ec5+kWHZp7Z1FPAol1
	pg9VXeJIkdVmBrq5WNsCUEMWIwT9ZSW9V5E3A3gPKn83kZ2LjBH40V5U6dMlMn6klDExKcVp6PZh+
	WdB4L3Q+YoN169AUmRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuId-00000006Ceh-2PmD;
	Wed, 28 Oct 2026 03:26:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuIb-00000006CeH-3Kut;
	Wed, 28 Oct 2026 03:26:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E4D341A84;
	Wed, 28 Oct 2026 03:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75A91F01825;
	Wed, 28 Oct 2026 03:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793157961;
	bh=/vK5C+z753Ldc2efhljC24upKDWY/ID73cW01PyfTLw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=F2ZYoHu4Ke5redW7yT1lepvi8XuyJXVY8kB2Soz01LWCk2/3Jr1wWQMm4V93gWhtz
	 gpIbdrL/+0Uc4zbhgIK+4Q/e/HSh1lXeavy6rrtWahva4Xra0jhcg3LlUfvSjbMUxS
	 fvFHO/agzt46sG9c09v8s4ST07qqLjiK0647TAMEiTRLvh6XpDPVeMlK9bF3YqWRTa
	 bw7jRrdpQTIdh7jnxShSvJCZcAEqm5zCE0+1ObOGYdVA6w2uZMEYnbjS+L2fk4uQCp
	 iMXNm7TCMgEUFIz8BdGxBUD/kJLbSSpeGm/mZ/AMqTEI54J20tdGMectcotGrzykh1
	 c8rYwIsH8pDaQ==
Date: Wed, 28 Oct 2026 03:25:53 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko
 <andy@kernel.org>, Benson Leung <bleung@chromium.org>, David Lechner
 <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, Jagath Jog J
 <jagathjog1996@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jinseob Kim <kimjinseob88@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Remi Buisson
 <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, Bart Van
 Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 2/9] iio: core: annotate the conditional mode claims
Message-ID: <20261028032553.2e865b19@jic23-hlaptop>
In-Reply-To: <20261028031834.2ff7e6bf@jic23-hlaptop>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
	<20261027124954.110697-3-zoone.rupert@gmail.com>
	<20261028031834.2ff7e6bf@jic23-hlaptop>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 03:18:34 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 27 Oct 2026 14:49:47 +0200
> Rupesh Majhi <zoone.rupert@gmail.com> wrote:
> 
> > iio_device_claim_direct() and iio_device_try_claim_buffer_mode() hold
> > the mode lock only when they return true, but carry no annotation. With
> > context analysis on, each caller that releases the claim is reported
> > for releasing a lock it never took.
> > 
> > Mark both __cond_acquires(true, indio_dev), the token that
> > __iio_dev_mode_lock() acquires. Sparse no longer reads these
> > annotations, so drop the comment about it.  
> Hi Rupesh,
> 
> The history of the definitions of these being in the header at
> all was to make them visible enough to sparse that it could
> figure out the locking and 'mostly' give good coverage.
> 
> Given that's no longer necessary, maybe it makes sense to make
> the implementations private. It doesn't really help us that
> much as those nasty helpers are still needed for the
> rarely used guard that claims the current mode.
> 
> So maybe it's worth this maybe not...  Anyhow, perhaps one for
> another day given I don't think it helps this effort.
> 

> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index e9a5d1d905c1..04c194bdda87 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -2269,6 +2269,33 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
>  }
>  EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
>  
> +bool iio_device_claim_direct(struct iio_dev *indio_dev
> +{
> +       __iio_dev_mode_lock(indio_dev);
> +
> +       if (iio_buffer_enabled(indio_dev)) {
> +               __iio_dev_mode_unlock(indio_dev);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(iio_device_claim_direct);
> +
> +bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
> +       __cond_acquires(true, indio_dev)

Dropping that marking. Turns out I even failed to build test this...


> +{
> +       __iio_dev_mode_lock(indio_dev);
> +
> +       if (!iio_buffer_enabled(indio_dev)) {
> +               __iio_dev_mode_unlock(indio_dev);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(iio_device_try_claim_buffer_mode);
> +
>  /**
>   * iio_device_get_current_mode() - helper function providing read-only access to
>   *                                the opaque @currentmode variable
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index ca91f5a64626..b9e4888e18bc 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -718,18 +718,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
>   *
>   * Returns: true on success, false on failure.
>   */
> -static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
> -       __cond_acquires(true, indio_dev)
> -{
> -       __iio_dev_mode_lock(indio_dev);
> -
> -       if (iio_buffer_enabled(indio_dev)) {
> -               __iio_dev_mode_unlock(indio_dev);
> -               return false;
> -       }
> -
> -       return true;
> -}
> +bool iio_device_claim_direct(struct iio_dev *indio_dev) __cond_acquires(true, indio_dev);
>  
>  /**
>   * iio_device_release_direct() - Releases claim on direct mode
> @@ -753,18 +742,8 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
>   *
>   * Returns: true on success, false on failure.
>   */
> -static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
> -       __cond_acquires(true, indio_dev)
> -{
> -       __iio_dev_mode_lock(indio_dev);
> -
> -       if (!iio_buffer_enabled(indio_dev)) {
> -               __iio_dev_mode_unlock(indio_dev);
> -               return false;
> -       }
> -
> -       return true;
> -}
> +bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
> +  __cond_acquires(true, indio_dev);
>  
>  /**
>   * iio_device_release_buffer_mode() - releases claim on buffer mode
> 
> 
> > 
> > Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> > ---
> > Cc: Marco Elver <elver@google.com>
> > Cc: Bart Van Assche <bvanassche@acm.org>
> > 
> >  include/linux/iio/iio.h | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> > index 9b63785d5aec..ca91f5a64626 100644
> > --- a/include/linux/iio/iio.h
> > +++ b/include/linux/iio/iio.h
> > @@ -707,13 +707,6 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
> >  void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
> >  void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
> >  
> > -/*
> > - * Helper functions that allow claim and release of direct mode
> > - * in a fashion that doesn't generate many false positives from sparse.
> > - * Note this must remain static inline in the header so that sparse
> > - * can see the __acquires() and __releases() annotations.
> > - */
> > -
> >  /**
> >   * iio_device_claim_direct() - Keep device in direct mode
> >   * @indio_dev:	the iio_dev associated with the device
> > @@ -726,6 +719,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
> >   * Returns: true on success, false on failure.
> >   */
> >  static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
> > +	__cond_acquires(true, indio_dev)
> >  {
> >  	__iio_dev_mode_lock(indio_dev);
> >  
> > @@ -760,6 +754,7 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
> >   * Returns: true on success, false on failure.
> >   */
> >  static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
> > +	__cond_acquires(true, indio_dev)
> >  {
> >  	__iio_dev_mode_lock(indio_dev);
> >    
> 
> 


