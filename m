Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDFE606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pA6zMmXn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=; b=pA6zMmXnLxOTW5Lw9tFu8+cVAx
	8mMYcy+daOQ4iewRP2KDznG2d7woECV5afVSjLXN4aKjgDXeXrWCZTtIAZS9ON2/QyjKnbRxXaM54
	JX8Nh+rJlW1b+vtVe4a+b1t8rAIa7UHgebhSR3U6ggkEIhHZzZQc8zay5RIdOLD6baJboRSnKWoZf
	6NZW7GyzZlQUaD0fWAFB/902gdH0sb/wUjCd6efWb3UIjLfO4Yzu6+xrX4wUtdVwc28RHjX0CNSfz
	ijv6qJLHrEGCHN1IA0L4Ia6l7PaskDuEmtoVTWH9T8k12SLr/o1YD57xvyDArh7y91pP3K4jbdWOk
	cjQf8ILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ46D-000000090PO-1nJl;
	Tue, 20 Oct 2026 07:17:29 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ468-000000090Ol-3Q3s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:17:26 +0000
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e635220b4so277242085a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 00:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480643; x=1793085443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
        b=r2PexCYEQTmY16p8iy8377RhrzujU3+soqLJ9AuSrpP46aGK1yG94FEM+AseZvxraB
         4saqMcn1AbCkLUvHgBnqYAmYmn4iWeLdAGWoYrvqH/qlIQFafZCro4F/2mlv7ef0Aas3
         vcU0i6BkfseGG3vr6NDynVePXcGbM+4oLP4olW0c5Ug5uSBZCX+ACeUP3bElQb4wF7Nh
         4Geqemho83z5gjhZ4m9ln5iYMbKj6X1y8M/8GrnEAJDLj+3bs+v4+ba5l/tWuY85AXyY
         xPAYpcM0VW13/YfxwfWoVGnoNA519YuBzr4kVu9MnZTBUGBctbJfpoNnpsPbkqxe87Kx
         A7Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwg2TAh4A2AMijr9TSNNBRT+ui13mXEt1eu72GX0AuUGxBSmkHgxOBjsxhNzmdwK8uqCaFhmYhoZWQD3pdcvClq@lists.infradead.org
X-Gm-Message-State: AFq9FYI8jZbUoZwfd4AKMcIDKEoja7izD97GFjQdx+JiWuX+YKhRWAkD
	1Tl0R/9Su0+atHYRjwUhl5aPOptTx/R1YDEstFd+cf4CBfoFEvpH+btj0sC8D8oCu9Y=
X-Gm-Gg: AYBFou0F+4PQeMmhim77JlrZRPCKAmSDXrn7h8qGNViEIg6s81bId6aRRSOibThcUYS
	dd7qJNEIAdZ7CDBbKMZX9HN9qbSn+23zuVVPGVXtgcTaVYB/XcRMWYVwD/WLgDe0sKR3FwhxUze
	xkt2olstsB+qzPmiskjmQucmponVcF8v4b3bATQRN8ItSxUHhN5iIZR89COwjO5vuuUwNse7JZP
	/0mRtRgNBSPLmT6ak+UFKOs3tBTeP3ylZqdw4vE8RMEfN+vn2FGgNc9kQaJ6RYOrawT9Y7SUygp
	MtJqMusse2VqDlX83jrB8xMWTLjVXtN8BYjUITEW32w6uK3iUs7SbPgKwGcCOEnypAKqXfZlC9D
	obkGQ69bvyQ7hWCv3FenUhT5yDJ9Tx2fvH/wP3TlsGeut8LEqi0kxV7OMsShqwllW6k6vMDpJBH
	9zGFoxCku0f/I7io2S2ZIN0anZgcdvqU5VoTjwwUzeOZawyq3o3xxbbxuG4162N89ggxgek/xn4
	tcN+Y0sfm9qD/l8DTXBFgURxDUw0Un5c/Ym
X-Received: by 2002:a05:620a:1b86:b0:93e:bcbf:4ad with SMTP id af79cd13be357-93f29d0a5a2mr1579273685a.33.1792480643338;
        Tue, 20 Oct 2026 00:17:23 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4af49b8dsm158689585a.2.2026.10.20.00.17.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:17:23 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso50484076d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 00:17:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByiucbJUYP2Ey2KXPUOPWHBt2grX93jUVcNG3yQg12c+F6PMpNhjYy9un3TGJZUdN60j58oMRuCG2yom0g4dUfe@lists.infradead.org
X-Received: by 2002:a05:6102:3753:b0:7cc:1ace:fd0b with SMTP id
 ada2fe7eead31-7cc368f6decmr2272570137.8.1792480154006; Tue, 20 Oct 2026
 00:09:14 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <20261019160545.GC3705@killaraus.ideasonboard.com> <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 09:09:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
X-Gm-Features: AclHuK-xW82aBw8g83Y0vnua8_TBb23MC_WawHBUIyGh3Twhft0MuZERm0ITiqw
Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_001724_862566_7097CF68 
X-CRM114-Status: GOOD (  23.99  )
X-Spam-Score: -1.6 (-)
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

Hi Laurent,

On Mon, 19 Oct 2026 at 18:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > > Unlike provider-based look-up functions in other subsystems[1],
> > > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > > the provider is not found, thus not supporting probe deferral.
> > > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > > -ENOENT[2].
> >
> > But not in the other functions calling genpd_get_from_provider() and
> > propagating the error up. Have you validated that no existing call
> > stacks will break ?

Sorry for failing to provide the answer I intended to provide:
IMO all of the callsites should be fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

