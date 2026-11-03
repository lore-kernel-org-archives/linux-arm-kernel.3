Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93143606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FHU8QoD3;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D9+PG6YQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=; b=FHU8QoD3e+gcb0234547CQz3oD
	gyLMcDVA7rc+Hg5nGDYBQRK4S5po771wb/u2EZK74TqtmaBNjoAM/5Y6Z8yGxyYbaVZa1i9xyk+uY
	zp3On9G6RRw8R3FuYmVoc3ROzzedO+Xrmid1YMLhN6bJoQDMfgoHrUP6XF5BqOQ1GtweM7gkFO0aD
	WNz+wNB0iJD0V/auIM4vcxgTY16fjeETFpOM0Z9D0DIdiLeRSzsNp6ICmV4xYtaId+nbuw6VI64Y+
	CUlaqTtX0YKU+J9oRc1zRuGSnIXQNk2hSbOeuoLVTTmEI8bLzpGGP2WsMVQ54GYY80Ae2jEwzPT62
	lUl7R+9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3wF-00000000r0i-152f;
	Tue, 03 Nov 2026 02:07:51 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3wC-00000000qyn-0yNT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:07:49 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so3650138c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671667; x=1794276467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=D9+PG6YQHbxKrfJ2IIGBXG/ZAjnoVP7B6BrF7kE+bZnFQMYNAwKtJ9Wx8ngOyTOvaH
         Djhp90e2CRUqZsd50j3QX4Ej02DwTgya8U2GqQBgjgIdeZtwWjFhtIq9AeG7KVdfyLYc
         auAYJq+DJbwgf6ZsaWl6HlDc5/lyYY2vCreLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671667; x=1794276467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=wmW0Bt4LX14LyYpUVMDSQLddBpJFGkaZVCC5Hp4xv/TOptAuLdAkv7rXPWiiGpg48o
         GMan6Ni0IFb+6oZrU2lAwF3pW4iZfqG5VKObXjxhQxWU3hjNmfAT0vm/ZbjFGJ9UaYIO
         3kKh0FFo56DAEvnJrAjLUOwex2QqxV/IL1Mc7JMPubG7X03nhBsyZL+VmaVwJwosI6e7
         mTm4RxWhGUTKYydY/+DKDAlCKaaqHcSV/71CztM13+V/nb1b/c2EbcP8TRNPi2HSLMiq
         kGHUZa9IZ78PgA+YVOFo3tekkwGbsfK+sEU78hE2PDb+ACpgIc+9bn8EIIq4ViTdaSLA
         qdCw==
X-Forwarded-Encrypted: i=1; AKwUvBw79a+aG8IZLCS9oK6522AsBXdvE+6NBHsy5XSiswKFMoG68jnv5idZfARgRxzHTZDuOGwmNjQ4wO0B/6JVXPpv@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3aFoI0k/eB0Kqm1WpgOpS2wG5z6RGT+Ug9dY9pFou48JtCtgO
	aa9jDy8eL2Zs5M0LqFF7XBxzy+BYa+j30OPKEx7sOWcMq9fwsCJ9LNfWCder7ABoTw==
X-Gm-Gg: AYBFou1gdJHPPb4FGB0/NRm2u1YofAc5mJQJo7nszWY4ctCh1i2XQ7B3DKVGrBM5KQ/
	Vggvl9GlUD4LOKawfzE89rESKlnNK+MPZbJlvns71XtCYRSwHMIzJ2e+1tI32UQu9q9CJmgLI8T
	lv54m7zwbiZdKkM4aGA0NlyCfKQqEe3AIEGrHRngPhixMMCLpsEnfrwKLTa/alcRW7JWM/pQcVP
	YgTHcFZEroDEbUUDBtx6RfiqWLqhlAMuiroHR2fOtyCMH0ZMwKaShkzoVeAJeYwbnDgAV/0pBuf
	7E2QtZ7qbal6xgsBYsuBi/cVWLxZQX3QeCn1CymJ51EeqVIRLzfEtwWWKAMbaw0AMKO22lQahEX
	xfK+g+xDI7zwluvhJx/o/mz8y4U7MBvoVJaMFlB9JslQ3bbmBQPEYrt/EEHnxpsDs0LVnMV1TmT
	HSpK6eV1S/WDEnxa+XZ/RROyFqiy/plcJI9Gpu97OaxuUxeTInsaPMjRnElQTvt4eJosBmxDNvu
	wgNiU5qQuBqTM/O9RQv2887/cQieYP4uwPHQRUF7KLVBE3WrcDLPJiIqx5zX1zugImdhyFGJfcH
	weNLLtxNMPMDsHvDPr8e72Lsbc9NnMjaBi6c5n4DqVQwak/brc2e3FKwUwRhONfBZpM=
X-Received: by 2002:a05:7022:f105:b0:168:e942:4e62 with SMTP id a92af1059eb24-1ac601d2f3amr14793852c88.40.1793671667220;
        Mon, 02 Nov 2026 18:07:47 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b23b847348sm4090158c88.4.2026.11.02.18.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:07:46 -0800 (PST)
Date: Mon, 2 Nov 2026 18:07:44 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <aulB8F6hc1eDvyfj@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <20261028-literate-pony-of-valor-3209fb@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-literate-pony-of-valor-3209fb@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_180748_275428_66E4E4BC 
X-CRM114-Status: GOOD (  14.30  )
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

On Wed, Oct 28, 2026 at 02:27:05PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:41PM -0700, Brian Norris wrote:
> > --- /dev/null
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +	tristate "Google Tensor CPM MailBox Array Interface"
> > +	depends on ARCH_GOOGLE || COMPILE_TEST
> > +	depends on MAILBOX
> 
> Can it be compile tested without mailbox?

I don't think so. mbox_request_channel() and friends do not have stub
implementations for the non-CONFIG_MAILBOX case.

Brian

