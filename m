Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4688AE69E9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 23:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXjlLr10nL652nOirJQGwQvnZ/wVzDxyYQeBTmt9Ex8=; b=mzZcUj5OvPyyj8oPlc87sYNelx
	ehIEtQtSEsEb1MyLfaflgMjXIXHdJlBMJBwXE+2NPozsiHF2jQubNnQSweLcs7Y0BXAbFhQiH7bY3
	G5T0poxQz5Zkk9qhk7yjGqDkG0z2Kg8VoZ1QbEcMUW/axFnzHA3XsDIX/SqJGjOsibwQjA2enGyhW
	3UPwNdBc4u7lGNQ9GljpYRpFUCc2NYoKPJbM8C3Ib7rIF+fw/hV+JeZS5zQTbF1S8now/jzEdWLra
	56obJt/xoiG16eZWjY4yM+mSwCt5JvEvHE6l8wfk8EVGwp57Aed9zcreFhVWqwD2zzcGu8uxSDdsF
	/31+Fflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFv4-00000007jKj-0VSq;
	Mon, 02 Dec 2024 23:33:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFrI-00000007ihS-3St0;
	Mon, 02 Dec 2024 23:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LXjlLr10nL652nOirJQGwQvnZ/wVzDxyYQeBTmt9Ex8=; b=XkormIfKy0bQwW9lEejYRetW0r
	R233wHdQwvqZ2nfj73Wkt7VeS27IAGG6VHETUq3MpLKyiJWSO0OA/fijtKCvne/OyoY5OLKgn3JCL
	ayZvnqF4Zed1JhvLfxN6QHKusFjilhGXldsorlCQUMi1a9uWQEOs2XgoNJkyprLI6CM4ZI8J2cyEF
	/JEW7r5Rm/3xIKufsDB6VtNTLgJ0/e5zwsFt9EfusZ+uAOSRHJKBWFxgwRAckmX/7fY9BiLcci9o4
	S+MIMdue6RewhnfXgt1OsbG9CC/OBsiayJ7y0cyTd6zSfl3zlpvZqnNqOo880VGe+CZrUMr3id4wm
	ENE79gGg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tIFr6-0000OB-IN; Tue, 03 Dec 2024 00:29:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: rockchip: rk3568: add reset-names for combphy
Date: Tue,  3 Dec 2024 00:29:14 +0100
Message-ID: <173318214612.1403925.12222889205247999008.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122073006.99309-1-amadeus@jmu.edu.cn>
References: <20241122073006.99309-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_152940_858155_80F72FC9 
X-CRM114-Status: UNSURE (   8.32  )
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


On Fri, 22 Nov 2024 15:30:05 +0800, Chukun Pan wrote:
> The reset-names of combphy are missing, add it.
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: rk3568: add reset-names for combphy
      commit: 8b9c12757f919157752646faf3821abf2b7d2a64

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

