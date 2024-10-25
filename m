Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F95D0C5ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m/zC+56hrmXkjDwWeD5nO5z9mcYmZfE7HQqJ8HhkoM=; b=lJovidS4JCaqeQNXyosHm1bumN
	S5J/vxl/c8rxvkAL+zpxyfeDiyrlzVbRsQjHfUE0YcGenkWnfu3pBrje86KnijOuh5eRZxl1CcBRj
	iqjQqSvGUX+GmK4lXGKOUSDYdQJXDPH898MTmcGxxhj343J6SVHcQQmr++/TMMCJH0K6Vtbfcv+uX
	NS4YOdMgzsGupItUbiBykQuP18X9UvbUL4+5odAMTeekfm3UhU0rhSWJxSS/57NBRb9siwPvhwVOo
	KMaJBHJBVyfIVf3iuGGsfw/OIqEeCM/touxa3W8Eglk7BvWQA2XGOdX28YaamPbFicOXf/+FlOJzv
	RWJtESnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GJT-0000000375a-3pxp;
	Fri, 25 Oct 2024 09:08:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GGW-000000036Up-3MoQ;
	Fri, 25 Oct 2024 09:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729847150;
	bh=COW3lk8+Bc9EJwhzhAxrKQJP6hCqWZJClySSSooP5M8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HsMv9IQISHMd8sUoNSI5iL7aDJPkZyKKJFfVFa/GPon4VDL/YCTSkRf8HSYfNK9Vo
	 tJC/sf8O9b0BLcAgjYh3BGuH6N4EYMSZInI6cXCH0nEXNSPZf/Qpv9Y5UT4Mvi3Icv
	 KQlR7SQBay2G5qRkk6sQ6880/jS3xnH2OxASG78wN8eajJyc2CIxTYjEXiHFi095VS
	 Rbxlv6ojXyldiusH2ZUUZTRHfvuXYxHK8rK+LdHP+d9Sh+etZqOz4Z6h1jgxAiJeny
	 yE+gRG4Wo4p+7DdEcl+r9hbYXVF4bib48mGOZF0A80YaOgvab/+m94GIctgQKhW+Dy
	 8O8dgIcCUCxOw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 61A5217E121F;
	Fri, 25 Oct 2024 11:05:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
In-Reply-To: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
References: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: mt8183: Add
 i2c-scl-internal-delay-ns
Message-Id: <172984715034.53952.16839871350225825079.b4-ty@collabora.com>
Date: Fri, 25 Oct 2024 11:05:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_020553_068730_4DB131B2 
X-CRM114-Status: UNSURE (   5.99  )
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

On Fri, 25 Oct 2024 16:03:47 +0800, Hsin-Te Yuan wrote:
> Add i2c-scl-internal-delay-ns for each device.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/4] arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
      commit: c802db127dfb9602aaa9338e433c0553d34f1a9c
[2/4] arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
      commit: 85af64983889c621e8868b744c8ca03bd5038c02
[3/4] arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
      commit: bd0eb3b1f7aee698b86513edf10a50e2d0c7cb14
[4/4] arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns
      commit: 6ff2d45f2121c698a57c959ae21885a048615908

Cheers,
Angelo



