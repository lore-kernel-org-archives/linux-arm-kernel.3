Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4B6C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRpeYUjYOCK7fAy5xC95Yl5UuQXVTR4cjv4XrdE76eg=; b=mMwi4ivbf2lkcNhTwsqSbzo/ME
	vjlFYF9oA07Fp6nOy2/wO84IegYKqspksAAVG0zdCxp29lf6pwCxehQ9K6Cq3gy7mhmRxNDO8Bq+w
	Q3ZxTvImKOk5owh6GeP2ffumZmha8BiuZLdBBbA7VI/7seU/WDw3C1dFe/K6tuTWLvOPZWGhv8wjc
	Lh0wMcMQ0qyJz6MjzWmmzN1XTzK71F/kESphkGBWAPb43+YhGDHlUUL48DrYVerHcTo1CTRqq1B7J
	6BH16xpccAwN6H2QLrZGbP6NfidKPyArOVv2Ga991azSX+hNbi0L6V1gMK4Dxp5kCUxeR12euXoe1
	kIv/Jpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMWw-000000007nY-2WEA;
	Sun, 06 Jul 2025 10:23:30 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMUc-000000007gV-1ZMM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 10:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=jy3swzlwwvekrdzd7oepny45be.protonmail; t=1751797263; x=1752056463;
	bh=TRpeYUjYOCK7fAy5xC95Yl5UuQXVTR4cjv4XrdE76eg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KIEVgAERnbR2vz9eE5jB3dxeBTNNIHZIFZuYheCWsRkuwVmh6orUQ2oIDGbxY2teV
	 C6hUUvSulbrg0mGhZEtOY8KGarvqrxhixl90ZEpaUoUcc26D4RuFxISHlorG2Oazjl
	 1STE3Wd5Ned1iAXjCXtzE54aMTm1PT3WLx0cD38cXhWoKK4VfRycJl3gMuF4YRvrLh
	 +Qu+oR6B3hK/9ldP9iozGDrDnsIdzVBb5maqhfu/zDdJ1djRy0B8SvfhhgrMDw36yb
	 ToqPTNSLg3vyx1WQWev9x1Y62uUI8op4fG1H589h8nxQ6ZPXHhXPyt6BW+0/PiB/de
	 brfhvlFt380gg==
Date: Sun, 06 Jul 2025 10:20:56 +0000
To: Diederik de Haas <didi.debian@cknow.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
In-Reply-To: <DB4W0GOQZ8MZ.MA7QXHJWCTK2@cknow.org>
References: <20250706083629.140332-2-pZ010001011111@proton.me> <DB4W0GOQZ8MZ.MA7QXHJWCTK2@cknow.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: fd5f69f618c951cf7280e90a0113a2616a1050d8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_032107_153017_7C7B990B 
X-CRM114-Status: UNSURE (   6.56  )
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

> Hi Piotr,
Hi Diederik=20

> With a new version of a patch, you're supposed to add the tags you
> received for previous versions, like my Tested-by tag [1].
>=20
> (unless the new version has changed so much you feel they should not be
> carried over; you then need to explicitly describe that and why you
> dropped them)
=20
Forgot... Should i send it as PATCH v2 RESEND?

Best regards, Piotr Zalewski

