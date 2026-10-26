Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BE4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IOBTyqFB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IWPDWWVK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tmyLomRU3odEzGMBEnqER8cvULIdSR4sKslKh+g3oUA=; b=IOBTyqFB3V4gsuei6h7WWX+mom
	4HzQgMg7BdrzX+Xut0FCCXe/4XvUgV8B8px2bOhhrYlGMKq+dlt8jMHzBr9lJIrVYcyaIhq9L5JTp
	0cKgEwuWHVLikE4a4AqYSOwK9blyqAi+5ieQj6qyyEadTBarp5payOkGra1N5LlUVpjTi8Lvq08Lu
	FXLXiwQhyltK2vEDRyYs6H/BmM+go5VpTUpLGWNU4dRGhPp9CzDLAY2rkN/VUojUcj8UnC52LRoGt
	kXH9NX1vK0wEtthwz+l0TgYhJz9NwQ2BOEar+sJCOu5nBMj8KAZwmhsyAvqx+6Tj4BtUAshnVjOsZ
	9GQZ7now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPqa-000000036ed-41fF;
	Mon, 26 Oct 2026 18:55:04 +0000
Received: from out-190.mta0.migadu.com ([2001:41d0:1004:224b::be] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPqX-000000036dr-17uE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:55:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MoHfFpJAFkB5Xy3qYToV+bmZRv6HdYN4+v8GE4amOTE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793040897; v=1; x=1793645697;
 b=IWPDWWVKr3kSRPqljCWlcb6/UuNeN3bcGNlx6iMKMnCl3CzLQG0T2L4Mm572TRIrUeIJLDFr
 U0ENwaZBHEL24J4Oc1uBNNfWuRb/TT7+bQtA2JJPiK+EXIilN29iQPNoH8XMdFLispsQfl9fAWe
 gug2XTf5c3DK8JxpuW50LhA0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d8420a780dbff587;
	Mon, 26 Oct 2026 18:54:57 +0000
X-Mizu-Trace-ID: d8420a780dbff587
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso1583e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw38b6MlC+0A4GOctZoFaH7LMG23h9qN/QRdLQ4H0ySGZPsbTMZluyI74cBHzqllvAxfH1itEXoot8hCsNd8Ivm@lists.infradead.org
X-Gm-Message-State: AFq9FYL1WByvFpBdnCTxqjNs1HMehorUxuDqnQA26c1IaZndgzH4i8Mo
	dsuYXOKhdeUXfOhSFS51DINK3eYiYaZ5Ni0s3p+LtXWR7KOdMrOLKB/Nw1i26LlgDgnBWa/rvUM
	aIMFpW40PZv7oAZEF8XdIzwoxXgJhOlje687ZpMTI
X-Received: by 2002:a05:6512:691:b0:5bf:a5c1:d20 with SMTP id
 2adb3069b0e04-5bfb7a0c36bmr234023e87.16.1793040892816; Mon, 26 Oct 2026
 11:54:52 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-4-fuad.tabba@linux.dev> <4066f726-310c-4168-bc06-1502740703db@app.fastmail.com>
In-Reply-To: <4066f726-310c-4168-bc06-1502740703db@app.fastmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 18:54:16 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx8Yy0eYQauYX7CYR1TFbJXLFJBssNfWtr72s=azLFY0g@mail.gmail.com>
X-Gm-Features: AclHuK__ZiaYmPESVb1fdiC9S92LDB2sGT2vZe3GOgGEAspZkMFDfe1sVpLPpQk
Message-ID: <CA+EHjTx8Yy0eYQauYX7CYR1TFbJXLFJBssNfWtr72s=azLFY0g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_115502_314509_466E9932 
X-CRM114-Status: GOOD (  12.37  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 at 17:33, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, Oct 25, 2026, at 08:51, Fuad Tabba wrote:
> >       return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
> >  }
> >
> > +static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt)
> > +{
> > +     struct kvm_vcpu *vcpu;
> > +
> > +     /* The host never uses ACCDATA_EL1 */
> > +     if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA) ||
> > !ctxt_is_guest(ctxt))
> > +             return false;
>
> Maybe add a wrapper for this as we have for other features?

Thanks Arnd. Makes sense, I'll do this if I respin.

Cheers,
/fuad

