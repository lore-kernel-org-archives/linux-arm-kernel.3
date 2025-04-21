Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AF5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGxau774sGXEj/elxW0VHyk5L2vjEpi52HNr5DCdeL8=; b=flaUeRrFg4UvbpxiN3fwqUPvY2
	9Uxg0WiOA5nU7/ilqO12ySQ638xqq1nyV71nsKHW6kkaDlVoO+eCRcES4mO4bfv5aEwnAm30npXqu
	CiGqJfpWHETF9fRFHvtsTWfthffY7hGqh3LI76n/DbzBqqrRmOd2ohxikq5DxxYDCKM2lEeRWGJcq
	R8rMjNcGEPIMNO46DF5AQyA+hul+cmMUdX+qtqsEctmhslw+FLSwCaEB23yCoJYPbbJgiSKKy77Fw
	JPHxt3nZswWZ3fQyXwDzyyR13mFlUjRLIn3++b51Zl4iegNcgkb/Djwy8aeyi0AHXogZ7sxxQdpmR
	tgK4r66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6z0q-00000005E8N-3Cmm;
	Mon, 21 Apr 2025 21:49:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yrY-00000005CJf-0mOh;
	Mon, 21 Apr 2025 21:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3FE1FA4BE6D;
	Mon, 21 Apr 2025 21:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E01C4CEE4;
	Mon, 21 Apr 2025 21:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271575;
	bh=6oOfiEbDXZjld4J1a2eZRwXMdYXVf8MHpZBJgMbf+tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CunwQe10diTQj7Kcsc6C1CwB8Xy8oJvuzynsA78ZhRpwLBXJ9aIAUSd98DazZIPth
	 eDlAoM1267TU0nkzPjSf3vqTvrDBwHxWxw/BY67nP0OCKTsLizQfmSLioFenT7O6E5
	 a43WAEOFqaZ6MmV0xO58uXeel2v4J2hSyIcqAEJBtrGAKjdQShZRFhTZ7x6lQon/rD
	 tCgZ15ggXKX3P7IsofHhj1hwRCvg8OKbket/d9jq/Cfpcb88/neFGNf3LZWG4EDQJV
	 /xFAsNBPucisnejtJnhpJAvE4rrdW1VetBy71+jircRcsz+Y52HH9AgXsumJ8I3425
	 +IT5znrvENNww==
Date: Mon, 21 Apr 2025 16:39:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	ukleinek@kernel.org, linux-pwm@vger.kernel.org,
	jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: mediatek,pwm-disp: Add compatible for
 MT6893
Message-ID: <174527157255.2974366.16207591192162778004.robh@kernel.org>
References: <20250416120253.147977-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120253.147977-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_143936_293897_F9B51145 
X-CRM114-Status: UNSURE (   9.02  )
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


On Wed, 16 Apr 2025 14:02:53 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the Display Controller PWM IP found in
> the MediaTek Dimensity 1200 (MT6893) SoC, which is compatible with
> the one found in MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


