Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oamAhSND;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YzOy58HK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ukB5/tT9mWZkYOa7VV6zjxKWYiggvhMatV2j30aZgEY=; b=oamAhSND6zkUGqRS22qYta570C
	NkJqj+OE9ayXeOlUF7eP2U9vbfq1MrYO4eiQ1G5aN3Ly3vaGxltphaTdOuoj83d/pUVdAUSeu6dbF
	7osaPANMVMS6F9BhTbrJb8MEur21JrY3iCgzYHeQds2VlOyArMJDQqSHeRAES3vpaaCv0Dq4Xa1Md
	kp5PT4gtU3/Kz3coaafpac8H1i6IdY5XsYOyJ06p0bkB3vF0rEHX9H4ZgiZ3uCkpge+nFIIbXVycX
	sJsQgF7xTkm8rZAiQnRfPezGKy8YfiAaukd9IeO3GbKE4t2DKd/NH+90ZbLgNRN5hP36GxJv/xNBg
	IO7dMeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjra-00000007By8-3b1Y;
	Wed, 04 Nov 2026 22:53:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjrY-00000007Bxa-0vkm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793832819;
	bh=ukB5/tT9mWZkYOa7VV6zjxKWYiggvhMatV2j30aZgEY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=YzOy58HKk9qmK6ynbPSEyojNDhwDWvKsqmHXDAI3hle9mkAuDkg9ZfGOwZxBEVh+t
	 sAEj14EjY2JMNXBH8qYuvJdS5L/j0ZLpYeUVdtDoKbnaTznZ7aqZBQ+dH33QDrNp/C
	 dbQGeXpWQxIG/jrp/GFONgM9YNbNaUBAdoAAvvb5/3UCVjszj9lyNsFL74K8ygAyvo
	 DYWGKTnsuK+cciDz09YEvfCibtQeUedllj8IkzXVMAQJVrMJ8uVkO5BtuQoNDIX0LH
	 U4+xzH04IJDmDNvvhwP2CPnYLZU+8txfToS25qeR4329a92+OKN4xdTQZ1uwzTvp6t
	 2iqz9Jz+jfLtg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9E24664698;
	Thu,  5 Nov 2026 06:53:37 +0800 (AWST)
Message-ID: <e5222c01c9f0b43758408451cf195e9adc7ef2f0.camel@codeconstruct.com.au>
Subject: Re: (subset) [PATCH] ARM: dts: aspeed: Correct white-space style
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 09:23:33 +1030
In-Reply-To: <179380380617.180018.5035897143826922583.b4-ty@b4>
References: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
	 <179380380617.180018.5035897143826922583.b4-ty@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_145348_462723_62F4C09B 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-11-04 at 15:50 +0100, Krzysztof Kozlowski wrote:
>=20
> On Sat, 01 Aug 2026 23:04:38 +0200, Krzysztof Kozlowski wrote:
> > Correct a few white-space issues, like missing space before bracket
> > '{'
> > character or spurious space, which will be flagged by dt-check-
> > style
> > ("redundant-whitespace" warning).=C2=A0 No functional changes.
>=20
> This is waiting for three months without feedback, so just picked it
> up.

Thanks. Apologies for the not getting to it. I've struggled to find
time for upstream kernel work of late.

Andrew

