Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AEA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fSPk5Yzc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WuxflAwE;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ty+my6nc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui51WN0V/dq90aCRoQaIw8Ijjmf9wTxT3VDMGJPua6w=; b=fSPk5YzcqRsYmvZXjk6CsYQKVd
	L5F78ew1+YlPYBLaOMWh0qt4zHn1BWuDSZ+ihUnH4DP09hUP2nF+BFXod9KIMXCgh7OjYhRKGJ98k
	/wefu6yb4XZxT4JJaciVxloxD72PtYrIa1aZ6k/xtI4erKShNue6Nk19WRmBeNy484/mRpiHxJmim
	mdXrM4cbPV1KR+XYumaNJvSSB1J3bG2SZNXSg8e9TExH0XgjKGbQD4fogZmhERPuwOgWm3ZdZZE2u
	t0BRx94ssBz9WrhD3VDcQivrd4ETjsoceUS6Bo1FWcMnhL9x3id8WzVJhpU5UFo/VUPzm4A5D8wn3
	WeDL3I+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJA6L-00000009oq3-22xt;
	Tue, 20 Oct 2026 13:42:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJA6K-00000009opU-0UNw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Oct 2026 13:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ui51WN0V/dq90aCRoQaIw8Ijjmf9wTxT3VDMGJPua6w=; b=WuxflAwEtZ9MYmpHPvzHso5Dha
	uhZagiepQ7McoTN6rpQifd8ikQl0kSmfrFuUFe4jiE0G6+DzpGVigxbpq9HPegIIb7mAYZKpUtxxm
	UROiLcAIv/XBgaQlFesbCqgjqbPC7/9LcLwKfqdFFy82u2l8JmiwHO03ab1gaY2knirnThwAT9xkK
	xPjYjgdhsxmh5BJIGRW29CRNbIOCmp1b4Mi0Y89k4TmRTqA/HA01e7gHHDLK6qa2wf3VW4STIbj+K
	f5xjnOT0HBZidfmU1w4bNEfWzlh8iOZwtY4gG2MtCZAoaCFF4bhK9CK5LZ2PEZ5aWOyochp6T7wuG
	GbTie+FQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJA6G-00000004m7X-1Gk1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:41:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C03642103;
	Tue, 20 Oct 2026 06:41:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2440E3F7B4;
	Tue, 20 Oct 2026 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792503713; bh=OY6likMPK5nTxdza/t+zyh7NbQpzfSUse40FyClNkn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ty+my6ncQIlsTuIWQOiV5wASyQxxXpdS75sdC5d1rQrtulJwrfqMhMlnmgF8Ioi5l
	 dRDyNuszLF+5q4lDDkfIlaWn6WKgQGs5IBhMpQ838mC1eSnD2j3qlf8RXABZ2DgmEc
	 G3VjUvu6F8G14LpFo1pDdqnw9DIaRkVF3zmiBPSI=
Date: Tue, 20 Oct 2026 14:41:48 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <atdvnMJuHUJlqX8t@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020124536.GM14213@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_144157_051590_24C690D5 
X-CRM114-Status: GOOD (  29.19  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:
> 
> > > Also this is weirdly structured, it should just be one driver under
> > > drivers/attestation/ that does the measurement register part of firme,
> > 
> > JFYI, FIRME's platform attestation token doesn't have the measurement
> > register. ploatform attestation token will include the firmware
> > information (e.g. firmware hash) and verifier checks the firmware
> > information. the meaurement with RIM/REM will be part of Realm token.
> > FIRME's PAT is for host attestation and doesn't include Realm token.
> > 
> > Therefore, in the new UAPI, attestation only have the evidance
> > interface and MR interface wouldn't be used by making mr_cap as NULL.
> 
> I'm aware, and this may change.

Yeap. but current, it's enough with evidance.

> 
> > > it shouldn't have two components and some weird firme_get_instance()
> > > thing to link them together. That isn't how to build HW drivers in
> > > Linux..
> > > 
> > > Since ARM has bundled different concepts together into one SMCC FID
> > > range, it probably make sense for the smccc_devices to somehow spawn
> > > multiple smccc_devices for the various internal software aspects
> > > rather than have one driver spawn aux devices to split it ..
> > 
> > If FIRME were intended solely for attestation, I think your suggestion
> > would make sense.
> 
> The FID are largely orthogonal, AFAICT there is no shared
> infrastructure between the various functional blocks.
> 
> SO it needs to be split into proper narrow drives in the eventual
> kernel implementation. token goes to attestation, link ide goes to
> tsm, and so on.
> 
> > However, considering that FIRME may be extended to support other services,
> > such as IKE key management, I think having FIRME-related code scattered
> > across different subsystems would actually make things more complicated.
> 
> Nope, it is the right thing to do from a kernel perspective. We always
> de-agregate these kinds of multi-function devices into proper
> per-subsystem driver.s
>  
> > I initially considered introducing a dedicated FIRME bus as well,
> > but I felt that would be overengineering.
> 
> Nope, just use the smccc bus and split up the 'multi-function FID'
> there. It doesn't need to be over complicated.

Then, I think the arm_firme layer could simply wrap smccc_driver and
smccc_device, with an extensible base interface shared across services.

In other words, the attestation layer (driver/attestation) would register
a firme_driver via wrapper provided in arm_firme layer that binds to the
corresponding attestation firme_device without implementing firme bus type
(of course, the smccc devices are delcared according to service in
smccc-bus layer).

This would eliminate the need for firme_get_instance(). Instead,
the attestation layer would obtain the FIRME attestation device and
use its function pointers to access FIRME’s attestation and base services
provided from arm_firme layer.

Would it be better to post based on Jiri's branch [0] for next-spin?

Thanks for your comments! :)

Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_pre_rfc_draft1

-- 
Sincerely,
Yeoreum Yun

