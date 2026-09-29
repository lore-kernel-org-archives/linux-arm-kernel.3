Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA91EC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 05:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1S/lX3D2zZ57yEJzY548RjwyLs+Qc5MvhmFefyEV0g=; b=USe5ZrgdgmAxgG7frETQe/EQHh
	Fn6Bd+YXeoBG411ODaFQFH5XbS6vOilPd6ZjZym66rglLjp1yj0lSwxZ1bnGmgJZvo82/N0Xz/TZv
	1zkno5K1wXQfwTz5x2AFHRpR2xTbxetKaD2FNSTU5fdICxwxZXBJDIsbWRY5ie8gOov7TH0dlbpRs
	DcV3r4rQwpTh62qbqQfqdrAPMVNuahhgmQgmtMBM09cxhchuFliA+muZlBo9J7+x+VwsURUzq+bei
	zM12JHTaiFP9si8x2FeMth1Cx57c4UkaGURSZrJZdfAdVFqp/5CRbFu56DiLrhwGp5FDkP8lkF4JE
	js2E8lcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQie-00000002OGC-2qfM;
	Tue, 29 Sep 2026 05:49:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQiZ-00000002OF7-02Lr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 05:49:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F62E43E0B;
	Tue, 29 Sep 2026 05:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A1D1F00893;
	Tue, 29 Sep 2026 05:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790660970;
	bh=j1S/lX3D2zZ57yEJzY548RjwyLs+Qc5MvhmFefyEV0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=enWdZG89UD2DM1Fya8gPx2GJrWxVR1QyspSAgl41Rt6k2BTG6jIfmeKqCKOOBALId
	 0AV1AlZREvDdPOspOMg4ksmsu0uuWEvSnDsDtoORi+zy+yzbmjvbwzblGqhtqufObQ
	 PvT3aRpnmyg50V0vXD5ElEi9LJDSIzrUNVln6DjWZJekCvnWd+AERENBdiyjlHrxX6
	 BLufPBNGhT5n7H3u3Rv3j00CJQuRBmJlJ7tSQ8lI8hTjeFAYQDbYLX2wJG0j4N7ctB
	 K53wROYwkth6cGxH3lR7yucdhjlhMnb2Gep60ufjCIU0vJ+jhDj/jRAxwS2hUkbdZv
	 4P5f7dureY0mg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Waqar Hameed <waqar.hameed@axis.com>
Cc: kernel@axis.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <e55caed5ef7d902b9e1f0635ad704c61a6dbb7cc.1790629313.git.waqar.hameed@axis.com>
References: <e55caed5ef7d902b9e1f0635ad704c61a6dbb7cc.1790629313.git.waqar.hameed@axis.com>
Subject: Re: (subset) [PATCH 13/16] arm64: dts: exynosautov920: Add missing
 space in compatible
Message-Id: <179066096599.19907.10125408562437494172.b4-ty@b4>
Date: Tue, 29 Sep 2026 07:49:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Tue, 29 Sep 2026 00:38:24 +0200, Waqar Hameed wrote:
> Tabs should be a space between multiple property data. Found/fixed with
> dtfmt (Devicetree Source formatter).

Applied, thanks!

[13/16] arm64: dts: exynosautov920: Add missing space in compatible
        (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


