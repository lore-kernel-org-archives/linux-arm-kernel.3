Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HEV4eTU1;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=dzX2nS9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EmwVVNfWTX/oFCv0ig9mplNZI03jXLrvbbZUZU4TCdw=; b=HEV4eTU1VkbfwzQMLMzSMGgWQ6
	X4ylFd8nZS9w5T51gJY+ts0r0Pt+4GhTTF9jEQafQju2Q7itE1lbL48DMVTf+J7qAma6tzarH8aPy
	Q/BQjqY+YP6TvQPGI6jb2Csh5WvBf/Sf+fK7EArxjVuTkkbv4ytQUZnouG1HhJq8oLTg2y6tyIUF6
	nHD2auiNBpL6rPICB1J6fbB3A5X4GnYaHzzdjz1d16EzWmgsMV5sW4A2AsLQoEaSysjb8YwZGKbcs
	hv2CB1YBluVxQrg0frdWU2ZDI63DHNG6wbnP36+Nw1E+C7mfxWi5v58iYsFjycIT0awCxd2jhUA68
	B21F3i7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLefB-00000004KTw-24ts;
	Tue, 27 Oct 2026 10:44:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLef8-00000004KTT-3T8o;
	Tue, 27 Oct 2026 10:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EmwVVNfWTX/oFCv0ig9mplNZI03jXLrvbbZUZU4TCdw=; b=dzX2nS9D8BTfbltg7sf8EyWnIF
	YR5/lR8p2o7W4dSnji19TWCRsn1H6oc6EmAvEpiz+FBLQKDWeEgI7pTHnlTtIvp1nsnLXX8UVC2ft
	IPwf/6y30bWKyAuWnlAW4wtOf/pNr9jhSZ77jBW65spt2KshPXsdUzelQxnGT8T88QeTnipw4Ommm
	Hy1HiU7KeYrnWfYkjaQczWONxNwSpZjyJ/IYOSkv1vMtYOGqCz6QPQkkXX0HUiPo0VGPzSN/v3uao
	9gQc8Vy2Lgs9IxG+6H8yrUt8Tt+mHDKwYtFuFylXHSJtnAQEyzYFucOGzx988/fa3z7gsfQ/MCXw2
	/RfziD/Q==;
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
Date: Tue, 27 Oct 2026 11:43:56 +0100
Message-ID: <3011736.yaVYbkx8dN@diego>
In-Reply-To: <20261027-vagabond-gabby-caracara-4edabe@quoll>
References: <20261026-add-board-ok3572-c-clk-v3-0-dbabfa39d692@qq.com>
 <20261026-add-board-ok3572-c-clk-v3-1-dbabfa39d692@qq.com>
 <20261027-vagabond-gabby-caracara-4edabe@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_034414_886599_26F25C67 
X-CRM114-Status: GOOD (  13.55  )
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

Am Dienstag, 27. Oktober 2026, 11:17:08 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Krzysztof Kozlowski:
> On Mon, Oct 26, 2026 at 02:56:47PM +0800, Cunhao Lu wrote:
> > From: Elaine Zhang <zhangqing@rock-chips.com>
> >=20
> > The RK3572 CRU uses the PMU0 GRF for the AUPLL reference mux.
> > Describe the controller and define its clock and reset IDs.
> >=20
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> >=20
> > - Documented the xin24m input.
> > - Made the PMU0 GRF phandle required.
> > - Updated the example.
> > - Closed the reset ID gap while preserving each named reset's register
> >   mapping.
> > - Removed CLK_NR_CLKS from the clock binding.
> >=20
>=20
> All your patches seems to have odd commit msg.
>=20
> > Signed-off-by: Cunhao Lu <1579567540@qq.com>

With code originating in the vendor kernel, it is nice to know what changed,
but I guess there is a tradeoff between brevity and more details.

I guess this could be shorted to something less verbose, like

+++++++++++++
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
[adapted to mainline rockchip clock and reset handling (xin24m input,
  don't introduce CLK_NR_CLKS, etc ]
Signed-off-by: Cunhao Lu <1579567540@qq.com>
+++++++++++++





