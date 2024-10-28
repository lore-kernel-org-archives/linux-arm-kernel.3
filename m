Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC6D5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0OL5D3wRRnScnzyZ9auDpW3UVQiUgrhsjMKbblKCAs=; b=DNKJC/2+n+kXbubYJlMR7tgHUf
	8zraSG1mfH8WFWqUCxakwvsyn4JdvvS5T94bCWOCZIkzF3FuV4vSOEqpYaJLdFvolnV/hXsT3H6xH
	YOLqZzGKbP/m591SbuYfIa76m8wGXPJ+3S5NxkkdZpVqY+v+0bJ38A0ESPtTRyx6ilqUI8/GMS6XQ
	uU9yj6Kay4vZ9zEiSeZEhSOOrQoFa9dh/k1hpQA7TSYx39Mmbb8gRNf2JPEuhF0rqnjS4TLAwq2ha
	NbufL+7PQCg4di1fu/qy4sHyxR66DrgY/DtMWqrtrgSbroEL+JADDysTtW0b5TrLcb3Ygm5wo1rjz
	0QsvoNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XOk-0000000CM3j-2EaU;
	Mon, 28 Oct 2024 21:35:39 +0000
Received: from mail-40134.protonmail.ch ([185.70.40.134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wm1-0000000CGUT-2uJ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1730148931; x=1730408131;
	bh=o0OL5D3wRRnScnzyZ9auDpW3UVQiUgrhsjMKbblKCAs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LvLyWoWiUh9ggZTBZ8zvQN5/B8ObjInqvBYhRHgkDODoLIPoHwDpmzcKoCLpx7zTj
	 vW8CXBLVD4VHqjrSARPpXxEa8WG7lLfIBOgyu4y17E9N03LO4Nv13G24lyxJcnPB98
	 ojl2y1CTGAOMKBpUfMyVBIySZ4bL9i2t+iJnwOGWHyx4JQrCZgX95OysTKBSF+4cHx
	 UY+VtUJKyZl0Nrlb4xwUNMUqyTMpLTSa4HvWq/wqzglu6ysFWkrVVtEtgMdcSz9PKm
	 dE51KCNUudFfX0gaWEZti32YbEMyrgava2m14Xqz/qHrsNpKUbRq+Mfk8LHr7oX6hx
	 EjNYZ8PFu1/jg==
Date: Mon, 28 Oct 2024 20:55:28 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re:Re: [PATCH v6] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <wXgQHAvchmtDzCTJX5pnEcLvGM1Rf2HTeooQ7GwE-6luNP_BLRQ2LW0wWSXcGWgARzDnfhKd1xQXeMMGYSAhIlX9m7pl3CZ6FxM1yc0qslg=@proton.me>
In-Reply-To: <-rVNN65kgfRzFJBJDIwQF3jNMfXIZFP8GibtUgB_p-eWGLBkNZhYFr-BXEas8IjjofHxWQUqNicUSTp5rb9XmuLi35XsDd0PzJPz79j-M-8=@proton.me>
References: <20241016223558.673145-2-pZ010001011111@proton.me> <DurUfF_0TBHKv4DHKIP3ggQh_85nRY0usYWn_fu_oJ45txO7dGKv-OK5rl6EDEPmX5l8WzrwPCzAvYz0xFPfeKGyx7enu1g-prsWIpilv88=@proton.me> <2bb58a1c.6287.192d1dc9b2d.Coremail.andyshrk@163.com> <-rVNN65kgfRzFJBJDIwQF3jNMfXIZFP8GibtUgB_p-eWGLBkNZhYFr-BXEas8IjjofHxWQUqNicUSTp5rb9XmuLi35XsDd0PzJPz79j-M-8=@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: c6c0ed3cb59d5081b7c3f97d9c933c5ec18de402
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_135538_355649_38669E08 
X-CRM114-Status: GOOD (  14.03  )
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

Hi again

On Monday, October 28th, 2024 at 5:40 PM, Piotr Zalewski <pZ010001011111@pr=
oton.me> wrote:

> On Monday, October 28th, 2024 at 7:42 AM, Andy Yan andyshrk@163.com wrote=
:
>=20
> > Hi Piotr=EF=BC=8C
>=20
>=20
> Hi Andy
>=20
> > Tested on top of Linux 6.12-rc5 with rk3566-box-demo in a buildroot + w=
eston environment:
> > weston --backend=3Ddrm-backend.so -i 0 --continue-without-input
> > weston-simple-egl
>=20
>=20
> Thank you for testing it!
>=20
> > simple-egl will draw a triangle on the desktop.
> > After the patch applied=EF=BC=8Cthe triangle will flicker again and agi=
an=E3=80=82
> > So it break some function=E3=80=82
>=20
>=20
> Did you have gamma on? The screen flickered for me when I ran something
> writing gamma LUT frequently because of disable step I reckon.
>=20
> > I've been quite busy lately, and it will take some time before I can an=
alyze what the specific reason is.
>=20
>=20
> Np, I will try to reproduce this behavior with weston on Pinetab2 in the
> meantime.
>

So I got weston (version 13) and ran it as you did, then ran the same
client. Nothing flickered. Since weston doesn't support gamma control, I
ran sway in the other tty and set color temperature there with `gammastep
-O 3000`. Then switched again to weston and color temp. wasn't retained,
triangle didn't flicker. Then I ran weston-simple-egl under sway (while
having `gammastep` running and doing gamma lut adjustments every ~5
seconds) and the triangle didn't flicker too (but there were _expected_
flickers every ~5 seconds because of gamma adjustments by gammastep).

Best Regards, Piotr Zalewski

