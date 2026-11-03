Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YuO/usrF;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=O5lmUz6q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yRNBCNleXapj6/D9Dy5JVT8U1O3DIrFP6P/UGlFxQWo=; b=YuO/usrFWVSJklJAuBKF3wwdnG
	ScKy2OWeTquRR9MpHDlUYzjBFAJqQkVeqHskanqa9j+kyAK6Rq1wwkcvy3ktcgfXBF0hVXJamOyT3
	X6iqKA5FwNp1MIk/eGhH2/gUlzo0P1rbwm53cBN/e4h64r8GFtCFhZonEEc/CzKlcaK+t21GISOFP
	NcagQfOjb1Al2piBixlzuSkQMmv645QOg7Sc0G6NGLwj7ySysjMfD4WrMkBjfXebEVY6J9yRgahcY
	SOIXDt4GQp7b6/ajLP3rzs+2HnTEmawTN+YkV3CthQze4z9i4ZKzOR3wMF1kjgctWYWKKxyNoMESx
	CNYk7IPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJsO-00000003Uo0-12Wi;
	Tue, 03 Nov 2026 19:08:56 +0000
Received: from out-249.mta1.migadu.com ([95.215.58.249] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJsL-00000003Umt-1oq6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:08:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yRNBCNleXapj6/D9Dy5JVT8U1O3DIrFP6P/UGlFxQWo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793732931; v=1; x=1794337731;
 b=O5lmUz6q5pRfDhZOh1Um3EqlZfU96vwu5sQgvLr40rTo8P8REOp6fgFGfd7M3JAu8T21WLAF
 zyDDHBwSz/w0dxMp/CZvn3vPPRsmf57uXiXNyObPCV/yN1vT7lcT6KHCirBwJjnxQJmQAPVjfm9
 K9uRucXL5sOBZllWf6AZN09M=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5d3681224415ad66;
	Tue, 03 Nov 2026 19:08:51 +0000
X-Mizu-Trace-ID: 5d3681224415ad66
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so1070e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 11:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxGSXKMHfgUdwmqsf1bs6dbXPeX+/ysymfODLXUMPwQ0UQnDw2JB7w4DoWmV4ow3P79fmtuqQWIqsSKvwWjy92i@lists.infradead.org
X-Gm-Message-State: APuU4Z/W/vE7jTL2D7B1VvnJ9uMvFrs/P4R26abBcR24GfWKB/kyQNBu
	Qnqu5v1kxvyXmlMSxQR9fiNmT7F1dR502hoinTr1UUpEqo8+Mj7Zh8upIvWnuZlsj1I/zDuYTET
	qJ4VucwBp1S474gSgS1tUH0pwlmzbeCvo8ScrZlwz
X-Received: by 2002:a05:6512:6c8:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5bff406f902mr12922e87.7.1793732925312; Tue, 03 Nov 2026
 11:08:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev> <auoT0b1LxuDlZOnc@kernel.org>
In-Reply-To: <auoT0b1LxuDlZOnc@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 19:08:08 +0000
X-Gmail-Original-Message-ID: <CA+EHjTynpZOE5s4U_Ls4WHdhHqTTo5Vp8YqKxK3EwxBT3O2XVg@mail.gmail.com>
X-Gm-Features: AclHuK8AbjAuWLo00Tzpop7EQF-bwBMdIvmJij4-h9aVeKs-eFdilzti7zR-K-4
Message-ID: <CA+EHjTynpZOE5s4U_Ls4WHdhHqTTo5Vp8YqKxK3EwxBT3O2XVg@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Stop stage-2 teardown scaling with the
 IPA size
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_110853_678219_C3B0748D 
X-CRM114-Status: GOOD (  10.68  )
X-Spam-Score: -2.8 (--)
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

Hi Oliver,

On Tue, 03 Nov 2026 17:03:13 +0000, Oliver Upton <oupton@kernel.org> wrote:
[...]
> I don't see why optimized destroy walks for CCA and pKVM is
> fundamentally incompatible with driving them from a loop that
> reschedules. Non-preemptible kernels are still very much a thing, I'd
> rather not undo the fix we took for that exact use case.
>
> So unless I'm missing something completely obvious, I'd rather that CCA
> and pKVM do teardowns from that loop.

In v2, pKVM's teardown will run from that loop.
kvm_pgtable_stage2_destroy_range() will return where its walk stopped
(Suzuki's suggestion) and pkvm_pgtable_stage2_destroy_range() where
the next mapping starts, so stage2_destroy_range() resumes from there.
That replaces the pKVM path in patch 1 and the lookup in patch 2, and
I'll drop patch 3 and the Fixes: tags.

Thanks,
/fuad

