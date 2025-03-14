Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7794BC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 09:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xv83JusTsGcRgffFR57rgLNiHErt3O8p5Ayy+ye4/ZM=; b=0+QweqpAs5PLqkNbY9bcpnHfmJ
	dP2JVRhUJ823e4br9wjlKuin/qLMaXF/TbROoBN303YV58b+/UTO4H/6N++8pjwE9NLMS4qSG+WJy
	cYSfVvA+diFGidX5y0XA68LTB4C8C9vAVnt6MqomfmopwRjteKJF9FDe7pUVdUVKxQmEG3yw+FZNA
	sA56ZbBncWXyr5R4qaiIF1CcaSHiG3afUK9tsQCR5efPq8L9G1XIGqnsRla8vWw8Y2nhYWqzicEC2
	UFDrVd7iprKNeiZJi2gHzuaG1KqOXivBIhJkCqBnepb6zSk8DcM6AJl1etuKzewrqoeCentgKkWKV
	KCxHmenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1fP-0000000Dj7z-1yIr;
	Fri, 14 Mar 2025 09:49:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1dj-0000000Dinu-1GKC;
	Fri, 14 Mar 2025 09:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB496A42A07;
	Fri, 14 Mar 2025 09:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD2AC4CEE3;
	Fri, 14 Mar 2025 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741945658;
	bh=GiqhQYgwNaCAQ86P7jRzLoUtt/6XmyAbfRPrIv6/4/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqWbMK3I8GlUQbAG7hEG6Hq4IeCZA+8ts7oj147BauszkdwI+h11xzROAPJ+9jT+e
	 9Xf4r7T5SBwV1UvsaiAYMsp7s3d2NleLznfpfhmcyE8ocT7jLUgUwJkgAsQ3pQXave
	 OK85ozDXGsmtZlNF2HyUtSLf44VszdJuvYUKg+qp8/6JBi+Yzp39qNt/caKfjRHh9u
	 z+tEmcQIpJv+r3NoE66YplPYJWcEfDpmT0tyQYlNEi/B7jV/lx/Gf8pv4ivSVqGE85
	 aJr3EXiVrSbf3XniXSvqEowF25cs3wquigGpYsL4OsqZPcohUmFTRzHEme98dgrMOJ
	 JSUPHqE9Bo5kg==
Date: Fri, 14 Mar 2025 09:47:31 +0000
From: Lee Jones <lee@kernel.org>
To: Lu Tang =?utf-8?B?KOaxpOeSkCk=?= <Lu.Tang@mediatek.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Chen Zhong =?utf-8?B?KOmSn+i+sCk=?= <Chen.Zhong@mediatek.com>,
	Sen Chu =?utf-8?B?KOWCqOajrik=?= <Sen.Chu@mediatek.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= [PATCH 3/5] pmic: mediatek:
 Add spmi pmic mfd driver
Message-ID: <20250314094731.GA3890718@google.com>
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
 <20250314073307.25092-4-Lu.Tang@mediatek.com>
 <SEZPR03MB6891D404A7AA2BC5244A992A80D22@SEZPR03MB6891.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR03MB6891D404A7AA2BC5244A992A80D22@SEZPR03MB6891.apcprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_024739_469215_E7E1E7B5 
X-CRM114-Status: GOOD (  13.89  )
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

On Fri, 14 Mar 2025, Lu Tang (汤璐) wrote:

> Update email address

What is this?

Please refrain from top-posting.

> -----邮件原件-----
> 发件人: Lu.Tang <Lu.Tang@mediatek.com> 
> 发送时间: 2025年3月14日 15:32
> 收件人: Jonathan Cameron <jic23@kernel.org>; Lars-Peter Clausen <lars@metafoo.de>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Dmitry Torokhov <dmitry.torokhov@gmail.com>; Lee Jones <lee@kernel.org>; Matthias Brugger <matthias.bgg@gmail.com>; AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; Sean Wang <sean.wang@kernel.org>; Linus Walleij <linus.walleij@linaro.org>; Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>; Stephen Boyd <sboyd@kernel.org>; Chen Zhong (钟辰) <Chen.Zhong@mediatek.com>; Sen Chu <shen.chu@mediatek.com>
> 抄送: linux-iio@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-mediatek@lists.infradead.org; linux-gpio@vger.kernel.org; Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>; Lu Tang (汤璐) <Lu.Tang@mediatek.com>
> 主题: [PATCH 3/5] pmic: mediatek: Add spmi pmic mfd driver

Fix your mailer.  Headers have no place in the body of an email.

> From: "Lu.Tang" <lu.tang@mediatek.com>
> 
> Add spmi pmic mfd driver for mt8196

7 words for a 900 line change is not going to fly.

What is this device?  What does it provide?  What are its dependencies?

Etc.

> Signed-off-by: Lu Tang <lu.tang@mediatek.com>
> ---
>  drivers/mfd/Kconfig                  |  26 ++
>  drivers/mfd/Makefile                 |   2 +
>  drivers/mfd/mt6685-core.c            |  83 +++++
>  drivers/mfd/mtk-spmi-pmic.c          | 518 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6363/core.h      | 134 +++++++
>  include/linux/mfd/mt6363/registers.h | 168 +++++++++
>  include/linux/mfd/mt6373/core.h      |  94 +++++
>  include/linux/mfd/mt6373/registers.h |  53 +++
>  8 files changed, 1078 insertions(+)
>  create mode 100644 drivers/mfd/mt6685-core.c  create mode 100644 drivers/mfd/mtk-spmi-pmic.c  create mode 100644 include/linux/mfd/mt6363/core.h  create mode 100644 include/linux/mfd/mt6363/registers.h
>  create mode 100644 include/linux/mfd/mt6373/core.h  create mode 100644 include/linux/mfd/mt6373/registers.h

Please try again.

-- 
Lee Jones [李琼斯]

