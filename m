Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F7C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSbtJfYpYv6dmlPOIorqeT7hfT+eDvX+w78jdbBKPZE=; b=QDLAZRzGoskZsiPgrOzvKrkEIg
	PtzufE9J19n+H3QX3msUZH8TnGt7kOb/6mRj6oJ+fN4WEYg11L0lvbd62c2UT+kuyxBut799+YqNP
	1RLrnKQtYEtUMgfx0gUcOX3LZ2m/89Cbym5x3cCioGGuBQZeyUJd3jDPa4xEO08tc5r33B5KB0ppy
	SV8Itnxc27ox3U6eQ5paj9xd6IoeecUzF3XUiIQHF347Xkx2yH5l4P05V1wSXQaqykgckCXQKPZOC
	OuYH16O7PxNZejETYfz8K6E27n3npbj29+i3FCWM7Ug6HqYwh+aVCX54I1zHNQn5/o5rVWYjmuTsh
	24U1Az3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDiX5-00000005syu-0KeD;
	Sat, 10 May 2025 11:38:19 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDiUz-00000005ssf-0yXJ;
	Sat, 10 May 2025 11:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1746876956; x=1747481756; i=frank-w@public-files.de;
	bh=CSbtJfYpYv6dmlPOIorqeT7hfT+eDvX+w78jdbBKPZE=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Pnd2hPr8NhqTEOL0Z894K9VvrtLD5MuuqAinM2SfezN7eEDHyzrMnIfWmv/kWzmG
	 xjJRi+BAhkgP1yzT+g5veLa7RgEFSKupdLOqgRQgSPIW9+9p3z/2+8bb3SgbCQqkS
	 Kn2G6ePJMwEgySMCXdcInTrczpW7C1kx7YmdGG6/dPH09Mt5cuIEhsHTP6wdeYsck
	 80/AGE4RQixvrwwaMyw0FajjARgIsZe4aha5quzhc+p18t/xe55tlPiDhXWu49oPJ
	 m0BoHvE8PRdt66o7Y36dyB48P1s4BqdIuZvU84nmwGTdQp/1vG0sTCItSIhp6AhAS
	 m8sDppr++ybIg8nkDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.226.129] ([157.180.226.129]) by
 trinity-msg-rest-gmx-gmx-live-74d694d854-5prkz (via HTTP); Sat, 10 May 2025
 11:35:56 +0000
MIME-Version: 1.0
Message-ID: <trinity-02bca72f-3997-456e-8182-d5ef1358ac9f-1746876955936@trinity-msg-rest-gmx-gmx-live-74d694d854-5prkz>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux@fw-web.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lee@kernel.org, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: rafal@milecki.pl, daniel@makrotopia.org, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: Aw: [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 May 2025 11:35:56 +0000
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:/4ZNXZpfFmBkVPBZv3pK2+f9+sAC8ipN/KCUrOlFJ+XI0q2pfnjGjudw95LSMJy3sYr+r
 p40VQEXpm3ViXsio5PTNuBijsGczQ6tP9BAwub1Pm9SljuJoKuDJLDotP1VcRVWGHVfsMzO4cGIf
 b+ABPFKpfaoqcbvk8bW8w4jlwQra6/motLhEWqxquYLikgV+ZDP/bCxBpsEL2fXfBz7LNeE9ZdTP
 LAoZDCRCcadw+/LGXoOjUTdsgZXA0Mwo5yEo+MrPoR9uwPo9ulqAjionYURV0jM7FspBjvmZ9uev
 SnRgsU70+803FMCzjV/eHZ56Eaj6mf1Xh7mnRKTHNgHfFuKo7iEr8iSt5OhVGYHP2s=
UI-OutboundReport: notjunk:1;M01:P0:ixHZ7+EpIYA=;iIZSgtviXbFJOi5roYS8ZQLGurG
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_043609_586819_1EE8053E 
X-CRM114-Status: UNSURE (   2.97  )
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

Hi

just a gentle ping. is something missing or can this series be applied?

regards Frank

