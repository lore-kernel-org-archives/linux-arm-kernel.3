Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93652C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taP2fHwcm8lXwokv7Iz/D+ZL55IlUQ20jGIo2i4I/2k=; b=jW/KBwLYxphXKhPhBTWDtWcUoo
	BgaDY8ldhyKsR7VEwanK7a/euqeDU6q+WvFDLizbEsCsWmY3f/zzxMmLKdVx+92tB44dhDuqFZn3u
	RaG9HZRUmhBhJboXhmANxyvWTrZr/wYxJAhbRbjMhitOn7cMxpB5lIXiiDJ+iO3YldsmYqjf8AR9V
	ZDOGSHMgf6oVq5Fx5NSoAmqxzyoEnor76gf8IKC22dBxJRnJwrqrLmRTz/ER9PnmpcUsWLLfd8Re0
	4eKO4TIdunL/6bkdeDwu1XrS/QloQiEEo43J99hwUy3i1UScb/a4XPw/wXrtJJ3ZHTfKc0k0uBYdH
	hHV4YAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrgf-0000000GiA3-1u71;
	Tue, 25 Feb 2025 09:57:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrIK-0000000GbC2-1uRb;
	Tue, 25 Feb 2025 09:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740475922;
	bh=T2+zLZc9kPHqAZ320EL8EGWj+CWbObMmnsE9DJNVjtc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pGC9V+uCzJStgNnlJ4XZbruQ/EJG3TArcUZOIYy3tAvuk8cTuStqHSWEgfpdg4FfZ
	 NzF5UvAzPt0OJixGh02ie1cKPfYOlG8i3eZWguo0P1SNmjCVNmHP2v0/KIjwUT/Z0V
	 MHW5wBVpnmzeAh5A7uqW6rZ0tRRhkF19P+BHu9yCUC3FgffPd+l9uFYLFHcTaacdFR
	 YmeG7IUHUUw8DBOXiDRblWgsIHYOye7QCaWtLyFu+EPkPzX/n7Sbh3S/yD16HKwM51
	 0SlkLS1jKyPO87Qq9QMjhI2bOrgtc4ZS4IjuU7KO5gTekRQFznVK9il7wf3BVXjkJf
	 DZU6dekKBzL+g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8AEBF17E00F6;
	Tue, 25 Feb 2025 10:32:02 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250220-mtk-socinfo-genio-1200-evk-v1-1-a683ad028bc5@collabora.com>
References: <20250220-mtk-socinfo-genio-1200-evk-v1-1-a683ad028bc5@collabora.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add extra entry for
 MT8395AV/ZA Genio 1200
Message-Id: <174047592248.25867.13400134127944507230.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:32:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_013204_640837_4225DA17 
X-CRM114-Status: UNSURE (   6.30  )
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

On Thu, 20 Feb 2025 16:02:09 +0100, Louis-Alexis Eyraud wrote:
> The Mediatek Genio 1200 EVK P1V2 board has a different socinfo match
> for MT8395 SoC (commercial name Genio 1200), so add it the driver.
> 
> 

Applied to v6.14-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: Add extra entry for MT8395AV/ZA Genio 1200
      commit: 8d1f9fcacf3b502f03ca456164cc7f36dabc1c43

Cheers,
Angelo



