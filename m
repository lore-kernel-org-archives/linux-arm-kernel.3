Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF53CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2v+IMVm6IgqZGS8Hphp9DRXBHawewl2uEW+/r9BI/EM=; b=GWJzqz7ClfTRIqTzjVieqgjDV9
	vprKdY9NFDQQWlcIZy7k9UNUlKKCE8i6Qcun0cHNX0doZxBl06SV9OrZkA7BWqbYWOhhxb8gQxn84
	tdyXLnVIHEQ4ZsnmynJLD4dw4ZSe14bDZfpt9SGH6giwWFca8XVp8iR17jixjI4jacAFPjDcxbp/P
	d3Q0d5prggSWr6uun4NLxqHy/HlLkbzRjxbpzYo3ojNhbBBzPzybknB8G5thp4y29O84BwOw+fQm7
	QV1kEu5zaBdTsYwpUxZp+0hXUxVxxRIRDyEQde6pVg6vsLDjHz4MZwKzGycY27wdiyTEfZAXC8V5v
	Fip8Clew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoteH-0000000FMKH-1Uoq;
	Thu, 21 Aug 2025 00:59:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uop9n-0000000EoQj-07LE;
	Wed, 20 Aug 2025 20:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2v+IMVm6IgqZGS8Hphp9DRXBHawewl2uEW+/r9BI/EM=; b=di0Cf9Kp78VENfldn13Bjh+KjB
	ZfCO6iYwRdSq7AySPsjmXPdn8tBz+HY/n3GG5HgjUDBJ5VpPf7A5doHpjQH1ZTaVprVIJQIYtV5cJ
	wJnqhNLs+fvoGqGLLqbgFAOz3RiS3OO0eMXshZiP7f+3c6ZUU0FnXUZ0Cok1xXBM/vQv3CwA8GQdY
	G6bgygCLL6sS/S0m8f8Mlsuywj4KSWLEJdOU3ZcBew/KN3thNxwRFVqvbNlPTcMMvvB90cYkgn3oo
	mbcxkz6MRrF8oq35OgYGIU66De7LB9rgEvN1RD8VgoByVTRdKF2eY/tGpc55VJ8Ed784Idlh+hqs1
	Y5D3cRdQ==;
Received: from i53875a0d.versanet.de ([83.135.90.13] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uop9M-0001iT-5z; Wed, 20 Aug 2025 22:11:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 1/3] thermal: rockchip: unify struct rockchip_tsadc_chip format
Date: Wed, 20 Aug 2025 22:11:11 +0200
Message-ID: <6318605.2l3rmUXbR5@diego>
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-1-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
 <20250820-thermal-rockchip-grf-warning-v2-1-c7e2d35017b8@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_131139_087464_7D41E815 
X-CRM114-Status: UNSURE (   8.03  )
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

Am Mittwoch, 20. August 2025, 19:40:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sebastian Reichel:
> Unify all chip descriptions to the version without any empty
> lines.
>=20
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




