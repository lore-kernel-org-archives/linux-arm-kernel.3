Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E7CD5D68A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6rS61pmtnnZyCNnDhYW7Yxzdh8e4M7TjjBsbO0wWTpw=; b=Cxg8KjIJM0mhxDIQtN51LV9fbF
	tMXjolsrU/oxmrBC/WN2F2e0QocAnjAWsKZsq5AaM+x9b28zl54oD3NrQQLywSgVkm77lm0n7sLsZ
	UnQTahMHhc1eYonEfh+K/SuYQeY0FUerqPJZbOydvWRUMyPhwcl8IHoCNtt+DWCApATPFl+x5j1eS
	gXlB9b31vF/+MJv5kYHb4Ez6TgeFrfrq4MxauJS6CSCmA5MXR9WzCwTILlBlQ3Osd0NfOQTTP/YlS
	39VKZ2KaABhI/hemS18UCA5vdf2jgbfNqOYX+URv7zdAZTHtaMTt/XkX9wfuqEXaO1BX/ENd6Tl9I
	iWSqypqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9A7y-00000008QCx-3B2x;
	Thu, 07 Nov 2024 21:33:18 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9A4V-00000008Pih-1K1H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1731014972;
 bh=6rS61pmtnnZyCNnDhYW7Yxzdh8e4M7TjjBsbO0wWTpw=;
 b=bYfjDPWx5cGRo79LdjQA79gU5aXrBNSm2M05ghq6Hb4sbAzke1t+iV7rFJgFfAtrih/hWl3Xy
 6a/kyGeS2N8Q0lW1Bh4DRrNPMSLVMo67lm7akCEEdguu2FuJOSh2sNWOaY1905eY8cEZa7mCBXL
 xkoUYLwufpbIi27267Dn2f7lkO5fLxAxpZOJx0uzlXKs0/Gxv8U3nDcYeGJbBy7IfIwFU9Cy2dv
 dqUVSgJBgJsyAi+fY+Ec+VvQnS/GwxmGSTmNF79gd8fL/Eow698edwuLSadMsdNufDby510KvjF
 Gz3ePsk7gCuwt6W0uZbWuiAcbYbysjWXSrBesfiDrl/g==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] arm64: dts: rockchip: Enable GPU and HDMI on NanoPi R6C/R6S
Date: Thu,  7 Nov 2024 21:29:08 +0000
Message-ID: <20241107212913.1322666-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 672d31376ff4b179fef28893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_132943_423599_82BC30C3 
X-CRM114-Status: UNSURE (   5.65  )
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

This series add the necessary DT changes to enable GPU and HDMI on
NanoPi R6C/R6S.

Runtime tested and working with video=1920x1080@60 cmdline on a
NanoPi R6C.

Jonas Karlman (2):
  arm64: dts: rockchip: Enable GPU on NanoPi R6C/R6S
  arm64: dts: rockchip: Enable HDMI on NanoPi R6C/R6S

 .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

-- 
2.46.2


