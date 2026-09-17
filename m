Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6021C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3xzcniINwmNhao4JPYypMLpsM0T7MDf9VsyZorh4es=; b=Whu3J7NPlE4O9PZ4igftkQ3I2i
	gbbAdAlD3TtgS18unl0CciWb0MsXQgbGlFoakJmQTsz8up2hwT4chnYK3SxD8db5LXzWzkG5VR7fT
	1IeXgIfRdARWTNNqG/iGy+TNge7ipINZCNN6Fww+f2g/wUihmQu+DgRQEUjUVn3TOXmOZjo5vJnh4
	JGQSFcTsNK7xkbU4l8U8hjb7YC3BVYjRGFcP8zRSx4Wj+dg5FPEca7g7mwhLzyzUSaHx0j5nrnZ8H
	caQNc8XPqI4pQwzQJ3sagodSO8kSOTQG7g6RBQIWLRKtwxl4t+hSI5pbmC28fzK6yLypwiCsRsG0e
	PvF+wmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DCf-0000000BYH0-20Do;
	Thu, 17 Sep 2026 14:35:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DCd-0000000BYGE-3wBH;
	Thu, 17 Sep 2026 14:35:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B08C60211;
	Thu, 17 Sep 2026 14:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D04C1F000FF;
	Thu, 17 Sep 2026 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789655706;
	bh=r3xzcniINwmNhao4JPYypMLpsM0T7MDf9VsyZorh4es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jydHxNrkXXLvYhfsxnObq8GaWczu17QwuQeJjv+FWdQkLqAIYmuS2NHFVguaojqd5
	 qk/jR88SXU5WWmiyRsysJ5jWw/Wq1LO8QkEdkPtIGQ1RPg9cijBisas80vrcNd7g23
	 4rDqgp9OIwknkVUaSh2UqqBKlc35MSEStS3aeTF4/6YttMACiMcdPDMWLisD1XZvCS
	 U4rc9Y9dWLuJ/i4Jzr6ryqWJ140A7ZxeS87Hj4U0WYl8bHNWvWLYVBEr3KKI/NoXEa
	 z1uNScJ/UGQYsJV58lwGXKUJgvf8228J51OXdfx1PJ4/eU9ygskNlltplmYbGVhMlD
	 uLBv272kmbNzQ==
Date: Thu, 17 Sep 2026 15:34:59 +0100
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v10 0/9] Add support for MT6392 PMIC
Message-ID: <20260917143459.GA2348773@google.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
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

On Wed, 02 Sep 2026, Luca Leonardo Scorcia wrote:

> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

Still waiting on Acks by the looks of things?

-- 
Lee Jones

