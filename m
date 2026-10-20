Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FaFp4wFZ;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ORvn9C5k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jgziv0oXH76L4ws+TONisnnpeya3jfmnUGQwTi5aL4=; b=FaFp4wFZVRvTskD2KBwWFF9gMl
	NzE6fe4/8PIdJkNRVExYZpKyD+m7CGSvlGVRzNI2TyTmqv27/kSsUuBWOv+WfTwOS/CsbMlvZ/bC5
	z+jnlGBTmP4NLATECrn/UzD/EGVM/5MreFb0VQB+DIRRQyOPrImPwQO5zFVWCdM7ubGAbE4rjSCrd
	XgoM2RMzXN9I2PQeTjNIZ0DV+Ll/JTwJ2Vo4XVydOrZ8luZHYEI34YTmvXUOhjN2kZITjSj0bRN+o
	Y6Fs/Om4wvQjgzVx2lu6SOv/ylXexlmfmnFS1fJTZ9y0G/ztbB6gep29IARtJtdvfBCYCmSg9vqd+
	jy9L+m8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Dp-00000009hnX-2SmU;
	Tue, 20 Oct 2026 12:45:41 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Dm-00000009hnC-3ISO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:45:40 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-91b89c6caffso25387936d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792500337; x=1793105137; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Jgziv0oXH76L4ws+TONisnnpeya3jfmnUGQwTi5aL4=;
        b=ORvn9C5kmBoxnu0eigL+L+WKpvGYyv1J95gAz9vTPWA2eDwFw+AgXK0o7X1IBtHGhI
         F+vF/emXah3r9uTMp8Xm0N/j+dj91DtPLpxPNxbsyV16yTbF2NKHPzNBjZrV0P80jX5C
         QWnnvjePe179TvC8LssCORQ80ZIhPXRCmOyBdYuirLHvhHMdRIVkr9Ou32CePzRXRUe8
         tnQXSKHXv6/Fl3zCq9Wuo2GOxSLLifNPkM7Y17kWTakWn07FAMFC9ITOPtKSZlnuHXNU
         ViBXqwlv4pNEgutBKfUUv+hjEgQxW2tmolpeUcY0pI1mmvZCkVdhARkVqmR4fELD7dK0
         vEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500337; x=1793105137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jgziv0oXH76L4ws+TONisnnpeya3jfmnUGQwTi5aL4=;
        b=NPOl8uEtax6EXhu/kjYggCu5Wh3HvgWaHYIklgPVBX2h9OhvBfqqCS0sLCPqjiIWxK
         Sj7eYXOSXJphIASyn/VYQ702nQOp488EY0TEU8naJgD0wRqIWSw27+alGVWi8r3kBFuu
         OYk6ZddnrbsZ4geNVdug2aHnjoG7eFRrmLcZgvErcZoRbOOM3vl+K76gWilYEb1Qffjz
         2o1u6KlcA5A+fHye3f0o41hQhdOVC7fZMrENT6L+7NjC4+sRmwTG5Fezp1FHU9gBEMQE
         epM+1Lc/ve28y1kuZyzRLo0U0qZSHzmyIohEsAu65pISNUyKe7m5UdBAwn2zcdcziKQ/
         zEuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV1mLQJ0o9fmE8VXjCfvIUxhhICoYWlEdNCzkw+SYKbFL7r6fAGmuZrLhZ8Hn7AY1qn+GNGlu35IU/DZTgS8w9@lists.infradead.org
X-Gm-Message-State: AFq9FYJllkcdHACyJDtWOKU6COisyEHO/fwSIVK+zslty/023vqaVJN1
	QKlnOXf/oHwkgOysNJ0ki9BIPngjMSgfq6aR+rLIVbM7aiL/2B7t+32KSLWbM5oYiD+o9reeD2X
	QxgYG
X-Gm-Gg: AYBFou1HbNsjDZ66OnLj9wIYxT2hy158U3O/C8mim1WV7MjOioI7gzlZgp0gunL8QMe
	UUkVYu/iPMZGSJhr8PxeTdINEwAH545aRQwXn+GHNS6B3Bdl0SxCqNoS3dqZviZemapy/URO0Ud
	Qy36YLIwTT7xBNQJdvVTzyaXwncH5m1u9L2I1jpZ/t72a/yZU099jF0lm0YZ70hvm/B6iclTWdB
	1zruURQIKcuNSBnyHZE3ePWPn1eOhhtJ49lPA0+Kc9kwglWFjLbhE12SdnWTl+teUy89DQjVlG8
	RJvXgsOaKhBhIFQi9vwVv3BeTUgxOFBT6/3j1xWmVT68gJOqToB6UO+hDTmBgIe+xY2wV91xxJI
	BRKEIIZDvdifh1tOw7WwoGjSyOhFLPKvi4znjoj7bs4ljXDK6nABT7Wf2INWEJOzpXyFFjHDkpR
	aYYurPLsHAWCgr95KVtFfBRK3lpnu/5jGfEb2MHcCgR4w156AZhDjV5iuXXVmx2B9Kq5Dk1XviH
	QKq5zE7h07fnRoboZJvHQqDDQe4CBIS14E39Qt5EsK1s91JamNf941Jtg==
X-Received: by 2002:a05:6214:3f89:b0:914:cdbf:b76 with SMTP id 6a1803df08f44-91bdf0a622cmr179577856d6.13.1792500337142;
        Tue, 20 Oct 2026 05:45:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c0408c531sm25905716d6.19.2026.10.20.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:45:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJ9Dk-0000000CS5W-05Ws;
	Tue, 20 Oct 2026 09:45:36 -0300
Date: Tue, 20 Oct 2026 09:45:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261020124536.GM14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atcUoSdggT9eU8YE@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_054538_941229_90B7112F 
X-CRM114-Status: GOOD (  22.02  )
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

On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:

> > Also this is weirdly structured, it should just be one driver under
> > drivers/attestation/ that does the measurement register part of firme,
> 
> JFYI, FIRME's platform attestation token doesn't have the measurement
> register. ploatform attestation token will include the firmware
> information (e.g. firmware hash) and verifier checks the firmware
> information. the meaurement with RIM/REM will be part of Realm token.
> FIRME's PAT is for host attestation and doesn't include Realm token.
> 
> Therefore, in the new UAPI, attestation only have the evidance
> interface and MR interface wouldn't be used by making mr_cap as NULL.

I'm aware, and this may change.

> > it shouldn't have two components and some weird firme_get_instance()
> > thing to link them together. That isn't how to build HW drivers in
> > Linux..
> > 
> > Since ARM has bundled different concepts together into one SMCC FID
> > range, it probably make sense for the smccc_devices to somehow spawn
> > multiple smccc_devices for the various internal software aspects
> > rather than have one driver spawn aux devices to split it ..
> 
> If FIRME were intended solely for attestation, I think your suggestion
> would make sense.

The FID are largely orthogonal, AFAICT there is no shared
infrastructure between the various functional blocks.

SO it needs to be split into proper narrow drives in the eventual
kernel implementation. token goes to attestation, link ide goes to
tsm, and so on.

> However, considering that FIRME may be extended to support other services,
> such as IKE key management, I think having FIRME-related code scattered
> across different subsystems would actually make things more complicated.

Nope, it is the right thing to do from a kernel perspective. We always
de-agregate these kinds of multi-function devices into proper
per-subsystem driver.s
 
> I initially considered introducing a dedicated FIRME bus as well,
> but I felt that would be overengineering.

Nope, just use the smccc bus and split up the 'multi-function FID'
there. It doesn't need to be over complicated.

Jason

