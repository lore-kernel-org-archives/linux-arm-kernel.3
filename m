Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CEACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWt1hIGUG4VVl6t3Lb7SwzBt8jaRjmM77PJvAbXYh6U=; b=TxKlLV4/FXf1qYS5tYtG/K6Oio
	xs4r0WT+emxZgBbbpvXq6WJe/ooPG5/TbZALvlHdcbRXTU1YLrTMGDq6UqoEe+ncs2fOYNms1cSAH
	k34zNMAcgil9V7z2+fF/9TUwEvYsNkc+4cXDieXeV8gvrWBiD+HnhcZ7A4rI1du6AXzM9drhLFG/B
	BZLSVBCGzUpR++QYYxX6lB6K+FcOwMB7rCuveUccHKGcde3ArS7o0fl2LOMY995SuQJweDczYfHbC
	dejBPAvHZhe4fe8IDPxAGUt4WHbXkmClRblRwSAGa6XFhhNGpYlI4lLyQakgsm22ZzTJw8PnAWhnb
	CX0W4oBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWu7a-00000005OkX-1yKV;
	Tue, 09 Jun 2026 10:55:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWu7Y-00000005OkR-3ouT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:55:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DBFC601D6;
	Tue,  9 Jun 2026 10:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB5A1F00899;
	Tue,  9 Jun 2026 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002547;
	bh=eWt1hIGUG4VVl6t3Lb7SwzBt8jaRjmM77PJvAbXYh6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nh0+1DoWGz8PxRCjAefH/c7JUS42e1lHnLFPOcQEFnOJQO9/ipqJR2pb5SUwjLoNz
	 opn2WT/tah17G395xBWCFM1u2SlSD3Sd03U3P9omegst+hOVt5ZvgKj7goVFV8IBA/
	 BwMWEagqWbIfuRd9RdrN3Gej3IX3RiSo4LmSZyh6jNpr4Wnmql9VwgAHTsIPXaNyaX
	 6Qy+s4ROu7fcKvbGB62YHRGU6/oZ6o1qJKNc5nmLQGQFiQzJ1zdZ+CevFDS0GPejBI
	 0+r7oHmMCy5n14HxKscWKfFn5SNkJEswN1gCYxAxiXrxd9HE/cebhQUaJomBfDBUUo
	 /iSy26G8OMqwA==
Date: Tue, 9 Jun 2026 12:55:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
Message-ID: <20260609-imposing-noisy-griffin-5c87ea@quoll>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
 <cover.1780319122.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1780319122.git.geert+renesas@glider.be>
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

On Mon, Jun 01, 2026 at 03:18:19PM +0200, Geert Uytterhoeven wrote:
> The following changes since commit 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7:
> 
>   ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6 (2026-05-15 11:35:25 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.2-tag2
> 
> for you to fetch changes up to 0d4ed954061efc3e47fa889d3de0675f933f438f:
> 
>   arm64: dts: renesas: r9a08g046l48-smarc: Enable audio (2026-05-31 10:52:23 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


