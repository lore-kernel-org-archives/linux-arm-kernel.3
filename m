Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0037C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LY5oVYdUILHJ7bMyICNzRnyWNtmpdOraX3azrsWKi/Q=; b=kvP1M1+dD0C6JKumquLs+73Cgb
	BhxzPE4URlbywWucQsKCx53Ku1KOLnAOluQ8wNxoCumsKkE01TmM3GEmwqwT8shae80IVyWPp0Chb
	zLKqnjImrH6KgJMIAjh0gxM3IWSf3x/XKl8NvBL2uECkybWgahckNQIyLu9f6Q9r2MvVtW634pmW4
	nqheP1LDZrr4aGQ4uiHdV8LVrAWcKaLALGTtvMW1lKzvijBPYWRtvSMJoDj/qfHaDvEAQjoj6/MR/
	N/qQqH+8JfacpP2AmJ5MrEEqcMa9cc3eXxELKYf5NLtSJlZwYF+v1hB+aIAzWy/JHrhK8cnttUQPX
	urYYmLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIF-000000067fx-3Zak;
	Tue, 28 Jul 2026 19:16:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonIC-000000067cQ-0N28;
	Tue, 28 Jul 2026 19:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LY5oVYdUILHJ7bMyICNzRnyWNtmpdOraX3azrsWKi/Q=; b=s6n2LzQSHVBxfWFaf/WwA/Gmuy
	C9RNLdRAeKgmiDs0gIa7oy5V4y0D7uRbiVQC2inHN61PgZWjub6EWXn4HKllTHC8Xleq8B87DJ7/H
	VLRt4yshEL9EhQ3JH3O0czaKKi7TxIMvPC9/ItTvrXGZc9I15nkyDFb6JPVF4g283bd5tHpe15v7m
	xzLbLK4V0AxX/uodcK9MELyskCq/5fMgSkpWNgVpp/2ZPctnchpRQmCAkcUmlBIYTBuS7R0/XDR7m
	8eRTRNV+B0SiantSzzb/IN65D42o0rYhEVhzcJl7JDErQvUJfmYmN0g4E0+wUKBRFL8pHd/HuTOG7
	xYKTC5XA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
Date: Tue, 28 Jul 2026 21:16:29 +0200
Message-ID: <178526609464.300371.10816180268283621892.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721133421.44258-1-festevam@gmail.com>
References: <20260721133421.44258-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_121644_133618_4632F774 
X-CRM114-Status: UNSURE (   9.79  )
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


On Tue, 21 Jul 2026 10:34:21 -0300, Fabio Estevam wrote:
> According to brcm,bcm4329-fmac.yaml, "brcm,bcm43455-fmac" needs the
> "brcm,bcm4329-fmac" fallback.
> 
> Change it accordingly to fix the following dt-schema warning:
> 
> ['brcm,bcm43455-fmac'] is too short
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
      commit: 7f1f09ed517de6b98fbd64393a3efc8b5055c2cc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

