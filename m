Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79670D68BDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 23:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKfURWwDvtWSqqeHm5kKHmniZPeJPhF6XTUSjfdoVwk=; b=wN+oTR4/2l8M9GEExLB0ZjSrLM
	b/Pa6i4wBOiEAO+pmS49O6kpzgzSkO8+E586c5FzZnYOzGvLGdz+hw1S1cFM4gOD9+KFelpttqtNX
	9uW7V4OxBRAvEIXVaeo7bH9DRSMql9obdrTj3kRpcALLqt9/b6vA9RF/yKuaYN0R1sqDT9RAIKnNc
	nGP2Ofq99Bfb7sC+i04qSxrUlfezByVb1FnZyQTrTUqduWIIUfwYSpIHA47KRF0nLptrjnN02lWwe
	kPA6P8L2paB9641lY2T6+8Hwbs3rSe/FsrbYhtdwSiPYi2+ktB8cjqXgyPZNuAjKRn2AuCk7okBn9
	fOZZT7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5eO-00000004Y1d-2sUQ;
	Fri, 15 Nov 2024 23:22:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5dT-00000004XvU-36KH;
	Fri, 15 Nov 2024 23:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1853EA426BC;
	Fri, 15 Nov 2024 23:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1E6C4CECF;
	Fri, 15 Nov 2024 23:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731712914;
	bh=UKfURWwDvtWSqqeHm5kKHmniZPeJPhF6XTUSjfdoVwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LsV4sVdgpvW1g76R/yd9MXfJEdFvLvA6ONdP9sjLPJWwKVY2B2Z36R5MBp+gwF9ZN
	 kuRlA8FP6ylyfXC3I0oPgy61b6Ag2Eh4XET2nneCbC4+4q/fdPNNK5HVt0+BUEyMhw
	 qPvllORMrR/W4qkWdmYMgYU1PLVFg4Ctz2rbKUhuoVMos/V8cVsy6iz7gm46EZZBo3
	 eCrx7/tJcDhroYFCfunXAjgT61N4wIYlUqpWch8WvYrKDCU9QcbHy6bV6L0UmTBSHs
	 X+YB2FLmBPk/NiYEMyT8J+Su611gwsawps9JC5tYG6gYJv1xJ/DZwC/9o2YTGF0kTZ
	 mO4ildP/MiIOA==
Date: Fri, 15 Nov 2024 15:21:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: wojackbb@gmail.com, netdev@vger.kernel.org,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change
 PM_AUTOSUSPEND_MS to 5000
Message-ID: <20241115152153.5678682f@kernel.org>
In-Reply-To: <6835fde6-0863-49e8-90e8-be88e86ef346@gmail.com>
References: <20241114102002.481081-1-wojackbb@gmail.com>
	<6835fde6-0863-49e8-90e8-be88e86ef346@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_152155_837943_1F2182E3 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, 14 Nov 2024 20:54:20 +0200 Sergey Ryazanov wrote:
> > We tested Fibocom FM350 and our products using the t7xx and they all
> > benefited from this. =20
>=20
> Possible negative outcomes for data transmission still need=20
> clarification. Let me repeat it here.
>=20
> On 06.11.2024 13:10, =E5=90=B3=E9=80=BC=E9=80=BC wrote:
> > Receiving or sending data will cause PCIE to change D3 Cold to D0 state=
. =20
>=20
> Am I understand it correctly that receiving IP packets on downlink will=20
> cause PCIe link re-activation?
>=20
>=20
> I am concerned about a TCP connection that can be idle for a long period=
=20
> of time. For example, an established SSH connection can stay idle for=20
> minutes. If I connected to a server and execute something like this:
>=20
> user@host$ sleep 20 && echo "Done"
>=20
> Will I eventually see the "Done" message or will the autosuspended modem=
=20
> effectively block any incoming traffic? And how long does it take for=20
> the modem to wake up and deliver a downlink packet to the host? Have you=
=20
> measured StDev change?

He's decreasing the sleep timer from 20 to 5 sec, both of which=20
are very high for networking, anyway. You appear to be questioning
autosuspend itself but it seems to have been added 2 years ago already.

What am I missing?

