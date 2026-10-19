Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12370606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 23:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKFY6+rW;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PNVnK7yc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5R66mz9oDZ4V5MTXt846nwHi/Uv89TbwYD+eg/h2p4=; b=zKFY6+rWyZXb7M1l5VLbxDPBlU
	oqccZbiTZPV6JZIdul1udMl41DdX5HjO2ZUinNImbEB2xPoVxpHxGJtXBnh8Lcz6w3jY4uC4/KOS9
	xS4UzGNJ5z0be/UCxYPquEi2QFUrohQZuH5XVHaaB4R5IdcI7POt3sojKU3BODf2ePLgZgZm6jpsM
	2fPkgN/EJrKU/zPpSMB0Q4Jw47pt5bSChvc+O77czOxptX+DkmDk8ar8o0xeVq/kLUoe1JoQGIVUo
	//vq69k/FE0Md5czhRZOYvuPnvz9qobcDOM97Sna2HbsopaZfcfHUhJ6uhi893QOeQcIAvNiut6Tw
	krbMtJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwtH-00000008Xog-1O2E;
	Mon, 19 Oct 2026 23:35:39 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwtE-00000008Xo2-42OS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 23:35:38 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-91b8b456dbeso34281506d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 16:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792452935; x=1793057735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m5R66mz9oDZ4V5MTXt846nwHi/Uv89TbwYD+eg/h2p4=;
        b=PNVnK7ycrU86+7OZDiykRt4TUWjttdOAuWHCQc5JvKpBiHObg9WM3MGVNkljWxWF3Q
         lWt1jTIhAmZTZ9R2WgPt5kzYdB/T5teIEnEDk6jHbRbNeaWYxRd3jWS5n4ffOUEWMVUV
         CtGrFnhy+oEEpK/OM7Bx2T7j86M0iahT3JNKVzAfqx4Uwm9UTcl4qoRKzzKRlZf60zk6
         5nvCVgVJBQS1W+GuGtz3b7ggcQeBJgeJDa3IxFCTdurigAMG439cviSJOUCbcx7pTWH6
         3lCKUOv8TqZkxOp99EqwQlc6Zrk2wO1KltAcvidDcSceSYa/azOtlG2RFVXPNXlrQNCx
         iSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452935; x=1793057735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5R66mz9oDZ4V5MTXt846nwHi/Uv89TbwYD+eg/h2p4=;
        b=b72ZBvw5w+4sv6fslYOrjd/2ad8PetW3QAAruJ23OWO5EA+tVXwBWQlqPic0Pi/42J
         lz1l0EelqJCACASQSyZj279K5rW982sWXMAufLHSbcuJXYJd1jM5umY+nkYPyxPkXO30
         yKSwoxgVKnS3fCH1aDdAMYnfISQaN74ymMt66cHjridoSVPiAmRhFbrsqAQC6MKcTA7E
         LiHUM3a9ZpjtqCERJVokQoVEzKXLcngpgMHRGQukhcBppegzqgSkD2NkbSsOiz7vd/Dy
         PMd63OTTAmBTPUZyNUgjuef1ElXqumwLJrystt7FuQ6FJH43NdNb8OfTZ/yrZSzcdEkP
         1UGA==
X-Forwarded-Encrypted: i=1; AKwUvBwaRDfDktTUHskHUtp42rBTefWcF977cMDKWF3dYYqksUBC91NX0+5CJtNeC3NXPeFOJleJuuuDZ4y40o8/djtL@lists.infradead.org
X-Gm-Message-State: AFq9FYLHlwjDPnmBxvJ/bYeiLZb3Km1P+PEjs9qTRZhFvi+OLli4EwnS
	c9xugULbhSliPBxTIhZEJot29U+RIla2rXa1SGBo7d2ddK7SHwiLGFN8JtYVyznWk8xOiUeLYWt
	arfhh
X-Gm-Gg: AYBFou3vjfmhrt4GRYiB5ZLGFEnkNJ7IaeMLk79tEANqKBXVmuphPD+s1G882uZsLFM
	XDyzb5D9HDznVk2BN6VMUoA19vi1ARyDVqCdf8h0nTERgGAoyq3pS+/TrrtgfKRXwKbDUKL2VCP
	ZOqCxMG+/+Olw0So/7kWJzcHK32QnEpqO+ka5iiaT7iSTWGCvI0hFxAz2A4yAMUMx/96jJO14fI
	mJePrPa+jWJVH8XcG3/UWka6ZQFrX0FLsfnXxXSUKbZkRStH9XG1Zyd1qTv4jRG6nrB4SysBtFG
	rdo37WJY1XVEBaqtc6SvMMA6MsaZYBejBezmY4D20Mko2AbOU34eAMUp32XqmUIXI4BxYUq1H3h
	wtVa9eOIpsQPr1nEgGCi930Typ1Hg1xg4OlrBjvSZugmZDMb+Yb0YaCy61U5tn5vP09bN6EVLGk
	x475I1RuL8UTwyyMyuYHp1XtvGYzOLyLjyQaQ82+laJIcrLImYYVIq3OQokynsvZ5l5xYFm/ZHi
	2ImRG7eFbr14I27zDJ/qu6WCz0wUy7KozyMFkXLjiFwwaIxYuXFIjL+6A==
X-Received: by 2002:a05:6214:3482:b0:91b:f655:4e4c with SMTP id 6a1803df08f44-91bf6554f9cmr65063266d6.47.1792452935159;
        Mon, 19 Oct 2026 16:35:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c04088680sm9297256d6.16.2026.10.19.16.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:35:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xIwtA-0000000Ay8i-2UGX;
	Mon, 19 Oct 2026 20:35:32 -0300
Date: Mon, 19 Oct 2026 20:35:32 -0300
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
Message-ID: <20261019233532.GL14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_163537_094396_2F292BB2 
X-CRM114-Status: GOOD (  11.56  )
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

On Mon, Oct 19, 2026 at 03:14:32PM +0100, Yeoreum Yun wrote:
> The Arm Confidential Compute Architecture (CCA) introduces the
> Realm Management Extension (FEAT_RME), which enables the creation and
> management of dynamically allocated, attestable trusted execution
> environments known as Realms.

Same remark as the other one, this is an attestation subsystem
driver.. Stuff like this is *exactly* why we are building that.

Also this is weirdly structured, it should just be one driver under
drivers/attestation/ that does the measurement register part of firme,
it shouldn't have two components and some weird firme_get_instance()
thing to link them together. That isn't how to build HW drivers in
Linux..

Since ARM has bundled different concepts together into one SMCC FID
range, it probably make sense for the smccc_devices to somehow spawn
multiple smccc_devices for the various internal software aspects
rather than have one driver spawn aux devices to split it ..

Jason

