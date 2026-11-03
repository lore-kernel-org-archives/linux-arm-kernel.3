Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 01:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hw927L30;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wORArVyx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=; b=hw927L30waGwY3
	cEviQufcrkNYTBhZH/K6qncApk4CPCNA5FpOYd72f2gINtxztYMzGMcxpWn81AScu1Nchl1tqQDQd
	3KHHLfBZsPjjwHDQKfPLjhyLsS9Mw+YiJdO9LoZv8j24zI9VuBC8eVmAHI/DP0BoIIAR48uTbKNjO
	4sJgjHzkCRQs4QW4SRUhTnqvVrFRRKkBnuIwCjVhWYh4WrLpShW1BZgk07S20E6wteuAYosgx6Gn2
	kLfx8ADxH4/4jRRSd0uliLOUPvucU/gQWWanGX0IU0+sRl7YQvmosb97BJcWe7J1lnaq7x17KvcKc
	Pgy6KFxn8cSlNjYV+Gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3Ox-00000000o3Z-0mRQ;
	Tue, 03 Nov 2026 01:33:27 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3Ot-00000000o2s-3HU2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 01:33:25 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-533797e72e8so23271681cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669602; x=1794274402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=wORArVyxmMLrdXsV62Be/4wIHcVpYkZGPEN5Tba3TxafElw/aRry3/DYys6FtB5+IN
         LUUW3o67qrncBgyhfPQRqIQf3dzaDWkb11omkVVW7/5YSMjDCGGMm20RIlgrqGSY6Yj1
         ZP1TTppJOgvEqAb6OgWYtP19bGYAHOXraCiqSSNHYEb4cTiubfxD2rQEdSBp8LNHgpcj
         IrKb7WduyBOP7D6ob87+7e3K/SkchCn9MxpBGKlGPmpsWpy8tYj0Gp8hTIqlNjMcOrSz
         aH8W0SWEU6NwkBcthVhx5yXLKSRVQu37pr4EugFwpENgvcAbTgkf0P3v2gFLqv5qEiEU
         4tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669602; x=1794274402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=lrBDtdc3/ysBTaZ1BniCIB79FCzc5KAwzeaXnjrmvBs394vsHh92n4veDo3kWRvjIF
         u0/CXQ+FArg2DWq25D4sgCnQRb9ot3OTBOJ186vPluowHyynd9g5Wti2yjlbo1oKaUF4
         dBMQtnWJwOBI0eB/bHA6CW/e/60VHF4DW5YnbE0r78Bdia6GLzbkObJSKMjgDwg8zuKq
         A1OZ7VUoMOihZBTFHD8LFiGHRJltd9gKOGRDw9vn8CbkxPMnb/pUzygVp2NL2blS6W3P
         LxZOlhpwnkKafMSeUqJBxmJMQ9N1stZPo+hpp7p8gfOFUtNB5Xwp4xVZYVRENG1FmM6Y
         Gjpg==
X-Forwarded-Encrypted: i=1; AKwUvBwyTFW/aFq/qZboWhMQjOwtk/s0Z3aavCyw7Oy6Sx9abQ2LeuaLerhbBjlkXB9NqGbfd9Pr9hXOb48p4t0OJzrP@lists.infradead.org
X-Gm-Message-State: AFq9FYJsHrbmbu3Sm0avUUVnzGSdd3jfV1KnFDtjv/sLCcnJ3aeIy7fd
	xtsTENBa8oilcVXerR8SHjsJDI4zfrhJ3y6n2MfeJrHSFi/67vfrQeBF
X-Gm-Gg: AYBFou2ROKjRSl5wcMjiTOa3npehjQSqEDMxTps6b/jgfW54l4szrqtP3FbnUFdJk/u
	OjwKfeGGJj+heMpxAc9sGmn/lpH+5gvMgclnw4gMLw5NlbdckXs/cWfeJCuKtHPTGznogi/Q6dn
	xwfjO+9X4HlGRQDPF0nFz4buZCfURsjgs1899Mw6ZRzfwyNoeaVlJYC9sV1XhJMs/qLVDy98I9W
	DZdUldIMYWvcpjrJTwNYznRD8WeSrZija3kbs6Guiozj+6hrOE7s7a9lYmGIQB2dksFVKzns34Z
	3236i+uPuvLP6hcA93K3oReUW2zOoaEZ/aWQUFUjU4geueqBwvaechs7JVJbJ4SspXH4QyVI6vT
	/44GK7E6dJJ59eyMhpc7LnW7m+Pfu21I7CcGwV1BgTvSyoYRAHRGPyfGc635iKAuxTsP6zcO8jh
	73Iw1o/e6lGs2SOeo/sfxc0s+TkLYknvCoNJgrEXP5IZqjU8nBPwFV2pgt6RECSa2xUk+TOvW/S
	3ayqa95rD78v6GVMTMdF6ae0gMDPmH1yDhhjAQfMSWsI9XZqNT8FcXgLV6+ngOcZt5reFRqhav2
	/JjIj+gohAQH3A4vjpfawxsCsX0IfYDe/fdJIlXFGmWEomYR1+JT4C2mPz48LuI2x5f59VZ1Fz0
	MOZ5ZE6e4IPdIqb+/+HjiGkXf2Q==
X-Received: by 2002:a05:622a:3c7:b0:535:5fa:ca6e with SMTP id d75a77b69052e-542b75236b4mr201626151cf.51.1793669602205;
        Mon, 02 Nov 2026 17:33:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb5b520sm12746021cf.26.2026.11.02.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:33:21 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  2 Nov 2026 20:33:19 -0500
Message-ID: <20261103-a733-ccu-v6-fw-clocks@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_173323_839316_8F59563D 
X-CRM114-Status: GOOD (  11.37  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Junhui,

On Fri, Oct 09, 2026 at 11:52:08PM +0800, Junhui Liu wrote:
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);

On a Cubie A7S with vendor boot firmware, v6 reaches a Linux shell but
stalls at warm reboot. The system-controller firmware uses the R-domain
timer and mailboxes without Linux clock consumers, so disabling these
clocks as unused can leave its services unavailable.

Could you consider marking r-timer0, bus-r-timer, bus-r-riscv and
bus-r-msgbox here, and bus-msgbox0 in 7/8, CLK_IS_CRITICAL in the next
revision? My standalone patch has the diff, firmware references and
board results:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

With those five flags, two RAM boots of my A7S integration completed
warm reboots without clk_ignore_unused, and all five clocks reported
enabled. That is one board on vendor firmware. Vinicius reported native
PSCI reboot working on an A7Z without local critical flags on
bus-r-riscv and bus-r-msgbox, with TF-A and U-Boot built from source, so
the boot chain may matter. I haven't tested suspend, or shown that each
of the five flags is needed on its own.

Thanks,
Enzo

