Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD35C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fQBK8bgFE1Ri1Krh9HfuYIeNKOzqdzxblIbW7hnQXQ=; b=wKeUrOkvmixokPuexZPfPM0hEz
	c5R44Ncz3Hz4V3Rtxl3swWfF1cOyYyEqnEPbz9Q7z6pmhWd/dklmcdfjIvmILQsv4vUmRoB+Eaw07
	B4sANK+cIzwuul2yQW4LJ1QTk/ShdKcOgcuEsq49ynivYAoHMT57E6Qhgsuljg18/uTY0q3ZMCzA2
	uNGCeTpbTHgdesCKLZ8GjX81Gp+uF9H0CDvI40wanUgzo0nqrSbQlD7ZcxtSRvobaSt2HqlDcU6uH
	zTiHVncloe3yIzW3SYqmneY7e3DHfMo0Ug1Pz0LSe4Hyl0G+yo0XIQ8sP/9ROV5oZ7NMJA3inDUMh
	Th422x2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukpmH-00000004sUn-1uUh;
	Sat, 09 Aug 2025 20:02:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukpjm-00000004sNz-1jiJ;
	Sat, 09 Aug 2025 20:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10A6E6141F;
	Sat,  9 Aug 2025 20:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F4C4CEE7;
	Sat,  9 Aug 2025 20:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754769616;
	bh=7fQBK8bgFE1Ri1Krh9HfuYIeNKOzqdzxblIbW7hnQXQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GBfpFW+tldLQvKQQnUCTIxV092GzoC3t6M7VHOAiWjRrEBBkv7QIw0lX0maHUrfQn
	 WNPg5HnhwTezF2HG9Mf+obGeahDBhbzh51uRWrEkfvCUUFVvLxrk/zJfyNCNtL8w2j
	 k09TFBa8vO1yehyW9TuqvYzGAjNx11Jm+zO7PQwHzuvYdj8GO0yhgNyT0n3FV5d/NP
	 vpizg1ixql0wV6LjMsH4jn/G5VZPROpKjsYg8vGgN8LQ0IRuwU3jpQdGkehyrAudvI
	 ekPwDPD/0u+UcAH3gQLmajUXN5nA9OA0uIlzh2/Pcwmb9vYLXkz7OMppBtWWFkzn09
	 Ky7m/QSekg1sw==
Date: Sat, 9 Aug 2025 21:00:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Waqar Hameed <waqar.hameed@axis.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner
 <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker
 <gerald.loacker@wolfvision.net>, Song Qiang <songqiang1304521@gmail.com>,
 Crt Mori <cmo@melexis.com>, kernel@axis.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] iio: Remove error prints for
 devm_add_action_or_reset()
Message-ID: <20250809210001.4d8af4cd@jic23-huawei>
In-Reply-To: <CAHp75VeGvgv6TAYRRtEySmESkjygW79ms-Yd64h08_+7JjJMJw@mail.gmail.com>
References: <pndectqm7te.a.out@axis.com>
	<CAHp75VeGvgv6TAYRRtEySmESkjygW79ms-Yd64h08_+7JjJMJw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 5 Aug 2025 15:06:02 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, Aug 5, 2025 at 11:33=E2=80=AFAM Waqar Hameed <waqar.hameed@axis.c=
om> wrote:
> >
> > When `devm_add_action_or_reset()` fails, it is due to a failed memory
> > allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> > anything when error is `-ENOMEM`. Therefore, remove the useless call to
> > `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> > return the value instead. =20
>=20
> Even more, the devm has tracepoints in case somebody really wants to
> investigate failures.
>=20
> Fully in support of this change.
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20

Applied to the testing branch of iio.git. I'll rebase that
on rc1 once available.

Jonathan

