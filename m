Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A993606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1y3jz81;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uBMeGJL4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lIwfX39/1xU2NA1XZwUTvUajjOaDvuDKqu8wPxFYaZQ=; b=v1y3jz81k4HBJQ4oqJ3qRq4AI/
	b+QKJFXXGHjcyVe9h5BQxDQRtzFGHq4W+Xk/fKk6xxQ/TpJieSJS4OMApO6qfImcvgZ/soU4ZNGCu
	RQYxulOmSUCdgsAEldlfJ9c+8PgmAelTRHGGN9RFqIVTPsbl9G1vg8Gh7tapGiErBvCrtjDbxQEUu
	fSWr1DHz7UWLvimNE5mv0nwr+EVhHLwhjX4MWCDKrQcOdbb1HKzMtO5jhY2TqeXnBWI2tGR7cb5KO
	VdFt5kqvr5demL10dX8jJcqqpIdhvAvhTWI9SNnqAN4DlwBGId0nmYsGt/yMiU65NCmUjVq6Gp695
	BRhZCBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJwO-00000002WFG-3yKz;
	Mon, 26 Oct 2026 12:36:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJwM-00000002WEt-1X1l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lIwfX39/1xU2NA1XZwUTvUajjOaDvuDKqu8wPxFYaZQ=; b=uBMeGJL4afAOvzwTx3cTjiA5jz
	CzZF53gUcYSEEsWw8kW70v32vlp6yJ0uKq+n+GqqsntmJ3kvMuzA4FKG4UDJpifhPr7Qz/w7AqAvH
	WVwgVz/OflNGm4uJ41Tfopvv6Neh/+bgDm7bC7GFhCw/CRcsqkmi5KYR8ve357yIMabI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xLJwE-00CnRx-S5; Mon, 26 Oct 2026 13:36:30 +0100
Date: Mon, 26 Oct 2026 13:36:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: Prasanth <prasanth.padarthi10@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <e33a471b-5f4f-492f-9656-e19e0dbfa1b7@lunn.ch>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
 <20261002062933.26497-3-prasanth.padarthi10@gmail.com>
 <CAMFFDGjmJTRR8GOX=S+kKnMA-bG+gbZP0sS8dG_d+taDPPRDZQ@mail.gmail.com>
 <CAD_a9mYKSYyP2TqeyjbQWYHdZgF3ggdrU6oTK6VWs2C2GSYMjQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD_a9mYKSYyP2TqeyjbQWYHdZgF3ggdrU6oTK6VWs2C2GSYMjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_053638_406048_152858B0 
X-CRM114-Status: UNSURE (   8.28  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 10:04:05AM +0530, KAVYA M M wrote:
> Hello team,
> I am new to OpenBMC. I want to development image for the machine using the
> OpenBMC/Yocto build system, available firmware information, and readings from
> the existing BMC.

FYI

It is considered bad practice to hijack some other thread for
unrelated matters. Please start a new thread.

Also, don't top post. Netiquette rules apply to mailing lists.

      Andrew

