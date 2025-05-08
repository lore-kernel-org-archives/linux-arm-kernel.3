Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8D3C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snJFHkDY2E1a08aDHz6n8SxnyGx4Hd3MJM1659jM70U=; b=0jP4JOMCdSikepraaZjhfa0XcB
	OxALEPc41LHqyPcAE61PXS3fhs36ybM86bgCNq+2sfOkzLF7l94FeI5zi+CngK7Eitc2HdFnmPsbs
	OukjT7VI3NZ8egoXpq+3gZags7dSxbz7PWJEmjU1H2LawUZ6PZayoHr5C333gLKpxkWGbsYOgBToh
	ij83ArLSti9aCsU6ZWJC0wYb9RYOOio6V9KTc809nt4j06fSJV7/3Txr7yDQzO8ZDvjhqDbbTvTpH
	ucNSPcAFB1eL3Z13m9qMxEcra2VH3B+TbtgGdSteH7/l5WtVcZ0QbBuq+n/yE8+x2V8U+bueqdGah
	/5ueiGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2tE-000000014cx-1W0b;
	Thu, 08 May 2025 15:10:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2J2-00000000wFu-19Z8;
	Thu, 08 May 2025 14:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9F145C6340;
	Thu,  8 May 2025 14:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CB0C4CEE7;
	Thu,  8 May 2025 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714778;
	bh=NxGW7N90fDSOJso1seyJ02kkBD8Q8q5t1i2zP+DewbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FNphbLh+p/iHJGO4w1vz+b+pnDN8vnpU1X/khuU1FqyyQqtMF8Y1NNiPwv50TXq2+
	 i2OnOQOsktJSkWMGlwy5A3v0ZMJq8dIL0eu0FoFnI09BpNRyGNQtrbQadE3Ntnb6iU
	 h5kTmoFA0Us1pEpAkjaZHi/aK08Dbid9571r64KdpvzwrjBNS9Ymq1Gj17EIhNibG/
	 AZIbeLlwbBS4g/VsrQWCHrLbAuckzEPF22Ylxm7Uh40BseiZbMVk13qwgXp/F+0SXD
	 J571fk6toXXaiG/oWU9+r4ZdIxqermazZoszKU1xDFJ18NW31t93n6QedfYRL/u/Ic
	 LMeywq/Uv1/TA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <1ce4245107e0a51dce502a007a69899bda018d5f.1746197460.git.christophe.jaillet@wanadoo.fr>
References: <1ce4245107e0a51dce502a007a69899bda018d5f.1746197460.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: rgb: leds-mt6370-rgb: Improve
 definition of some struct linear_range
Message-Id: <174671477676.2472260.13790392166774211195.b4-ty@kernel.org>
Date: Thu, 08 May 2025 15:32:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_073300_385142_95CD5C95 
X-CRM114-Status: UNSURE (   6.06  )
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

On Fri, 02 May 2025 16:51:22 +0200, Christophe JAILLET wrote:
> Use LINEAR_RANGE() instead of hand-writing it. It is more robust, should
> the layout of the structure change one day.
> 
> 

Applied, thanks!

[1/1] leds: rgb: leds-mt6370-rgb: Improve definition of some struct linear_range
      commit: 4e055c846de470cb4a9bf4be0811c7d624785abc

--
Lee Jones [李琼斯]


