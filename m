Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68E3D74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WS0f5bi98M5eBa14B/5RdQ+Ecx60VuhQKVTEvwph+6Q=; b=4jxAXk6tmQKXgioCFPJsNdiD5C
	YrPuTZ5wVA4XKerZU6byBe/Xe2QIXHQhhoUNbCoiUHs+GcoL6O712DBpFgwcbvHZyjLnRMZo6T9rI
	pXneqmVKlxe3whRpP6ri9nGBP16E3QoafN4sCmcOF6XjIexSK+QhipW01MrRa9BrUc2EDafe77q0s
	Btx4TXuJK3MVn45cJAD5BGoJEuXlyjNWar6HlNuDai62kZFochcBtKMNWj8qwL1v7itNxQiHeDDdp
	5aJ3M3Ni0leNse5dy3fxxhqw3G0nXHdbVER+DKEkkV5rlveCLnroyuuzmSJ7kJR5U0wfTnVverfNC
	Kn9a6Z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVVn-00000009nhN-2RV1;
	Fri, 19 Dec 2025 08:06:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVVk-00000009ngu-3yHj;
	Fri, 19 Dec 2025 08:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E97E9406C1;
	Fri, 19 Dec 2025 08:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E8BC4CEF1;
	Fri, 19 Dec 2025 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131610;
	bh=6wCyEn0zK8C4XAbIScYX2qsUWSagoyGEFQBluCSB5PM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vO58ZjCNdxzXozw/+5Mr/i7hwPDtWNwg+GASMBNTYE0gvY8nJLNyX6Qi+banYiLa0
	 3NlqZaKz8vnGrZhnnuPc/ZKJTZWQMaI34Gf0VXumLLpjyaI+psSKDGglQYPUZxwlYn
	 3FRJEV5uwW1Y7lovF0fJz3d2VN2zDZhoPJsIhOzMjEFl6NC50B8MoIe1GwrM+Up7O6
	 OKeDoX/Obp2+YSgWlL+YKPnZ3nu2whGsRDHM6bMUo/JmkHkCAJPjWnukx46k7pkGOQ
	 wTmymHz6m8slhOtkkjzU215ba8qkWjn4nRffp/VJi3pHmEklQfoRGmUxnVX3xQfwRT
	 PQhE+t9ZgazBg==
Date: Fri, 19 Dec 2025 09:06:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Xiaoshun Xu <xiaoshun.xu@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu <vince-wl.liu@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: mediatek: devapc: Add bindings
 for MT8189
Message-ID: <20251219-eccentric-mouse-of-drizzle-0c667a@quoll>
References: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
 <20251217063429.1157084-2-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217063429.1157084-2-xiaoshun.xu@mediatek.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_000653_006322_B9ABAF65 
X-CRM114-Status: UNSURE (   7.29  )
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

On Wed, Dec 17, 2025 at 02:34:10PM +0800, Xiaoshun Xu wrote:
> 
> External email : Please do not click links or open attachments until you have verified the sender or the content.

This is not a proper email. You already received such comment before.
Why did you ignore it?

NAK

Best regards,
Krzysztof


