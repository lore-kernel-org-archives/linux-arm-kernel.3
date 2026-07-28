Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D181C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Yzas/8UGeVn5Kj9PsqEqfdR5PzjNdmPToWDa74/rgs=; b=lwc4Clc/DTq0ml71+4wcP/cRCO
	FKki7xnnipxrzZUpX3a5Wr16/msHmYJW5CfdznfGyDwWmdeHXbYaC0TH1tDiMbND4iTf6zKoFVpXj
	sjt4FFF4uJQxKfrDxyHtREnqxKI/VKwh5hEeoSKz2h7AT51UGfJiMgxQ/Qm05UIhgNrYnxv/xafkL
	hjDWrXTFB8z9OpXzKwj11QrkRmjdo1oqFiZz+oFPw5zkhNGFqUs1kHG6F0CN6+Gw2tdylbnOm+mUv
	B0SN3NCQ5Kc82SBcPCZBINWKj9SrzDe74NhsC+XrowOjPA+ABItl2NoBeefxQRpOyToCxIPgBTRhU
	EbfNusXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeUf-00000004tQm-3syC;
	Tue, 28 Jul 2026 09:53:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeUe-00000004tQK-26sD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:53:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10175411FE;
	Tue, 28 Jul 2026 09:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F761F000E9;
	Tue, 28 Jul 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232379;
	bh=3Yzas/8UGeVn5Kj9PsqEqfdR5PzjNdmPToWDa74/rgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h+TVU+VGVEACQv2BALZS8b57h9oGpn8EBE+4LmElFBqY3c9BPYDKgZO0O9NOgEtZK
	 e0ZZHDrGy5kSNSGnDYMFxIV/X2JGczdFc88TGFzaBllMKWERvAjOMYwEBC+dN0t4ai
	 6MelX/zjgaCH9gvRZVoQ3mSWFqijCoeYZ2JHgfIU4W6ZACm1pwvt6W4pj2tR8zGZ69
	 C8eACTh224xnvg2c4UdfP9S11yn7eVxVXhY1m8hjIifKJNH+vd99uwtVv9rS3TwWLq
	 V6DjpSyrIvA5y6t6YHEB1n/NUl/YhwTfn4JmasEusNxe70SS+NcyIx8wKlbjP3UWwj
	 EQd4Uqhe1AnHg==
Date: Tue, 28 Jul 2026 10:52:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: scpi: use PLATFORM_DEVID_NONE for
 scpi-cpufreq
Message-ID: <20260728-cuddly-alpaca-of-serenity-c0c824@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <cover.v2.1785200642.git.liuxixin@kylinos.cn>
 <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn>
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

On Tue, Jul 28, 2026 at 09:27:31AM +0800, Xixin Liu wrote:
> Replace the magic -1 passed to platform_device_register_simple() with
> PLATFORM_DEVID_NONE. The constant is defined as (-1) in
> platform_device.h; this is a readability cleanup only and does not
> change behavior.
> 
> Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")

This is not a fix, just a clean. I will drop this when applying.

-- 
Regards,
Sudeep

