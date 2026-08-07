Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA3C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJDGvHNzyPJzBg2Gr80EJpq1olmLSKAd+7nnwt0Qai4=; b=oL0/B+gVRvvzKJ0TCun3Kcnx0m
	xKlW9hjjFJc/naFhjDCTdkw58tPWGLW8xMNUs9MnVvmrfsuUzk88rWLxYAI/UqYWjoZgDFPLMgiWv
	TtC/TyyvdFFl3KD9iSJiapBysSG1TZTW2cXHVu89VKW1iAdzjd9sJYzfj+qZZronyFuoKBFMA032b
	upK2xeH/0BiUI6HvjTFH9u3jlpGPn6he0URRqb7pbeqt+Sgq20eCwP59WA6nRQSxXklgyoCWWMPYJ
	HyLXePiIsU4vOvkr0OEIN/FrFPZnKxhq6uyBa4dZFZ4EYe8dZ0ea9z1UTt/eF230SGIBcehW4IEx6
	c3BTcdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFF4-00000007HiE-34Vk;
	Fri, 07 Aug 2026 07:43:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFF4-00000007HhX-1lFo;
	Fri, 07 Aug 2026 07:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zJDGvHNzyPJzBg2Gr80EJpq1olmLSKAd+7nnwt0Qai4=; b=gysSq7wqVVxQPxW6unuxL5d+fm
	HaFSM1BNGomxyaoO0EruVFQpl56uLftO4y0/0P1TpnaaArZOTXeOhYlH3UIHfEqBJTG1ln2WnCQnL
	5ad4idZI2Wn7qL63Liilscoe0C0pQoldQA7WWmk9OiW/xpwnucdGkyCHDOL43qTbYOVNu4zOefPfM
	A8n0ZD39XWA4n69aeulDfb27IUuaINTP19t53W3cY+UNweT8bQ0mHS4/MUiCPgXsIlstNA808SmuF
	LH2cKUACHKjYqw22lRyr+JWsrxUR17R1+4DIWXWVS5pMjovmkwcpsKiXR8HXGXRKTKTIB3fwnJVCs
	4tV/7y0g==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFF1-0000000C9TZ-2eNM;
	Fri, 07 Aug 2026 07:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zJDGvHNzyPJzBg2Gr80EJpq1olmLSKAd+7nnwt0Qai4=; b=i5nO0QXpBMJAJCP1h0853SVIfv
	njaw20WcD8pQ8I3+sEAYsbIBJ4KCRTvU2ppajxQtOv7g3+H4QclYwQBUtuwxCldVkVAQauJgBd1hP
	9E5e4+g1dbTvZpGuSS9QVGx57ttCKIJB34z1YHVnxV4Yx/I7b8PQm1fMzrpLlFHa+b2n/AbgLK9cu
	mf1bCYRANeeZCUKAHxjG9cfsPouHIRV6RGRemCA7cnbNQeu1A2FxbfDK8w25WgIZ2omH33+NLhbSW
	mZO9NANTrXx7qJVqUcHMFDsW8aekUJjxSqt8r4thJuCL3d7SSF9fVWVj3eyWBAgK+ciLCYImozMip
	dJYmY0kQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-gpio@vger.kernel.org, Vladislav Leonov <vlad@zlab.su>,
 Jonas Karlman <jonas@kwiboo.se>, Fabio Estevam <festevam@nabladev.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, huang lin <hl@rock-chips.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: rockchip: Two fixes for latent driver bugs
Date: Fri, 07 Aug 2026 09:43:30 +0200
Message-ID: <5262877.taCxCBeP46@diego>
In-Reply-To: <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
References: <20260803141028.710706-1-sjg@chromium.org>
 <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084343_746020_EC6DDF21 
X-CRM114-Status: GOOD (  18.06  )
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

Am Freitag, 7. August 2026, 00:12:51 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Linus Walleij:
> Hi Simon,
>=20
> On Mon, Aug 3, 2026 at 4:10=E2=80=AFPM Simon Glass <sjg@chromium.org> wro=
te:
>=20
> > This series contains two small fixes for pre-existing issues in the
> > Rockchip pinctrl driver, found by the sashiko AI review of my RV1106
> > series.
> >
> > The first makes the SoC-data calculation safe when the probe runs
> > more than once due to a probe deferral: the pin count currently
> > accumulates across runs, shifting every bank's pin base. The second
> > aligns the RV1103B drive-type override in the get path with the set
> > path, which restricts it to bank 2.
> >
> > The first fix is tested on a Luckfox Pico Mini B by forcing the
> > probe to defer once: without the fix the second probe doubles the
> > pin count and no GPIO bank comes up, while with it the values are
> > recalculated identically and all banks work. The second is a
> > behavioural no-op until drive-strength decoding is added to the get
> > path, so it is verified by inspection against the set path.
>=20
> Patches looks good and the Rockchip maintainers haven't
> commented on the other week-old patches yet so I applied
> these two patches.
>=20
> If the maintainers have issues with them I can pull them out.

no issues ...they look correct.

And I'll try to look at the pending new soc pinctrl today.


Heiko



