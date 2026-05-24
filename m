Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1F0CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW2vu9IkRnZzp1fQCeCBE/2EMHJERHqOYiopdnI8NrE=; b=jo2L0bi7g3YtsOEcTIADAOw+xq
	IhNZRA1wplgTPljKsM9ozqHmsQJetDxUvqtU2o+iWY2oioS/CiYre53iO+pYuk7zMiRDoH9R2ccaQ
	0DVG8frHRykxPdDW0uNcUJVnbJoFXXOoIDKY5TsRUuJ9tFXl/Zr2TPObvJl01Pa48BwN761ann4bb
	Ca2ki+ChdJwdeMgZTPbu22m2lK8FdBH9RD5lClN9dghOzTIejIS/L6ZeTCytNMlcoqgOdQgkOiAz5
	4kYMitwLsfX5+fdjTsCQV7VWlqLOQ0hgqJkPbKdcb++3qV6CASs0XFdAbCpi3/YlMYOq4qFZAgCef
	VA2qV4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFS5-0000000FaHi-0nZ8;
	Sun, 24 May 2026 20:29:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFS2-0000000FaHB-29lJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 20:29:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF606436B9;
	Sun, 24 May 2026 20:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017821F000E9;
	Sun, 24 May 2026 20:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779654573;
	bh=wW2vu9IkRnZzp1fQCeCBE/2EMHJERHqOYiopdnI8NrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VlUktFk6QGdARWhMdwA535XklXSsXGCU33ELIlg3UMenDgnbqrqH7PV6yNSCuTxex
	 3Y07MzcJwBAi7EMwxVHwbkERMC8tv9kb50ylfLnJSha54UeWLD+r1VqqUFlgF2Bl01
	 V746WCm57N6jn8LwGt8YO2vpKFfqH7nphm6bX6x+gzd8It9b3kXU7OGI1KkkmLX8li
	 EzSQeWzf3CKJW7PoVBZI4qmFv/q/ai5Wlx9paxdbdzPbGaphBBJ6LnaBX/Uli2HE4t
	 970/bqnclb2SGorYUF17o5iUET746oJ4E1EQ3DUgLxzulGs2ozelzKtJb8tyN57DsW
	 whgHTFe5VwI5Q==
Message-ID: <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
Date: Sun, 24 May 2026 22:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Thara Gopinath <thara.gopinath@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_132934_603416_42AC7438 
X-CRM114-Status: GOOD (  16.10  )
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

On 24/05/2026 22:12, Demi Marie Obenour wrote:
> On 5/24/26 12:42, Dmitry Baryshkov wrote:
>> On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
>>> From: Demi Marie Obenour <demiobenour@gmail.com>
>>>
>>> It's slower than the generic C code and causes problems.
>>
>> Which problems?
> 
> See https://lore.kernel.org/all/20260522024912.GC5937@quark/.

Your commit is still incomplete and other people's opinion is poor
reason. If you do not know what to write, ask that person to make
necessary changes.

Not mentioning that removing driver is not even necessary to achieve the
goal Eric was mentioning and if I understood correctly: you are removing
even the pieces Eric found useful.

> 
> Also, if there are no systems in which the QCE driver is actually
> the highest priority, then unless someone adjusts priorities manually
> it's unused code.

That's not a reason to remove a driver.


> 
>> Also in the security world faster and safer are two orthogonal axis with
>> very limited correlation.
> 
> If by "safer" you mean protection against physical side-channel
> attacks, then my understanding is that all operations on secret keys
> need to be masked.  This includes copying and storage.
> 
> Linux only supports this for protected keys, and even then sometimes
> uses the kernel's own RNG for key generation.  There is no support
> for using the QCE for protected keys.
> 
> Linux does support using hardware-wrapped keys with inline crypto
> engines, which are what are actually used on Android.

Patches are discussed for some time, did you miss that?

Best regards,
Krzysztof

