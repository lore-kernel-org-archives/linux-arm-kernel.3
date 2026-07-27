Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F70BC5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qR4dqbp+zRu/s40zv7AEPU7MyfRRLU9YxIJ+M1aDif8=; b=EWFHoBBE1D26hLyAqduQSGnx7j
	b+BTPyDNQq0Pu9olWm0PxzEAysn5KhNjgx3VCd7NUWFkmV5ui+uNpe/P/6xeatyveylsUJFu23du3
	7ikP9KAaCVNdwHQB8WquOURdGlyhIQFfzNiuyGJUVCr+DdKAwKmZYKsCL4vlgMlah9poVCKEyDWWg
	X26tKrYxBcFT5aemO4pMT4rQ9AzTpBNSLyMXHS7NcazfAQIRRRpAWEy0i9b7ax7HfR1nMQtHAKsqu
	1YtmGyw5k+m4jDsyUJD3nDRIVCXPPAakMIaeUMn3lQJ6uGpDUWFZSvwlbTPMdd7fChQB0Y7zNnWv4
	S5IP6xww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKpT-00000002ke6-3Kle;
	Mon, 27 Jul 2026 12:53:11 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKpF-00000002kay-3Y2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785156774; x=1785761574; i=markus.elfring@web.de;
	bh=qR4dqbp+zRu/s40zv7AEPU7MyfRRLU9YxIJ+M1aDif8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PhTE4C4VRFUrCXMyxJxo05cwvFzVeDwResX6tWmzU+nrAltBNgifp+3yLaaQFnZV
	 KRt+Qcy3VNTYF6hQfgMkucz4jQADse783cIrjwYSZuQuROZrw6DOkgU9HiwdF7yJC
	 Uca8pTcU3MrvIw1wAp7PZ7yNF+twLf5HlyHdUjDxUg32xM5gUs7vDAjFd3Jy9H9cS
	 kKMKbnhKdHSuLRQ9EOVbGUSkTeJtyh/5WU+oZubkcohaK6501+ZZ+5SCUOrri8x74
	 gE7fiXIcyG5NeeAcdYcddp84N55ZuUJMhvEtsa4cBFHxmkmOgAye21fhEBJieO6Lp
	 z6epoirWifhHzLW5KA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmyqx-1xCyiv1gjX-00lAV6; Mon, 27
 Jul 2026 14:52:54 +0200
Message-ID: <2932c998-5899-4999-a031-6ad6918bf241@web.de>
Date: Mon, 27 Jul 2026 14:52:52 +0200
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
 <802ea627-4bae-4267-b1fa-7da2499f2ab6@web.de>
 <55dkpjlibtfurmrrzxzznq6e3dhxvo76rsrjnokkaquwktl74r@omft73n4kp52>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <55dkpjlibtfurmrrzxzznq6e3dhxvo76rsrjnokkaquwktl74r@omft73n4kp52>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p4J2YjnmmKmMEJUnTkMMXcW+VcONTTx2Boz5nkpOC+hFtz+ig/V
 T+AUxNm3ReLxmlPNPx4Maem5f2pW/cldyZynhBk48i2BKs5NJ1GyI9GCeQLFQbX5HBt4L60
 XbVxBN4SulVWan69SYHEkrhBEuG4MFyjVkusv1+WZHasaFvYeA7TmsfcCLJmEUgz7BzEqrw
 zTODyHm7MT/+AELqDNXWw==
UI-OutboundReport: notjunk:1;M01:P0:vT3MZKEQ7gU=;XZnICSd6RgkgL1aRN1+z9YVohdX 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 uXp1mI47w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_055258_188263_3E987555 
X-CRM114-Status: UNSURE (   6.22  )
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

>>>> * Omit the local variable =E2=80=9Csize=E2=80=9D (for another memory =
allocation).
>>>
>>> Please remove this change, not related to the intention of the patch.
>> What does hinder to perform the required size determination as a direct=
 parameter
>> for a kzalloc() call?
>=20
> Nothing, but it's a different change. On top of this, it's just churning
> the code without an added benefit.
It influences development concerns also according to preferred variable sc=
opes.

Regards,
Markus

