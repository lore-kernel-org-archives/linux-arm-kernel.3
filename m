Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E9960A383A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BlKJX4If;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=k2PTt2A+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjbG/FoRPniPEwnQTEjCNTAwJMSN6gDCjOc1NSBW89Q=; b=BlKJX4Ifkprddzig1h2FFjVwNA
	sWpwMJRVUgDlY/wQOBVMNGHF8VH3T1Gi4R9VxjpTF77pXfqvyeRvWbPL1HmUhqYqcHwUbcp6l/+5K
	YTNyh5FaK4pdCALAu/7H6aUGnnQ9E/wt9bmYmaroDzqUBU6caXTwsF/qHpJMhq1Ce5hmUmmpVNU2F
	rF+NN9Nz1O8H9aXrHOD79DFY+jgfncQeJgg3McYgx0CJvvXpzOpesdFjaXS6B7mmyUfhZrPmCnBxq
	7Xhz8t4PyxoLWfcpcs9QXy0nZkyx7bvwdRIfI+0eNLjvDsz3EdB9MER3cqzL4C7plGDw2TKYBx0zL
	9H3os0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBIA-0000000A0ZG-3xb8;
	Tue, 20 Oct 2026 14:58:18 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBI0-0000000A0Wk-2gKl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:58:11 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-93e63ee7b4cso373012585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792508287; x=1793113087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjbG/FoRPniPEwnQTEjCNTAwJMSN6gDCjOc1NSBW89Q=;
        b=k2PTt2A+PhqnEF1ob33yqFa8TTufPFURIq5S+abfmB030jrQJvoUVXfGicMb1sZNAo
         KdU3mztK3si6hlb3t7DpxP3A1p4lptl1Kv6inWACuWe9flnxiJLS3YrHbv9kRW59sLlc
         vDqCrqR5PUfLPGlsGegGzAbrmBmc3yAuoF46wNYJwuPXEsTMiAjm0QtXGJWXjTrAMfRq
         R7dnSPpsiCeTVt8eG4zrQvSvcN0ivb3xYbOBwp/4iQgZjWPaPKbUbIhIHTIYu9wEam+7
         oPXJM4Tln351tQmzBr+NGNZO1Rgxqlp3oAl+3Irv2aNasyOLc7uoQATK+8CImDvpvW4x
         v2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508287; x=1793113087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjbG/FoRPniPEwnQTEjCNTAwJMSN6gDCjOc1NSBW89Q=;
        b=dwQGihBURX7/lBjBZr2cr54RXeKJ62FVYGj1aU/SNw0P5Ah57V1TyJ2ztZI+RS6LIk
         M8sp0lxVsNjkLHM56rMZNOWRan1gXq+QYLGvFbHMIZmwfrs1oFLEG6YOaDj4EeS/okgy
         yHjAQ/33BXw3YhlwgDaqnmsaqo421M5JPQEjnCia4OSLhLkwaIUxSUUBjfXIf6hAcdzF
         ugMNfq4NPvQ16o3yxCWFJQhv7clatTixIg1WHAMU4sNOGAH7hKzSF9UXL0z4FcE4FfYD
         jdzyJKsSt95Oee1/3k654O4XtvPOGii8YPCUx799xGOE/qEX+CA6oEHb4ok3Dd8RetBn
         T1fg==
X-Forwarded-Encrypted: i=1; AKwUvBzAqNAopV4TIizufibZgUPxm3dA5GQ3OLBTncQymf+yCxx9kXN7V/88pFuuKPHDpGbrSqncrjzwnxduEztELjnF@lists.infradead.org
X-Gm-Message-State: AFq9FYLkhyClm+3FjE/+7KfJrh5n6ghVbcPBDA8DrrWWfbOEsPJesWbK
	pyuBhgtd/AEpHaDxhSdAP4jPZzz349kxy97zhE4W2baqSh5l5c/yRaAvhvSrWHf8oQb/vuJ+hw/
	rOg3/
X-Gm-Gg: AYBFou2Oe/kkKXC2F08WH/UzJmhfyjB8uUaalQkO94ox9b/de72nkqBLnIj5uR5zzfi
	xi5YSSl/p7sLpYiLjCgByV4fXmv0qsallBOiNglqzwOxKwni0lLg9Ocn5fMe6/y+c4NGlBr3LNn
	gHkYsjjWZw7c+DMnNTPOarGIpGCun1V3zMx5Xz+e31RnMLGic79/Ro1pcAHc+iN9OCllKKJyYYA
	AxEn+vGxKIz6W3V6Qi9ff53jig+7gLjXexw5fTYXAJsI4/De0jkhNDj0QQ8DbowSwQpg7LL6RLe
	Cm4fzpVFjEvp5uTFqEsEBtx6cI/8xwSUhMQeeHDIh85le2axscYmPCmnWFneCNt74S6neKcRuFs
	ExwL3jJvsxQD+mfdXztKMb3Rlrr/NNDpBsvw35jJhvdLpZGDi8BnJ8I+GbNg1c/9E3qGjbNAWx/
	11OYnc29lVQLJUWGtjnqzMRYxoboD6Q2dbyQ0I1s5824KOgzRQJGQ5tS72pd6CR1yhiz9akf+8Q
	JwQXkJoYFfknzPoyQQaDhgcy5FHlN+ue3UB4+7sw2cli/u13RgA9myt
X-Received: by 2002:a05:620a:4442:b0:939:a0f3:6aef with SMTP id af79cd13be357-93f29ced7cemr1836575085a.23.1792508287130;
        Tue, 20 Oct 2026 07:58:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56dfdb2esm1820385a.28.2026.10.20.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:58:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJBHy-0000000CiZ3-0ODE;
	Tue, 20 Oct 2026 11:58:06 -0300
Date: Tue, 20 Oct 2026 11:58:06 -0300
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
Message-ID: <20261020145806.GQ14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atd-I059nHAwcZFE@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_075809_023356_D4D13F06 
X-CRM114-Status: GOOD (  26.54  )
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

On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > be able to break up the multi-function SMC into several devices.
> > > 
> > > I think my explaination was poor. Apologise...
> > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > for firme specific and definietly, this would separate the
> > > multi-function SMC to defien each firme device (attestation and IDE).
> > 
> > I don't see that kind of complexity is necessary.. I think it is
> > better to just have the root smcc bus spawn them 
> > 
> > > But, the *base* is common. and I couldn't find any proper location to
> > > deploy *common* code unless making arm_firme.
> > 
> > What common code excatly?
> > 
> > There shouldn't be? Getting an attestation is entirely orthogonal to
> > set link ide, for example?
> > 
> > If you can identify what you think would ever be common that might
> > help clarifgy what to do..
> 
> I mean the BASE service of firme and typical example is shared buffer
> allocation. I agree IDE and attestaion service are orthogonal. but
> in case of base-service is not. it could be used for both service.

It doesn't look like it needs a "shared buffer", just allocate it
right before invoking the SMC that needs the memory. Use a simple
library function to help allocate it. No need for a struct device
layer.

Jason

