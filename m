Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D65C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/amaEOPXodvRCGzBV5IZS9UU/2WniCVnyRWnkghVEbQ=; b=LhfP0aHmwDfm8Mso+wKD4/aQpT
	s8cBrUCT+dvmdYHZH+Lwz7wY/SdOaq0SGpptyao2OlYqU/H0XTpUiDoaBjjatq+oDUUWOdraU8+NF
	pgKpvacU1zIHV4Gjf6Hmb8tOl/kP5L14VjuJvmuD0vjrSeQIB/l2iIu6CzudbGRKM2w+A/l0Mg97w
	JhzlLW/0R5rmEeALo1mlD2V7SPjgAVjOotWOcnUSyhz/NoZWo42YZpAusgvaXDUQYX4x0I+Y5pWXL
	t7+2hNbhYiA5RtfsVYg9RUE72ybuEhU2CTJYuPU2buA8qeaBsREuhXu4YKu9l+n/tYt65KZTTRmt5
	dF4cNJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKOF-00000002f9n-1nmm;
	Mon, 27 Jul 2026 12:25:03 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKOD-00000002f8w-0Il3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785155097; x=1785759897; i=markus.elfring@web.de;
	bh=/amaEOPXodvRCGzBV5IZS9UU/2WniCVnyRWnkghVEbQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=miLDaXbyzTJjssXS8l1zdVRKzwdD6hGqnCx98A9skgK2YRpPjyCsVGUUBwU8EaO2
	 YFeGQsNFYF6dZWB4fwrI+FfhHm1gnSnbMb5u3zdUnukuW1U/TetvSEbRFOiBku7Kd
	 YpdT7ERmcBxM9s9p5SHd8FH5baKPWRK4J1H9OWHrpWpnQ1Evtm/q+MEjaNCuLwxIz
	 Fd3ipP3mFmSnV2muElUcl7zbsZSnN8ctCu3ABqH/fK8i7Hs5RbQ+XaO7Sfl3CKw6u
	 5ahdzRm9RxzR+lInU+u9GoMFK91MkNZ0Pj9Hkr0/R/wTEtni5WdJBE0RBd2dtaY3o
	 I5oDl2s+h6eocs5DXw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MRk0k-1wPXDH1rly-00S7Zl; Mon, 27
 Jul 2026 14:24:57 +0200
Message-ID: <802ea627-4bae-4267-b1fa-7da2499f2ab6@web.de>
Date: Mon, 27 Jul 2026 14:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 1/2] soc: fsl: dpio: Use scope-based resource management in
 dpaa2_io_store_create()
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <chleroy@kernel.org>, Roy Pledge <Roy.Pledge@nxp.com>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
 <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>
 <y2h44um2grcbecnpkck44cvudugha6df2itq2uy5y46whxjouh@yy2kebig3ia5>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <y2h44um2grcbecnpkck44cvudugha6df2itq2uy5y46whxjouh@yy2kebig3ia5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F/cIw0T/BV6XsIydacBmp7oxmIQWuxhB8VrShAifUep+B0A4eEw
 XspKZt0NZ2JbWTJAMoukGAoMGjMJ9fumg5HZark9uy1fPdzMbfrA3tSDQ1Li9JoSpeiZFuX
 ODgTriycLgfv3ZtAnwBGQyk6s1RaR9fdVRfksvVvOXr3K8xCqPP9yzxHhhumQtnljwyekwH
 nPVskoTItPy16inN2I3aA==
UI-OutboundReport: notjunk:1;M01:P0:uq9q16Ou37k=;uqrA8SQIQkHf8kVLE9DXrJbnaPT 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052501_409776_A1263A67 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

>> Scope-based resource management became supported for some
>> programming interfaces by contributions of Peter Zijlstra on 2023-05-26=
.
>> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
>> Introduce __cleanup() based infrastructure").
>>
>> * Thus use the attribute =E2=80=9C__free(kfree)=E2=80=9D.
>>
>> * Reduce the scope for the local variable =E2=80=9Cret=E2=80=9D.
>=20
> Please don't. Let all the variables be defined at the start of each func=
tion.

Do we stumble on another coding style preferences conflict here?
https://elixir.bootlin.com/linux/v7.2-rc4/source/include/linux/cleanup.h#L=
142-L146


>> * Omit two kfree() calls accordingly.
>>
>> * Omit the local variable =E2=80=9Csize=E2=80=9D (for another memory al=
location).
>=20
> Please remove this change, not related to the intention of the patch.
What does hinder to perform the required size determination as a direct pa=
rameter
for a kzalloc() call?

Regards,
Markus

