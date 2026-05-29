Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C06FCD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 22:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPEbrvvQAzNpfGL52FhYthqiF/e4hVDDeDLmdGEm930=; b=4bZBazGyR0XETnpyXZD5ATWMMA
	dKDqVq2lzcRv0IWBsyE9JvaN6+rMtgPTUb+WpSxD3ZbY73n8mfpYl+ir3w44IuTZGkhhMZSN635mv
	qQ7VMqAxeasCUX9BhyJ/P0AVX+v8O+B2o1F1mMAYD9BXXgFbK30sGYc0yd/dA2XmHq8U0jftP9K0k
	0g9B7GBTSYdOu5vYKrHPC4jJ7E0yRZx1CFel937cGJEKMEa7C8r8y3RJHsCYwcN63yI1Kw58MaGVD
	KAB6esAo4TfxgRuvs5VHoUxmqFXnRmSwXRQ7vEYoDq5Gwwrf6TlFbnu2mo/M30/WD7U0os5S10aO/
	AgvwVevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT5HP-00000008GJr-0V7L;
	Fri, 29 May 2026 22:02:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT5HN-00000008GJh-3QKv;
	Fri, 29 May 2026 22:02:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3B58605E7;
	Fri, 29 May 2026 22:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6AD1F00893;
	Fri, 29 May 2026 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780092128;
	bh=BPEbrvvQAzNpfGL52FhYthqiF/e4hVDDeDLmdGEm930=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJxYZCawRQCJDet7RbbBxOcM6cDDG5/iiY9fCWcwN31fdH5IijixpVm2bSAwQ1cjK
	 46VV5ZrKrG9b+geWcsEqluc7YluMjTa9aDxyO0XbyKfW3iGjNlsPi54EyZkqgwg6kG
	 DPGD5cq2MVcOs2sTY5i7jnDEdJZGRxzQLY18YYKA+cnKlrdynOTyY4KRHgJ4cwz00l
	 VJZrsaYBqlWYU/PmDv7ojSIg3eUABElDL7C5mSTvRauAD357uSeoQ1Lb/SyrWvNYyY
	 UihkXydrzVZ50UITwZBTjc6iQM9R1OajxmT2LAw9HARyM5+lLkyV2EjkBgUu6kVx9B
	 FP357Zhn3+tOQ==
Date: Sat, 30 May 2026 06:02:01 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Sebastian Reichel <sre@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/6] power: Drop unused assignment of
 platform_device_id driver data
Message-ID: <ahoM2TVy6gXCYewa@tzungbi-laptop>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <ba3589f74a12d86fb02ecb9fa2e89532188c22a0.1780048925.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba3589f74a12d86fb02ecb9fa2e89532188c22a0.1780048925.git.u.kleine-koenig@baylibre.com>
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

On Fri, May 29, 2026 at 12:18:16PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing, use a named initializer for
> .name and drop trailing commas after the list terminators.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

