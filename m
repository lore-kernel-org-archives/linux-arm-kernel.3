Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A0CD26D9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaqcbPBY3IQoR0jtaZwk5gcsHRGbJRzX8r0itcBjzrM=; b=Wh++jpxeVqEaHLtWHi7p8p8tYT
	Op3QCHKG0qR0+kCHR+FymzW72w2Yp61WzBQJm+sYNsAhVndrmzVnS7LcvBpci/KJqnf+JovOImP8g
	j4tJzf6wXU5wU4BO/u4ycPo7Vv8Tc4nvfNerBYjQVHfexYIeo15jkKHM+eK5SrNo8So3Y9YvNhqXL
	x1gSy6lFNeHKUMLixT+9f5j414mqeHHmeKKWqWipBGnV8yZHiBvkYgHUTFKdlsyb0WQKc+0I3DfBC
	2+5N9ECzMEmOQiFWuvNJN75AoRqoSbAC0ckKP0bh3bhdk0LCmlMgjsufGPPqFZ+1FAHrYweBiDc87
	tMk2hSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWw-00000002xMM-3Ikk;
	Fri, 09 Jan 2026 19:52:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWl-00000002xCb-2xIX;
	Fri, 09 Jan 2026 19:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iaqcbPBY3IQoR0jtaZwk5gcsHRGbJRzX8r0itcBjzrM=; b=oyotgQCPVPa0I/XbNDCa1YmMKL
	ekf7praF1ph6I8glkCRAwpOIvV1zFIFJMyBOPucBdrNy1c4+8xYtQr3nru8hDVmZrEf7QXjl5tOs7
	V2b9JHHpxIWwMsmntZOT2TKl+dxQWaMoAKvqrU9P34O0aIKHWxJIYVOHurTMp5JWyxlwl3OajJYpN
	krhbM/Mluuz59vOAi651dGZbwwP4z3l/GzL+18BKpBNAMvhW+hd1KJqgkvYL3gct16wdgjZ6awbUB
	jSKiIVCyRTx8W670L28JQ9n3RTVjPGXrCYbVowULehIj6+I9A2K/rt6iLo3DXfSbee9/Ma2VtdOpq
	SdmSZMsg==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veIWj-001fth-Ft; Fri, 09 Jan 2026 20:52:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3326-odroid-go3: Fix pinctrl property typo
Date: Fri,  9 Jan 2026 20:51:57 +0100
Message-ID: <176798831390.3446147.13738471484516134666.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260108230613.1349060-1-robh@kernel.org>
References: <20260108230613.1349060-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_115207_741554_C27C3B7E 
X-CRM114-Status: UNSURE (   9.67  )
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


On Thu, 08 Jan 2026 17:06:13 -0600, Rob Herring (Arm) wrote:
> "pinctrl" is not a defined property name. The correct name is
> "pinctrl-0".
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3326-odroid-go3: Fix pinctrl property typo
      commit: f45385c511141683379a6e090fe74c6002337b5e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

