Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C590606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uu78Z9yL;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=AFcHvXIh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B3x+ve/3y8894hAz6Kf2M5B/2DKTWxmuPKSuFN/yyCo=; b=uu78Z9yLpCPhsdNoeDTfPseJpA
	Jp+VFJNHl+S6JGWp+GwGbwFFJNwWpNBhHX4Wg7CKyqucPhLWMxUA3BnZs/OWtdA7l9Fmz6SJa/SMJ
	3mwUvfJBUiNGWYMJW7KTtpdvjY1IfIV9rEf5JOpMhDnjMlJaUbeir+aBxVUxEYNMx6OwcteAmJ5Uo
	l4PxATiFkoIix490GBfSAgZW0yYa7AYkboAR/vAucupbHhH8X58PnwuaALS28xh8vqgyrMWxWkZP4
	nqTTGMZodnt4ts1I46lCaYL7RyFwNXhxzOe1vZJqyTBQbyBXeHjzeUzW4iZmGCv8YcXeqJZKZg0Qc
	YTzaEMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLggK-00000004ipH-3OHi;
	Tue, 27 Oct 2026 12:53:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLggG-00000004ioG-2PML;
	Tue, 27 Oct 2026 12:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=B3x+ve/3y8894hAz6Kf2M5B/2DKTWxmuPKSuFN/yyCo=; b=AFcHvXIhhGrKyfs9/MEEb2VHHP
	lneMt/MX28F0QNNgpDxTH+e7aeEYK1POI8mqG8oTD43odd/FssBI+at/TdQ46iYEWIhqQ9yAPEbki
	Zbv2J/jbVy0uXNymHAnB/CV1ql7+G7KKNLb+FM842Fs6NjFIVaUit6rp22B3MoT/ywKS60BfjzyP7
	qh2V/aPdZo+EXMYESreOURbgACsTKgBGqaHXbLjlJMsEf1RGP2ktznToxAwVwAxP6bEWaCaqcc5qR
	uBr8u2AlPqAx/n0iNfz29QRJgICC9ID81sbIPpdEJ4NARgRxkpmtgkY776RdUolbbVG5kL/UgIxZ5
	zs+Hxbag==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Cunhao Lu <1579567540@qq.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: rockchip: Add RK3572 CRU
Date: Tue, 27 Oct 2026 13:53:18 +0100
Message-ID: <22145329.0c2gjJ1VT2@diego>
In-Reply-To: <c1fc1868-5583-420f-b945-2bf934873713@kernel.org>
References: <20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com>
 <3011736.yaVYbkx8dN@diego> <c1fc1868-5583-420f-b945-2bf934873713@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055332_669204_C9B69A11 
X-CRM114-Status: GOOD (  23.28  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 27. Oktober 2026, 12:07:12 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Krzysztof Kozlowski:
> On 27/10/2026 11:43, Heiko St=C3=BCbner wrote:
> > Am Dienstag, 27. Oktober 2026, 11:17:08 Mitteleurop=C3=A4ische Normalze=
it schrieb Krzysztof Kozlowski:
> >=20
> > With code originating in the vendor kernel, it is nice to know what cha=
nged,
> > but I guess there is a tradeoff between brevity and more details.
>=20
> Honestly I disagree :). Vendor kernel commits and their messages are
> irrelevant per se. They are only useful as source of knowledge, but what
> was exactly written there does not matter. Quality is dubious, coding
> practices are terrible. We want to extract the knowledge, the important
> details, but not the exact commit. We do not care what changed from
> downstream to upstream, because we know that downstream sucks so much
> that we don't even want to touch it.

Here I partially disagree :-) .

We trained Rockchip somewhat well over the years in that for example
the per-soc clock drivers fit quiet nicely into the upstream framework,
as both sides follow the mainline driver structure I did in 2013
(which is still surprising that that mostly holds).

But you're right for other parts like the whole graphics stack, which
diverted so much from mainline that things can't get transplanted at all.


> > I guess this could be shorted to something less verbose, like
> >=20
> > +++++++++++++
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > [adapted to mainline rockchip clock and reset handling (xin24m input,
> >   don't introduce CLK_NR_CLKS, etc ]
> > Signed-off-by: Cunhao Lu <1579567540@qq.com>
> > +++++++++++++
>=20
> Yes, if this brings anything useful. For example removal of CLK_NR_CLKS
> is completely pointless to mention. How does it explain the hardware or
> design choices? How does it explain why this driver was written that or
> other way?
>=20
> Just take the authorship of downstream commits and send them as your
> own. Both GPL and DCO allow this and if downstream did not bother to
> upstream that stuff, they do not deserve credits.

So personally I do believe in giving credit where credit is due and
trying to make them better citizens instead of just telling the vendor
"your code sucks" ;-) .


The authorship question is likely not as relevant for the binding, but
for example for the clock driver itself, where Elaine did most of the
work matching the hardware- description to the clock structure, I  really
believe that Elaine should get credit for that.


Heiko



