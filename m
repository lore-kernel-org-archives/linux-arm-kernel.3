Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA47CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIUlDV1IY6nSQj5QOrfZh0BooD+8aP7O6GxuMWsxEsk=; b=aR0B+iut42q6w72d3QrOqeiFgg
	BHG+oxIPb6TiGhJGcv5wIVoZOgszXIn9/2DRc0qBmil9489WWC8zGAeoJuF86+hAGjNQ071t/eMhq
	89dk/0h/H1/apaqKqhdKdF7y3o3S8E/jblIH5uRnctmkYr6tatc5X+gQJ5KgFLrs3eXGtbhkq5lna
	PxG7yw3wDD77meM8dM6wyZE0kOvhe4MINKzkEmQTxWsX7OrEYlHLeGFsB8FjVyobor68N0ksWIEX8
	8+XO3H8kFOx9t9SsOF/GCKRrWPObmIMPtXj7922+8JQ90ESB5eX7eQyeVuNOQcipflQSs9rDG/UYB
	dGVuam2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzR2-00000007GQt-0QkC;
	Thu, 21 May 2026 09:11:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzQz-00000007GPj-1rrt;
	Thu, 21 May 2026 09:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=TIUlDV1IY6nSQj5QOrfZh0BooD+8aP7O6GxuMWsxEsk=; b=2KzxyR2wRKxnh+joy3BFL2cZZk
	vGBZd0mQregl8fpn8XVyZSDLjYNBnMZAhJ/4U6m3UZl8inEFhnvxgBw7YObQbW5rHZmZh6z0mJ8kc
	6u41ZadiSY7KZJt6LFqiVAJ7CajYlUAzZxhEON/k23kiXwz+trWehGX8L5hmeeVQni1EiycJKe7hj
	stoFEHCBLXj/Y8pzmK7SKOnrZ5eOLaK3BzyR0WQSBJCMtHYRuLb9jo3Fds2pkkYmak3H7QDVFlfqf
	avmsLjHPVuxEQ9h1lPUjFNg07NpCUp8Xew60pgWibsZXZjiHgCceqgAsyMONFYJ8GqKnjNdGKLmWB
	2FYdTFZQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 2/2] phy: rockchip: inno-hdmi: Remove deprecated way to
 configure TMDS rate
Date: Thu, 21 May 2026 11:11:14 +0200
Message-ID: <15479877.EVyyLHbfrO@phil>
In-Reply-To: <20260518180722.2480799-3-jonas@kwiboo.se>
References: <20260518180722.2480799-1-jonas@kwiboo.se>
 <20260518180722.2480799-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_021117_482199_201951F8 
X-CRM114-Status: UNSURE (   8.09  )
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

Am Montag, 18. Mai 2026, 20:07:21 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jonas Karlman:
> The TMDS character rate of this PHY is configured using PHY bus width
> in downstream vendor kernel and out-of-tree patches, however no in-tree
> consumer of this PHY has ever called phy_set_bus_width() to change the
> TMDS character rate as currently only 8-bit RGB output is supported by
> the HDMI display driver.
>=20
> The series "Split Generic PHY consumer and provider" clarifies that
> phy_set_bus_width() is intended as a provider-only function.
>=20
> Remove the deprecated unused fallback way to configure TMDS character
> rate now that this HDMI PHY support using phy_configure() to configure
> the TMDS character rate.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de> #rk3328




