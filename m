Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B23CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pwDxzyQEn+iBDtKyLYCmHQVSJ6/W7lkVlzqOH9eCks=; b=le0ulirjnVwd12/Y5NHytmYmSY
	cuW5E7A03kgUYQcZmHmINuoIZAcmrgB5tdTp854oi3PnaqGwAQAKB110OzU6PyD2jioRJfB1j0BBy
	nuywr7uFm+wHtMeAAyloqSwY9t10je1Z+oE3WQsqxTwa1oUnruz9lIeLvuNwMuK45MovKoR0vZrIp
	9oi6IOGRmV2ejBSEKa29K9bc3xJacV86wudf3igJzv9QlU51/35LMHTJoihhRWMhofnDFyJXKZ7r+
	oetmZncR+OtGmuOncElYAvxc1jU+hyU3cf2BaGymLkYPN+1iG84O/DOfOTg0DH2K3ZOfeypI4I8aO
	bzAENKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NgJ-00000007uac-1aF9;
	Sun, 21 Sep 2025 17:16:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NgH-00000007ua6-45hL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 628D860143;
	Sun, 21 Sep 2025 17:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E324CC4CEE7;
	Sun, 21 Sep 2025 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758475017;
	bh=5pwDxzyQEn+iBDtKyLYCmHQVSJ6/W7lkVlzqOH9eCks=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YqZqhogas/JJIGwYzK83wOMaHr8WS6DsS2UDjE4tpj3MwA6o3PFNGAjDJZI70T4F1
	 fW3TqUbO8tzfDOh8zqEWDiozw0SWdSIRd8WrneBFIaQ98B4P1rTHmxeYsmSThsT9pZ
	 EVgYn0ySCKXxySVOm/kZSt82virJ19an6cz83jQ37RNRjwA8sPBz/DeqssqFpaHcaP
	 cfy8Hbl1Io75eKm85cTeMp7ShoofPA0L9jWpQlev8YHHAT7eczaVnF12Ft5rEVlFyA
	 KQ8cNQt1jwU+oeIiAnOEZMqAAaPfkeiX6NBT9mg9jrv0Y/xtsCT+1aDyaSipujI5As
	 SD7unuHWLjsTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250814035317.4112336-1-wenst@chromium.org>
References: <20250814035317.4112336-1-wenst@chromium.org>
Subject: Re: [PATCH v2 1/2] clk: Sort include statements
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 21 Sep 2025 10:16:55 -0700
Message-ID: <175847501556.4354.8718434383967720736@lazor>
User-Agent: alot/0.11
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

Quoting Chen-Yu Tsai (2025-08-13 20:53:15)
> The clk core has its include statements in some random order.
>=20
> Clean it up before we add more.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

