Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E0606D804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fX3oiGi9;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tZ9r4Jzb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z2fWxPIivUBhMftF8Gk1vKGE8eRaXMmvpg6wPiGqf2I=; b=fX3oiGi9odd+tKFR8jQZa1PZeN
	Lx1bpNilzGjGRz7zh3EalqJsKeMnQKGZ9oiEUnmK68DlEwiTtv19VIcF6JjSwUhVniImwHZyQ/4Ay
	kK+S7ICRmNTVI5+xv0i6UTVAo++y6TqwenZyAPvNPux4Hpzxj1KvR+7HvMgNZRmHwmRybh7PV0jF2
	t69dXNngOhjNYKePs46QmlrrjLBbBYzn+Ev+BIuLz1vpkdrdSNmJ09G60qffBxhhkMY37GJW8Fb14
	xJEBJmXu/NYSjaJIq3kf6api8C0rqKAwSjxzWZskj6gx4KDBX4FSwUyMllfJOBMigj5S3jyK2NmlH
	GdHSSDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIg5-0000000CFwp-2wpT;
	Fri, 06 Nov 2026 12:04:17 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIg1-0000000CFvQ-2g8Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:04:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rj2O/1Kb6OAaGvUDXfJ6mwWrzDMaFwYbI8RyxwywtBQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966651; v=1; x=1794571451;
 b=tZ9r4JzbuLRsjt5YpO8Jig8xPY8hTfnWa41Wedx60tBSOUaHN34aa7Y19ite+x7H4bXmdM30
 DVSbtoQztWvrBq5BZ99ESJZpfnlJ+WUSULIRtuLlFqZfNHtWK5Qh80P/H1sV3wy6/gUNC8Mtita
 DTq9jD1YsEZtWrcVSM5fPWd8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9591eacf49b9a623;
	Fri, 06 Nov 2026 12:04:11 +0000
X-Mizu-Trace-ID: 9591eacf49b9a623
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bff701efa5so3357e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 04:04:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxORkh1GlB4clq0pl9gOVRiKAXcAE46HelZfIdYjLbkBOkvQUER+FBZD6c7ExIgD1tUVwjJTSxtvLI0rrtqh9PG@lists.infradead.org
X-Gm-Message-State: APuU4Z/y9qADwHdgAN5/1+pmkUoRQZM/KxUe6MGCQs/cBboGJ76Ay/ug
	D1lmdf6jAZlgKArEto787dmrHJXIcVOO1xDQEGtjDI6iHzfBiANEvWGw2btnN2A75jfw7cOjWE6
	3d8DL9xY90diKzovS8fVDmdK+eOven9DMMwJWZnl8
X-Received: by 2002:ac2:4f13:0:b0:5bf:f1ea:16cb with SMTP id
 2adb3069b0e04-5c00641eea8mr72074e87.4.1793966645378; Fri, 06 Nov 2026
 04:04:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu> <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 12:03:29 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
X-Gm-Features: AclHuK9hNEpLkAP5NVJokscwbXhyIypQ1gKGYucY4gZvymjkk3c1yRLXlhMVEq0
Message-ID: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040415_370040_4DC864C8 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Hi Xuheng,

On Thu, 05 Nov 2026 22:59:50 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
[...]
> No in-tree caller maps into an existing hyp block mapping today, so this
> cannot be triggered in mainline.  Fail such a request with -EEXIST
> instead, so that a future caller gets an error rather than silently
> losing the rest of the block.

Could you mention in the message that the WARN_ON() is fatal at EL2,
so a caller there gets a hyp panic rather than -EEXIST?
kvm_pgtable_hyp_map() is already documented as rejecting such a
mapping "with an error and a WARN()", which is a better reason than a
future caller.

Also, please don't respin series so fast. Give us time to digest the
series first :)

Cheers,
/fuad

