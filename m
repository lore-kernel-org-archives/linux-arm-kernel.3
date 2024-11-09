Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D69D5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgIG6VFXhAny1bqWlSHICx+VLNUGSni3L7C8KK4UjRI=; b=i8NCV6KtBbx1T5p/KpWfY+axE7
	X3jj0Yb3Nw2OK+yURoN5O/kuV+OyTIGUjH+LAEZ8x5w7lst5HbXJ/n8FSFfyeOz3JcOYOg4+5zFL0
	NRijJ7l8RyG6/9kN3Ru+a8Fy4dZVqHfoNgPIxAtnfzwNYhcubvgA6nMWVweh+/Zu8CXmlHGarXjMU
	ngsvPcrfkmijzj38ZDOktbRXt9XfcD7bdPCFQyR+zxtOZhCKlUO/CP+ZIV1GfvqMHn3c/8qpDb/eV
	0NvlwUdckk95O/ge1H0tXo3yoQ2G+SeaQ0rDOBHGn3b8clLW3YBY0xFLv+eITAPlXFJINkI49Mw6m
	Sp2HGD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qLh-0000000Dp5Z-13g3;
	Sat, 09 Nov 2024 18:38:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qBO-0000000Dnft-0CNP;
	Sat, 09 Nov 2024 18:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FgIG6VFXhAny1bqWlSHICx+VLNUGSni3L7C8KK4UjRI=; b=AfL4v7pR1ibSLkCxVQqYpbITpf
	S6i/UZysRmfKiWFA6fW4aCKMCDlR/xgKDUT/B2Bk28lLlb2yPb2gT3OHIhAKYNL38MSGrmJInbah4
	+hH9J88yuO/6B1aJCIR5NcQEU45T6BIMilL1WgrRKUXA4RrwvMIaWd8/J8DaP7e7MyB7XBXYcfABd
	oine8eRjcX1EXKKHNbcTuNoktnUqvlIeW07PAo5NixZcnmG9XTaj96iX84B3TGQafkOnJmaIPyqSU
	5rDZ9jzqKhTzc9YF/VA9z3adRikhCke0kdzhCdLc/yJEZ8eHjEiSythbE70UOuHtwKP4d1+Z38xWQ
	EuWldHwQ==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9qBI-0007Km-VB; Sat, 09 Nov 2024 19:27:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HDMI0 on FriendlyElec CM3588 NAS
Date: Sat,  9 Nov 2024 19:27:15 +0100
Message-ID: <173117675954.1131306.10474212584108457519.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108171423.835496-1-jonas@kwiboo.se>
References: <20241108171423.835496-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_102738_107566_4CEF0621 
X-CRM114-Status: UNSURE (   9.09  )
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

On Fri, 8 Nov 2024 17:14:19 +0000, Jonas Karlman wrote:
> Add the necessary DT changes to enable HDMI0 on FriendlyElec CM3588 NAS.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI0 on FriendlyElec CM3588 NAS
      commit: 6f846fe4d07a1b16e769754c5101c2e5a039d729

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

