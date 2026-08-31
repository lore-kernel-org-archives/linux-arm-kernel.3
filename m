Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DD5C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpvghv+x5aUM1Thg4eRfz3/bCxhuXjjHyhBWU458Qxs=; b=kKkSJx5cNLxhGk3bsNF0bjFk/Y
	Ywe9GlLMyky8vBHWbdOtDiYSDmKwVq83Qrfb4sE/aldZuZbQsDEvmOEn8jPbqBqzXwEmV209mg92u
	obN5rL7UiXz3B7qlcbPzryBLIJjV8HuDMZVtrCSWRCGkzdbIt/r7NYfJhRteqJly1A1thvPMa2r53
	kIMwtbdhrkBw3D7hrpzZtZytM2oHsPbVuqdqEMHlb41H/d6BCrKnayRsadBCsJO+l83WEonvv8uJu
	cFID59t7pawgjdZd3CQ61KhanoV5YklD39MSez3rXlc/CDvU31qlwpLXVc0UOKnss2xznUq26ts+d
	ALZ40kfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12VZ-00000009Znd-3Xkr;
	Mon, 31 Aug 2026 13:57:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12VY-00000009ZnQ-1Lui
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:57:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAF3B43823;
	Mon, 31 Aug 2026 13:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A8F1F00A3D;
	Mon, 31 Aug 2026 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184627;
	bh=zpvghv+x5aUM1Thg4eRfz3/bCxhuXjjHyhBWU458Qxs=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=FGuPY1d/6GY/ERrM5QSjmFdkSpbpfGIGYaQap8DLICBfVMmEM9x7oX3wn3W5NYFj2
	 mfrl05gu1XA/n+/YCVeHI3ptSBLnsypixYuu/EuS2z0dlqxXzrSBIkEQ7zCc7Wuy5l
	 0wke59Vq30Hw5/Fw/CDDY3Tc9Em38sS87t8CMMPCPTFoCM6i3KCE3aA9l+gku3mS31
	 RgcFtV+FZzwO/BI5I3WBt7uFu2mOHSlbH19yUngQSxtnBp5u4uVHsI+pZawur4cTOZ
	 GS493ZFHXw+4nHSz9khS6q9gA8vUlXsSqCT6Akxc4o6lPW4MkoOi4K8sj8ZHnO9PgE
	 ad5DQlTyncU3g==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: allwinner: sun7i-a20: Replace spaces
 indentation with tabs
Message-Id: <178818462583.248724.8146630248194463325.b4-ty@kernel.org>
Date: Mon, 31 Aug 2026 21:57:05 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sat, 29 Aug 2026 21:41:32 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> 

Applied to sunxi/dt-for-7.4 in sunxi, thanks!

[1/1] ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs
      https://git.kernel.org/sunxi/linux/c/913f7eda9f3e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


