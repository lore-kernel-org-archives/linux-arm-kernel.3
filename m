Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EACC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJSjgFhs32spsSbz3nbqM96IYqNhxGGxV940WNPjSmk=; b=TDuB+M0JUDbbRlbRpoU6iG1pro
	4jyAc7LghNrE654KTQNn8H7aWWBOsLVT/0X/cEhEsJ6/tEuOw2mCZ7JOuCdZ+JxA3KCtyN6HdnOTk
	XQd7GHSyOWYXLQueZ8pkoe9sZumAUiZwWnQq5X9lb06lt6dKgfCQq03kqWHjFksjfiQYInkFDn7U8
	9filgCMmKhSBXzV31KQ97Sc1SU7w6ykhBwY4UQafN2CXekwSixm/HxdYuEcW7NzjtqYiotGaCt9P/
	j5dXuGSEnrbvx3YZuVj/IniN4cmqddpOGrlLCXghkXdy/uiZGCC6Yb3ESqKju8iBmHlyZ9wTeL7Pu
	HQI43Dnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vAt-000000093D3-2FhR;
	Tue, 08 Sep 2026 12:43:43 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vAq-000000093By-2Fzu;
	Tue, 08 Sep 2026 12:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788871415; x=1789130615;
	bh=UJSjgFhs32spsSbz3nbqM96IYqNhxGGxV940WNPjSmk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I8GKxt+4AZwRUYSxuDSeZW+bx2VdPBQpQx6MCOgAPMoyegYxzYC2bSAB77qHdacB7
	 u1hR7INWFLurEv2MhCUc/USgQjpJEN7yrkaoAgIj4oDAZTVdgvo/8Yw4AMOdAlBWhc
	 KOE6JsLl4YSoU+VirPSvJ4IdYydVpXKywvjyo1650+uL0bKjDRcWqPV/qCxmxWEM5t
	 MLkqawmub0hKX7dI4KTQkd7ugm3bAbxVQKw59ggttMd1PBaTmZukBfHAVUy6d454rP
	 3WH1Nh03P9hPVvyTHuizwoIJz76N2ZW0ZYSz062l2W4BskrnPGMpaJZ3IMgCDB+jSa
	 jBOwNRqfvdAlg==
Date: Tue, 08 Sep 2026 12:43:29 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] soc: mediatek: pwrap: add mt6572 support
Message-ID: <hbDKbnlOf7yqJYJuWVg6P8y7T2ltx6kphF6V0jho-1Z1KNKWNxqD0ffPp6rhjGDfXW88hP4ynycDkZF_1VQZj1PpRHekJqeorEijupq4GRY=@protonmail.com>
In-Reply-To: <27cdcc55-b9b1-49ad-82f3-25e38e3e0e50@collabora.com>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com> <20260715-6572-pwrap-v2-3-bea1d801c81b@protonmail.com> <27cdcc55-b9b1-49ad-82f3-25e38e3e0e50@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 6ad0deee7d7c11f91a563fe03d94143783dac5a4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_054340_726112_BF36258F 
X-CRM114-Status: GOOD (  10.09  )
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

Hi Angelo,

On Wednesday, July 15th, 2026 at 4:23 PM, AngeloGioacchino Del Regno <angel=
ogioacchino.delregno@collabora.com> wrote:

> On 7/15/26 14:26, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Add mt6572 registers and platform data for the pmic wrapper.
> >
> > While vendor kernel source code suggests that mt6572 can be paired with
> > the mt6320 PMIC, no such devices have been found yet. Hence, registers
> > that not included in the mt2701 array are omitted.
> >
> > The mt2701 SoC-specific initialization function is used because they
> > share the same GPS_INTF settings.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Could you please take a look at this series? It has ack for dt-bindings pat=
ch and your reviews for the rest.

Thanks,
Roman

