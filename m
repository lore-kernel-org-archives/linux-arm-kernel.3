Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7391EC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/fpsiyFB9X5GjYqnpYmGfRoMhMa23+uX4rHc6F+FvE=; b=HnLAej2/DxZWj1vZTkrBsr4GMX
	MPQMTNJR7xXbRTzXopLE6BChKdl1h2TJLoNGKhq5A8K+nq9MeTLaife6a6QzhySy+Hupp9YveGxjv
	fHttpltW9eWFcKkMfnGaWSSMMxZ3dcGQ4PmmqagQkweNuqa/6MsHWq3BTfaKbmdsBgFRDOi5RFjEX
	Iq95895Pm6ys8FSyLLmUNNDgJ9ySKUiZi3A/8ihFaLezS7QBr7m8ylbR1kAs2fo3Y/faEBWAekk51
	v+31DDhyF55Y06ny3suYg1FSoPXHuXVAD4tQJZp8Cvdwa9yrifcLylZp22KYj55FVvj/WC3ocgcAV
	aF6CD21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wud4e-00000001ec0-3KHV;
	Thu, 13 Aug 2026 21:34:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wud4d-00000001ebs-1eYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 21:34:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7831D600AF;
	Thu, 13 Aug 2026 21:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB641F000E9;
	Thu, 13 Aug 2026 21:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786656890;
	bh=T/fpsiyFB9X5GjYqnpYmGfRoMhMa23+uX4rHc6F+FvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JNmRDUEDF1ldVZW35B1Fn5gnZje8hF8uc4NH9KRb9t24bVfP3SmaMjIc2N3DENhh/
	 WlsjqrCpjCahx7wpIHgOGt8Dp90I8Nd4UjQeYP+Pdi6wg2jLADl/l4j53gLihVG0a+
	 Gzoq/hPuJFr/WXNnD+lBUn28oghif8pNKN8ZlMCtMYaDr1DyW/9JrsryBspF9+y9Lo
	 HZ1OMDt3LXvrIb7mNDY8I7y8PWE1RqxwdADMZPH8XrrDa+qEVwg4Ks0X4+MO4dLTY0
	 dLH3MUkS47jhCiekmJNoPuvZWTdjHmM+ZMCWF8L8DerYmOwcwf/NoHqklotlPNcImc
	 pycJXXBLQzm6A==
Date: Thu, 13 Aug 2026 21:34:48 +0000
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
Message-ID: <20260813213448.GB987015@google.com>
References: <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
 <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol>
 <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
 <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
 <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
 <0d2706c6-79fa-40fc-a24a-6d5ffbf02330@gmail.com>
 <20260813201019.GA987015@google.com>
 <b7e697ee-ce3b-4c81-afb8-00205c2997f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e697ee-ce3b-4c81-afb8-00205c2997f3@gmail.com>
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

On Thu, Aug 13, 2026 at 05:00:28PM -0400, Demi Marie Obenour wrote:
> On 8/13/26 16:10, Eric Biggers wrote:
> > On Thu, Aug 13, 2026 at 03:09:36PM -0400, Demi Marie Obenour wrote:
> >>> SM8650 with the QCE is FIPS 140-2 certified and apparently this makes
> >>> a difference. Don't ask me if that makes sense, I don't claim to understand
> >>> the legal aspects of it.
> >>
> >> That sounds like the kind of thing that would cause someone to use
> >> a worse implementation of cryptographic algorithms 🙂.
> >>
> >> For what it is worth, many common uses of kernel cryptography can't
> >> use the QCE.  This notably applies to the CSPRNG (/dev/urandom etc),
> >> storage encryption, and AF_ALG.  Therefore, I expect that anyone who
> >> needs FIPS 140 compliance with Linux needs to ensure that the software
> >> crypto is certified, as that's what actually gets used in most cases.
> > 
> > Well there's that, and also the Inline Crypto Engine (which is actually
> > being used and is unrelated to QCE) has its own FIPS certification.
> > 
> > Which upstream kernel feature, if any, is QCE being used with?  I have
> > asked this multiple times and still not gotten an answer.
> Historically AF_ALG has been used to access FIPS-certified crypto
> from userspace, but that no longer can be used with QCE.  Most kernel
> features reject CRYPTO_ALG_ASYNC, CRYPTO_ALG_ALLOCATES_MEMORY, or both.
> If I exclude tests and fallback paths of other drivers, that leaves
> crypto/asymmetric_keys/public_key.c (hashing), BPF, MACsec, OpenVPN
> data channel offload, ecryptfs, Ceph, SMB, IPsec, mac802154, TIPC, TLS,
> and crypto/kpp.c.  AF_ALG only allows offload drivers for cbc(paes),
> which QCE doesn't implement.  QCE is broken with IPsec and probably
> some other networking protocols, as it would wind up taking a mutex
> in softirq context.

It's a far more narrow list than even that.  asymmetric_keys uses the
shash API, so it cannot use QCE.  BPF crypto uses the lskcipher API, so
it cannot use QCE.  MACsec uses AES-GCM which QCE driver doesn't have.
OpenVPN uses AES-GCM or ChaCha20Poly1305, neither of which the QCE
driver has.  The non-legacy Ceph protocol uses AES-GCM, which again the
QCE driver doesn't have.  IPsec does decryption in softirq context,
which the QCE driver doesn't support.  QCE driver does not implement kpp
algorithms.  SMB, TIPC, TLS, all usually use AES-GCM as well.  Until
just a couple months ago ksmbd crashed if passed an async algorithm,
which proves it was never used with QCE.  There is really not much left,
maybe ecryptfs AES-CBC file contents encryption?  But even for that the
cra_priority makes it not actually used.

But we are going into the weeds here with trying to theorize some way
the code could theoretically be reached.  It seems it's really just not.
Or at least if there is a use it is not upstream and/or is not actually
the appropriate code to be using.

- Eric

