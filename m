Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C8DCD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xEd7M9h2Cbss66G5Zn5D05u0Eic3TX3YV8Uit/1EGg=; b=EVNmp2iFAjf4YNkbImY++SpBiu
	9a5Bi3PaTBsiDmQ6YNtIBIRmKaTG49YXBoftLY1SVSAJAepG0jVdmQ7RSfie1eppMtBV93WchzCQl
	cHfXdOvKLdEJ42529Sxu49Ub2DrV6oZnrtDnhf1ZCE3cmzvuohKhbfYqk5Yyh9CoggoGNLb59x8Ou
	ghmhAD9Cr1oOOBn4CPload+fzmvKQ3ORY5iPDLUusLNlw4AuXBgib1X4L/CFhCV+/IYRw6LuJMRub
	w2EButwMYmEN7IFEzt+K/GFLw8Yo1xawjUqEQmoQbIzhyFmkJQP7Vnb259Om7UQbBjoM9+JmNfjn2
	ao1lTqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4D-0000000Cwzq-2Aht;
	Mon, 11 May 2026 09:36:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN44-0000000Cwvu-1PZp;
	Mon, 11 May 2026 09:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492197;
	bh=p1144q5uGIWy4jprhL+Oqk7paSk0FQJqwCjykWivi20=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TEsigOM2GBpsAxpa1hfcmZuTtLMe1BsizvwXPFqWCMG0ESFomiYFSENGctOred0R9
	 sC0bqf/l7TkKPHoFzmuUA6iucfJ4bCR+vOyqpaP9/cUeZbKjymllgtfT76iGo2ZRAx
	 ySFsUv1b4QWz4cNprkyIHqaqvJ5Wa7517jl+LEA0gpRZ6K7/dWL0YT3mmOCCykTON9
	 /py+3s5PKHLQRQVAwh6LY9XG1T7sBEz/MTvgHcYNgv40mACl4tSGEAhxvI1oBGJE+/
	 5yFQBOiGJmr3A86ogsQvv+ZIs6nCdJkv3E630kfI+g33qbMX3XvrT17L/i5/26+QAk
	 MqHCkQSmihiDQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DACD17E12E5;
	Mon, 11 May 2026 11:36:37 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
References: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
Subject: Re: [PATCH 0/3] Mediatek Genio 510/700-EVK: add CPU power supplies
Message-Id: <177849219746.115964.3278328697060309658.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023640_548312_97319666 
X-CRM114-Status: UNSURE (   7.49  )
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

On Tue, 14 Apr 2026 12:33:30 +0200, Louis-Alexis Eyraud wrote:
> This series adds for the Mediatek Genio 510-EVK (MT8370) and 700-EVK
> (MT8390) boards the CPU power supply definitions in their devicetree
> that are missing for all their CPU cores.
> 
> On the boards, the big core power is supplied by a MT6319 (sub PMIC)
> and little core power by a MT6365 (main PMIC).
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8390-genio-common: add MT6319 PMIC support
      commit: b049df10aea8222a42d42433b675b7b0d013c4dd
[2/3] arm64: dts: mediatek: mt8390-genio-common: add CPU power supplies
      commit: 728a38437d8268a9a43405d476fb678d37f86cd7
[3/3] arm64: dts: mediatek: mt8390-genio-700-evk: add specific CPU power supplies
      commit: e6bc454bb7ec547ccd371482b8692a87c5b58245

Cheers,
Angelo



