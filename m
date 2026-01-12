Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CF9D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 05:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sn6rBHfC5KR9lr4T94WwV2W/rBakB3cYAuUc+FhzQiM=; b=YPl7zXm5XMb+T/FetUmExJ7ekq
	dwkv39S/48NhJ8foYdgyEyciKh/02epzJ9M1JIJxksvaUTqNOQmZpo9F4ianGu7MJShpZWUpOs8mM
	SOAgi1S2xzVVIwVkTjPu7qAnghLDy067lZSH78/J4DwJoC3ftKOSzTjIC2i7vD/ZmYAwPvpIpb7Rz
	gFHEVR9mP0oAqYIhi2CNJnv70sPUhjzw/j1PXNx78fJTBzMGfE9zxaAQTJuBQvwaJD2cxFni+SiB6
	pkpiwB+IsuM8N5n71D9CAyA4HDP9FrlC8Ua3ZxZyvocrpCISCZ+mpBfqz19vwT7Uz+oZPc+QjdbU/
	msoPmK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfA6I-00000004lfa-30Et;
	Mon, 12 Jan 2026 05:04:22 +0000
Received: from lgeamrelo11.lge.com ([156.147.23.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfA6F-00000004lfA-1QsN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 05:04:21 +0000
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 12 Jan 2026 14:04:08 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO BRUNHILD) (10.178.31.97)
	by 156.147.1.125 with ESMTP; 12 Jan 2026 14:04:08 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
Date: Mon, 12 Jan 2026 14:04:08 +0900
From: Chanho Min <chanho.min@lge.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Kael D'Alcamo <dev@kael-k.io>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Gunho Lee <gunho.lee@lge.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add 'lge,*' for LG
 Electronics
Message-ID: <aWSAyGx0KU7HyW6h@BRUNHILD>
References: <20260108082213.6545-1-chanho.min@lge.com>
 <20260108082213.6545-2-chanho.min@lge.com>
 <49d28c7d-a08c-4543-b3bd-a23d36785c28@kernel.org>
 <0b80d046-6141-4389-b666-592859468b8f@kernel.org>
 <aWBaYUTp8dOTIEGz@BRUNHILD>
 <2770a98f-ce6f-48c7-9bb1-45f9286de371@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2770a98f-ce6f-48c7-9bb1-45f9286de371@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_210419_693502_212D0BE2 
X-CRM114-Status: GOOD (  10.70  )
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

On Fri, Jan 09, 2026 at 08:33:43AM +0100, Krzysztof Kozlowski wrote:
> > 
> > Existing "lge," → "lg," conversion will be sent separately soon.
> 
> If you have existing compatibles released as ABI then they should stay
> and you can document a deprecated lge prefix. But not for new devices.
OK, I'll send the deprecated "lge," prefix documentation as a separate
follow-up patch.

Thanks,
Chanho

> 
> One of many previous threads:
> https://lore.kernel.org/all/9942f964-442e-e782-3926-6d7d1123418a@canonical.com/
> 
> Best regards,
> Krzysztof



