Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C710C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+O/RjKz8VvaPPQMBTUPAO9bROziXqWuh74ARHIp9xKM=; b=Lh+lLpV2P+mEltJzbT97Snkpfj
	un0qU77uUDrF1YqGbk4bkqiDWERa+VO15debCKKvmEbxD/OGJQB5+jjGT914LBbEetfw+wOQBU4La
	Wf28YSrFqXhT80a5T1kaWhdcWgpR9kAeL5SOxjexSpO+NrVSxwXVE1f7Ao4gLlc1qEFMY4P6AVAVZ
	I9MBRP65UJEfQ6ALFsjLyVo9R6SYcopEKTvSxt4wHxoacE4boTvJCXNh5FpvZse3/OEpoDoTWUVVA
	cdJTQ3eoJpiM1eFG2OPAwNBov6ZmwZaH9e2HIqn8pRB/+sWSARs9o1PO6/rJZ5a+Heotis6ZvlG2e
	EKdDiE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wubku-00000001UGb-0t0Z;
	Thu, 13 Aug 2026 20:10:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wubks-00000001UFt-00HI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 20:10:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BED9E40B96;
	Thu, 13 Aug 2026 20:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBE21F000E9;
	Thu, 13 Aug 2026 20:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786651821;
	bh=+O/RjKz8VvaPPQMBTUPAO9bROziXqWuh74ARHIp9xKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4X6jOsueE1Brvi+7ETrR4bW3h8czj+b8LgIin2e4xwGiazfCXEivoPDy7JzOqFig
	 FHaQYV6v4/zal8ZLNqu01clp1jnSh7cUVkkuqI1F8ZPoIKJm2fDk3bVNZ76IxFJR2h
	 Wdj1Uqhtrfdcw0hxlzQYqAalYB3nysu4JDlglXoRqSmHa0kiQqXA854dc7iquG0uOt
	 hmyqX5mINWbHZRGhUsL/oxHI2UwaaNisDM1bD9Ffy356KP4CwJ/giK1a/8rwmsmao9
	 tNShEuWin3dK39yWHA4YcAS7T0TV1JzMhGlaMDdwbGTQRONMW6ZtlLXnTEx0EudPrE
	 iYBXo+SHUhwtA==
Date: Thu, 13 Aug 2026 20:10:19 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
Message-ID: <20260813201019.GA987015@google.com>
References: <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
 <20260801162900.GA2021@quark>
 <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
 <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol>
 <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
 <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
 <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
 <0d2706c6-79fa-40fc-a24a-6d5ffbf02330@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d2706c6-79fa-40fc-a24a-6d5ffbf02330@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2026 at 03:09:36PM -0400, Demi Marie Obenour wrote:
> > SM8650 with the QCE is FIPS 140-2 certified and apparently this makes
> > a difference. Don't ask me if that makes sense, I don't claim to understand
> > the legal aspects of it.
> 
> That sounds like the kind of thing that would cause someone to use
> a worse implementation of cryptographic algorithms 🙂.
> 
> For what it is worth, many common uses of kernel cryptography can't
> use the QCE.  This notably applies to the CSPRNG (/dev/urandom etc),
> storage encryption, and AF_ALG.  Therefore, I expect that anyone who
> needs FIPS 140 compliance with Linux needs to ensure that the software
> crypto is certified, as that's what actually gets used in most cases.

Well there's that, and also the Inline Crypto Engine (which is actually
being used and is unrelated to QCE) has its own FIPS certification.

Which upstream kernel feature, if any, is QCE being used with?  I have
asked this multiple times and still not gotten an answer.

Does the perceived value perhaps come merely from "offering" FIPS
certified cryptography on the system -- then not actually using it in
practice?  That can maybe be understandable in some cases, but it's also
not really something that belongs upstream where actual technical merit
is expected.  Also, could ICE be enough to check that checkbox?

- Eric

