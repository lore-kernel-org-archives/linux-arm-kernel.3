Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6524A606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wkYLnL7l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OcU43TI8;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=YNeRhBW2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQFTusPZWZAQO9ncVP5/pVATTKlUKVRB9FJ/9plts7M=; b=wkYLnL7lC33PNeNfgaEtjojmxY
	SEC7Z4hAU+ZOP0w+gkLowswKP7omZJPqOfeQerRWneepkTtuS3lhbZlepFMKCGb6UNh6jT10HO62V
	agaGuPVBeIlyvHtv8Vr+uS6X+vlg9PBbT+iWclZxE5z6eXg8w+daGy+Lqnh/BirIOfDG1lEFncNgI
	3gIp8mPLA2IopJtY9z3apGbJ7Y+MF9hACrahJ/2tzO6ea5LOvQmAEzI8pfRU2rfPqf2P4nRclWcDI
	Vuecq6xqabBU0bdi7pBEvGBdJuHS1Z8mSXmtIVFXgkcSihbrTrMg6fGMLCJDA37uQ0ONaUhxjqAcD
	jHVhhVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmS4-0000000DU6l-3BVw;
	Thu, 22 Oct 2026 06:39:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmS3-0000000DU6W-1Anq;
	Thu, 22 Oct 2026 06:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Message-ID:Date
	:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VQFTusPZWZAQO9ncVP5/pVATTKlUKVRB9FJ/9plts7M=; b=OcU43TI84rN5wBU9r9VQim9lMI
	/z+U1eRs90O/gUNNxyzOjwn0EIbsA6BKwUUEnosvg2yR2d7l4t1Ec64o6SIelLvHC04f2nT+EKjCr
	E1wIDdwIsnMBeuXSvtXTXrjuXOXc+4PJzbRmI2uMJluNepG/Fr6Qq8LRthK8N/o9QPsNhKgSP2T2x
	zgxIbk+PHRAnzLCdRbILsPqCBzva0Tpv6rS71F0i0blFiD2cF6+0UmmxD4IxYegvqm3iMgTLl9xUD
	ItJ/4eb8TealBwGvEEcxUnECbsqAA9tuEFAgUppDwbQSFMdJDoM+9LAXWXj7aCxZPMfhe69R0/TZb
	e4O2N69g==;
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmRt-00000006W7d-2RZx;
	Thu, 22 Oct 2026 06:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792651124; bh=VQFTusPZWZAQO9ncVP5/pVATTKlUKVRB9FJ/9plts7M=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=YNeRhBW2tuGtVSGUiFjgVj6gaMR/c1/FJ+61cIbS0pluPJZDHhNTWydiRbOpV++4y
	 7H7W+aH0oW4FH/zKDqio7TfxOsWNcQ2B+zSQSzoQNl2PaEWqbwfqY7RIy9joAD7ABw
	 vTe9cGWJ+w3A8V0eJZzDRuLetTvElIuvxol0YoX8=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-XMAILINFO: N6vT1niysq6m+dolIeSRQmZ0Z/lSCBqEUxgMgKnhlcqyDzFYwRYb/nFI862AH8
	 hx16FZ7vQ76yOO4KNrAZLP9nGxJ89E38Vmc3rNG+xB70iOUAV7wSRAQwTihTOulk5fqrM0fPZ230B
	 KEjiMz7HM7L4qzHyBVCqvG9OHxF9AE9K5R4nq44q5B5A5vDvoF2e6N2kZaxF1Xwl7qyXn0HPU+w0q
	 jx+hU0FDBXH84DVvxXpEVC45nfZW7RE5b4cT+s2JTCz893w+J65yZGKPYhKhbfVjLu1uzs423rZHF
	 YhpWLoHB7Z5iyFTSqhVekL+bsNuil22wBS381bllGmpRd0Z5eGD8IpYIPKcsKtvIw3suSvGWztqCp
	 ZGnIzV/u3oZCv65hNU2vXGJYFoE1CwNhDvwyxZLhcqUptZfdM3alzxLkTi4sZcGcAkl0YQLxv0wcs
	 xDYdGeTy4dt8w7sun/yBo2hbrgzaosoCMO9RohKNuUElD6qUPsPbWHI0n7ImrN45HY2QPGs1bCvVk
	 MWSRQYnB5gBQQseXW+2S7fzKMYfLxHzAz/06wSHooNP221o35sl8hHLxnG+gxrgIhpp8SEAZcRLdv
	 wttYLqc66aRhuxibq6faN+1fdUvvf0l4cS04L724Xdz7CC95Ngz5WGvieS2ipVQY1PH3RPEC0SCQc
	 LLZDi4lUTEtGHPpV3lXVwSsXOJZKBClnzlse4Bo/O+ZEZSX8poOOa0aS22M1U1Gi0XNUU8VxABkh2
	 bEmFwFeuf6x8bwc+bj+CMBVRMOBbJozHjSlFbbqRMjHcly44ucpG1KRKT5UmvuIARe2VdvezT5O6l
	 4AjpimmT+Wwm48X5K++Szf3pWy8brWR888+n7HrXrJNl+S1bpTLclyQC60yZO5MIsRD1+1zgcsxEy
	 Y16MLptC3/0G6NBTSzeoOt/17k+XaE4mdHZh69reiQfF1CWqaBhKA87ASDRQ945nLDYWOlNQ6C5AI
	 wOHX74OkmtP7bfnjvPr48Afne4f9RYdonvRTS0CxUYkICRgEbasogiv1kyvxnWGZzdyciyj+lRx9T
	 ZTKQ1aSJt3odwsS1uNe1fIHMqU8WkURomskKvfn9JQJrjd4w=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?U2hhd24gTGlu?=" <shawn.lin@rock-chips.com>
Cc: "=?utf-8?B?c2hhd24ubGlu?=" <shawn.lin@rock-chips.com>, "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bWZk?=" <mfd@lists.linux.dev>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?bGludXgtaTJj?=" <linux-i2c@vger.kernel.org>, "=?utf-8?B?bGludXgtc2VyaWFs?=" <linux-serial@vger.kernel.org>, "=?utf-8?B?bGludXgtbW1j?=" <linux-mmc@vger.kernel.org>, 
	"=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>, "=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/27] rockchip: Add RK3572 and Forlinx OK3572-C support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 22 Oct 2026 14:37:30 +0800
X-Priority: 3
Message-ID: <tencent_1468586598128C460803261171FD769AA209@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
	<7fa26028-5c7c-4c5d-8cc5-3116b2e51cc0@rock-chips.com>
In-Reply-To: <7fa26028-5c7c-4c5d-8cc5-3116b2e51cc0@rock-chips.com>
X-QQ-mid: xmsezb41-0t1792651050t9mjujcfl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_073850_294083_7FB9D4D3 
X-CRM114-Status: GOOD (  11.28  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaGVzLiBUeXBpY2FsbHksIGEgc2VyaWVzIG9m
IHRoaXMgc2l6ZSBjb3ZlcmluZyBTb0MKPiBzdXBwb3J0IHNob3VsZCBiZSBzcGxpdCBieSBz
dWJzeXN0ZW3vvIxmb3IgaW5zdGFuY2UsIHNlcGFyYXRlIERUIGJpbmRpbmcKPiBhbmQgZHJp
dmVyIHBhdGNoZXMgZm9yIGVhY2ggc3Vic3lzdGVt77yMYW5kIG9ubHkgQ0MgdGhlIHJlbGV2
YW50Cj4gbWFpbnRhaW5lcnMgYW5kIG1haWxpbmcgbGlzdHMuIFRoZSBEVFMgcGF0Y2ggY2Fu
IGZvbGxvdyBhZnRlcndhcmRzLgoKVGhhbmsgeW91IGZvciB0aGUgZ3VpZGFuY2UuIEkgYXBv
bG9naXplIGZvciB0aGUgaW5jb252ZW5pZW5jZS4gSSdsbCBzcGxpdAp2MiBieSBzdWJzeXN0
ZW0uCgpCZXN0IHJlZ2FyZHMsCkN1bmhhbw==


