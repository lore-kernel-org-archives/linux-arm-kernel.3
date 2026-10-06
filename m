Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C05CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 19:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qBitEhmQ0nRXsqFbRoBV52/x56ftA0tXFJqTD+1+Bg=; b=Kx5rtUYzCYYzzLaAsXOQOGNbvU
	k1Ia+ZWvmel1eEYeVsvHZ7T1P9p8L30eNNtrIoVgk0aKb2aSeUIkCadVJsu+xSwMFAJq0APK9uDCL
	zXx5ZB827XNdNAbkkGAjpLZYxAkPM+LWOzeZj0uIJiILG8xdxjySHJET+qwytQdbri4QV/DwSaXce
	0WEr9wN6zwxlAXwI+trh0FIPE0KLgXnE9Nan4t744jfCj/JDiPJgaiFQutlOGHr9dhl4CQaKg/Viw
	FTXtGJlbmho4wMetKN5RjQF4b2cJNvKS8Dqk6DcmL538jmSjHe0/Rfnmv9mZ+vhP7LmxmhNJOv3en
	tORmffJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEArX-00000001Jlp-1isE;
	Tue, 06 Oct 2026 19:30:07 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEArT-00000001JkQ-1DwM;
	Tue, 06 Oct 2026 19:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1791314996; x=1791574196;
	bh=1qBitEhmQ0nRXsqFbRoBV52/x56ftA0tXFJqTD+1+Bg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ODfamKOlMrd/svk2N3xAryTpWMoBSxgYAPPwkYwb/0eKSjCXnjVUZqpWhxScYZNWB
	 58XC6whD0CzUO7YKaqbV3ZM+x6o5EEkMpEAcModPXCC30POBiq3n18F9XopFL6PAFI
	 PXji54w/i0RCzudx1GTj8elNBmBNvyX7ZjO+XxEuaGx46wwsWpqZG3Sqdw6KWKdZJ2
	 Zbslz5qkM0RU8zmsKGoxkqjBF0h70rJPxjdN0Qfo1iSsBMtvlMePjN3GBsoKKLw/6i
	 fZ+1h0XWOKzJEstjlXja/pXtOO5uP6nKY36aDtfOFylDT9Ixhmg6oBN4r/GLo2D9DW
	 uLh0UyllLGKdw==
Date: Tue, 06 Oct 2026 19:29:50 +0000
To: Linus Walleij <linusw@kernel.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 0/6] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Message-ID: <oiGrAevSu8pKA28tZnLYomTYf7Ox9GgRiITPUpJnRqzFsusm9sE3GXOED7sBHn-oTLk0rfD5bqwABV7rQdkHBuTTGaqiuzgY1m7QxFIKxCk=@protonmail.com>
In-Reply-To: <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com> <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 496c99386a9184e561265d3356b401c0b7c518a6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_123003_493997_282CC7A2 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

On Thursday, October 1st, 2026 at 9:07 AM, Linus Walleij <linusw@kernel.org=
> wrote:

> On Fri, Sep 25, 2026 at 5:46=E2=80=AFPM Yassine Oudjana
> <y.oudjana@protonmail.com> wrote:
>=20
> > These patches are part of a larger effort to support the MT6735 SoC fam=
ily in
> > mainline Linux. More patches (unsent or sent and pending review or revi=
sion) can
> > be found here[1].
>=20
> Waiting for a DT maintainer ACK on patch 3 otherwise this looks good.

I sent a v10 [1] addressing some additional comments by Sashiko and the DT =
patch there got a Reviewed-By already. Please make sure you pick that rathe=
r than the v9.

Thanks!
Yassine

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D1173=
988

