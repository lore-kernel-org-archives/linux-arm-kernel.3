Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3075606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LIlrHrd5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anVIaiiw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H9VTlijTFGW2hK1YgmVnrnjy6rcLsJbVdxBVMKqQ5Mk=; b=LIlrHrd5d46KwD
	05bDQdBCWTzSERDrZUKdhmwCdWtievfIBT7V5LU3vWje3rR5+8II1pIXYdEyBExbiUDxPfyFADdga
	QtlYD76NPg/KIISVXu2n0zO0vdSvmVLrawQfClwbttn2Nsn22XZ3XC1uRhfEWep05u/ZRORgvLsIh
	fSOaz/18psvmXnZyAXkdKTAXsslFNqBceB2HfZaDeqww7xAleDu2AwAYTi+QQ6SmSGUha4muO+bJv
	eNxGIAFTW+HTu7yEBUmynTz4ILeTVGYmy1lnYPL6AWLPG4PCsBEKS3Jc/T9lRLWZa36RzZZknNaRp
	QMLAcAu1T3Ux0SUnC+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaqs-00000005Sbe-1eqi;
	Wed, 04 Nov 2026 13:16:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaqq-00000005SbQ-20Uv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:16:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4099343F67
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFDF1F000C1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798188;
	bh=H9VTlijTFGW2hK1YgmVnrnjy6rcLsJbVdxBVMKqQ5Mk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=anVIaiiw1pZMJg2YZ1N3c1UamUmvnrrKGQWnO8NEpY87ayerF9aRI865xN7k4arhP
	 0ora4PhcKUA7tc3gRf5KJPZRLzDlKLUVlUaqjd2AMjgBarla0oTMiSTZyFgbsGYlwY
	 fsVOjVqGXMbB1lKrRbyHQGM8moEQGCArsVVqCajNxylEETrn8qtM2iWzHaOLT43wdY
	 9CF1Ojyj4aExSItAwUd/2QmsiJWsZaO/6jXd0s8gtn7I/G6Mjw5g7TIub3bSE58eC8
	 ii1USs42gD/OF3w97LAp+kC8W3GgxUmmbmvKzN05ws3y5BPE6ZVY/ahrli3ugfB9y1
	 B7FSo5BHSH9EA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso551254e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzLIH55BIwl/EK98qHFKHGyPV9LBpOBM2Fs7AGHOwz3+OCXXi+Jw7psnPob34XrKcesNvgSHbuw42HScevsqTrS@lists.infradead.org
X-Gm-Message-State: APuU4Z+DiYB14NjpabspYjStsYv6jqf1M7YVRI7YijLizZYE8Bd1850w
	7GXG2EytaJo3NeuaMXwa8FtTEcCfSKTAgVjFolBTufzqYbsuAyK9R/QWW2O5tOTbliU0SFc2ybv
	/T8MWZJNK3huv0TA9KhemBiltN5kRbH0=
X-Received: by 2002:a05:6512:6681:20b0:5bf:d9b4:9b48 with SMTP id
 2adb3069b0e04-5bfd9b49cfdmr3241637e87.23.1793798186772; Wed, 04 Nov 2026
 05:16:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn> <20261103-a210-scmi-v3-7-ee6b31580808@iscas.ac.cn>
In-Reply-To: <20261103-a210-scmi-v3-7-ee6b31580808@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:16:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLk_PJu_ViUmKSg19VEhc0=3SoyiqwkSH3vGix1qk7xpDA@mail.gmail.com>
X-Gm-Features: AclHuK9XaDppXSCtd7Lxt5eqeFEltqu7_7zUAwED7nuqN9o1y9Frwslmkgi1DM8
Message-ID: <CAD++jLk_PJu_ViUmKSg19VEhc0=3SoyiqwkSH3vGix1qk7xpDA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 07/17] pinctrl: zhihe: add A210 support
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Zhiguo,

On Mon, Nov 2, 2026 at 8:45=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>
> Add pin mux and pin configuration support for the AON, PERI1 and PERI2
> pad controllers of the Zhihe A210. Each pad forms its own group. Drive
> strength requests are rounded up to the next supported value.
>
> Across system suspend, restore only the register fields Linux has
> programmed and leave the ones set up by firmware alone. Release the
> optional pad controller reset at probe.
>
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

This looks good, just waiting for a non-RFC version and review of
the device tree bindings.

Yours,
Linus Walleij

