Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA49606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YZJmas3v;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gQ6jHYFe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=; b=YZJmas3vC8ngjt+lKmLMKM9cAd
	tFY2TrDOMMOwMikkjCe7n0z7me3bWgpdSBe5jn4YoEr1k3swiZpx9Ec1BkHXq4N2sfTZDy824tEdm
	AaeoJ916WoIbTezM+S4PjKoTeWNPCscWlDlI/IFIipDZDjaDX9I4VqO2u4iJ4LDZb4iq+tzUdEBez
	9TjHsDL2Sqqxme88mBGQdrlvy7HPBuAKP54etT/tfz7C6wq5MOKSO906NC9NWVIuoG8NHBhBA5fQh
	P14FVt8YYZqlKoUriuzPWh/5eIRwW8JXRqcPIqRj3CSnlkn9WsJbij4atKD6UQskDzKdj6IfqRLAJ
	YIy10nLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxuq-00000006SS2-3XRS;
	Wed, 28 Oct 2026 07:17:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxun-00000006SRM-0pbk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 07:17:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso4539175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171859; x=1793776659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=gQ6jHYFelp6MH/kyUIPE8IqJRhYd4U9+CAJvM0N7klinVapSnt9NPEfeMIlAeCWBIm
         8wGyZMeKESLN/smGCU8WQwp/EMQxLSvNA3RHdYNE/esYPV/eqYfgQEHDQswQ7V97qL6J
         pMqNycUgWH0Ai7as9sDczo8vt1+5hcGM2E1uaxtD1g8DNgFBumbULAsraZfxnOQtclvs
         zD/CrvIjVcoieWWQOz/9elyjOYW0/U3zlBIEjGlohEp1sh4hnY8wW5w3FlKrmywjF9Cy
         Hv2DWC8VVL3T+MtdmZ+XVWRTwsGmTGZVfl+/Vxe19B+qqvrPbDonaXyca8MR3rL5X+j6
         Y7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171859; x=1793776659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=179NlmyrN2v4xVAiJ5os+AD5O87Pv1QXWIbFQZCWXR3UYlf5gyAqhzKjAIaBPv8XRs
         ijXvhqosDh4kqzSWMURlGrL06IJS//zLjHvwhMu969Lyv+uWxXyuwC5Aw8GCMvatAMXP
         uQFLkOJh2Z3dxD6bvqilVx1ZdbBL7lZpKvxYGdXnnSDUstxtGJVLqkyshmdJpwjLSFEE
         TL9FBcYeIzi8Uv4oUHVj/EEOaN/0B+8O55yazi7yDVmgHPD4kvi91X+/ybdApMWa1kWV
         ldtBo3a3UUVEzUQX4kRtsuTipdgj6jJxfNVdYSTBmZo6CoG/qTKU/yZhuBL61hUADTLx
         gfdA==
X-Forwarded-Encrypted: i=1; AKwUvBy+8FJWPmj7Q1xfemr7YQiZJ88a4usOF1+KYOww5M/B+xlnL5XhlpfyBIShUunVqNds9hVqLth8KuJOdb4v0stu@lists.infradead.org
X-Gm-Message-State: AFq9FYLdpXu4nM6KRrYixfyLcI81saLGA7JxCVvxrlxUHCnOnRX4p8gZ
	2repFMnddWIpdQsM7lUkpd+1NBtPc7Qw2GaeUTGzMrQbs4j3aU3bcE6j0gfiCmqSox8=
X-Gm-Gg: AYBFou0Ts1ZMfLMkbjTIf4b+jHYDrpss+6cbhSSlEfwui5XQKiBvQ5uUQYmiknMrhV7
	1+uocFVoCW5FVCS5G5z1VjHA3BQQqJH3efeQkM+gw+IqS6VIDx9IU+/RcRmq2h3bJxp/lu8uNEd
	xboztwbu+lW48ThldqYepvohmId3LVYHrRHrV2/j93ZKy/itnsoPd5jOoKmhy4LDbrz30Zovjng
	yTnCy/oeIWdNuVfN6nBMLtr0ogHpA5VjjRG8yHYC6XCVBXnhnXk/5UqGfHa5Ck0F9/53a7DvRhY
	wIP1TxoClKv/UhhM4IFCNy2uPG6u3pQTYQGA0XC7b/H98O6YFiOPS9HDO9lRCE7sujhXvATaLQr
	ip9DlffmWQk2Ii4OtZjO/x1+niQMtT6A0Lztydlxf+sA7E2kK2U3UVY1g87hrVqCtBBL/RBz/hc
	PoyLDQS0kOv3g1BmduVOIPCINcgSJxsK9sgumicWr010YjhORj2yhzsmG2wKd+zpESKspuM6oXg
	RdVR9I0B/H1DIvCWmKvXuFPbUil7RggRJfRS9r33Rz0/axG63974pg9Zs8kV6+JIe/Uqt24mznr
	EM2XDSQrWvScH2I5VfDRFDMtk9ZbuYyc8kmmiJDfC6zWBdYYkHBj+oObwCOWyWZ0e9mVciPVtS9
	S/58p2wj6gDquiaE=
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr25106675e9.33.1793171859280;
        Wed, 28 Oct 2026 00:17:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d7cdsm20719315e9.3.2026.10.28.00.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:17:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:17:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
Message-ID: <auGhPHjanNTkkzG-@monoceros>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf4vux6swhzzilrx"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_001741_255019_A12F92A3 
X-CRM114-Status: GOOD (  10.59  )
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


--bf4vux6swhzzilrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 11:36:58PM +0800, Han Gao via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a lot of unneeded
build dependencies.

Best regards
Uwe

--bf4vux6swhzzilrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoY0ACgkQj4D7WH0S
/k4lEQf/aQompiZrE8lzHamk+WXWr2kv9iqPDmKByLu358ny9EKvV3eNOG0y3m2B
hMQ9inmxBjyfz0TMb3NkQtmXVKnu41A8A6mcl3B97akrhcvKxPDgsn8FWhhNJiBs
s0jrcYuMILEssk5h7k5Ah8fEdVAXbDTp88j/afUmb9QfOZxjaW+SXfLYigacUFT0
U8Hy6rX3B+GESX5uvdxOY69bn4dHt7Qwr56FksGQtIi7Y9DbyRhhMRnwCy4pCLnw
ZD9t3GwAHwOm1fdsdqP0zLsJPukoZPNmbT58FjRf45TfYHmOSulG5O3oszd4ElAw
wrbitVSdlgy1G4VvYAZKJRQLV5gF2Q==
=JnXH
-----END PGP SIGNATURE-----

--bf4vux6swhzzilrx--

