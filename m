Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C139FC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yorhsLAeb7/eNSEo6amlAo4PUgqHZFjFZz9Sfx8j8a4=; b=rcOrZB/Bg1AN8ZH/nBAbm65vs9
	JuCPX0+Zw4HCAnJ4N0GmeWnJfL41lWcy7BjJxBEq8L8zqwzI37L4eRoQbIH7EjgD6EqggxsHqTyVN
	enJDcotirI8BfSxYOEBLMVspUPBlDfDasOf3TWuQZd+OV+PMii/Wcsu7IUCNvyQI8xyUhfcEwYe+M
	oS0PVQZX2N7qUY+joLhjY/Abms9AEKTu6o1/Kl+OQe7hVGQPLP6NpA0VRWodpckiFVPhpfkqMV0gd
	DN9OMVe2qKRvktaOyfUHlYjpo2eFO6Nz39lV5oisQjI5i4471Yqre2ojgW6p1H9/Oruhs45xJJKTe
	uu2gQkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8sd-00000007Agw-1is6;
	Tue, 11 Mar 2025 23:19:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8q1-00000007ARW-3cjR;
	Tue, 11 Mar 2025 23:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF5D15C0EDA;
	Tue, 11 Mar 2025 23:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA6EC4CEEE;
	Tue, 11 Mar 2025 23:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741735000;
	bh=PfimZx7PgZ/5Gi9CD2rOAcgt5dAWqfxSVWTYj2Jq5nY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHwfdiPkB4R7wXEfdDOvowQshJv8zRAnt6aBix9+yfuWB7qg34ggPKMQQe+8L1O0Q
	 uHRRPWfNw/VcezTLuYbGh2MIYNmLV+3rjTjf5vj/zNopgqy0TPvBR6xGHcHz/e9oFU
	 nlci6yxjSOIi0Z5UF5J8CRSh0NPMiWLIs/7sA6oL27ey1dpANMCybYfPSSj5Ucv5di
	 kkRvC9cXy0mgGsvCFhgsc85TLM8TQpS8trr0xJEdPx7XxmGr8joo6f4dwUoOcxbj6F
	 tTIURLvA0H7KKcS81zfVKv8E3ANKWuj0KsDDCk676xjgcbLFO1jyiDSjZqaZdItCIk
	 cIq/q4P18b2lQ==
Date: Wed, 12 Mar 2025 00:16:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin =?utf-8?B?KOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>
Cc: Qii Wang =?utf-8?B?KOeOi+eQqik=?= <Qii.Wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	Teddy Chen =?utf-8?B?KOmZs+S5vuWFgyk=?= <Teddy.Chen@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Shunchang Wang =?utf-8?B?KOeOi+iInOaYjCk=?= <ot_shunchang.wang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Joseph-CC Chang =?utf-8?B?KOW8teasvea0sik=?= <Joseph-CC.Chang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	Leilk Liu =?utf-8?B?KOWImOejiik=?= <Leilk.Liu@mediatek.com>
Subject: Re: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <idbp6ckhu2pdt5p6vapcblqlinezpq5miqzl4hrzmlbgrniw7o@ucd42tvbtfmr>
References: <20250211144016.488001-1-zoie.lin@mediatek.com>
 <46621db1-6096-46af-b021-c919c1cae7ef@collabora.com>
 <ec77bb9478cd86a6737b92135170064970925b3c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec77bb9478cd86a6737b92135170064970925b3c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_161641_957884_27141FED 
X-CRM114-Status: GOOD (  21.17  )
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

Hi Zoie,

On Tue, Mar 04, 2025 at 08:37:27AM +0000, Zoie Lin (林禹妡) wrote:
> 
> ...
> 
> On Thu, 2025-02-13 at 12:57 +0100, AngeloGioacchino Del Regno wrote:
> > 
> > 
> > Turning on and off regulators at start of transfer and end of
> > transfer respectively
> > is very expensive and, while it makes sense for power efficiency of
> > the controller,
> > it doesn't make sense for:
> > 
> >   1. Responsiveness (latency); and
> >   2. Platform power efficiency at a whole.
> > 
> > As a start, just set the autosuspend delay to 250ms; this gives you
> > at least time
> > to bring up clocks and regulators and usually finish a transfer at
> > 400KHz, giving
> > you the chance to also get some more requests before autosuspend
> > decides to, well,
> > auto..suspend the device.
> > 
> > The right way of choosing an autosuspend delay a bit more precisely,
> > though, for
> > this device, would be to check the bus speed and calculate the
> > autosuspend time
> > accordingly.
> 
> We understand the importance of balancing power efficiency and
> responsiveness. Given the diversity of I2C devices connected
> under each platform, it is indeed challenging to estimate an
> appropriate delay time for testing.
> 
> Therefore, we would like to proceed with your initial suggestion
> and set the autosuspend delay to 250ms. Based on our preliminary
> tests, this adjustment appears to be a practical solution across 
> our existing platforms.

Am I understanding correctly that you are planning a v2?

Andi

