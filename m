Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD3ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNAXiQNHZKvLPmuSvHGH4xfiW4QLvC5MPDpiztpmQtc=; b=mz8jUXJN6zNcmYKmUCfEoost01
	7MQkBBjCXshG0IHFuMaO+OZLbaB6Oi6CNBFrJYagVfTsspih/8Lsh7PWZYvEg/2DT6EM/s+icoQyg
	s3n8/cTLy1ZRh1o+bQn8eQvnlnRxkIyvQihBHGkDBkMRMLP1qlTFQrHRJhcVmVVuT3Gtq+cz3EFFg
	2sXYg3sQYLdfn1x+1Jj3pJFN+RMwIojC0k4Iawo/0t35EVaDlXO9JU6phC14nSCy7YS9v64lXjtVF
	DuwcmuH5PiOYOL6soC8Paw/UlxoMt3zz595Jsb2G6tQb2/gB2ay3nQ2BQI68psJfgSTztfb3Iw84a
	/UaTwhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61MJ-00000001NT1-3AYH;
	Tue, 07 Oct 2025 06:39:39 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61MF-00000001NSb-3k67;
	Tue, 07 Oct 2025 06:39:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id EECCF409F9;
	Tue,  7 Oct 2025 08:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1759819170; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DNAXiQNHZKvLPmuSvHGH4xfiW4QLvC5MPDpiztpmQtc=;
	b=l+3F2tAjUyIOhktb/XyLvEnDUXX2dOrNO/bgw39WI2UIIax0uB4BvAQRK8p0JNEekq55gj
	A8tyodsL5OdWkTXLCMkne4mq1+V0HhnwVQJlXbL52CfEfLq3xFmziVM7Qjvpkz2BXqtz2v
	4UcbUmqyk7gdRdRfFYdsYbDqCeq1Q4WaJ5d6YVKyTcPGnPYdXPI2sNVg2dDQ/S9HRXCmGr
	JdHqffjocrzlvo1F2j0iLaoWltxVKgON9Mmd0nYUVd0XQ2e4zFPBbhosWOLi0Cl6jXOmRd
	9wELyLkk0duy1rwEenQ2a1BC8ITrgiwXbpb87Z/ODqSHfTsbPrjO1slgS2YYuA==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <37f2603e-8c51-4f92-a7af-0e60cd577004@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20250921-ppp_light_accel_mag_vol-down-v3-0-7af6651f77e4@gmail.com>
 <53eabe34a310ea9c74315fa09a604e4a@manjaro.org>
 <b01ed528-8b29-4a6a-bdff-88f2e3b5dd2e@gmail.com>
 <115da845d9161e6ecfa67cf189b84aa8@manjaro.org> <37f2603e-8c51-4f92-a7af-0e60cd577004@gmail.com>
Date: Tue, 07 Oct 2025 08:39:29 +0200
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Ondrej Jirman" <megi@xff.cz>, =?utf-8?q?Leonardo_G=2E_Trombetta?= <lgtrombetta@gmx.com>
To: "Rudraksha Gupta" <guptarud@gmail.com>
MIME-Version: 1.0
Message-ID: <eae79f9b-7127-6808-6a46-57ebc079ca50@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 0/5] Upstreaming Pinephone Pro Patches
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_233936_346590_15C3DC74 
X-CRM114-Status: GOOD (  32.33  )
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

Hello Rudraksha,

On Sunday, October 05, 2025 06:55 CEST, Rudraksha Gupta <guptarud@gmail=
.com> wrote:
> > Thanks for improving the patch descriptions in the v4 of this serie=
s.
> > I just went quickly through the v4 and it looks much better.
> >
> > It could be said that the new patch descriptions are now a bit too
> > verbose, in the sense that the test procedures and their results co=
uld
> > be summed up a bit better in prose, instead of providing the "raw"
> > inputs and outputs.=C2=A0 However, it's still better to have those,=
 than
> > not to have anything.=C2=A0 Writing good prose is a skill that usua=
lly
> > requires learning and practice.
>=20
> Awesome! I was hoping that others would comment on the testing I've d=
one=20
> (especially for the accelerometer and magnetometer patches) as I can'=
t=20
> tell if userspace is wrong or if my testing/conclusion is wrong. Mobi=
le=20
> Linux is very early stages at the moment, and I suspect the Pinephone=20
> and Pinephone Pro were used as reference devices with Megi's downstre=
am=20
> kernel. Wrong mount matrices in the downstream kernel might be affect=
ing=20
> userspace. This means that with the corrected mount matrices in this=20
> patch series, userspace is slightly broken (eg. since I fixed the=20
> accelerometer, the screen in Phosh and KDE Plasma are upside down. I=20
> suspect KDE's Kompass and Leonardo's compass app might be the same if=20
> I'm changing the mount matrix for the magnetometer). This is why I=20
> decided to showcase the raw values in my testing. If my testing is=20
> incorrect, please feel free to let me know.
>=20
> I think I will leave my testing in the commits itself this time. If t=
he=20
> mount matrices are correct based on my testing, it will probably be=20
> helpful in the future in identifying why downstream is slightly broke=
n.

I'll prepare and send to the mailing list a couple of patches that
will also adjust the mount-matrix values, so you might want to have
a look at those patch descriptions I'll prepare, as an inspiration
how could such information be presented in prose.

I'll also review your patches, to make sure that the mount-matrix
values are correct, hopefully around the end of this week, or next
week.  I'm having some issues with email, which I must resolve first.
(I'm actually hoping that this message won't come through as HTML,
as a result of those issues).

> > You haven't done anything technically wrong, but the way you submit=
ted
> > the v2 and v3 made them feel a bit like you picked those patches fr=
om
> > some random place and submitted them to the mailing list without re=
ally
> > understanding the subject matter.=C2=A0 In other words, it's the co=
ntributor's
> > job to convince everyone else that the submitted patches are fine t=
o
> > become accepted, and the v2 and v3 simply lacked that.
>=20
> That's fair. I was under the assumption I had to keep the patches mos=
tly=20
> in its original form.
>=20
> > I wonder how would some forge prevent "spamming"?=C2=A0 It isn't ab=
out the
> > possible "spamming", but about the act of submitting different vers=
ions,
> > which would be present regardless of the way they'd be submitted, a=
nd
> > the reviewers would need to be aware (i.e. "spammed") of them anywa=
y.
>=20
> At least with Gitlab & Codeberg, a lot of the notifications can be mu=
ted=20
> (I believe updates to pull requests is one of them) and pipelines can=
 be=20
> created to ensure that formatting is correct and that the proper sub=20
> maintainers are notified automagically. In my opinion, b4 just brings=20
> some of the forge's functionalities into an email based workflow, but=20
> will have to fight it's own problems such as:=20
> https://social.kernel.org/notice/AypvdTWyAs5km0Gc3k. I don't mean to=20
> detract from it; it is very commendable what Konstantin Ryabitsev is =
doing.

When it comes to submitting patches and their different versions,
reviewers have to be notified about each and every version, which
means that muting the notifications or ignoring some patch versions
simply isn't an option.  Even fully ignoring the patches that one
isn't interested in isn't a great option, despite sounding good,
because leaving out such parts makes one less insightful about
the subsystem they're contributing to.

Of course, the associated level of interest depends on one being
a "drive-by" contributor or being in for the long term, but for
the former different options exist to help with their periodic
contributions, such as the b4 or GitGitGadget.

You're right that the automagic features of forges may help with
setting up the lists of recipients and whatnot, but that's just
offloading of the complexity elsewhere, in hope that the automagic
part will work flawlessly, which is hardly the case with highly
complex projects, such as the Linux kernel. In other words, the
mailing-list based workflow does have its deficiencies, but it
leaves the contributors in full control, without relying on some
automagic things to do everything perfectly instead.

When it comes to formatting and whatnot, I'm sure you know that
there's already scripts/checkpatch.pl.


