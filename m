Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nq7Rb7Yx;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hxEh/ZsV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=t/Npa1R0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q3DEVqrZHjQPZv56tDkM43SEEr29dhJWwVMxvej/8Yc=; b=Nq7Rb7YxWXSKqn
	CxUdpBGxo4VWKnR04Kqc2zhEshTeKs8t2FjEkD3dcLvK3d+4h2amGMl2FnwZEBovH1VMN0g15X2hH
	tzdWYM+vsuV+Wx6GEiqRTPyQxtYgHL6sPE25FLFmYRjek12nlWlHtiET8d+1j5UCWPj4gSTjG71in
	vYrBAFtSFp9WTx2Qc1OQsv27QQrxInQeofxZ/jVly1g69xDo8IntPt/E8mw/PC8G9M612kYsl10u5
	pxWEpjrcdR1FRC3LevYzuft6+gA3BVT3vaY1Q1ydZXGzwbaIqoMHJVE1V4NVVREsMTFtZZp0eJhbi
	A75vENkjKLUa1kfpIWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLL7Q-00000002e2k-0H60;
	Mon, 26 Oct 2026 13:52:08 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLL7M-00000002e29-1vlC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:52:06 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 80C6AEC006D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:51:58 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 26 Oct 2026 09:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793022713;
	 x=1793109113; bh=Q3DEVqrZHjQPZv56tDkM43SEEr29dhJWwVMxvej/8Yc=; b=
	hxEh/ZsVMXx0VaMd/+M8Z96je/vs1Zp8GiGfwLUU3sMVKxrSEqFM1LWqRrwVWgxD
	ic0sjz+MicnBUw5CZJPlx0Im3sJpaRjNc/HJGDjCajNWx4gGJdpwfkIQYj6wNBgt
	e+eBnu22SH8Y13GRb32d0cm7GJHJYhAaN3NtprW97s/y44jdKzmoaT39V/9RtiVL
	lgSBIebc6e8J0HOOX/kHDyFaCPKp11iqSuPK/+z/Z1sc7CsYx0MNLVw0B5TzOJEa
	gkEOLtE9ere9nNr543UjbRUwyLo/hIH2Tb02YqGaI11nMi6nMznFeQ5tAhWomJwg
	xhQZsW0krpAfTW46v/PmQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793022713; x=
	1793109113; bh=Q3DEVqrZHjQPZv56tDkM43SEEr29dhJWwVMxvej/8Yc=; b=t
	/Npa1R0HkfQ14yvATXInKphJDtSyIRV5l1q/k/issD2KJKlkaDH69zU27cQn31VR
	H/FdlWiJIZjeUOxC5j4CEIeFRIQx04x8vxSKD+BnbxlKq/MnpFi+LAh8jRGMfd4p
	fkywLOY6ZkHPeBjcsrMyhy05dVvMtGODDM3QTKzc2OkJ5z1p5YAZkqxjhpFWlmde
	zRW7wyDzFw7qtTunUW4h7T3yrEQLuu+UMsWuWq5cIrRgH4qglLFfojmgY0XeKJTr
	CyW8svbnP5DaX2g7vzUefeiuA2V3xw/alfRwqv/kCN7yCXqTd+3u9gLDb589PkGD
	zGpTnWmH5v+LDlhzK7Cbg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793022713; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:Q8syvd+tKqCnh2DyoO73PIm6S3muVijg5d+SK6VZB97cz7g
	+3Loxd+LYqvIqhg4+fXH446kT89kHB9hinerdZ33NPcWHeHu+3z4tKJUgesWotAs
	3pkeunRyzYuxK0q9QHA65ElqQu1leOIGcNaTRBNdTf2ejpj9a7rajUgGzku7aK2s
	jhRCLn3dtm/2IXGuk6uPAXhTqh37zGr3o4VHqD4Wwi1Yy4Q8LyGMtuXzBovaTKow
	lkB9v9I/93wHsvogqwcobhJ5PCDattheN3VXcMN2qiNiWAMqfwwatCHkrtC/RMca
	+/orX93ZZJ9Tj8dx42bPsVCQmBxAKf0tip8CLaQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Oy/howkruMFXJD3laxRsMr4nOnclTbF4SNSQ6L93fKU=:KtX4k3ya7RcU8NJ3EsCTbOk4F9OmT8AIpqn6aAliyFk=;
X-ME-Sender: <xms:81rfaljJJ3gxVsOVJ5b0Iz5j0m47vRpWtVSiAphiT1Etk6luBcYQMQ>
    <xme:81rfak2ehLAhgKTK5zig3tDAtZ1co2alavnEDhfKb4XkER8uQ8U6KVrtGuTxQzR66
    J2dmDyQE6m0GIlPem8cM79NX1Z3JbFKQBEd1U0fZ9uKzquF7OrXOJKz_g>
X-ME-Proxy-Cause: dmFkZTE10nT9aBR7VZGvooOUSEy9GXDTiA4fuLwAGQk8gcKjnfNQfW7SSsRSjF46yJnilC
    ug+nAoOlsm9ni3ebzgzSGJQTNboxVBBt0rTBObzgYi41jG1ILiJdkgROT/uof9eFptJse5
    A/btnyQRsPuQSDLUJUyv+dDyIWiP2iy5NVIt+T7Uh/uddWL3I90XhDupPX5M2vCqxcXQSq
    DwEcdDZqwm/UTSkgzVRlQ3pVQizQ7FMRRau9ixulXaj32FeKpkicStKj4YiY4HslYkiAaw
    goJG1x5bgtcelQrzM8UffY+pZItrjSQfzVqS/KifCHl8bsUOm3U37cipWrWqSXt4182EWf
    Eik/LS5y0fz+oAnEp9bUrQWhuYEjFQKeLzSREa89M4D8HV6rRTfQ0mqBsM9qcJUgYPmxMe
    sEyVhxNgO6AxEuWlZeLmqotx/P8Bhcb6RxrvkNzQVnmEUzebcZEplqJxS+KuEYomjiS2GY
    cN72nYbIOtIGEIRDJ9etf0A2gGSlwKw6m3Rgk2Dkc5/Cb/yZchesW11dNuIuPxudNvPKED
    dKhQaWo3Js5LXQqwCzEdIu0bDGLWP4TSJCa+ZPEA6SwlcCTEZwrwzLY57F0AUf655SM5SG
    S5NeYVsEIA3aUIzcD4sCrp4UTGkR0cY0NljKqhKlc/BzwBjgvzdO2/ArwPzQ
X-ME-Proxy: <xmx:9lrfai7MMHWvIpkcN7Ex5paFsEknNsUPslrfZRwafLq-NQEsd0Rnpw>
    <xmx:9lrfamkcRv4lrYDS2g6ntYkeiTSDdVz0R2bpb4U2gCkPS39zq66rZw>
    <xmx:9lrfaoEh7Ix8f1v3crW6hERWF3Um-x7HKNkbpV6FpuGkSX8Bd8LnIg>
    <xmx:9lrfaqHFuIS2W1vz-hDVLSax1chdktmSPzQjFRWyAEF-LETbuYAkYg>
    <xmx:-VrfagmAfe00RPWSkxcZJ3xx5c7E_MlNrP2HqaJaTR3cSUgzjJdapRYy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3F1D932A0093; Mon, 26 Oct 2026 09:51:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AIMzr2H-57Yw
Date: Mon, 26 Oct 2026 14:51:16 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Lee Jones" <lee@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Russell King" <linux@armlinux.org.uk>, "Mark Brown" <broonie@kernel.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Message-Id: <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
Subject: Re: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_065204_972573_84458A60 
X-CRM114-Status: GOOD (  14.63  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026, at 06:03, Dmitry Torokhov wrote:
> Hi,
>
> This series converts the Cragganmore 6410 board to generic software nodes
> and device properties, allowing the removal of legacy GPIO lookup tables.
>
> We add software node propagation support to the wm831x MFD core to route
> DVS GPIOs to the PMIC regulator, and convert the peripherals on the
> Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
> from legacy GPIO lookup tables to software nodes and properties. This
> eliminates the legacy GPIO lookup tables on the board and fixes incorrect
> GPIO chip names from previous conversions.
>
> Hopefully Krzysztof can finish merging the series through the soc tree
> once Lee acks the MFD part.

Hi Dmitry,

This all looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

I'm a bit unsure about how this fits into your wider plan, i.e. why it
is helpful to replace the lookup tables with device properties in
this file:
Are you working towards eliminating all gpio lookup tables from
the ~50 files currently defining them, or is there an immediate
benefit to doing this one in particular even without the others?

Do you plan to also eliminate the uses of the legacy gpio
interfaces in mach-s3c, e.g. the hardcoded numbers
in {pca953x,wm831x}_platform_data, crag6410_lcd_power_set(),
crag6410_machine_init(), or the pin config in
s3c64xx_i2s_cfg_gpio()?

     Arnd

