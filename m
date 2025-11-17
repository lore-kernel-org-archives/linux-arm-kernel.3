Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EAACCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 01:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayCI78s0sFTeRE+mYXvPdg5dHDi/jDMZJzVBaBaUiuk=; b=Mc9Q3DLSOQzQjSeB8lsX9Y6mpG
	bmNHEMYSnx8oI+4g4wZ+NL649u8c7N5ri8OuQHbh4d+OKvp0+6+bSHCA9oKG5tRaWUpb3rmnUxDEJ
	I1eLSnlseVWhVQ9sTniKFK8LC1Vm7gCkKi4h2ZaS3j95flonnAYTjHzr0cpZghCutdlRnKq2xricE
	EwZUN3CSTNP9rrX63Pc/26cTJpd5l+Vo1QSpHfqmc63O5zFA2+ThXoYDclrcTKJFWZ+8aT1Z+K9NU
	Z9EvXG3M5JgLm6LIhoLPyaBGvrsJI65LHMRhHx7cY8JjddjdFrn0j/0xWNZxNXWU5ojV0A1uCWq5A
	xdE3TZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKnrw-0000000FFuq-00vB;
	Mon, 17 Nov 2025 01:17:24 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKnrr-0000000FFuO-11cP;
	Mon, 17 Nov 2025 01:17:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 768CA4118B;
	Mon, 17 Nov 2025 02:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763342234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ayCI78s0sFTeRE+mYXvPdg5dHDi/jDMZJzVBaBaUiuk=;
	b=PoYARTsooGdjq3wnQNA8x72KudChF71ko5NH0iTGj3hnqKcMmltTC6ZR9Cuz9PBqHMGZE1
	uRu4zviJiEzSLqKiMUVKma1gnBCt9QndRT7yeON+ZP2/83raE6ljp9fixSgtdSFnqW9J47
	kq5HNoKeylpEjrpiV/VneuW2gQQjg8sAPcpGFGZxj1FZIYpUuPpTaqjWlUtGhh2ao2YYdx
	NHK5Yn9TgQM/pCnSAPY85vppSbRWkbKW37LdgqQpp9tHEWiisRRwWwcBsSeiv2DP6X6YtV
	mDlqNdaqq/UhIqN3ydZyZc0G0jFr4hsDIh66e4b7HZeDnO8m2/5W3unvYQxeDA==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <2455319.NG923GbCHz@diego>
Content-Type: text/plain; charset="utf-8"
References: <12d6e151-dfa0-ca0a-5888-ddffb2dbdec7@manjaro.org>
 <bb74679a-ce21-4373-bcc5-1214e9bf832e@rootcommit.com>
 <24561990-8293-0505-5837-eca416d01bb7@manjaro.org> <2455319.NG923GbCHz@diego>
Date: Mon, 17 Nov 2025 02:17:12 +0100
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
MIME-Version: 1.0
Message-ID: <a5e7824d-03c7-fa0a-473f-193e172420d2@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 2/2] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= Add Asus Tinker Board 3 and 3S device tree
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_171719_777199_0F36C4A5 
X-CRM114-Status: UNSURE (   6.08  )
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

Hello Heiko,

On Sunday, November 16, 2025 00:27 CET, Heiko St=C3=BCbner <heiko@sntec=
h.de> wrote:
> Am Samstag, 15. November 2025, 08:14:58 Mitteleurop=C3=A4ische Normal=
zeit schrieb Dragan Simic:
> > BTW, my responses are currently jailed by the linux-rockchip mailin=
g
> > list, requiring manual approval, as a result of the mail server I'm
> > using sometimes inserting some strange invisible UTF-8 characters
> > into the email subjects.  Oh well. :)
>=20
> I guess that mailserver needs a fix :-)

Indeed, something is, unfortunately, really messed up there, :/
to the point that even one of my "unjailed" responses in this
thread ended up in a separate lore thread. [1]

[1] https://lore.kernel.org/linux-rockchip/e4cd11d0-463c-e707-5110-6b92=
899b1ba3@manjaro.org/T/#u


