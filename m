Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8538460A3820
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iDkME1D9;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=R5IDPNwy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksV1nYGWqa4ysMkLSXAqAv6N9dnVAqAoSrOhhUQFIQo=; b=iDkME1D9cKWRLj2oUAM0n4gJLF
	uUBzsWdD13WRC8oK1PK2wiPElweJFmO2C57o5/ulkG5qTu56UfbVtA5VVGBvsYGDzQNc6oveO9wxE
	rXDHhQ55WQmaTjGjDR2OiUQVS0Yxc65D2VralbG4N/Z2CZ3MGI3ZrCXdgNfK1EUgzQOZAgM/Fjsqt
	0IQcnJfxfmnu3HdNwGNYN6nVSTzWo4XVdyv5MbG5F72FpFE+dez+QJ4uVCjzoaPlp56jFk3rv+U+4
	5XW8Vi9XOVUnUcH1JI79Lx5kUbQvvMSnh8QBt0zMVHXEoURHxgRjpayF1Bo3y81coS3IZZ48B3INu
	xmNcGShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD0K-0000000AEkS-1xHT;
	Tue, 20 Oct 2026 16:48:00 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD0I-0000000AEjj-0oTF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:47:59 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-53664b4860bso25321221cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792514877; x=1793119677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksV1nYGWqa4ysMkLSXAqAv6N9dnVAqAoSrOhhUQFIQo=;
        b=R5IDPNwyWnLjU6u8phQW54Gfa4FZBGx3r9zYwe3yZc/oHiAcFSPhjSzBGNRfU2/2Hg
         JhlXMFESHmvm5UyfCoVvUALEXHezs4pRc01neG2ictp8mszr2Q1us0Fp5viGiRn5I2Mf
         3yQM6GKp3anvca+RZ/ySUL2CsTCTW62wej8KRAEyee+S5LxF7qlDzULlhpjqt4HkcF96
         Y8WTGL0t5JKxCfuCcXJNnyFGDDRvn5/4Q/DiNGqlU3JS58Hm/KuQu742LnRu699SHH2m
         MKVONV3WpYViZMsMKIXPzY8P/0RD6ng7wfKBWCS5DnaDzwPwp9Ol5GRHkGu9K02DyKns
         DRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514877; x=1793119677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksV1nYGWqa4ysMkLSXAqAv6N9dnVAqAoSrOhhUQFIQo=;
        b=GpkEnxxtk69BTS+xgRaY4fr/c/x0E3eKZULdNGBOCtrg3Koyq0i2qEj8Q6bBka7n1t
         0sr/qwf+BvBJC1RCJutX0d9jm6ow4dk7Ev/aYVQpv+2xMNnfcRr51YLFASV5m+h0mvq3
         3OYy/Yknw7FAIWse+BB4V4TuuAxG01CN88tYSvCcju8CX1Kzwc+l9dSUgxdMudqhVuwK
         pfbxdf7zIMvYMQU16/bt0g29A5ljYei7bWgvXeBq7BwnTy16F4PNR8EPNsA7H3Pd/zCe
         GidEKDpKVgSwh+/qenFdLt8NbqHEufAECThdUqN9/CF8DNIugr1WVkBMj4Z1PGSptxQb
         GxHg==
X-Forwarded-Encrypted: i=1; AKwUvBwvQ+8roCViMF5HeyaEjkaFQWB11Gv6zewq3BJfgvK8Jy5iPPIgqfnDKn4kaDJd8L+svUf2+Vih4CmoTAUif4nO@lists.infradead.org
X-Gm-Message-State: AFq9FYIbMLh+9O8rQfKEmrgfYWbuoDlSb9N8KynV4UonEA77dGSBiWg3
	A8iyw4ncDeDsF233Uuij0S6hYE9vs+uwLZxWfQXSP58l92X5nBU3to0EJ3oVWIvPuoVfQBDvaY6
	uIid/
X-Gm-Gg: AYBFou0deNXAyjrfh8wA8VZeH1xOJRUghe4OIRtY76qdVYUVgbWmHADf7EY+FA9CpuL
	wNekWmMvjd8VgsrchtOgL3XI1o1inahOjEJUqASBvSn4RRRuSYMvKFPQl04ymJDjS+kKoMQsDme
	hN6Qt7ePUjDV0BKISTsC5xKK/TIVyhygAICWXNNOyWIbxfQlKLj6SVYQB0kV82BqYrZmfb1o+qS
	By0XzpmTVoJ51fBTRHDhY7q84Z9hSyjlpDhN3or91jyaF4cdxhazQfAz/Cc9e50V/4giyBFqSYQ
	DXOJmxkI1LtwFZkO8jojZXzeosdZWPLRR6Uyetz7KVXbN/WYiCGK9QovFitfcF5Ftib/uGvZy0G
	ifKUFHIvZIPvwbly7vO489ke+bjYUU+ffIrhiVE70Xsw5x2jAkKrzbP9Btv0dRADsstZj5QyDho
	KKSB65uMYmGos3Uu7TKvHXtLymbWyKEje1iQF6NpCdgWSXlJFMCurM4DPe9E1LRSjFiW0ooy5zp
	+dGqOX3537AUniKlCKh0xpNv6zR9SNTZCVOvPXFKjyI8lcunQsnUSq/
X-Received: by 2002:ac8:6106:0:b0:535:a5f9:7522 with SMTP id d75a77b69052e-53646105effmr173286901cf.65.1792514876834;
        Tue, 20 Oct 2026 09:47:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b71878sm44011cf.16.2026.10.20.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:47:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJD0F-0000000Cndt-1WvQ;
	Tue, 20 Oct 2026 13:47:55 -0300
Date: Tue, 20 Oct 2026 13:47:55 -0300
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
Message-ID: <20261020164755.GR14213@ziepe.ca>
References: <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ateGVeZmDcOSxaOD@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_094758_294161_B4E50013 
X-CRM114-Status: GOOD (  38.23  )
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

On Tue, Oct 20, 2026 at 04:18:45PM +0100, Yeoreum Yun wrote:
> On Tue, Oct 20, 2026 at 11:58:06AM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> > > On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > > > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > > > be able to break up the multi-function SMC into several devices.
> > > > > 
> > > > > I think my explaination was poor. Apologise...
> > > > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > > > for firme specific and definietly, this would separate the
> > > > > multi-function SMC to defien each firme device (attestation and IDE).
> > > > 
> > > > I don't see that kind of complexity is necessary.. I think it is
> > > > better to just have the root smcc bus spawn them 
> > > > 
> > > > > But, the *base* is common. and I couldn't find any proper location to
> > > > > deploy *common* code unless making arm_firme.
> > > > 
> > > > What common code excatly?
> > > > 
> > > > There shouldn't be? Getting an attestation is entirely orthogonal to
> > > > set link ide, for example?
> > > > 
> > > > If you can identify what you think would ever be common that might
> > > > help clarifgy what to do..
> > > 
> > > I mean the BASE service of firme and typical example is shared buffer
> > > allocation. I agree IDE and attestaion service are orthogonal. but
> > > in case of base-service is not. it could be used for both service.
> > 
> > It doesn't look like it needs a "shared buffer", just allocate it
> > right before invoking the SMC that needs the memory. Use a simple
> > library function to help allocate it. No need for a struct device
> > layer.
> 
> Retrieving a PAT requires a buffer shared between the worlds. Before
> allocating that buffer, the driver needs to query its requirements
> through the BASE service's feature-query calls.

So? Make the query, allocate the buffer, get the token, free
it. Simple, one driver, no convoluted flows. Use a little library
style call or inline to reduce duplication if eventually necessary.

> Considering possible extensions to the BASE service, my preference
> would be to expose these operations through firme_device rather than
> standalone library functions. The intention is to keep access to the
> BASE service within FIRME-specific drivers and provide a consistent
> interface for those drivers.

Try not to overdesign things. If we don't know we need it now based on
how the current spec works don't imagine something else.

ARM spec design is informed by Linux implemetnation. Having a sane
simple implemtnation in Linux will motivate future specs changes to
align better.

> If we implments this with library, are you thinking that file should
> be located at driver/firmware/arm_firme or other place? though we make it
> with library, I still think it should be located at
> driver/firmware/arm_firme or some place in arch/arm64, but as
> perspective abstraction to mange firme helpers in one place,
> I think this design seems good.

Will has indicated a preference for driver/firwmare

Jason

