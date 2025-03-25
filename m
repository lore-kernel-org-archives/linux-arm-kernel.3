Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DFDC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdybEFAtjvlOoe9OT9n/vdKYA9kiNqWEyCmU9ONMv4Y=; b=AiXZm2Te1X8Et/2vacBMbJINeG
	g9IN+aVncpP+VFayUshfOTA1HMoQwS3OeH5s5aLmK3M/tTQMe+k8G6TkHuGPK0vvkcoYBE9iiaP7n
	f9M0/3jb3lru2NMVqYYoeXprDYTaxoIg+l6XH4dWMuR8oi2mf/Nk8r19YluIa6jxT0PUOseJigSYf
	sh7VAueSQNllueLanmKiAbd7DcUQWq3kCbumaRQp6OHcc4fx/kl5fDeIQ2wyDB5E/xSpJK41zL/X2
	2daOnDLQ7r59RkeD+IzN0iYyDxJnBNDo7nG7UtOg3uL6Bg/lL5fsZP0qgdZ8DJQXINESNX+tD8Qqk
	J/25Vn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twzyz-00000005Ev2-1juL;
	Tue, 25 Mar 2025 08:50:01 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzxF-00000005Eis-2PuG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742892476; x=1743497276; i=markus.elfring@web.de;
	bh=gdybEFAtjvlOoe9OT9n/vdKYA9kiNqWEyCmU9ONMv4Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CsUfPwOTvpTRQFrwLHMp11jMytjtJ/MAHcAEfD6eKLnkBozij/L2JpDGet9jCruP
	 Yl0GxU4u8QUogGNe65WbXGe18QEM3Mq4GMHL5X4fGtGN6U025y86YDBCR6X2/UNJc
	 t3gERAkk9GAQy+0jHIFkQ4M5GOn8lc+GaIGkdUisPpIgzHRFf2JWTs+9/DxU/FJ7L
	 mJj4WEjG2vtR5W4YYv6nPRXzmXYGIp2YA38ZgzX7Sn+ZLlDpyglyffV/p8miBahqG
	 m/JZbzBvndGkkp3Ca+gio2BS1tvzDh/2N7Xv6MMnpsygnHS1TCrFjR5Mn1aOblhga
	 W8ZR4SaokJxRozYuQg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3V26-1twRzC1KeA-000ZK4; Tue, 25
 Mar 2025 09:47:56 +0100
Message-ID: <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de>
Date: Tue, 25 Mar 2025 09:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de>
 <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fj09jZvYnU2PRBECVb5E4bk1pNUR2cUYFKE/F1CD28+WT1YEeMm
 A1hpelizqKdWuW+fSGxR02KYM/2LGzi+mgT3qr7OhcpEhUVrNPh5MhO5LkXx8AUNSLgXHqq
 LiNEicK1qnvcbwp2BcQq/yzUpqpsJIUOSNaDC/+GjKIkCm0a79TU3ARq/JBnrB/F49EnCLi
 Hh0enqr+g1IBFc4o197NQ==
UI-OutboundReport: notjunk:1;M01:P0:GoLEl/f3Dng=;QQQMs5mLUQQJmFylzHuzn08kGws
 SVxvDdpDtxGhPr06YlcK4GFIPHqVKZk1ZVcTfPPj26o3qxmaH6piRQlSVuI1cFucGSFdvXAkG
 TZea0c4XZMmSO6nk9erVf/b6EFQ88AkIVYECOFNS82Crzi9QLR1GZmqVlMKC0Q4523GHnGr7T
 gVz+pcwnX6ETj8uP3wI9oFmdhNeKVI+G9k6p+2DEL7hvq85pl9nSWrkkhx3PY0v6WKB0HUZM+
 F70lSArmU79nMmx85ubYicRfesvjrLm+ML9uM92tBJ13spHm2aeCmlWjIiJdmWTHRL6s4wVjm
 a7hSEwQBt7HpscjK3rpU+PkbZJlrJy6W8DV1OwxRq9wr5mQJHbtMLQeoSXcTzsEthgkAqBppA
 Af+TzTKeRPR8XryW+fLu2wPkZIK1PxNUbQoMdnfj4TqPIYPp4nBzwyOXNrjt6IOaACb2RtciB
 wfLrXH5IuXLCtYjxRbxgdi4fk2KJCvx7bx77Uszv4kd5ebXeex52Tf84g3aQE6xlMviHOKM4H
 mqQjDpdmSDq+SDEihQt3h/vqgYJIOKMZofpQPjIXI/i7KOOse7cxm50jrqQ2Umpk7hiriIIfz
 uxmYxfQT5Q2LPjqooZlpy1RUP6qq1owLOB2n85P8AHGUygYibgxOpGuEQqVDkljO9bOZogeJI
 ynDRfygn/uu4ZeloRoyu+IIfvaQJpHCcSR4FjCbmANnqNGbK0s663bRRad93r2Q3NDQKQvqAM
 8siK/yk2/RxJkfvyed3hkwJPLZJF9W/gcVxqjaCSsBg8u7CIelQFn5/C3oappdQCETb46nX6e
 D7rBs/sPfGUev/sXddvPsi0rv1OL45rdyv+hxFd7QJIVeiJvwcxS2wpSVEMpOg4bnnzkgTbhY
 vPjwfIcESJ94406BDsIkLnMH2ZpgAaFSIk+nFtSklhgO0Qku75QuGxUyUuOO3sASSwqDchH0t
 /GTUuqPbDgxRFQiKJYQtaooIRRPN6S5DmAWmjwX0LdO4MAlFtTkJF03bQ3WZWMg50+4oBdCYr
 LJTUf9IDkt58H/J9wccd8TUWy8at5ImsA/N1miTkAhNdTyYUe6wIt6auZuQMpr3wo5RFBJAgQ
 mMIhDS1bM73YBxquBkmFRWKVOx+6KLtVoeOPS6lvJ1h+ewinoEB+MHJDobV8uCHNn4dBJH8P9
 L0TqBXr4TJ37iL6f/pz3UYTuG6O0NRJE5m649BHwnG+E9I35jQlw35bsrA1RIoKt68kNzjZ/9
 62RIPQnKYzHRUZ662fS7gFInGYPMwNG7GWtvZKg+cFuHDWoWYCdGjlY9XlOB6QDl/D91q1bjY
 wAwca9rw3/EzDwHWD5PLk13omvrlpaKJkHVjJoSbNKlZmh6BQQd7yeNftIAzNmRP6LzxKuX0S
 RUqDgMEz7flKzAxhQ0wFa8E5huxUVRWTxi336F1WNPK6+cifvWEzJsvkwQPa2lwxxHOI2hJla
 F9KrODZbK+/iVBlhu7vrGgzx6qCdnvYBJanVkKKYJDcYmbmFuQrhvl86QQBI03sy9V42QFw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_014813_979075_21FB36B3 
X-CRM114-Status: GOOD (  12.49  )
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

>>> Clean up error handling by using devm functions and dev_err_probe().
>> =E2=80=A6
>>
>> Do any contributors care for a different patch granularity?
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n81
>
> I still don't understand why you are so adamant on this.

There are developers who tend to prefer an other change granularity.


> It is just a simple refactor patch changing 33 lines,

The transformation goal is fine.


> mostly in one function, with no logic change.

Implementation details are probably worth for another look.


> Does it break something in your system? Please explain yourself so we ca=
n understand your viewpoint better.

I hope that the understanding can grow also for another bit of refinement.


>> Will it be clearer to mention also the function name =E2=80=9Csun4i_dma=
_probe=E2=80=9D
>> in the summary phrases?
>
> I already added it as per your last response, did you not read the messa=
ge?
>
> On 2025. 03. 24. 18:20, Bence Cs=C3=B3k=C3=A1s wrote:
>> Clean up error handling by using devm functions and dev_err_probe(). Th=
is
>> should make it easier to add new code, as we can eliminate the "goto
>> ladder" in sun4i_dma_probe().
Please distinguish better between information from the =E2=80=9Cchangelog=
=E2=80=9D
and items in a message subject.

Regards,
Markus

