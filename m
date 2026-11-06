Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B499606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IJ7NZ2rz;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qh8zsFw0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ne3EpNoMJHND53sLVjB8iHYRzBbI+NXjoTQbJvnLE4=; b=IJ7NZ2rzBsFBYmNIfR4SWrns6g
	M4PIaA3EFSivWEoF1EC9M8t8K1dEyq9dH6hdOfNrXfq6qPVjgwYqtHWxypqX1qQ8henqiYJkcZpzE
	Z2dekLPfJObKJWfp4xMLkkd3GUMRYhLqNBJOYKokE/m0kFC5wVO01e2RRftubwylq7m2i0dKmYUej
	Vqqu2Z74/sALzAdV1cassbVrhdK5ffm03SmHv7xhIgXRrcGD/qCSfRPsgCK61BRv/bJB6RpF2sXVX
	HYk7qXCD+BimwroZNaKW6v1r9YvUD656VAHhKXY0kDLehnXew7O1ZxPu7OG4ud+xlMzKwX51vcKBd
	32APCMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL2s-0000000Cgwn-0agP;
	Fri, 06 Nov 2026 14:35:58 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL2n-0000000CguM-3hGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:35:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9ne3EpNoMJHND53sLVjB8iHYRzBbI+NXjoTQbJvnLE4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793975751; v=1; x=1794580551;
 b=qh8zsFw0enJLd4ZvClZWPDZlTsFIk5INKhrWJ4r78s/JpKm87ACudBoycHvJYPfqt7ySobj5
 Y5tq2ABM0ieDFOB/X/Z4oXRrAQhONtGQfiiuFidNOfnaBzOxWZ7PlBvYoOz5UxKKl9dCvBiUEqx
 mzRh4ImOR3c/W9z2ISz6JhXo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2da17deced27c129;
	Fri, 06 Nov 2026 14:35:36 +0000
X-Mizu-Trace-ID: 2da17deced27c129
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so72e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:35:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy8Id6MlJve5jx86eVhff+CvD6oRDz41aOTVkmI+zxfXAPEvKqBs5ZeVkU1rbpDKdoOP65ca8yKT7Y9Oib9kl4Y@lists.infradead.org
X-Gm-Message-State: APuU4Z+gWpJNyEnLro4GGrPF+QJf55F21NOH9HfiOKLYTtNBcwccNCpr
	Wbq3eBjKjDRibt/t6P4Q75hzn0sQDQpV3QHs6LxDCEExGkwp8PUSnMjh/Xqxs8mkR00V05gxYen
	pr7cVa8zR8qoY4WnEtvMOMNVAYD3udj7ZHRYDYPd6
X-Received: by 2002:a05:6512:4019:b0:5c0:50:ff89 with SMTP id
 2adb3069b0e04-5c0071d689fmr69373e87.14.1793975731712; Fri, 06 Nov 2026
 06:35:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com> <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
In-Reply-To: <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 14:34:55 +0000
X-Gmail-Original-Message-ID: <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
X-Gm-Features: AclHuK_pCYkO0OW5l_wmtgWxAs8e930i-uFO6iYlwOczI7StHxm9o788PZxd9Ls
Message-ID: <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
To: Xuheng Li <xuheng@cs.columbia.edu>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063554_264798_50DAFA28 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, 6 Nov 2026 at 14:34, Xuheng Li <xuheng@cs.columbia.edu> wrote:
>
> Hi Fuad,
>
> On Fri, Nov 06, 2026 at 12:03:29PM +0000, Fuad Tabba wrote:
> > Could you mention in the message that the WARN_ON() is fatal at EL2,
> > so a caller there gets a hyp panic rather than -EEXIST?
> > kvm_pgtable_hyp_map() is already documented as rejecting such a
> > mapping "with an error and a WARN()", which is a better reason than a
> > future caller.
>
> Thanks. I'll reword the message to say that the WARN_ON() is fatal at
> EL2, and point to kvm_pgtable_hyp_map()'s documented "error and a
> WARN()" instead of a future caller. With patches 1 and 2 dropped, I'll
> resend this one on its own once reviews have settled.

Actually, like Vincent pointed out, why the WARN_ON(). The caller can
just handle the error.

Cheers,
/fuad

