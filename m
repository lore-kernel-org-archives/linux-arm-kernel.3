Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E48606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=16GORsLp;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Az16B1NT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xCKzQnE8sR8qGnyIMcveJ64Ln+A33qIBzCr/8Ncna5s=; b=16GORsLpUGHYdgNyBcR0leNNGZ
	I21JlP1rrL1/UbtRcm1ehY8xcFPHcRO0/9BS9mklz9r3MMVEFFyvlAcMLzu+/Y9IUKrofCZb30ujJ
	x5Gs2qNkcoor8cUO7z9CtDGyzcQmJwKhLnuJv4+CFDxulL1DXxC0hVnVdF6u3FOpDl4Ynx1nNFu4e
	cAcLcMHFkKFVr8/dk/fRkucshvLZXNx08dRzwQRwLmi/IRh5jcklu+dMMwzMJbHZ4J6Zy0i69KS5I
	YJcXeu5fkSjtkKLZgUcsaLMBhR9SP4h9MtrsZ0AkKiW2Nuzrw59vFzI5x0l+PbseS2sh3la59HVFC
	raqI4s2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAb0-00000001iDY-3Qsf;
	Tue, 03 Nov 2026 09:14:22 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAax-00000001iCu-3sxp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:14:21 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A9E7320103C;
	Tue, 03 Nov 2026 10:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793697257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCKzQnE8sR8qGnyIMcveJ64Ln+A33qIBzCr/8Ncna5s=;
	b=Az16B1NT/o8u9bVz4Vr+qtoUJMO3XnS5rLrEvivYNfOeg/KeYGFKJa8LvN/V523v7lH/79
	dKjT1Dj0L2tkZoPLOQYbfdaLEiI4+49lt+e0MAxy8rJLme1LJMizWuHIj3IuJqhIdplKzl
	bLdN24LfJoTlqzgYGPzLR7nqq8CoC8dBkvg2VKgJL1LKp2XvwAUqf3Q/cBzK8GgB83tSLq
	iJQT7CebcWCXUevcw24RNeD62XHc1PVw01VapBpiNKtOAGGnKnBK9rgWhkCY3EnEB6J/J/
	TZDqOnUvRwt7btSCyUqCt3QOIkm1cCXRPqacLNsX22HxcLv1l68DnXQC2AxoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793697257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCKzQnE8sR8qGnyIMcveJ64Ln+A33qIBzCr/8Ncna5s=;
	b=IeFNgT0IVHiRepot8IhD9+8MZxksgKp8QtZ0Q+NkRQKSzRW3F1st38bGCwY408Qds7atpb
	ASrtbeQfpuAnNb5kkd7A+fbJ8ddafXqTtv0cWMMKVkgzhTPcwxdGEQURAVF1Bq9QZ0rgTg
	9Vy3wLWnvjju/NCLna2Jd9dKEalVQTk8EXyJGFG8zWnPj2aNmEqFl0MlVN2ji7XxzsVrsT
	WQO+2MIY9f1v0UNM0UDw6LyRIoKSSMVnq3fAMy5ZR/NKyOiIELMNjRr/xIJYmGGI4VnjHD
	4JiOPXyDQ1eksy1+MAANficJxkHsVtWHcA8cTuH9WeEIu9XiQesit2LyMZgpcA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793697257; a=rsa-sha256;
	cv=none;
	b=MqelqDHcu32UrtpOsw3KKZGLgLnFSR66JSukkrD0iM4rky+LVtOW4DCdHiERKyp0wwyUUR
	GpeDDOCAgBKM7K8U1C36Gv6NbS5q0c332HXHoL93qzyNgEhptnCF4Q7rWM42PJSwcutHq7
	hj+C8jujlg6ifEOlQI652m1MHSw4+zhWckIyPos4F8hrlN7763yEA8xzS9Aogizms7TF/z
	N9uxspC3AcdMXAscx5zzdN40nfJrBNAnohLxQCGiVeRKE+pr0x0NTROgrjV/fgvjOKINoW
	XQbjuGVpvakYsEUAjDsft9Ml7OavlmNny2MoEjyxe4tOnmtQ082HCtQPFGF80g==
Message-ID: <88963fd1fd87123496a55e2002bc8b0dc2466bd4.camel@pengutronix.de>
Subject: Re: [PATCH 6/9] reset: google: Add CPM reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,  Peter
 Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@linaro.org>,  =?ISO-8859-1?Q?Andr=E9?= Draszik	
 <andre.draszik@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Radu Rendec	
 <radu@rendec.net>, linux-arm-kernel@lists.infradead.org, Mariano Marciello	
 <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, 
	linux-clk@vger.kernel.org, Jakub =?UTF-8?Q?G=C5=82owacki?=
 <jglow@google.com>
Date: Tue, 03 Nov 2026 10:14:17 +0100
In-Reply-To: <aukyyYhDCBUdIH16@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
	 <20261026144346.6.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
	 <8d57f0a1dc8a07838bf1320f9b79588196264ff5.camel@pengutronix.de>
	 <aukyyYhDCBUdIH16@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_011420_437808_B185212A 
X-CRM114-Status: GOOD (  24.58  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mo, 2026-11-02 at 17:03 -0800, Brian Norris wrote:
> Hi Philipp,
>=20
> On Wed, Oct 28, 2026 at 03:03:24PM +0100, Philipp Zabel wrote:
> > On Mo, 2026-10-26 at 14:43 -0700, Brian Norris wrote:
[...]
> > > +DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_assert_debugfs_fops, NULL,
> > > +			 goog_cpm_rst_debugfs_assert_set, "%llu\n");
> > > +
> > > +DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_deassert_debugfs_fops, NULL,
> > > +			 goog_cpm_rst_debugfs_deassert_set, "%llu\n");
> > > +
> > > +static void goog_cpm_rst_add_debugfs(struct goog_cpm_rst_debugfs_ent=
ry *entry,
> > > +				     struct dentry *debugfs_root,
> > > +				     const char *name)
> > > +{
> > > +	struct dentry *d =3D debugfs_create_dir(name, debugfs_root);
> > > +
> > > +	debugfs_create_file("assert", 0220, d, entry,
> > > +			    &goog_cpm_rst_assert_debugfs_fops);
> > > +	debugfs_create_file("deassert", 0220, d, entry,
> > > +			    &goog_cpm_rst_deassert_debugfs_fops);
> > > +}
> >=20
> > Please drop the debugfs functionality or explain what it is needed for.
>=20
> Ack. I think I'll probably go with "drop", but some notes:
>=20
> There's no real way to test and validate a "reset" driver without a
> consumer. There is no direct (even for debug) interface into the reset
> API, unlike in some other subsystems (e.g., GPIO). I believe the main
> purpose here on Pixel drivers has been hardware+driver testing, so one
> can test reset functionality before hooking it up to real client
> drivers, and without adding fake drivers or extra debug code (a la
> "printf debugging").
>=20
> (One might observe these results either via /dev/mem-like access to
> registers, or even through external debug peripherals/consoles that can
> monitor the status of the underlying component that is being reset.)
>=20
> This all would generally be in an early hardware bringup scenario, so
> admittedly it probably doesn't have as much of a use case in the
> upstream kernel  -- it's a long shot for this kind of hardware/product
> development to *actually* work directly on an upstream kernel, with
> upstream drivers.
>=20
> ...but if I were imagining a better way to do this without bypassing
> reference counting: perhaps it could be useful to a have a
> debug-oriented "reset client" driver, that could bind to arbitrary reset
> devices, if they're not already owned, and expose a sysfs or debugfs
> interface like this? That could fill similar use cases for this sort of
> hardware testing/validation area.
>=20
> But anyway, I understand such a proposal should definitely come
> separately from this driver submission.

Thank you for explaining anyway. With that use case in mind, I think
"drop" is the right choice for now. This functionality can be
implemented in the core and use reset controls like any other consumer
driver.

regards
Philipp

