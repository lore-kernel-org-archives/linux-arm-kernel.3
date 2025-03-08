Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622FDC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mlmp/JejejU48CyLjywWdPMnJaDEMrjKUd4moOR86Fw=; b=nJWjOcXCF5It+Xod8N8L3F4KjI
	WvIEVRSgJOlhvOPOUZj+fWKA06IpS/YLMZa3jQ/atRBblNOhWfrtl6XKax8ELSzL+ZBV2I0nobjMi
	cJRJstd9jHYF+YgqoQzCNCxn5BUQcWAFXeANVVwIEHCZAsjTbFWPgC5ruYMS4S8/IWv7MnvKmhJM9
	nmfHwGhlhe7JOucsib4OvuVMaIkT4/rjP2iPC9fdmjvenFRl3TQJjwtiNIyEp/jOIASn6M/hg+M/0
	QkGvBsmWVeCIP1/4GcG4xiKFWkUFKkpsbGUadrGXFpeIW6sFAIqQp8wpVI65fxHuu3ILe/3eaxB6e
	+FoK36dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqyBg-0000000GwqO-0GTo;
	Sat, 08 Mar 2025 17:42:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy2C-0000000GvZq-3BB1;
	Sat, 08 Mar 2025 17:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mlmp/JejejU48CyLjywWdPMnJaDEMrjKUd4moOR86Fw=; b=XCzQerHE6bawYn8QgC7/JaKHJN
	AHtJnVYHI97Vc/WcgJyglq3M944TP+KLqNdyNAWDfaLvuo5WiFbBL68z4MZex2Zv0TOjnlrWbRruK
	n1tCDzUPMYlHhxQZroZprJvbF/L82LzHa2nkQb+wkM51HI2kq+8pUVKyBisk2VsZmiykn0E5BG94d
	AnBAzJAW10aB+yLO+UIi9f/iKD6XQ4yg4WI+oKpBDjgS9Tk2hCRwzok0WUo/S+LxqhdqzDBCbgoZM
	17rlB6oQsdo0bKVxyrJrCtapS7sJy1P4TJ0Wned2eKtrFABcG7cY6ZSRjoWmpJH5YPLX0oBJzJKZP
	Fb9hgLKA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy1z-0004Tx-Fc; Sat, 08 Mar 2025 18:32:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Stephen Chen <stephen@radxa.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add HDMI support for rock-4d
Date: Sat,  8 Mar 2025 18:32:03 +0100
Message-ID: <174145503575.101861.8670068937049575401.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250306180737.127726-1-detlev.casanova@collabora.com>
References: <20250306180737.127726-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093224_792599_AD25F3BD 
X-CRM114-Status: UNSURE (   9.62  )
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


On Thu, 06 Mar 2025 13:06:31 -0500, Detlev Casanova wrote:
> Enable HDMI and VOP nodes for the rock-4d board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add HDMI support for rock-4d
      commit: 4e4f54aaec204a27d51386a9dd0d3a805fea57f4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

