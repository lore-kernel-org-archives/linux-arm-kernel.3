Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C1606E54A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HLAeoFJE;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kDx6eE22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=; b=HLAeoFJEl+Q2ILekLWBvQ6LqDg
	Vsxhc1QFmmHYs7UIW3aRLBWCxARuknn4WiIeVJZpNBXGe98SaM6lv2GNJGKMpF3buyPNq1reJiIBi
	yY+LqMng7IT3AB7yRWBKt8j7Nx5h7wxOW4rC5PnsE8HVADlkBM6SvXHNmvNZ8R0XnzW4qnW46IOOP
	zMzNDto3hzkShZqGlRZ+Rd1I0dpUpqBCIoRv8qpUcuWH5S9hHkqb7MzKdhsobNCwZMjL3jRFKjc+t
	LKkT9B0cDxxOU+9+DC/46FfvOxJp/W8De0FEfL5VLt+x6ICJwtu4En3bPI+ZVjqjJTO1cAz1hTr/R
	SE9ci6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxis-00000009A6K-30kI;
	Thu, 05 Nov 2026 13:41:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxiq-00000009A5V-0BLe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:41:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48df4f540ebso992539f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793886102; x=1794490902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=kDx6eE22anDQzKsBj76oDJYrcqNNdFb68o5pEPJu5KpTej6CvDEjlLObNu7cyOvcOm
         4B5wlSSfe2md1mt0OjGYLOohu7vcz0GVICgkVh2ciXjMQAuLwhQegiRXbo26diPiOmPS
         3vP3/9W/McgljgV2yZXwByYNYxFbDV/7OASbbzBiOpWS5jMLoNk62fDcGgd2KKtUqKIj
         Qh8pxxoP6w6tJQZtl7PAr0hn1l/Ruq0ObNBwhplnybyRlMJeRTAm1ADHFZ0KxZyuAClH
         Mu6hKZwKYP103gXFIjMmQsNd/n801vZhGQoleCymKZ06wM3APjuurzz+mclBD1TX1YW1
         kS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886102; x=1794490902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/GsPw6ysr3Xvdnr+TigErWLMubZI7BxQjWx0TCjmMM=;
        b=VzXJRwckhyvwY/oxEFssA9hWLL6gKA3OM/VdwXfpqzhfv6TCEvN6t6bPMxcb1X0Yq5
         TbzleOT/0aewOSRtJx5ekh2XzrIe/urmn0WbgpiD+g8aHC/F82wSPVU3LAvt40Sj1AoE
         TR+2IbLXUmx0QI+Z8hAaM85ZLt30pA6FiBhAdWDlLCXBL4decZlx4ThgQmL6XN0Mepwc
         mnJLGHzOnVVNPpMKaV9xszPIx5nmdGlKthxcHhpsmn8Jf2QDrz91QVHiuKwXjHNMgrGg
         REYZbT0EETJT1tTc80AQ/rZojm+ERuLK38Vel6sYIsjn6dc91H8JVJ/yBzieAx0UemNf
         HxIg==
X-Forwarded-Encrypted: i=1; AKwUvBxj01V4AEekwettni0ZQ+q2SPSVX1IXVHr+EPd8GO94++0IvhNHSs6tLVgNdpv6N+cGnvyQe1rUcdCOE1r4+EMV@lists.infradead.org
X-Gm-Message-State: APuU4Z+cw9/NH5yIQXhqg1lbx0te29eSk8slsbkPiTTE248dD6H64GHO
	RzZxQzw4ZDxrkzHrgRortR7ymqLxsOJ9Ve6fpf1wGUkVfrw7jFq5DA51o8AC4LAv3qo=
X-Gm-Gg: AYBFou0h4J/5QqLUxF4xs2VGKYIqIC6RG+OOql6GE7LVMQ9qxArH+d24Si4EfOdXwgP
	tGMQBYCWzWV0EUjh88Xv4y4vsKwncuB3OkK2FijTODB9q/bXYAHMVGuGAEsv5h0w03tyC/cE2YF
	EcVY6D9VlEevrf5kgui7zCKGIjswvYLq0LKmyUUVAP/tKvZc48hVXbTirzgE1GCiXahkLfbTPKV
	TQLwk9tHIPz8AlmtPKoeg9uXxLdpsFJ6ui0inY7v2x/Ba10ETN46CJTxmB7qAxORWNWCoEFkY+V
	ex0+lxkC8MYeszwoSNDMHhnigQITqZj+VPwkxAndschkt4G79zrSxRgXRkVIP073NgfGmAx7uD1
	3uopA+0i6nXtf2pYru6q2+Os8eAzEf28lkSqHI1WYkOmSsT0IS3WVHHRDwrg5hQ5ThIvn1DSRq7
	a/PKGPpk4uFzj2U4I3RVnYh4RR9fsh9uqaDNQ5j+p4VJwioZT55pNO730WDMAjTa/1+V1n4qWt6
	AlORbT2iIQpf/taUnlNFDVnN9XuZJ6IgiNfgtxpwjcOiWSzTNRxEPc3raimT/iur3tqjs0Afdzf
	2ktrVoV0nBjNFb42DCfJNxPk/XSCSI3f4E8neDGvmg9One/F
X-Received: by 2002:a05:6000:25c3:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e6e5182bemr39618525f8f.51.1793886101892;
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fea1811c4sm10123361f8f.3.2026.11.05.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:41:41 -0800 (PST)
Date: Thu, 5 Nov 2026 14:41:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auyGiW91Ir0JcuxG@monoceros>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
 <sashiko-outbox-198999@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwyxkko7vmbusv5v"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-198999@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_054144_136269_E152D6D1 
X-CRM114-Status: GOOD (  24.68  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--cwyxkko7vmbusv5v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
MIME-Version: 1.0

Hello,

On Thu, Nov 05, 2026 at 12:10:05PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 00019b1895e6e..e750a127cbc4a 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -75,6 +75,7 @@ enum rsc_handling_status {
> >   * @detach:	detach from a device, leaving it powered up
> >   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> >   * @da_to_va:	optional platform hook to perform address translations
> > + * @memcpy_tova:optional platform hook to copy data into remote memory=
 range
> >   * @parse_fw:	parse firmware to extract information (e.g. resource tab=
le)
> >   * @handle_rsc:	optional platform hook to handle vendor resources. Sho=
uld return
> >   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> > @@ -99,6 +100,9 @@ struct rproc_ops {
> >  	int (*detach)(struct rproc *rproc);
> >  	void (*kick)(struct rproc *rproc, int vqid);
> >  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_=
iomem);
> > +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> > +			   size_t filesz, size_t memsz);
>=20
> [Severity: Low]
> This isn't a bug, but is memcpy_tova the best name for this callback in
> struct rproc_ops?
>=20
> Across the remoteproc subsystem (such as in struct rproc_mem_entry and
> ops->da_to_va), da denotes a remote processor device address while va den=
otes
> a kernel virtual address. Since rproc_elf_load_segments() passes the
> untranslated device address da directly to this callback (including for
> devices where remote memory is not mapped into CPU virtual address space =
at
> all), calling it memcpy_tova seems somewhat misleading.
>=20
> In addition, when rproc->ops->memcpy_tova is provided,
> rproc_elf_load_segments() skips both the filesz copy and the trailing
> memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_to=
va in
> include/linux/remoteproc.h document that implementations must copy filesz
> bytes to da and zero-fill the remaining memsz - filesz bytes when
> memsz > filesz?

That's a valid concern. Maybe `populate_segment` would be a better name?
I considered being more verbose in the kdoc entry, but all the other
entries are very sparse, too, so didn't want to add a 5 line comment for
the new callback among all the one-liners. But I can if you tell me your
preferences.

Best regards
Uwe

--cwyxkko7vmbusv5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsh4YACgkQj4D7WH0S
/k4IJggAu4L1Wed3i0W4vuPU7pAQ2mQJvf3FezMAeGDQffUtpvt+zlonpWqYwV7r
HK8tL4z8k28POxQlGKhkCLJS0JLSFnZpN2S0YQ7Kh2gQyzfxq6sUkwUkHKGNtYSX
0kI4wqKgdURieKMj4hFmGKeX9o/yXSX3F9W+uF+FwTl78oOZAK6YWgoZLjSbiagt
M40PJrmpoCTPln1ZcWc66RLVoA9IBR8TELu2VNA536pV3RSAGaCbHHmECAQMrBMY
IfGrXrxhI7fCIhMC5OT/hBBRB140ekbyW0PC1kdVqu1iT4j1WI7f+2wMV3e5ba2D
Yl1Q7lDlQ/qxjmKRlfF1oyzKWeAl8Q==
=axH4
-----END PGP SIGNATURE-----

--cwyxkko7vmbusv5v--

