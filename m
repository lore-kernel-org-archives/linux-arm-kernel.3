Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EBB606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3AsM164e;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=McLlj5dx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEVIAWxa+q6sbG3Bq/x2CA113pzvbMJrwYJBK5kHkqE=; b=3AsM164ePe5ib+N4tIkMPCY38/
	LQKpq32vBJOBtBpRd4hpc9U/N097xj1jGvTxoaPbuFwDfogdWFoLHDIW/B4u56ChHv5hrzWaH4I7g
	6J8mZBoAtgGbg1B/u/+FbJ7ObDgtEPRkZrjI6iPNo70n5GjxktyvztS4SvPQ8Ysm1Ca+VH12TlhVI
	MDhP3e6b7EwoqpbANOygo4/bZ0HLhvB+G3ptLiSYhFEfraWPwIzEDlMCeZz4iIf5LhcPESpOZ5oSU
	78ZLu0ndg4r0FWwz8K+LJD+cyhtOP3F+Qx0bjDYNmB26X+9bTv3ZY3woCliugJ9TV51WiKr55l/6k
	dO57Wq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEsC-0000000ATlQ-0Dwr;
	Tue, 20 Oct 2026 18:47:44 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEs9-0000000ATl3-43Kg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:47:43 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-53381e53b80so42141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792522060; x=1793126860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NEVIAWxa+q6sbG3Bq/x2CA113pzvbMJrwYJBK5kHkqE=;
        b=McLlj5dx2EFk7nc+5DeECWODQHEiKpyFs9qdlJJ6eO4naj5OvMNwJpyoplb8Q2wTGa
         Tum0mTD2DDcuwUZTSaBDnDPbka2GRdWIPycF1FcGWRNRH/E6muuJ4mn1q3nOSUlVLlJE
         n/XYyaIOaub1wkC7XPlHXLMGHOypoK0QiadSkhchXzep1mfP/XV7hhttg7EoqjJRzxH+
         1zX8WVbNh3wS1WPRP/jbwld/KyfvoB5tnfp7OcyhygVhMWrs/rPXTLX1DGkPXnjjmS0G
         Z+F1XVZjKAobAcsJ0GgzO97otIkilvey3WaoXxSaO5MxvdSPx2w9/3wsCyjtY3Ld6oi8
         TAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522060; x=1793126860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NEVIAWxa+q6sbG3Bq/x2CA113pzvbMJrwYJBK5kHkqE=;
        b=PbK2K14kvi1YlaQ+CIQpMd9skiGtbgrYdrxOSylRAqb2La0HBaePtOqapwZRzESMdN
         gfH3bGYyWW5mbTyBco9Tx0Sw0PK2sNWWpwrLTLCbFIXR4bc1w/hem44t8EiiZCHywOJK
         xK8vV9D3OicioILiGVQizZJCoKtU282YVXj8eHsMtbEl6jimIkSTyUnTcLvAZ+WdhzLp
         foFJOhF71oRBrj0pvNaIbPIBTVERcD+R5ezGN8YNX9Xt6okWsq1n7P8oiQR7Ra5PMPis
         rqMphjj6CkL+J6z3CnApFXkP+46T0PrNdgslrlWf4E3kju58gs2w6vbc8JBc3p0bDoyv
         gTZg==
X-Forwarded-Encrypted: i=1; AKwUvBxgdUoQomTT2i0AtXpto3X9+FXHWfrm1k+SGKeeTLQZRqz5wdM5MzQymW+PIRS9BXA38qFrc0wuwflLiJKWbY1Q@lists.infradead.org
X-Gm-Message-State: AFq9FYJwa6/hXlHLWjFlc2Zp5ITb5BeQDwuh29ky1h3VBS4aEwgTjgwR
	jgBw1TQr1D0QMDVnMy83CJdiBnXK0USMFKTOXK0FfZFlhLCOUDidx5Ukm+lL8hOLruY=
X-Gm-Gg: AYBFou3b8MwU0VcqhzZbBlGxOons3Zw2RTZZAzbDBjZgmlHHEbIaG2Ja98+NZXFj3np
	zTPOD/1lOf6vYsT2GhTcwqV4VkmBBjLEedTPOHqb+SchRP5PClYTnRKJCewSQqmkBc3QWpA6QPb
	TXYELOzUNmRleVNSBf99V9QiQDFAxwMbb/TfhCazSI4Ey52p2CBHCFKb3NyQ7BmUlWUyhQ3A1n+
	WVvKYNrvjFXPs8+SPw829KSjttQT2nNAAzarta6Rk9Wt8kd74arlbEDjLEqNzhbI8v7RHG5TDg6
	HYUgHfxOhDXGxbSr/tE7aQXItq6OfVxHgnxg2aIQ1qr3qLWCNJdjnqriahhfwfg/52FRp0bHMHe
	QV4MNezVe7q0ZlRx3nyS/dK2E8Pnp7om9GrYYShYWoc+0zSDeuNbQP8vGj+O8AFRiR0Cp4z2da/
	M1yv4+59FUANKe3oQ8UqkCdUxKir9l9UZlkHkV+bKro4SDLMg+LyOS3t0t7xvOmJ3hNhMAEAF1H
	ytTcsR3NTn+a7lGQT8oB2QfVa4cUn/ObDWNoqhwiev0hGxDpbKQfdvJjAVXqjOqJo4=
X-Received: by 2002:a05:622a:1aa5:b0:535:232f:ca25 with SMTP id d75a77b69052e-53645bfef7emr161704501cf.7.1792522060406;
        Tue, 20 Oct 2026 11:47:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698b427f5sm2545661cf.15.2026.10.20.11.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:47:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJEs5-0000000CtNP-0Yiq;
	Tue, 20 Oct 2026 15:47:37 -0300
Date: Tue, 20 Oct 2026 15:47:37 -0300
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
Message-ID: <20261020184737.GS14213@ziepe.ca>
References: <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
 <20261020164755.GR14213@ziepe.ca>
 <atefXz-0cD9viNHK@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atefXz-0cD9viNHK@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_114742_012368_764F7FB6 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, Oct 20, 2026 at 06:05:35PM +0100, Yeoreum Yun wrote:
> > 
> > > If we implments this with library, are you thinking that file should
> > > be located at driver/firmware/arm_firme or other place? though we make it
> > > with library, I still think it should be located at
> > > driver/firmware/arm_firme or some place in arch/arm64, but as
> > > perspective abstraction to mange firme helpers in one place,
> > > I think this design seems good.
> > 
> > Will has indicated a preference for driver/firwmare
> 
> Okay. with this let me make a driver/firmware/arm_firme as library not
> a module format and make this library APIs (base, attestation) to be used
> attestation and other. This means device / driver registeration with
> smccc and done in driver/attestation/provider but use the APIs from
> /driver/firmware/arm_firme.

You should try to structure it with a firme headerfile, and some
inline helpers to invoke the smcs and then a very small set of out of
line functions that *are used by multiple firme drivers*.

Don't put attestation in driver/firmware/arm_firme..

You can look at what I did for DRTM for some inspiration

https://lore.kernel.org/all/11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/

After some feedback from Jonathon I think it turned out fairly well.

Jason

