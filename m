Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5904B606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plheaSNr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hIOwi2+K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iPFbuhVhE1g4yui1cmP0KhQNdE0EYgL9kQOJwYevAeY=; b=plheaSNr6zz8jpC7sZL7kfK8es
	pko6bwCCvq6qtUhkchztx4aZZcaDXoeeaDQAvr/2lZKA0M3EPm8KkvCj1pdw3IQnNJoo7evmlcRgn
	c/jZJ1J1zNp2iKFqe14nAbdSD7p5BUsKZuWju9RqVjtXeKHfnHlcp1BYV7ZF6qjaeuvkvGvhJ8ObE
	9tsWQay6Q39kw+PCjIR7BHBngcK+79deCmsdhuZ4m+aZOis3I2Cy6EGq/XHWNr1650+zymlnF4NdF
	uRyT+9oBSXHjwyBX/qHonxDrALZOtyyZPnHKPU6J1lFl4Dr4HIqRqS6k2Tag0ghkdNETowQySswl2
	IytdKswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHN8-000000037i5-0PMP;
	Tue, 03 Nov 2026 16:28:30 +0000
Received: from out-122.mta1.migadu.com ([95.215.58.122] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHN0-000000037gL-2qxt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:28:28 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CUR3VrnT7Ns3nP5+yfIqfY8w9gLzlAPh5PghOBj2uBY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793723300; v=1; x=1794328100;
 b=hIOwi2+KAJbWUSFAc6vd2q4RYWYPQ+ypTVXy8BrX+VyxusZDuRc7cfwt2M0la3oiXta8rT/X
 sxAZfSGUcZmHXs8XgxObdAmWKTVHgNyJYQ6JEEalnxdUavB0vasxd/nAiWMHQeWDIybRhCHEEjf
 xD0Lm+5wIcrCcHT/P7W7we8w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7823085f6cd776c4;
	Tue, 03 Nov 2026 16:28:20 +0000
X-Mizu-Trace-ID: 7823085f6cd776c4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8697e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:28:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxBANPuCgnNsc3RyKdP7TVsEjQL+cwaZWSG1NvNk5UFapXLHDgybhh/lWx1eSUoBOShOMqUzRekE/1GswFM1sGQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+P/YsZSZZtUTUrbK/mbhdgQTYH2SqHVkOnsaGUtDfpuOWphmzg
	8Dxy1DJ7MkGVlH6J52RNAhP5Rl/91YH3mhz5OhnaTwOvaAoL+ojvknCybQfVjvbkCwLr7duQy34
	wYoMpOZXXf00Aaz/gGRPgsIHSXsFDNwhPD3Khbt6B
X-Received: by 2002:a05:6512:3e0f:b0:5bf:d226:862e with SMTP id
 2adb3069b0e04-5bfefdaa5bamr205874e87.2.1793723295372; Tue, 03 Nov 2026
 08:28:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev> <aun1NJNtnOeSL4oc@google.com>
 <CA+EHjTwCPHp_odMPJAJ8pfPtymtU5ia_RrH30DavFeiZqvhVAQ@mail.gmail.com> <865wyd3mqu.wl-maz@kernel.org>
In-Reply-To: <865wyd3mqu.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:27:39 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxfQ5P+Q9jrGxr6A4CjtewetFE9apskj061iJQbtwAsyQ@mail.gmail.com>
X-Gm-Features: AclHuK9bqtJuUq_-qqIlTFI2gjtDBN-F09-mdn7cW-n-Iv21GT3fzkXnYFOU20Q
Message-ID: <CA+EHjTxfQ5P+Q9jrGxr6A4CjtewetFE9apskj061iJQbtwAsyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when
 destroying a pKVM stage-2
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_082825_670071_CC2C1FD5 
X-CRM114-Status: GOOD (  11.92  )
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

On Tue, 3 Nov 2026 at 16:26, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > > > Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
> > >
> > > Isn't it an optimisation?
> >
> > No, it fixes a regression: 4ddfab5436b6 replaced a single walk of the
> > mapping tree with the 2^27 lookups, as described in the commit
> > message.
>
> But that's a configuration that simply does not exist in HW.
>
> Therefore this isn't a fix, this is an opportunistic optimisation that
> may or may not become useful. So not a fix, no backporting.

I'll drop the tag then.

Cheers,
/fuad

>         M.
>
> --
> Without deviation from the norm, progress is not possible.

