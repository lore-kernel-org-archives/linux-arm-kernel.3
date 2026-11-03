Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2472606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ffqPIFf0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwBwKwXE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=; b=ffqPIFf0ynvg32
	0vdJD/u/piu4EFedoFtNMFANdIgwCGil7a8JHWUX3OdDtlyjWgfGOtD4LL1q+i79s7ws7/kr/dQ4X
	igy7rW6UgMRc1CSsNzObcJtFv8vufFYOMfq7KxV66ajK4upSujVbWP1tOZsd38B+isojy8vWdhQFd
	0g8PPaqB7fN+HcA3GlhmfLu+gOa1WjZr3qCLqij5PPdnya4o9VsZwetxlPXugn06dTLlIf4ilLrir
	da2A5ZYTRGI6JS7C3PnAmTO7QHnOzvG85xH8LWT4pOWf8vv/hp9CUuedZqTtyOUojhsJZCo5IDqrK
	10lywSD8S8pV3ozZ6WwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODNA-00000002Kwa-1vIx;
	Tue, 03 Nov 2026 12:12:16 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODN7-00000002Kve-2eHd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:12:15 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so3184888e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707932; x=1794312732; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=YwBwKwXEAZKSPpj5uVHvEWIe6H7Xw9N3kSIfLbZqR1FgdejnwC0i6iaCW/Y9pG4yL1
         Ren5ecl0+/eYVNDekpUPOebKxqWN3fdcfuYVeBEwhdSeB4plsech+QJvxwx9l8bDAEH/
         pKmgkXvCjROBTFmddlKmrubuVaSTFum+la2DchzGJVrC92LWe7keS9524V8E7j7rSG4K
         aRNCYP//Oawf/21bR6BP1jHY17TaYGGpnn7UO5WlPv3KKdIqSxGMwwm0owohwa5XNWMz
         RwEctHkUY1WdLbs4i/asyfTB53h2ojNBaT/nQIDudpFfQ/GqWWjYzElwsXllVmm6DTz9
         zqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707932; x=1794312732;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7XwenWdW96OgNgWcGPygbhPSyvm8Dmo6vx2RBl2lPo=;
        b=wIsTyua+0dfsekfXufq+70XWQcoEodjAHN3k61aYQ++IXujQQYpVPQkgO+XCvHZQPm
         MxYBlzbt3Gg1nFa84eN+qZZFmFIgxtz4uF7OxjfL0JYtZsYonkSRBml8YklPEYrXEcB4
         bwuORo8ecwHYGYtK2xiGYY3+7TAWTNgsadAAq4eAikqNEgPErVzlEZxezSf4zNFtPHPk
         xcq+QViMZG+CE7OkLC5cW5S4KZdI7WgRpGgiOqiWC90C0KAW9EpGnuUPlLTgKiXFL2eN
         uEn4DyzJ0QLAu0vMkEta94Y8paFKGhTvZKcTGqO7YHsno6sUKoWQqhSxnqjIiWbaFg57
         fvug==
X-Forwarded-Encrypted: i=1; AKwUvBzs7ZONZcnGfODlpzYl7oRvIEBp38TlD12uHDB/0IYrIVLj1AG7DPnU/0PaRq3hcKgvcu5QVgLTRuW7VafjXyRz@lists.infradead.org
X-Gm-Message-State: APuU4Z8ChIx0cnf2QNHUiPXTnoKLhzq4cCgstpAw/E0W6IQz9EDIJ3AP
	HZGUy985x+AHPsrPvpaZGAzk8BYDl0/tAJIiYJUzD6U7bgIqqnmyMlAU
X-Gm-Gg: AYBFou0eC/UGb8CIFJHWPqPQw2SrfFFv10b/csBwcAGTaqYpr5jVHKoaDYrZCGZCFsV
	dMmhSD/Ki2L/H+yjrlqlJPI15SrVEZUTvdf5MPNQj+esFji3E0BJ2MgDDnFJ4u7C+CP6keB1hZM
	wQ9VxKJsqM8dfDpIoRDuMigqBd/yE7+OBPHrkL3+hvmTjTMLGBLtKvvFy2bDt0yxYLFMdcykwac
	7A5TZ1g4zWxV9zy1G4QucAM2BO/oeRU8xULzztdcI6JStJP2xdYcH+nLIdYmT6LhezlRwOwGIQ/
	CdbptAFhxu33R99sTXoZ/eyQsM8dja3ZF2fBauCT99iLYSJ+XXBc2G6wrUp9D1+DxJqgJgXRRxv
	j2YrKcBSxSvSqUDbnEBAVx1pvXnHp8oOsGodxnU5XXGzDLM/3KnJ3LbQUpkQhmRMk1eeUFLSgfK
	FvzNI8b9nZrLkPDp6ATDXxbJ/1yS9qKeqwVMgf/V3sSMOniMUH+yb4zuLeVtS9UGlWe4/4CYjTD
	FwETlKuieoXn+eOSi48KXuF6CgBrTqxf6KI3zIZvIL61fKCi+JO5/L4MhQjKJ0F4rEsnzZL+bkm
	ftxvVwU6fdraFj/Q9XpmQO2bjbqG4sgsoqsqqB5cxvuH8FpWKpn5/M345rIKYdfAhl8iGU1RWCK
	RH8fCiDyGMtNVMKZ3KVbsb/sOyKjUZP+XaTjX
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5461054137.16.1793707931886;
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0775a716dsm12606282137.6.2026.11.03.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:12:11 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Tue,  3 Nov 2026 09:11:49 -0300
Message-ID: <20261103121149.33238-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech> <30e43e84-e6e8-4024-b415-dedf67070c4f@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_041213_671604_5A6498C7 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Andre,

On 11/2/26 16:32, Andre Przywara wrote:
[...]
> > +static const struct clk_parent_data usb01_ref_parents[] = {
> > +	{ .hw = &sys_24M_clk.hw },
> > +	{ .fw_name = "hosc" },
> > +};
> > +static SUNXI_CCU_MUX_DATA(usb01_ref_clk, "usb01-ref", usb01_ref_parents, 0x1340, 24, 3, 0);
> > +
> > +static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
>
> Don't these two clocks miss the gate at bit 31? So it should be
> SUNXI_CCU_MUX_DATA_WITH_GATE instead?

Yes, both have the gate at bit 31 in the manual, and the vendor CCU
models 0x1340 with it too. usb2-u2-ref resets to off, which is the one
I hit on my board. usb01-ref resets to on, so nothing breaks today.

With the gate added, clk_disable_unused would switch usb01-ref off
unless something claims it, and in my local DT nothing does (the
USB0/USB1 PHYs take osc24M like the A523 ones). On my Cubie A7Z,
clearing bit 31 of 0x1340 at runtime stops the USB1 Wi-Fi traffic, and
after rebinding EHCI1/OHCI1 the device no longer enumerates (error -62),
4 out of 4, while it enumerates again with the bit set. So at least USB1
will need CLK_USB01_REF kept enabled once the gate is added, likely
through a consumer in the USB controller or PHY, as suggested by the
vendor DT. I only tested USB1, by writing the register, not the gated
CCU itself.

Thanks also for your guidance throughout these discussions.

Thanks,
Vinicius

