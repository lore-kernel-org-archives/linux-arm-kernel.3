Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD8C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr4utZ1nxXKjnpr1D3zoCgwSjkia/sCH3TSWyZwXxpk=; b=w4auMLagZ0VedWaqD+/6khdMeK
	EXz9vkNU27eygfKVo/NMBGC+DfpdynHv2Ss/AvIAMtdzs5k5m1p1l3RDsU7uT/PVucaK0JCPCyZHE
	GCLpZFqW9YheAmj4MVio7xQDHfPn/jC4HpUbIkhf8hBRsgUlGUp8x1JPQ87a96rt1SOS66FUlGmDL
	Ceq8QSuloQZrGfCAqjOvEcSi+ZVyTXfH9A1DeaSoQllA891XumIY4VStAdbNPtD1rThpNavFpAF/5
	wIoGKBkOfU1AtkUCpOXZtOSJP192+jT21T1i/svDiVTbZ0MQX1qWBSIIY/ERuuuXj3+xwaFHzP/iJ
	llTnkdKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Su-00000002uLg-2y1m;
	Tue, 08 Apr 2025 06:29:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22R9-00000002u9D-1wHT;
	Tue, 08 Apr 2025 06:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3060A60007;
	Tue,  8 Apr 2025 06:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA00C4CEE5;
	Tue,  8 Apr 2025 06:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744093674;
	bh=sMS+pgw6gVqh68XJIsm5XK7zPr1Qw6uCBmzpegKq8po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCxPKDAtYbCUGWLAiugHnlJ1jfR7zWnnyv2OFh5PAfDoXZ5tNhjnYj7CCDh9B4YZr
	 XBmjYBbC965nulCVvYBO33HlCKoyIb6T9L8+o6kkcPbMC1XL8UdineCjJrOqAm8hBn
	 qJSX7QgOzaL9eL0P46aTPKRWWE/2PEJXSpZNv9W62YJmepkAFgw7oPDwOjEohJrRcK
	 vPgCUGoYuZZGPBDkWZaGmprtjx1O5BqTz0ZP+XMUgSSswwnZYFbys0Yi1QK7/hgGTt
	 AelyZ9xgtBpZmhTCEgPBnZHn2F/RRbPngzI7jYEKmxwfHvglujYi5USJVC1oadHCFE
	 7DncsVfNmNocQ==
Date: Tue, 8 Apr 2025 08:27:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 1/3] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
Message-ID: <20250408-bulky-optimistic-lobster-69ed77@shite>
References: <20250408033206.12176-1-friday.yang@mediatek.com>
 <20250408033206.12176-2-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408033206.12176-2-friday.yang@mediatek.com>
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

On Tue, Apr 08, 2025 at 11:31:54AM GMT, Friday Yang wrote:
> From: "Friday Yang" <friday.yang@mediatek.com>
> 
> Add 'resets' and 'reset-names' properties for SMI LARBs to support
> SMI reset operations.
> On the MediaTek platform, some SMI LARBs are directly connected to
> the SMI Common, while others are connected to the SMI Sub-Common,
> which in turn is connected to the SMI Common. The hardware block
> diagram can be described as follows.
> 
>              SMI-Common(Smart Multimedia Interface Common)
>                  |
>          +----------------+------------------+
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>        larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                    |      |     |      |             |
>                   larb1  larb2 larb3  larb7       larb9
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  .../mediatek,smi-common.yaml                  |  2 ++
>  .../memory-controllers/mediatek,smi-larb.yaml | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


